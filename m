From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Routing decision?
Date: 15 Sep 2003 15:46:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063633591.31093.99.camel@raylinux.internal>
References: <3F657D37.1010000@able.be>
	 <1063616905.31092.78.camel@raylinux.internal>  <3F65981D.1060700@able.be>
	 <1063628083.31092.82.camel@raylinux.internal>  <3F65B63E.7030203@able.be>
	 <1063631398.31092.91.camel@raylinux.internal>
	 <1063632718.932.71.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eKsR4d5FDCdZOQ/P5gIH"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063632718.932.71.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Wim Ceulemans <wim.ceulemans@able.be>, Netfilter Mailing List <netfilter@lists.netfilter.org>, pieter@able.be


--=-eKsR4d5FDCdZOQ/P5gIH
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-15 at 15:31, Cedric Blancher wrote:
> Le lun 15/09/2003 =E0 15:09, Ray Leach a =E9crit :
> > I think that the aliases on the interface have something to do with it.
>=20
> Nope.
> When you DNAT an IP address that does not belong to your DNATing box,
> there won't be anybody to answer prior router ARP requests on it, unless
> you either set an alias up or tell this router that the IP as to get
> routed through the DNATing box.
>=20
> > I have had to add input and output rules in some situations to get DNAT
> > to work the way it is supposed to (redirect to a different destination)=
.
> > It is strange.
>=20
> Yes it is. I can get DNAT working without specifying any INPUT or OUTPUT
> chain. Can you illustrate a situation for which you have to specify
> INPUT and OUTPUT rules ?
Sure.

My firewall machine currently has 5 NICs, each with their own ip (one
has a public ip - eth0)
eth0 has the public ip. It also has 10 alias ips.
eth1 has a private ip of 192.168.1.1.
eth1 network is my dmz with all the web servers from 192.168.1.165 to
192.168.1.173.

If I want to DNAT incoming traffic destined to on of the aliases bound
to interface eth0 to a server in the dmz - eth1 192.168.1.165 (for
example), then I need :

 - a PREROUTING DNAT rule
 - a FORWAORD rule for each direction (eth0 -> eth1 and eth1 -> eth0)
 - and an INPUT rule for eth0 alias ip.

Does that make sense?

If I remove the INPUT rule, my DNAT does not work, the packets get sent
to the OUTPUT chain ...

Ray

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-eKsR4d5FDCdZOQ/P5gIH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/ZcK3h1fuR/Bv+ygRAn54AJ935TOUmyiltPyPBzOt0mcLfb5FIgCdEzVQ
qFMF1JcxFDNCN8kFCTrpznY=
=s+Fk
-----END PGP SIGNATURE-----

--=-eKsR4d5FDCdZOQ/P5gIH--


