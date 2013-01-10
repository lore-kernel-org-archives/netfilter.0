From: Peter McAlpine <peter@aoeu.ca>
Subject: Basic bridge routing via ebtables and iproute2
Date: Thu, 10 Jan 2013 14:28:03 -0500
Message-ID: <CAEDV4yqDKuEvafDsh=FpRGD4-AyXzcyU8-Z0aWdQ=_LV9A6C_g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello,

I am attempting to route bridged ipv4 traffic via ebtables & iproute2,
but am experiencing problems.

[client 10.8.7.101] ---- eth2 (no addr)[brouter (br0: 10.8.7.10)] eth3
(no addr)---- [gateway 10.8.7.99]

I have flushed all iptables and ebtables rules. All policies are "ACCEPT".

At this point, pinging 'gateway' from 'client' is successful.

Then I add an ebtables rule on 'brouter' to route traffic destined to
'gateway' via the routing table:
ebtables -t broute -A BROUTING -p ipv4 --ip-dst 10.8.7.99 --log-ip -j
redirect --redirect-target DROP
For good measure I also enable ip_forward:
echo '1' > /proc/sys/net/ipv4/ip_forward

What I expect to happen:
1) The packet comes in on eth2 on 'brouter'
2) The ebtables rule matches the traffic and sends it to the routing
table (via the DROP target)
3) The packet (destined for 10.8.7.99) matches the default route and
is sent to 'gateway'
4) The packet is sent out eth3 to 'gateway'

What is actually happening:
1) The packet comes in on eth2 on 'brouter' - CONFIRMED via 'tcpdump -i eth2'
2) The ebtables rule matches the traffic - CONFIRMED via syslog
message due to '--log-ip' option in ebtables rule
3) ... The packet vanishes.

Can anyone help me figure out why this is happening?

-Peter
