#!/bin/sh
erl -name $1 -setcookie $2 inet_dist_listen_min $3 \ inet_dist_listen_max $4
