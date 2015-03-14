From: Murugan Venugopal <muruga86@gmail.com>
Subject: Remote telnet session - "conntrack -L" TO value displays incorrectly
Date: Sat, 14 Mar 2015 14:30:30 +0530
Message-ID: <CAMVHObNhJyq6UkAuXRoyvfoFCsi+jotKaqYi34W1-G7fzK8N1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=5Gix7KwIyNEWBpbQFr26duwZLB8DMkdJMnOlCFFZ2vE=;
        b=AdZEfpNVhwL5wc8/UF/1mlC/XqcUKohYtf4C9iiJhm5WQTL8yrSIiackWrEwrLJVPd
         b4Z6s9TVJfheOS04RJI8PoYZSP2u68lLlzdHXIanqCq6UPqIN92WBnqREm4elB0Nu1GB
         MRckLhVsas9qJUbngjJ9CudaoY8p9ZG6OaJx7AZtC4+KYRkQ7+/mu9sPdOVq2OR15Z27
         /EiPVTHUtiW0YGdLDwAgbWNvw8zvFDV9xWMGfKMoiOioCSAItdRLhlV17dPqoi7V0T3m
         rgVOJYmtYOh0gfhzAfDdyzAzGmA8VIZz3nXS4+rRzIZwq7XCBVc1naXh6h3W4H0Mm+eO
         G6kQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Everyone,

I face an peculiar issue.
I have a Linux server box from where telnet session is done via remote PC.
"conntrack -L" displays correct details in Linux server box, while in
the remote telnet session (To value is displayed as 299 for
established tcp connection).
Then i created one more telnet sessions, here too for the current
telnet connection entry the TO value is being displayed in correctly.

Logs:

// In TELNET SESSION1 (sport=1369 dport=23)

#conntrack -L -p tcp --dport=23
conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1369 dport=23 packets=252 bytes=14212 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1369 packets=231 bytes=63012 [ASSURED]
mark=0 use=3


// In TELNET SESSION1 (sport=1369 dport=23)---> 2 telnet sessions

#conntrack -L -p tcp --dport=23
conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1369 dport=23 packets=372 bytes=15239 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1369 packets=258 bytes=63295 [ASSURED]
mark=0 use=3
tcp      6 7495 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1415 dport=23 packets=90 bytes=3747 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1415 packets=67 bytes=7115 [ASSURED]
mark=0 use=2
#

// In TELNET SESSION2 (sport=1415 dport=23) ---> 2 telnet sessions

#conntrack -L -p tcp --dport=23
conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
tcp      6 7496 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1369 dport=23 packets=374 bytes=15319 src=192.168.1
.254 dst=192.168.1.64 sport=23 dport=1369 packets=259 bytes=63823
[ASSURED] mark=0 use=2
tcp      6 299 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1415 dport=23 packets=97 bytes=4036 src=192.168.1.25
4 dst=192.168.1.64 sport=23 dport=1415 packets=71 bytes=7340 [ASSURED]
mark=0 use=3
#

On further analysis, i notice the strange value 299 is obtained from
value 300 set in
/proc/sys/net/netfilter/nf_conntrack_tcp_timeout_unacknowledged 300.
When i modify this value from 300 to 400 then both the telnet sessions
display 399 instead of 299.

// In Telnet1 (sport=1566 dport=23) --> 1 telnet session

#conntrack -L -p tcp --dport=23
tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1566 dport=23 packets=101 bytes=4151 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1566 packets=75 bytes=3557 [ASSURED]
mark=0 use=3
conntrack v1.0.0 (conntrack-tools): 1 flow entries have been shown.
#

// In Telnet1 (sport=1566 dport=23) --> 2 telnet sessions

#conntrack -L -p tcp --dport=23
tcp      6 7497 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1567 dport=23 packets=86 bytes=3540 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1567 packets=67 bytes=3907 [ASSURED]
mark=0 use=3
tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1566 dport=23 packets=110 bytes=4520 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1566 packets=80 bytes=4291 [ASSURED]
mark=0 use=3
conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.
#
#
// In Telnet2 (sport=1567 dport=23) ---> 2 telnet sessions
#
#conntrack -L -p tcp --dport=23
tcp      6 399 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1567 dport=23 packets=93 bytes=3829 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1567 packets=70 bytes=4074 [ASSURED]
mark=0 use=4
tcp      6 7454 ESTABLISHED src=192.168.1.64 dst=192.168.1.254
sport=1566 dport=23 packets=112 bytes=4600 src=192.168.1.254
dst=192.168.1.64 sport=23 dport=1566 packets=81 bytes=4610 [ASSURED]
mark=0 use=2
conntrack v1.0.0 (conntrack-tools): 2 flow entries have been shown.


I feel this anomaly is strange and could some one clarify whether this
is normal expected behaviour or some error.

Thanks in advance.
Murugan
