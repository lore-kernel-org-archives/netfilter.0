From: <karl@asl4.net>
Subject: Redirected packets being dropped
Date: Wed, 19 Nov 2014 20:34:22 -0600
Message-ID: <671BE3C4E5B04522B7149F6A8EAEA8BD@na.mvk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to redirect traffic to a transparent Squid proxy.  The redirect
works, but then the traffic gets dropped on the input chain of the filter
table.  I can hit the Squid port (3129) directly, so I know my accept rule
is working for other traffic.  I just can't figure out why the redirected
traffic is being blocked.

Here's the setup.  My Internet gateway runs both iptables and squid, so the
redirect is going to the same server.  Eth0 is the Internet connection, eth1
(192.168.2.254) is the internal LAN.

I've set the nat rules like this:
  -A PREROUTING -i eth1 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3219
  -A POSTROUTING -o eth0 -j MASQUERADE
And the filter rules like this:
#8  -A INPUT -i eth1 -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#9  -A INPUT -i eth1 -m tcp -p tcp --dport 3129 -j ACCEPT
  ...
#36 -A INPUT -j DROP

If I turn on tracing, I see the packet go through the nat redirect
correctly.  But the packet never hits my accept rule, and instead goes on to
the drop rule at the end:
Nov 19 20:16:26 gw1 kernel: TRACE: raw:PREROUTING:policy:2 IN=eth1 OUT=
MAC=00:13:21:5b:14:89:00:00:00:00:00:00:00:00 SRC=192.168.2.21
DST=156.151.59.35 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=6376 DF PROTO=TCP
SPT=58881 DPT=80 SEQ=1031477322 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT
(020405B40402080A058D00A20000000001030307) 
Nov 19 20:16:26 gw1 kernel: TRACE: nat:PREROUTING:rule:1 IN=eth1 OUT=
MAC=00:13:21:5b:14:89:00:00:00:00:00:00:00:00 SRC=192.168.2.21
DST=156.151.59.35 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=6376 DF PROTO=TCP
SPT=58881 DPT=80 SEQ=1031477322 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT
(020405B40402080A058D00A20000000001030307) 
Nov 19 20:16:26 gw1 kernel: TRACE: filter:INPUT:policy:36 IN=eth1 OUT=
MAC=00:13:21:5b:14:89:00:00:00:00:00:00:00:00 SRC=192.168.2.21
DST=192.168.2.254 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=6376 DF PROTO=TCP
SPT=58881 DPT=3219 SEQ=1031477322 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT
(020405B40402080A058D00A20000000001030307)
 
Input rule #36 was the final drop rule in my config.  So why doesn't the
packet hit the earlier accept rule?  The interface and port match the accept
rule, but for some reason iptables isn't hitting the rule.

If I telnet to port 3129, it goes through fine:
Nov 19 20:16:14 gw1 kernel: TRACE: nat:PREROUTING:policy:2 IN=eth1 OUT=
MAC=00:13:21:5b:14:89:00:00:00:00:00:00:00:00 SRC=192.168.2.21
DST=192.168.2.254 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=32822 DF PROTO=TCP
SPT=34465 DPT=3129 SEQ=3212399120 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT
(020405B40402080A058CD2260000000001030307) 
Nov 19 20:16:14 gw1 kernel: TRACE: filter:INPUT:rule:9 IN=eth1 OUT=
MAC=00:13:21:5b:14:89:00:00:00:00:00:00:00:00 SRC=192.168.2.21
DST=192.168.2.254 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=32822 DF PROTO=TCP
SPT=34465 DPT=3129 SEQ=3212399120 ACK=0 WINDOW=14600 RES=0x00 SYN URGP=0 OPT
(020405B40402080A058CD2260000000001030307)

Does anyone have any ideas what the problem might be?  I've tried many
variations of the rules, but I can't make it work.

Thanks.

Karl%frustrated

