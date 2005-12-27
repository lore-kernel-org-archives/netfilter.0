From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 13:25:12 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B792@mailbox.vikus.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Richard Pickett
> Sent: Tuesday, December 27, 2005 11:49 AM
> To: 'netfilter'
> Subject: RE: DROP TCP output to HTTP attackers?
>=20
> > My only comment would be that for proxy users (AOL, for=20
> instance) you=20
> > may end up dropping legitimate traffic. The risk/reward of that is=20
> > something you'll have to determine for yourself.
>=20
> My logic is like this, if AOL polices it's outbound traffic=20
> the way we police our inbound traffic AOL wouldn't ever send=20
> us illegal packets.
>=20
> Oh, they've got these big adds on TV about how they are so=20
> safe etc. I'm sure by now my systems have all their public=20
> IPs blocked.
>=20
> An additional thought is friends don't let friends do AOL. If=20
> they want to use the service they have to accept the lameness=20
> that comes along with it.
>=20
> AOL has obviously compromised on security. Why should we=20
> compromise on security with them?

AOL is a bad example since far more legitimate ISPs use proxies and
businesses will typically NAT many clients to a single address. It would
be nice if ISPs had some kind of upstream filtering but the reality is
that most don't and their abuse@ address is an automated blackhole.

For me it boils down to risk and time: how do I mitigate the greatest
risks in the least amount of time. I've considered autoblocking before,
but the risks of dropping legitimate clients have always outweighed the
risk mitigation of dropping IPs sending bad packets.=20

Derick Anderson

