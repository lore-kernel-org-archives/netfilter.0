From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 16:07:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082038036.23863.41.camel@raylinux.internal>
References: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dHtQUGkZ7yryZcqeIesU"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
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


--=-dHtQUGkZ7yryZcqeIesU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-04-15 at 15:57, Nick Vazirianis wrote:
> iptables v1.2.8
> Linux Fedora Core 1
> Kernel 2.6.3
> =20
> I am having some trouble getting port forwarding within the attached
> script.
>  Please refer the line starting     # enable port forwarding for
> BitTorrent
> Incoming packets to these ports are being dropped (and logged) by the
> section lower down in the script, I have tried adding the enable port
>  forward section in different parts of the script, but this makes no
> difference.
> =20
> could soneone please help, I even tried adding the line=20
> $IPTABLES -A INPUT -i $EXT_IF -p tcp --dport 6881:6885 -j ACCEPT
> but i believe this only allows incoming into the firwall and not
> redirecting to another host
> =20
> someone please help=20
Maybe the source s not 6881 ...
$IPTABLES -A FORWARD -s 6881 -p tcp --dport 6881 -j ACCEPT
try
$IPTABLES -A FORWARD -p tcp --dport 6881 -j ACCEPT
instead
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-dHtQUGkZ7yryZcqeIesU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAfpcTh1fuR/Bv+ygRAgRNAKC6q/YaRuMylI4NHhm3so72bkDpgwCgg+cz
09uh3l8mUJ90MWYOJBAQjpA=
=z0L1
-----END PGP SIGNATURE-----

--=-dHtQUGkZ7yryZcqeIesU--


