#!/bin/bash

mailalias() {
   ssh $MAILALIAS_USER@$MAILALIAS_HOST "echo '$1: $MAILALIAS_USER' >> /etc/aliases; newaliases; tail /etc/aliases"
}

homebank() {
  LANG=de_DE.utf8 /usr/bin/homebank ~/stuff/geld.xhb
}

m() {
  cd /jonas/dev/mongodb/tests/
  workon m
}
