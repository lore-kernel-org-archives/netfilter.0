From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: http-rules and browsing ebay Problem
Date: Wed, 11 Feb 2004 15:09:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076504982.2747.83.camel@raylinux.internal>
References: <25706769.1076502938552.JavaMail.ngmail@webmail02.arcor-online.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5WvX2DJEN9nT2jOwcXLR"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <25706769.1076502938552.JavaMail.ngmail@webmail02.arcor-online.net>
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


--=-5WvX2DJEN9nT2jOwcXLR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-02-11 at 14:35, mgeschermann@arcor.de wrote:
> Hi all,
>=20
> I spend a lot of time on building my own firewall-script. Mostly everythi=
ng is working fine (some things aren't tested yet), but I've got a tricky p=
roblem and hope you can help me.
>=20
> If I want to open the ebay-site from either the firewall or an client my =
browser tells me after a some seconds "This site could not be displayed."
>=20
> I've done some logging and noticed, that after the reply I get a packet w=
ith status "NEW" from ebay. (within a few seconds after the the first reply=
)
>=20
>=20
> I'm running Suse 9.0 on my router/firewall with iptables 1.2.8. I'm using=
 ip_conntrack.
> (The problem occurs even without conntrack.)
>=20
>=20
> here my rules:
>=20
> iptables -t nat -A PREROUTING -i $IFACE_LAN -p tcp -s $LOCAL_LAN --dport =
$HTTP_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> iptables -A FORWARD -i $IFACE_LAN -o $IFACE_EXT -p tcp -s $LOCAL_LAN --dp=
ort $HTTP_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> iptables -A FORWARD -i $IFACE_EXT -o $IFACE_LAN -p tcp -d $LOCAL_LAN --sp=
ort $HTTP_PORT -m state --state RELATED,ESTABLISHED -j ACCEPT

Do you use a proxy server on the internal LAN?

Try doing a tcpdump showing all traffic from and to the workstation and
ebay web site.

There was a 'problem' with earlier versions of IE where the browser
would send a NEW packet after the connection was closed, never did
figure out why?

Regards

Ray
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-5WvX2DJEN9nT2jOwcXLR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAKimWh1fuR/Bv+ygRAkv7AJ4oztzTHh/P9zFvVk3PaogIZjSR+QCgjVpH
9QpQlSbJX5BOd1T8cIkS3wk=
=MIDf
-----END PGP SIGNATURE-----

--=-5WvX2DJEN9nT2jOwcXLR--


