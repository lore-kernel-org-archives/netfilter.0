From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: filtering in which rules?
Date: Sat, 21 May 2005 03:11:30 +0200
Message-ID: <428E8AC2.8090005@lopsch.com>
References: <42889941.5060507@griffous.net>	<4288E7F6.3030700@riverviewtech.net>	<Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>	<Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>	<42890B63.2000603@riverviewtech.net>
	<Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505202018220.12153@darkstar.sysinfo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: netfilter@lists.netfilter.org

R. DuFresne schrieb:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> Jason et. al.,
>=20
>=20
> I wacthed the discusion today on leaving filtering to the filter chain=20
> and leave nat to nat and routing to the pre/post chains.  But, when one=
=20
> reads other documentation and it has paramaters to iptables like this;
>=20
>=20
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
> iptables -t nat -P PREROUTING DROP
> iptables -t nat -P POSTROUTING DROP
>=20
>=20
> It g9ives one the impression that matters of filtering and decision=20
> making for a packet are not as carved in stone as implied in the=20
> discusion today. Jason makes some great points about complexity of=20
> rulesets and trying to maintain that accross a number of firewalls=20
> overtime.  But, that seems to implay that others have adopted complexit=
y=20
> and feel fine with all it brings to the maintainace table.  Unless I'm=20
> reading the DROP defaults for the pre/post routing above.  So for=20
> clarification one more time, should one read these docs with a grain of=
=20
> salt and alter acordingly, perhaps placing a default ACCEPT in the=20
> pre/post chanins and then doing what filtering is required in the=20
> 'proper' filter chains for clarity? I direct this to Jason in=20
> particular, though Grant as well as others may wish to input again=20
> <cause Jason and Grant seem to know their stuff when it comes to iptabl=
es>.
>=20
> Thanks,
>=20
>=20
> Ron DuFresne

Hmm I do filtering, mangling and natting in the appropriate tables for=20
better arrangement and because afaik some things can only be done in the=20
responsible tables. For example the outgoing interface shouldn=B4t be=20
known in the PREROUTING chain of the nat table unless iptables uses it=B4=
s=20
own routing algorithm for finding it out or a hook to the existing one I=20
don=B4t really know.
I think it=B4s difficult to find a way so that the filtering will be=20
effective. For example should DROP be as soon as possible so the packet=20
won=B4t traverse all needed chains.
e.g.:
 > iptables -P INPUT DROP
 > iptables -P FORWARD DROP
 > iptables -P OUTPUT ACCEPT
 > iptables -t nat -P PREROUTING DROP
 > iptables -t nat -P POSTROUTING DROP
Let=B4s assume a packet destined to the machine no forwarding necessary.
If you don=B4t want that packet (no ACCEPT rules in the nat PREROUTING fo=
r=20
that type) it will be dropped.
With this set
 > iptables -P INPUT DROP
 > iptables -P FORWARD DROP
 > iptables -P OUTPUT ACCEPT
 > iptables -t nat -P PREROUTING ACCEPT
 > iptables -t nat -P POSTROUTING ACCEPT
the packet also would have to traverse the INPUT chain until it would be=20
dropped.
Only as an example.
I also think positioning the rules in an order within the chains=20
depeding on the frequency you expect a packet has an effect on=20
effectiveness. The deeper you have to traverse a chain the more time it=20
takes to handle the packet. For alot of packets it can have an effect.

