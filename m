From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: owner based policy routing
Date: Fri, 11 Oct 2002 09:34:38 +0530
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <3DA64DD6.7080805@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LARTC <lartc@mailman.ds9a.nl>
Cc: NETFILTER <netfilter@lists.netfilter.org>

hi all,

THE SCENARIO:
we are connected to 2 isp, both having their large network.. isp A has 
gateway with ofc network while ispB has satellite gateway & hence there 
are advantages to take specific routes thru specific isp.

PRESENT IMPLEMENTATION:
the present linux box with kernel-2.4.19, julains multiroute patch, 
iproute-ss020116, htb3.6-020525 & iptables-1.2.7a... this box has 5 
ether ports & presently doing only **source** based policy routing for 
access to internet...at present no squid is implemented in this box... 
things are working good for last 40-45 days !

THE RULES DEFINED:
10: 
from all lookup main
50:     from <ipNetispA> lookup ispA
50:     from all fwmark       50 lookup ispA
75:     from <ipNetispB> lookup ispB
75:     from all fwmark       75 lookup GNFC
100:    from <localNetA> lookup balance
100:    from <localNetB> lookup balance
100:    from <localNetC> lookup balance
100:    from all fwmark      100 lookup balance
32766:  from all lookup main
32767:  from all lookup default

THE ROUTES:
[root@ICG surfNet]# ip route ls ta ispA
default via <gatewayISP-A> dev eth3  proto static  src <eth3ISP-A>
prohibit default  proto static  metric 1
[root@ICG surfNet]# ip route ls ta ispB
default via <gatewayISP-B> dev eth0  proto static  src <eth0ISP-B>
prohibit default  proto static  metric 1
[root@ICG surfNet]# ip route ls ta balance
default  proto static
         nexthop via <gatewayISP-A>  dev eth3 weight 3
         nexthop via <gatewayISP-B>  dev eth0 weight 1
prohibit default  proto static  metric 1
[root@ICG surfNet]# ip route ls ta default
default via <gatewayISP-B> dev eth0

THE GOAL:
we want policy routing based on owner of the packet, in perticular we 
want to handle squid to take the best path--best path according to 
us(pls no BGP here).

WHAT WE TRIED:
we tried using iptables owner based rules & marked packets( as one can 
see in rules above), but it didnt help.
iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 202.0.0.0/8 
  -j MARK --set-mark 50
iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 204.0.0.0/7 
  -j MARK --set-mark 50
iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 203.0.0.0/8 
-j MARK --set-mark 75
iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 216.0.0.0/8 
-j MARK --set-mark 75


but packets were not marked as seen by >> iptables -nvL -t mangle
& hence owner based pilicy routing not working

... hence now we turn to the list for help..
awaiting a reply ...
thanx to you all in advance...
A.H

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
