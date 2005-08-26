From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Request: Submission of Rulesets
Date: Fri, 26 Aug 2005 07:57:32 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCF4E@farmer.vikus.com>
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
To: Thomas Jones <admin@buddhalinux.com>, netfilter@lists.netfilter.org

 =20
What you said made sense regarding DTDs and XSL stylesheets. XML (from
what I know of it) is a great standard.

> > I can submit
> > a working ruleset that isn't optimal (accepting RELATED,ESTABLISHED=20
> > connections as the last rule, for example) or that checks=20
> src/dst IPs=20
> > but not which interface...
>=20
> I am not here to judge yourself or the logical purpose of=20
> your rules. I simply want to contribute to the community.=20
> None of my projects are for profit.=20
> However, I do think that it could be a good starting point=20
> for new users to the netfilter framework to be able to=20
> construct valid rules and/or rulesets.

My point there wasn't to say "I'm going to try and mess up your
project", it was an example of what I was asking about earlier -
evaluation of a ruleset that goes beyond correct syntax. I'll be
rebuilding my company's iptables firewall soon (the previous sys-admin
didn't quite grasp stateful inspection or using least privilege) and so
perhaps I'll submit a copy with external IPs obfuscated.=20

I think there's a lot of work that can be done to ease the learning
curve for Netfilter. It took me a year to fully understand the basics -
where I knew what would happen to a particular packet as it traversed
the chains. A project like yours combined with a simulation environment
would have saved me a lot of dropped SSH sessions. =3D) I've got no
problem helping out.
=20
> > Admittedly I don't know that much about XML and DTDs. I=20
> don't know how=20
> > powerful DTDs can be, but it seems to me like you'd need a=20
> high-level=20
> > programming language in order to test for more than syntactical=20
> > correctness.
>=20
> That is a totally different beast. This is where the XSL=20
> stylesheets come into play.
>=20
> > A simulation environment for Netfilter rules is something=20
> I'd really=20
> > like to see.
>=20
> Agreed. Construction of pseudo datagrams and testing for=20
> resultant outcomes would be a very interesting project.=20
>=20
> Cheers,
> Thomas

Derick Anderson

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFDDddIoR5cE1e/kEIRAqn0AKDc0iJETnOHYDBWOQlekweswOj3sQCeIo/6
> LhSsuJbNwjqcG9fSmV5Hw2U=3D
> =3D0+PB
> -----END PGP SIGNATURE-----
>=20

