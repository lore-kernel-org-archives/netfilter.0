From: Prash <prashk@staff.btltd.net>
Subject: traceroute
Date: 13 Jun 2004 14:55:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087134949.24620.61.camel@hand2.loc.gv.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Peeps,

A weird problem. See my rules below on the INPUT chain. I have NOT
allowed 33434:33523 for traceroute on UDP but some people can and some
people can't do a traceroute. Any ideas? Traceroute should be accepted
only if I open 33434:33523 .. isn't it? Then why is it allowing some in.

I'm allowing everything on FORWARD and OUTPUT chain.

Also for DNS and Web, do I need to open any specific >1024 ports. That
should be covered by ESTABLISHED, RELATED .. isn't it?


#Accept ESTABLISHED
-A RH-Lokkit-0-50-INPUT -p tcp -m state --state ESTABLISHED,RELATED -j
ACCEPT
-A RH-Lokkit-0-50-INPUT -p udp -m state --state ESTABLISHED,RELATED
--dport 1024: -j ACCEPT

#Allow traceroute
###-A RH-Lokkit-0-50-INPUT -p udp --dport 33434:33523 -j ACCEPT

#Accept ICMP Ping
-A RH-Lokkit-0-50-INPUT -p icmp --icmp-type echo-request -m limit
--limit 5/second -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p icmp -j LOG

# Drop Everything else
-A RH-Lokkit-0-50-INPUT -j DROP


