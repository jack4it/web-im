#!/bin/bash

if [[ -z $TAG ]]; then
    TAG="latest"
fi

expect <<-EOF
set timeout -1
#登录北京集群跳板机
spawn ssh -p3299 easemob@182.92.219.104
    expect {
        "(yes/no)?" {
                send "yes\r"
                expect "\~\]" {send "ssh ebs-ali-beijing-docker\r"}
            }
        "\~\]" {send "ssh ebs-ali-beijing-docker\r"}
    }
    expect "\~"
    send "cd /data/Dockerfile/docker-compose/webim/${TAG}\r"
    send "./restart.sh\r"
    send "exit\r"
    #退出跳板机
    expect "\~\]"
    send "exit\r"

    expect eof
EOF