From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: A drop-in firewall
Date: 04 Sep 2003 11:53:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062669234.1615.28.camel@kermit>
References: <5.2.1.1.0.20030830201439.01072380@fluent2.pyramid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20030830201439.01072380@fluent2.pyramid.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Stephen Satchell <list@fluent2.pyramid.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Son, 2003-08-31 um 05.25 schrieb Stephen Satchell:
> Background:  I used to be an audio engineer, and got used to the idea tha=
t=20
> a properly-designed and -maintained sound chain meant that each block was=
=20
> designed to "drop in" such that a failure of any component could be=20
> bypassed simply by patching around it.
Use a bridging firewall.

http://www.spenneberg.com/talks/linux-kongress2002/ralf-spenneberg.bridgewa=
ll.pdf

That does everything you want.

Cheers,

Ralf
>=20
> Situation:  I have a series of Windows boxes that were infected with MS=20
> Blaster and SoBig.  The net result was that my network of 200 computers w=
as=20
> completely brought to its knees when these Windows boxes started doing=20
> their thing.  I don't control the Windows boxes (co-lo situation).
>=20
> Desired solution:  "Drop" a Linux box between the Windows boxes and the=20
> rest of the internal network.  Use IPTABLES to ensure that the Windows=20
> boxes can't do anything nasty to the rest of the systems in the room,=20
> without impairing access to the rest of the Internet.
>=20
> SOLUTION 1:  Use the experimental ROUTE target:
>       Public-network interface has the addresses of all Windows boxes on=20
> the protected network.  Design rules that take packets destined for those=
=20
> boxes and route them instead to the protected-network port.  Bypass the=20
> routing table completely.
>      Protected-network interface has the address of the site=20
> gateway.  Design a rule that takes packets destined for the gateway and=20
> route them instead to the public network interface.  Bypass the routing=20
> table completely.
>      Use regular FILTER FORWARD rules to impose access rules on the local=
 /24s.
>=20
> SOLUTION 2:  Use MARK target
>      How does this work?  Google doesn't bring up any usable=20
> discussion.  Pointers?
>=20
> What makes solution 1 not very usable is that Red Hat doesn't include the=
=20
> ROUTE target in its distributions.  Attempts to use Patch-o-Matic haven't=
=20
> worked with Red Hat kernel source.  I'm going to try vanilla 2.4.22 from=20
> linux.org to see if I have better results with that.
>=20
> Is there any other way to do a drop-in firewall?
>=20
> OK, you ask, why a "drop-in"?  Because the usual methods require the=20
> customer boxes to be renumbered, and I don't have access to the guts of t=
he=20
> customer boxes.  The other standard method requires our Cisco 7500 be=20
> updated with a route, and the network manager is scared to make the=20
> change.  "Why can't you just do it all in the Linux box?" he asks?
>=20
> The other issue is that some of our support technicians don't know how to=
=20
> do anything with the routers, so if the firewall fails the ass-wipes can'=
t=20
> just patch around it and have the customer box "just work".
>=20
> Hints?  Pointers?  Is there a FAQ in the house?
>=20
> Satch
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

