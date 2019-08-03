#!/usr/bin/expect -f
spawn ssh austin@161.6.5.43 -p 6240 "echo hi >> log.test"
expect "assword:"
send "Cyborg0807624/r"

