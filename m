From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Request: Submission of Rulesets
Date: Thu, 25 Aug 2005 07:56:04 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCF13@farmer.vikus.com>
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
To: netfilter@lists.netfilter.org

=20
Out of curiosity (and the lack of fully understanding your intent), how
would this DTD validate a ruleset? I imagine you'd be trying to go
beyond syntax since netfilter will tell you when you do something silly
like a --dport without a -p tcp|udp anyway. If that's so, what is your
standard for failure of a ruleset? Or success of a ruleset? I can submit
a working ruleset that isn't optimal (accepting RELATED,ESTABLISHED
connections as the last rule, for example) or that checks src/dst IPs
but not which interface...

Admittedly I don't know that much about XML and DTDs. I don't know how
powerful DTDs can be, but it seems to me like you'd need a high-level
programming language in order to test for more than syntactical
correctness. A simulation environment for Netfilter rules is something
I'd really like to see.

Derick Anderson


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Thomas Jones
> Sent: Wednesday, August 24, 2005 6:48 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Request: Submission of Rulesets
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On Wednesday 24 August 2005 17:36, /dev/rob0 wrote:
> >
> > If I could remember the URL I would post it.
> >
>=20
> If you find it forward it to me. Sounds like it could be an=20
> interesting trick or two.
>=20
> >
> > Ah, *that* was the piece I was missing. You are accepting=20
> the rulesets=20
> > submitted as valid (probably) and are simply using them to=20
> test your=20
> > DTD. Is that it? I thought you were compiling it from the submitted=20
> > rulesets, and that, I guess we agree, is not possible.
> >
>=20
> Some of the targets and matches located in the extra=20
> repository have not been introduced. These will definitely=20
> take some work. Altough progress has been made, I am sure=20
> that I have neglected various syntactical portions of the=20
> netfilter framework.
>=20
> >
> > I still don't, but at least the gibberish issue is cleared up. :)
>=20
> Fair enough. ;)
>=20
> Cheers,
> Thomas
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFDDPlAoR5cE1e/kEIRAnTvAJ9MdKaDz6DME9g7XQRhK9ZfCHq8fQCcDQJq
> Y9zJBZ5HNohUBV8e0eg/D7Y=3D
> =3Dh+/H
> -----END PGP SIGNATURE-----
>=20
>=20

