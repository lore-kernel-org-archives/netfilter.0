From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: conntrack command returns zeroed src, dst, sport and dport
Date: Wed, 7 Oct 2009 15:05:44 -0300
Message-ID: <20091007150544.1be2d2bf@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi.

I posted this two days ago and got no answers, so here we go again.

I got src, dst, dport and sport fields from "conntrack -L" output all
zero'ed.

I am using:
  Slackware 12.0
  Kernel 2.6.27.7 SMP PREEMPT
  libnetfilter_conntrack-0.0.100 (configure --prefix=/usr;make;make install)
  conntrack-tools-0.9.13 (configure --prefix=/usr;make;make install)
  libnfnetlink-1.0.0 (configure --prefix=/usr;make;make install)

The output is like this:

root@newquark:~# conntrack -L

udp      17 9 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=1 bytes=147 src=0.0.0.0 \
dst=0.0.0.0 sport=0 dport=0 packets=1 bytes=48 mark=2 use=1

tcp      6 35384 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=8 bytes=1051 \
src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=7 bytes=7300 [ASSURED] mark=2 use=1

... and hundreds of lines just like that.

"cat /proc/net/ip_conntrack" looks good:
tcp      6 35555 ESTABLISHED src=187.17.33.9 dst=200.225.157.92 \
sport=52526 dport=80 packets=8 bytes=1051 src=200.225.157.92 \
dst=187.17.33.9 sport=80 dport=52526 packets=7 bytes=7300 [ASSURED] mark=2 \
use=1

tcp      6 104308 ESTABLISHED src=187.17.38.47 dst=187.17.47.132 sport=58627 \
dport=389 packets=1 bytes=52 [UNREPLIED] src=187.17.47.132 dst=187.17.38.47 \ sport=389 dport=58627 packets=0 bytes=0 mark=2 use=1
...

Any ideas what can be the problem??

Regards

Ethy
