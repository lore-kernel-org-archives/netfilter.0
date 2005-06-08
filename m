From: Vincent Lenouvel <vincent@info.unicaen.fr>
Subject: Re: netfilter logging
Date: Wed, 8 Jun 2005 15:34:40 +0200
Message-ID: <20050608153440.094d81e2.vincent@info.unicaen.fr>
References: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=_averell-5520-1118237682-0001-2"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
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
To: netfilter@lists.netfilter.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_averell-5520-1118237682-0001-2
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jun 2005 14:25:33 +0100 (BST)
"Jimmy" <squid@oranged.to> wrote:

> Hello,
>=20
> I have just started to log my iptables drops. As seen with this line in my
> iptables-save output.
>=20
> -A INPUT -j LOG --log-level 1
> -A INPUT -j LOG --log-prefix "Dropped: "
>=20
> What I would like to know is how I can get iptables to NOT log to console
> only to the message logs. Currently it goes into /var/log/syslog
>=20

	cf /usr/src/linux/kernel/printk.c

	echo "4 4 1 7">  /proc/sys/kernel/printk

[...]

--=20
Vincent Lenouvel - <vincent@info.unicaen.fr>

Universit=E9 de Caen, Campus II, Bd Mar=E9chal Juin, BP 5186, 14032 Caen

Empreinte de la cl=E9 =3D D14D EFE9 4F55 AF89 98B0  666B 17E5 C840 4B0D 80E4

wget -O - http://users.info.unicaen.fr/~vincent/signature.asc | gpg --import

--=_averell-5520-1118237682-0001-2
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCpvPxF+XIQEsNgOQRAgxHAJ4iVs3iO9tyBShKXaKwOshfzhhiFwCeIaff
oDX8NQNTHQ1ytsE51ZuUqc4=
=/qak
-----END PGP SIGNATURE-----

--=_averell-5520-1118237682-0001-2--

