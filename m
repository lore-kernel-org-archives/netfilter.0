From: Unknown <unknown@unknown.invalid>
Subject: Re: transparent squid with internal sites as well
Date: 27 Nov 2002 09:15:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038381319.1450.74.camel@rayw.knowledgefactory.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
	 <1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
	 <20021127085814.16b50de3.bain@tcsn.co.za>
	 <1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
	 <20021127091419.57f9a3e6.bain@tcsn.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hisb49um+pzZuK9n9glM"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <20021127091419.57f9a3e6.bain@tcsn.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Henti Smith <bain@tcsn.co.za>
Cc: Raymond Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-hisb49um+pzZuK9n9glM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-27 at 09:14, Henti Smith wrote:
> > > No it's not. the dns server is on the outside of the firewall.
> > > What does split horizon DNS do ?=20
> > >=20
> > Basically it resolves names to different ip addresses based on where th=
e
> > request came from. For example it can be setup so that if a person on
> > the local lan makes a dns request for www.foo.bar.com it will give back
> > 192.168.1.123 and if someone from outside requests www.foo.bar.com it
> > resolves to the public ip address , e.g. 196.4.160.123.
>=20
> Ok ... let me draw a complete picture then.=20
> We have two DNS servers one for internal use and one for external use.
> The internal uses the external for "normal" internet DNS and the internal=
 handles all internal DNS.
> So. If a machine on the internal network pings www.website.ady he gets 10=
.9.9.9
> on the outside you ping and get 196.9.9.9 which points to firewall. that =
ip on the firewall is being redirected to=20
> 10.9.9.9 on the inside.=20
>=20
> So in a sence the DNS is split.=20
> I think the problem tho is that once the redirecting os squid works corre=
ctly, it grabs the internal web as well and for some reason=20
> boggs it up. if it's not working the packets get to 10.9.9.9 on the inter=
nal network fine.
>=20
> I'm way new to transparent proxy, but I've done a bit of playing iptables=
.=20
> I'm going to play around witha  few more ideas tho.
We also use squid as a transparent proxy here. For internal websites
though, do you need them to go through the proxy? Is there some tracking
that you need to do, or would it not be possible to 'catch' the requests
to the servers using iptables before they get redirected to squid? This
is what we do, and it works fine.

Also, check what interface squid is using to process the request. It
might be trying to use the external interface instead of the internal
one.

Ray
>=20
> Thanks for the help so far.
>=20
> Henti=20
--=20

--=-hisb49um+pzZuK9n9glM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA95HEHh1fuR/Bv+ygRAlDMAKC4elU1hrPdwZ+pvNr2UMBMzRLLmACgmPL+
/VllWTARDU0Ggbn7z6yaeqg=
=MEsh
-----END PGP SIGNATURE-----

--=-hisb49um+pzZuK9n9glM--


