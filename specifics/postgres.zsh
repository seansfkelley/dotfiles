alias pg_init='initdb /usr/local/var/postgres'

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log -w start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

pg_reinit() {
  pg_ctl status -D /usr/local/var/postgres | grep 'server is running' > /dev/null
  if [[ $? -eq 0 ]]; then
    pg_stop && rm -rf /usr/local/var/postgres && pg_init
  else
    rm -rf /usr/local/var/postgres && pg_init
  fi
}

pg_start_anew() {
  if [ "$#" -lt 1 ]; then
    echo "usage: pg_start_anew <db> <username?>"
    return 1
  fi

  NEW_DBNAME="$1"

  if [ "$#" -eq 1 ]; then
    NEW_USERNAME="$USER"
  else
    NEW_USERNAME="$2"
  fi

  pg_reinit || return 1
  pg_start || return 1

  if [[ "$USER" == "$NEW_USERNAME" ]]; then
    echo "not creating user -- is same as current user"
  else
    createuser "$NEW_USERNAME" --superuser || return 1
    echo "created user $NEW_USERNAME"
  fi

  createdb -O"$NEW_USERNAME" -Eutf8 "$NEW_DBNAME" || return 1
  echo "done! use postgres://localhost:5432/$NEW_DBNAME"
}
