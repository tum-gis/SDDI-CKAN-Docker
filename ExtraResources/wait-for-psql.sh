#!/bin/bash
# wait-for-psql.sh ------------------------------------------------------------
#   Wait for Postgres to become available and execute a command with arguments
#   when the server is up.
#------------------------------------------------------------------------------
# config ----------------------------------------------------------------------
sleeptime=1

# functions -------------------------------------------------------------------
function usage {  
  printf '\nUSAGE:'
  printf '\nwait-for-psql.sh wait-for-psql.sh TIMEOUT HOST PORT USERNAME PASSWORD [COMMAND] [ARGS]' 
  printf '\nExit codes: 0 = Postgres available, 1 = timeout.'
}

function usage()
{
    cat << USAGE >&2
    
Usage:
   $cmdname wait-for-psql.sh TIMEOUT HOST PORT USERNAME PASSWORD [COMMAND] [ARGUMENTS...]
    
    TIMEOUT         Timeout in seconds
    HOST            Host or IP under test
    PORT            TCP port under test
    USERNAME        postgres db user name
    PASSWORD        postgres db user password
    COMMAND ARGS    Execute command with args after the test finishes
USAGE
}

# process arguments -----------------------------------------------------------
if [ "$#" -lt 5 ]; then 
  printf '\nWrong number of arguments passed! At least 5 args are required.'
  usage
  exit 1
fi

timeout="$1"
host="$2"
port="$3"
user="$4"
export PGPASSWORD="$5"

# set command to execute, if psql server is online within timeout -------------
shift 5
cmd="$@"

# test postgres until timeout -------------------------------------------------
until psql -h "$host" -p "$port" -U "$user" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping for ${sleeptime}s..."
  sleep $sleeptime
  if [ "$SECONDS" -gt "$timeout" ]; then
    >&2 echo Timeout
    exit 1
  fi
done

# postgres is up
>&2 echo "Postgres is up - executing command"
exec $cmd