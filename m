From: richard lucassen <mailinglists@lucassen.org>
Subject: proxy_arp
Date: Fri, 25 Apr 2014 19:35:31 +0200
Message-ID: <20140425193531.55f41d258f184710b44487a2@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I have two identical Linux servers, two identical vanilla kernels
(3.2.57). I start an arping on srv1 to the *external* ip of srv2 using
the *internal* rfc1918 addressed NIC (eth2)

           +------+                        +------+
eth0       |      |  eth2            eth2  |      |  eth0
ip1a-------+ srv1 +--ip1b--<------>--ip2b--+ srv2 +--ip2a
outside    |      |  inside        inside  |      |  outside
           +------+                        +------+

    arping using eth1 ^^  --via-> eth2 ^^ to this ip --^^^

root@srv1# arping -I eth1 ip2a
ARPING 213.34.90.190 from 172.31.255.249 eth2
Unicast reply from 213.34.90.190 [00:15:17:F4:41:46]  0.891ms
Unicast reply from 213.34.90.190 [00:15:17:F4:41:46]  0.799ms
^CSent 2 probes (1 broadcast(s))
Received 2 response(s)

No problem, it works as expected. The other way round however:

           +------+                        +------+
eth0       |      |  eth2            eth2  |      |  eth0
ip1a-------+ srv1 +--ip1b--<------>--ip2b--+ srv2 +--ip2a
outside    |      |  inside        inside  |      |  outside
           +------+                        +------+

 ^^--<- arping to this ip <--via--- ^^ using eth2

root@srv2# arping -I eth2 213.34.90.130
ARPING 213.34.90.130 from 172.31.255.250 eth2
^CSent 15 probes (15 broadcast(s))
Received 0 response(s)

srv1 does NOT reply to arp requests, even if I add an:

"arp -sD eth1 ip1a" (which is not necessary)

I compared all sysctl settings, they are equal. ip_forward is set to 1
on both machines. The srv1 has a large iptables rulebase, the srv2 just
some simple rules. A tcpdump shows that srv1 receives the arp requests
but is not willing to honour the arp requests of srv2.

The goal is proxy_arping (which unexpectedly did not work), and I
found out that the machine srv1 even does not reply to arp requests of
its own ip addresses.

Any thoughts or hints on this matter?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
