From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Mon, 22 Nov 2004 16:39:10 -0500
Message-ID: <20041122213910.GA31537@bender.817west.com>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD0BD.6000906@uni-paderborn.de>
	<1101061543.3501.18.camel@hubcap.ljm.dom>
	<41A11AD5.3080401@uni-paderborn.de>
	<1101131121.13662.17.camel@hubcap.ljm.dom>
	<41A2010A.9090601@uni-paderborn.de>
	<20041122175440.GA31032@bender.817west.com>
	<41A23EE6.4080804@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41A23EE6.4080804@uni-paderborn.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: bj-schmidt@uni-paderborn.de

On Mon, Nov 22, 2004 at 08:32:54PM +0100, Bj=F6rn Schmidt wrote:
> Jason Opperisano wrote:
> >alright--let's reset here.  this is how i understand the situation:
> >
> >you have two machines:
> >
> >192.168.1.1	(skyron)
> >192.168.1.2	(gigabyte)
>=20
> Yes.
>=20
> >there's an IPSec tunnel setup between the two machines to encrypt all
> >traffic between them.
>=20
> No, not a tunnel. IPsec in transport mode:
>=20
> http://www.ipsec-howto.org/x247.html
>=20
> >you are trying to initiate an SSH connection from 192.168.1.1 to
> >192.168.1.2.
>=20
> No, from 192.168.1.2 to 192.168.1.1
>=20
> >192.168.1.2 is running iptables.
>=20
> Yes.
>=20
> >with no rules loaded on 192.168.1.2, the SSH connection from 192.168.1=
.1
> >succeeds.
>=20
> No, but:
>=20
> with no rules loaded on 192.168.1.2, the SSH connection from 192.168.1.=
2
> to 192.168.1.1 succeeds.
>=20
> >once you load a basic ruleset on 192.168.1.2--the ACK packets from
> >192.168.1.2 to 192.168.1.1 get dropped in the OUTPUT chain which allow=
s
> >"-m state --state ESTABLISHED" packets.
>=20
> Yes.

would you be so kind as to humor me by loading the following rule set on
192.168.1.2?  essentially--it is the minimal ruleset you can load on
192.168.1.2 to allow bi-directional, IPSec-only communications between
the two machines.  if 192.168.1.2 needs to communicate outbound to other
hosts, or if other hosts need to communicate to 192.168.1.2--this rule
set DOES NOT take that into account (you've been warned).  you'll also
probably have to re-establish the VPN after the firewall rules are
loaded (i.e. load firewall rules first, then initiate VPN).

if you choose to load it--let us know what happens.

---BEGIN SCRIPT---

VPNPEER=3D"192.168.1.1"

for table in mangle nat filter; do
  iptables -t $table -F
  iptables -t $table -X
  iptables -t $table -Z
done

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -t mangle -A PREROUTING -p 50 -s $VPNPEER -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -p 51 -s $VPNPEER -j MARK --set-mark 1

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m mark --mark 1 -m state --state NEW -j ACCEPT
iptables -A INPUT -p 50 -s $VPNPEER -j ACCEPT
iptables -A INPUT -p 51 -s $VPNPEER -j ACCEPT
iptables -A INPUT -p udp -s $VPNPEER --sport 500 --dport 500 -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "INPUT DROP: "

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p 50 -d $VPNPEER -j ACCEPT
iptables -A OUTPUT -p 51 -d $VPNPEER -j ACCEPT
iptables -A OUTPUT -p udp -d $VPNPEER --sport 500 --dport 500 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -d $VPNPEER -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -j LOG --log-prefix "OUTPUT DROP: "

--- END SCRIPT ---

-j

--
"Ah, beer, my one weakness. My achilles heel, if you will."
        --The Simpsons

