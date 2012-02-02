From: Netravali Ganesh <gnetravali@sonusnet.com>
Subject: RE: Routing the DNS Traffic via specific interface.
Date: Thu, 2 Feb 2012 04:52:28 +0000
Message-ID: <EB822645982FC24F99C33D9513902AFA0CCED0A2@inba-mail01.sonusnet.com>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
 <607824512.20120125163350@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <607824512.20120125163350@yandex.ru>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "gapsf@yandex.ru" <gapsf@yandex.ru>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi..

Thanks for the help. This worked excellent for me. I have another question on this.

Suppose if I have 2 interfaces say eth2 and eth3. If I want to implement conditional routing, say ex, eth2 is down and all DNS traffic needs to redirect via eth3 upon detecting the link failure, how do I do that.



Thanks
Ganesh Netravali


-----Original Message-----
From: gapsf@yandex.ru [mailto:gapsf@yandex.ru] 
Sent: Wednesday, January 25, 2012 3:04 PM
To: netfilter@vger.kernel.org; Netravali Ganesh
Subject: Re: Routing the DNS Traffic via specific interface.

No. You should use "Policy routing" with MARK target in iptables.

Mark outgoing DNS packets with iptables in mangle PREOROUTING for example.
# iptables -t mangle -A PREROUTING -p udp --dport 53 -j MARK --set-mark 0x4

Create additional routing table with different routing rules.
Add new entry in /etc/iproute2/rt_tables =========================================
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1     inr.ruhep
1      isp2 # <- new entry
=========================================

Then execute
# ip route flush table isp2
and add defalt route into newly created table # route add default via <ip_of_your_eth2_gateway> dev eth2 table isp2

Add new policy in RPDB.
# ip rule add from all fwmark 0x4 table isp2

Check RPDB
# ip rule show
You should view somthing like this:
0:      from all lookup local
32763:  from all fwmark 0x4 lookup isp2
32766:  from all lookup main
32767:  from all lookup default

In result: all traffic routed with main routing table, except marked DNS traffic routed via "isp2" routing table via its default route and iface.
View picture http://postimage.org/image/nn9owf5x7/ for example.

NG> Hi ..

NG> I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?

NG> Block the output DNS traffic on eth0 interface.

NG> iptables -A FORWARD -p udp -o eth0 --dport 53 -j DROP

NG> Forward output DNS traffic from eth1 interface

NG> iptables -A FORWARD -p udp -o eth1 --dport 53 -j ACCEPT


NG> Thanks
NG> Ganesh


NG> --
NG> To unsubscribe from this list: send the line "unsubscribe netfilter" 
NG> in the body of a message to majordomo@vger.kernel.org More majordomo 
NG> info at  http://vger.kernel.org/majordomo-info.html

