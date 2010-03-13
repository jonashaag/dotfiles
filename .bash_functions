#!/bin/bash

function mailalias() {
   ssh $MAILALIAS_USER@$MAILALIAS_HOST "echo '$1: $MAILALIAS_USER' >> /etc/aliases; newaliases; tail /etc/aliases"
}
