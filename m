From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: Some progress, new problems on DNAT with 2 uplinks
Date: Wed, 15 Oct 2003 19:08:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E1296036@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter list <netfilter@lists.netfilter.org>

First of all, thanks for the help.

The ROUTE target does come in handy, I've combined it with the match =
"conntrack" because that makes the info I need availlable: "-m conntrack =
--ctorigdst" gives me the original destination of the connection the =
return packets are part of.

However (you saw that coming, didn't you ;), for some strange reason the =
following rules result in the out-going packets not being UnDNATted =
again?!

iptables -t mangle -D POSTROUTING -s INTNET/INTMASK -m conntrack =
--ctorigdst EXTIP1 --ctstate ESTABLISHED,RELATED -j ROUTE --gw EXTGW1 =
--oif EXTDEV1

iptables -t mangle -D POSTROUTING -s INTNET/INTMASK -m conntrack =
--ctorigdst EXTIP2 --ctstate ESTABLISHED,RELATED -j ROUTE --gw EXTGW2 =
--oif EXTDEV2

These go out with the Internal (private) address... oops!

I will try the trick with fw-mark and using iproute2 to do the actual =
routing next.

One other observation: if one enables "Multipath routing" in the kernel =
config, one is _required_ to set a multipath route or your second line =
is unusable. (try setting a default route on line1, and just the normal =
local routes on all other interfaces, now do "ip route get <internal =
address> from <external address> iif <extdevline2>" where external =
address is some host on the internet. Very unfunny.

Gaby Schilders
IBFD network admin

