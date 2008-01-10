From: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: Support for ICMP Time Exceeded in REJECT target ?
Date: Thu, 10 Jan 2008 10:23:30 +0100
Message-ID: <200801101023.35077.laurentp@cse-semaphore.com>
References: <200801091818.38810.laurentp@cse-semaphore.com> <4785D984.9000909@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2308161.DyyLLvkysN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4785D984.9000909@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?iso-8859-1?q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

--nextPart2308161.DyyLLvkysN
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 10 January 2008 09:38, G=E1sp=E1r Lajos wrote:
> Laurent Pinchart =EDrta:
>
> ...
>
> > I know that my application breaks the OSI model and creates some kind of
> > hybrid "layer 2.5" device. I'm open to suggestions regarding a better w=
ay
> > to implement bridges enumeration between two ethernet hosts, but using
> > the traceroute command is a customer requirement which could only be
> > changed with strong valid reasons.
>
> I'm really curios why would anyone need to enumerate the bridging host?
> Could you explain?

Our customer needs IP connectivity between two computers in the engines at=
=20
each end of the train. Each carriage will have an embedded routing device,=
=20
and connecting the carriages together creates a chain that ensures IP=20
connectivity.

The customer's application requires enumerating the carriages. One easy=20
solution was to enumerate the routing devices in the chain, either using=20
their MAC or IP address. Configuring the devices as layer 3 routers would b=
e=20
really complex, as all routing tables must be automatically updated wheneve=
r=20
a carriage is added or removed. Using layer 2 bridges is much easier, but w=
e=20
then loose layer 3 route tracing. This is why we thought about making some=
=20
kind of hybrid device that acts as a layer 2 bridge except that it decremen=
ts=20
the IP TTL and sends an ICMP Time Exceeded message when the TTL reaches 0.

Best regards,

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75

--nextPart2308161.DyyLLvkysN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBHheQX8y9gWxC9vpcRApBhAKCMM+M/oVDFQ4aZsrlTav9WLDqpmQCePbvl
GKg3PjUf6fkwsaif0/bjSog=
=vGJO
-----END PGP SIGNATURE-----

--nextPart2308161.DyyLLvkysN--
