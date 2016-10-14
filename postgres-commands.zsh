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

pg_bedrock() {
  NEW_USERNAME='bedrock'
  NEW_DBNAME='projects'

  pg_reinit && pg_start && createuser "$NEW_USERNAME" --superuser && echo "created user $NEW_USERNAME" && createdb -O"$NEW_USERNAME" -Eutf8 "$NEW_DBNAME" && echo "done! use postgres://localhost:5432/$NEW_DBNAME"
}
