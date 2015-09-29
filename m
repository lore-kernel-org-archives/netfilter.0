From: f0rhum <f0rhum@free.fr>
Subject: What mean rules with no target?
Date: Tue, 29 Sep 2015 10:22:19 +0200
Message-ID: <560A4A3B.2030307@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi
I have rules in my firewall with no targets. What is this?

iptables -V
iptables v1.3.3

The 3 first lines:
iptables -nvL INPUT
Chain INPUT (policy ACCEPT 9 packets, 2650 bytes)
  pkts bytes target     prot opt in     out     source              destination
     0     0            udp  --  eth1   *       0.0.0.0/0           0.0.0.0/0           udp dpt:14305
     0     0            udp  --  eth1   *       0.0.0.0/0           0.0.0.0/0           udp dpt:4305
   926  120K            udp  --  eth1   *       0.0.0.0/0           0.0.0.0/0           udp dpt:698
  1386  154K portfw_INPUT  all  --  *      *       0.0.0.0/0           0.0.0.0/0
     1    99 DROP       all  --  ppp0   *       0.0.0.0/0           0.0.0.0/0           state INVALID
......

The part of script that creates similar lines as the 3rd one near the end:
# Ignore OLSR packets directly from these stations, e.g.
     # if this connection is too slow, ignore sporadic packet
     IFS=\;
     for i in $(nvram get ff_ign); do
         iptables -A INPUT -s $i -p udp --dport 698 -j DROP
     done
     unset IFS

When ff_ign contains semicolon separated list of IPs, same number of rules will be added near the end of INPUT:
DROP sourceIP udp dpt:698


Thank you for suggestions

Fabrice
