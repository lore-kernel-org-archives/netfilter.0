From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 17:26:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512EE@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have been trying various set of rules in various table in order to =
have packets go over
> the right link. ie. packet's src add should match outgoing link's ip =
address.YET, there
> are some packets that always tend to go over the wrong link and thus =
causing ip address
> change. They mostly seem to be ICMP Destination Unreacheable messages =
or DNS queries.

please verify that the ICMP dest-unreach & DNS queries are not locally =
generated packets from the firewall machine itself.  everything you're =
doing thus far applies to packets being routed through the firewall; not =
from the firewall--that's a whole different story...

> I tried out the rules that Daniel Chemko so generously had provided me =
with...and they
> don't seem to work. I am probably not doing something right. I just =
tried thefollowing
> rules with no luck:
>
> iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
> iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
> iptables -t mangle -A PREROUTING -m mark ! --mark 0 -p icmp -j MARK =
--set-mark 1
> iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j MARK --set-mark =
2
> iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> ptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
>
> Are these rules supposed to create 2 routing tables???? If they do, I =
don't seem them?
> This is what I see:
>
> [ ]# ip rule list
> 0:      from all lookup local
> 32766:  from all lookup main
> 32767:  from all lookup 253

no--iptables commands do not create extra routing tables--you have to do =
this yourself.  hopefully, you've been studying up on =
http://lartc.org/howto/index.html (specifically =
http://lartc.org/howto/lartc.netfilter.html)

something like:

  echo 500 icmp >> /etc/iproute2/rt_tables
  ip rule add fwmark 1 table icmp
  ip route add default via $ICMP_LINK dev $ICMP_LINK_IF table icmp

will make the packets marked with "--set-mark 1" (icmp packets in your =
example), get their default gateway from the alternate routing table =
named "icmp"

again--this applies to packets being routed through the gateway, not to =
packets coming from the gateway.

-j

