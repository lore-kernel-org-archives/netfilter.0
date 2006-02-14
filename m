From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: ipsec and iptables
Date: Tue, 14 Feb 2006 17:30:45 +0100
Message-ID: <BAY103-F314AB42DCC4D2185B7AF25B2060@phx.gbl>
References: <010501c6317b$9db3e9f0$b00aa8c0@a2smark>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <010501c6317b$9db3e9f0$b00aa8c0@a2smark>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark@alpha2.com
Cc: netfilter@lists.netfilter.org


Mark L. Wise wrote:

>Here is the configuration:
>
>192.168.20.0/24(net)-->[192.168.20.2(gw)-->$PUBLICIP1 <firewall # 1>]  ....
>internet
>.... internet [<firewall # 2>
>$PUBLICIP2<--192.168.30.100(gw)<--192.168.30.0/24(net)
>
>Without NAT, all packets can reach every destination internally.  When I 
>add
>the following to allow NAT to allow the internal machines access to the
>internet, packets are no longer routed to the opposite local net;
>
>iptables -t nat -A POSTROUTING -d ! 192.168.30.0/24 -j SNAT --to-source
>$PUBLICIP1

mhhh... what linux kernel version are you using?  There are some know issue
when you try to snat esp packet with linux < 2.6.15-git8

>How can I route outgoing packets going to 192.168.30.0/24 (opposite 
>internal
>net) differently than packets going to other addresses????

Try these rule:

iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -d 192.168.30.0/24 -j 
ACCEPT
iptables -t nat -A POSTROUTING --protocol esp -j ACCEPT (don't snat ipsec 
packets)

iptables -t nat -A POSTROUTING --protocol tcp -j SNAT --to-source $PUBLICIP1
iptables -t nat -A POSTROUTING --protocol udp -j SNAT --to-source $PUBLICIP1

Ciao



