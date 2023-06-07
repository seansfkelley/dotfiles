# default to connecting over network instead of Unix socket, so that (1) psql's HISTFILE is written
# to a sane place and (2) it just feels less surprising
export PGHOST=localhost
