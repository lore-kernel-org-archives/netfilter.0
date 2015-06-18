From: "Withnell, Richard (withnell)" <r.withnell@lancaster.ac.uk>
Subject: Re-Routing after OUTPUT mangle
Date: Thu, 18 Jun 2015 19:56:22 +0000
Message-ID: <AA848452A6213541AA3068E39B028C5616B0EE59@EX-1-MB2.lancs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I'm having a little trouble marking packets to split traffic across different connections.

I have specified rules (see below) that mark the packets as expected, and they do hit the correct routing table. The source address however, is still based on the decision from the main routing table, made before it hits OUTPUT. As far as I know, after altering the packets mark, it should be re-routed, changing the source address to match the interface/route it will actually use. 

ip route add default via 192.168.1.1 dev eth1 table 2 src 192.168.1.10
ip route add 192.168.1.0/24 dev eth1 table 2 src 192.168.1.10
ip rule add fwmark 2 lookup table 2

iptables -A OUTPUT -t mangle -j CONNMARK --restore-mark
iptables -A OUTPUT -t mangle -m mark ! --mark 0 -j ACCEPT
iptables -A OUTPUT -t mangle -m mark --mark 0 -p tcp --dport $PORT -m conntrack --ctstate NEW -j MARK --set-mark 2
iptables -A OUTPUT -t mangle -j CONNMARK --save-mark

I have worked around this by using SNAT, in the POSTROUTING chain, however I would like to clarify why the re-routing after mangling isn't working as I expect.

Is there something wrong with my understanding of the re-routing process? Is there something about the rules I have specified that is causing a problem? Or something else entirely. 

Thanks in advance,

Richard




