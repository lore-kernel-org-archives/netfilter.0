From: alexb@atix.com.br
Subject: ROUTING thru two LINKs problem
Date: Tue, 11 Mar 2003 20:47:30 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047426450.3e6e759219a53@www.spsul.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a router conected to two diferent ISPs with diferent costs and got from
ISP1 a Class C ip range but only one IP from ISP2. I need to direct trafic from
a sub-range of real ISP1s IPs thru ISP2.
I redirected trafic behind my GW with NAT and ip rule add from SUB-ISP1 table
ISP2, but external trafic coming from ISP1 thru SUB-ISP1 ips got also out thru
ISP2 that drops the packets probably while source-ip(realy from SUB-ISP1) aren't
expected (some rp_filter).
I tryed in many ways to define a rule to route the replys of incoming conections
over ISP1 thru SUB-ISP1 back to ISP1 with no success.
Unfortunatle ESTABLISHED also gets packets from outgoing trafick expected to be
NATed over ISP2.
I couldn't find a way to distinguish replys of conections coming in from ISP1
from related packets of outgoing trafic


    ISP1                           ISP2
      |                              |
      |  200.ISP.2.0/24              |  200.ISP.1.17/30
      |                              |
    ------------------------------------
    | eth0    My Gateway          eth1 |
    |                                  |
    |                                  |
    |                eth2              |
    ------------------------------------
                      |
                      |
      ---------------------------------
       |        |          |           |
                                       | 200.ISP.2.64/27


I have something like:

ip rule from 200.ISP.2.62/27 to table ISP2
iptables -t nat -A POSTROUTING -s 200.ISP.2.64/27 -j SNAT --to 200.ISP.1.17

And in table ISP1 the default gateway is from ISP1 (200.ISP.1.18)


But when somone out in the INTERNET starts a conection to 200.ISP.2.65 this
comes in thru eth0 (ISP1), but the reply to this conection goes thru ISP1 over
eth1 (and with src=200.ISP.1.65, since it is a related packet and so no SNAT
tackes place, that couse ISP2 to drop the packet).

How can I route back thru ISP1(eth0) ONLY the packets of conections that first
started over eth0 ?

Thanks for any help

Alex

