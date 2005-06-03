From: "Ginter, Jeff A" <Jeff.Ginter@ca.com>
Subject: RE: 2 Questions--state (est, rel) and tuning
Date: Fri, 3 Jun 2005 10:06:30 -0400
Message-ID: <B80488675062364A909EE60F4A66603807840EAE@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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


I think I am still a bit confused...I understand what you are saying =
about why established and related would be needed for return packets, =
except...

For example on a Checkpoint or PIX you would NOT need the established or =
related rules.  They are aware that a conversation has started and will =
let return packets in....of course, it is possible that there is an =
implicit rule on a Checkpoint or PIX that is "hidden" that allows =
established and related and the user just doesn't see this and in =
iptables you do...but I thought this was part of the state engine.

Thanks again and sorry for my lack of understanding of the iptables =
code...however I think it's a fantastic security system, just trying to =
get my hands around it.
=20
=20
Jeff Ginter, CISSP
Computer Associates
Mid-Atlantic Consulting Manager
tel:    +1 908 874-9726
cell:   +1 609 577-1494
jeff.ginter@ca.com
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Daniel Lopes
Sent: Friday, June 03, 2005 9:24 AM
Cc: netfilter@lists.netfilter.org
Subject: Re: 2 Questions--state (est, rel) and tuning

Ginter, Jeff A schrieb:
> Hello,
>=20
> =20
>=20
> I am brand new to the list and couldn't find an easy way to browse the
> whole archive, so my apologies if this has been discussed (as it
> probably has).
>=20
> =20
>=20
> I understand the state concepts, however, I keep seeing example =
iptable
> scripts with the first rule in each chain being something =
like....ACCEPT
> related and established packets. =20
>=20
> =20
>=20
> My first question is...Is that really needed?  In my other experiences
> with stateful firewalls this rule is not needed because the firewall
> remembers the outgoing packet and the rule is implied...or do I have
> this very wrong?
>=20

Hmm you often will see a default policy of DROP in the filter tables. So =

related to the strategy deny all allow needed. Then new connections from =

inside to outside are explicitly allowed with the NEW state. Then when=20
answer packets come back in and reach a filter table and there is no=20
rule to handle them they will be dropped. Therefor there are the EST.=20
and REL. states to allow that packets because they should be save enough =

as new conns. are only allowed/initiated from inside to outside. Surely=20
it doensn=B4t prevent a machine with a freaking worm to spread out ;).

>=20
> =20
>=20
> My second question, which may not be totally applicable for this list
> is...I have my netfilter/iptables set up on a Redhat 4 Ent WS =
box...are
> the following parameters for hardening still useful and applicable =
with
> the current kernel and distro?
>=20
> =20
>=20
> net.ipv4.tcp_syncookies =3D 1
> net.ipv4.conf.all.accept_source_route =3D 0
> net.ipv4.conf.all.accept_redirects =3D 0
> net.ipv4.conf.all.rp_filter =3D 1
> net.ipv4.icmp_echo_ignore_all =3D 1 =3D 1
> net.ipv4.icmp_echo_ignore_broadcasts =3D 1
> net.ipv4.icmp_ignore_bogus_error_responses =3D 1
> net.ipv4.conf.all.log_martians =3D 1
>=20

Yes they are.

> =20
>=20
> Thanks very much for any help!
>=20
> =20
>=20
> =20
>=20
> =20
>=20
> Jeff Ginter, CISSP
>=20
> Computer Associates
>=20
> Mid-Atlantic Consulting Manager
>=20
> tel:    +1 908 874-9726
>=20
> cell:   +1 609 577-1494
>=20
> jeff.ginter@ca.com
>=20
> =20
>=20
> =20
>=20
>=20





