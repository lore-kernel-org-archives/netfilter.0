From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: two ISP's woes?
Date: Thu, 25 Aug 2005 17:09:12 +0200
Message-ID: <430DDF18.9000100@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi list

K im into my third week now and I still have not resolved this routing / second isp  issue.

I have been fortunate in that someone advised me that I this is not as complex has I initially had thought and I just use the ROUTE target.

I initially tried from the following example:
http://lartc.org/howto/lartc.rpdb.multiple-links.html

which too did not work for me.

any way my setup is so:


	            |		INTERNET	    |		(I sure hope this gets displayed correctly)
       ----------------------------------------
		    |					  |
		    |(Static IP)			|(Dynamically assigned ISP)
		-------- 	            ---------
		  | ISP A |            		  | ISP B |
		--------         	     ---------
		    | 196.36.10.113	      | 192.168.10.200
		    |		                        |
		    |                                   |
		    |           			| 192.168.10.100 (eth2)
		    | 196.36.10.114 (eth0) ------
		    -------------------| My FW  |
				                      --------
						            | 192.168.111.10 (eth1)
							    |
							    |
				       -------------------------- internal network
				              192.168.111.0/24

ISP A = Internet Solutions ADSL ROUTER
ISP B = Telkom ADSL MODEM

My ROUTE modules:
gate:/var/log# lsmod
Module                  Size  Used by
ipt_ROUTE               5272  0
gate:/var/log#


My default routing is as so:

gate:~# ip route show table main
196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
default via 196.36.10.113 dev eth0
gate:~#

And  test firewall ruleset:

$IPT -A POSTROUTING -t mangle -p tcp --dport 80 -j ROUTE --oif eth2

# SNAT the Private LAN
$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j SNAT --to-source 196.36.10.114
$IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j SNAT --to-source 192.168.10.100

$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A FORWARD -m state --state INVALID -j LOG --log-prefix "INVALID forward: " --log-tcp-options --log-ip-options
$IPT -t filter -A FORWARD -m state --state INVALID -j DROP

$IPT -t filter -A FORWARD -i eth1 -o eth0 -m multiport -p tcp --dport 25,53,110,113,123,143,6667 -m state --state NEW -j ACCEPT
$IPT -t filter -A FORWARD -i eth1 -o eth0 -m multiport -p udp --dport 53,123,500 -m state --state NEW -j ACCEPT

$IPT -t mangle -A FORWARD -i eth1 -p tcp --dport 80 -j ROUTE --oif eth2 --continue
#$IPT -t mangle -A FORWARD -i eth1 -p tcp --dport 80 -j ROUTE --oif eth2
#$IPT -t filter -A FORWARD -i eth1 -o eth2 -m multiport -p tcp --dport 80,443 -m state --state NEW -j ACCEPT

What im trying to achieve is that all my traffic goes out eth0 (196.36.10.114 / ISP A) except for all HTTP traffic, that I would like to go out ISP B.

I may be having a problem where by my ADSL ISP B modem has to NAT twice ( (But I dont see this as an issue) FROM 192.168.111.0 / 24 to 192.168.10.0/24 to dynamicly assigned IP).
I suppose I can get the modem to work in bridging mode, but I first want to get this experimentt working first before I venture down this path.

I got this gut feeling that this is doable and can work, but I just dont know where Im falling short.

as I aways ask, if anyone has got any tips or tricks that could help me, I would be most greatful.

Kind Regards and thanks in advance.

Brent Clark



