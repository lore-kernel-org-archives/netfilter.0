From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: QoS on dynamic port allocation protocols
Date: 13 Mar 2003 07:28:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047533324.11445.64.camel@raylinux.internal>
References: <OFA83BF598.09B2B5B9-ON83256CE8.000228A8@LocalDomain>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yP/pbscZOlCGJV9EM9XN"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFA83BF598.09B2B5B9-ON83256CE8.000228A8@LocalDomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-yP/pbscZOlCGJV9EM9XN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-03-13 at 03:09, Antonio Paulo Salgado Forster wrote:
> Hello all,
>=20
>       I'm trying to apply QoS rules on protocols that use dynamic port
> allocation on secondary connections such as ftp or H323 that have a
> specific iptables helper to handle them, and the problem begins when the
> secondary connections startup.  Would the connmark module mark also the
> seconday connections if you tells it to mark the main flow?  Or, is there
> any way to to match a packet using, at the same time, the -m state --stat=
e
> RELATED match and check if the related connection belongs to a ftp sessio=
n?
>=20
> Any ideas are appreciated. Thanks in advance.
>=20
> Forster

Depending on your QoS setup, you could use the -m state --state RELATED
and the fwmark patch to mark the packets. Then your QoS filters could be
triggered by the fwmark values.


--=-yP/pbscZOlCGJV9EM9XN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+cBcMh1fuR/Bv+ygRAltdAJ96SlLZUoLB436YLxXCgV4RhcclSACfTXNp
ErapTdkFwkeiOVGPOdezOMY=
=nxcW
-----END PGP SIGNATURE-----

--=-yP/pbscZOlCGJV9EM9XN--


