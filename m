From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: some help please...
Date: 19 Mar 2003 13:10:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048072202.2376.36.camel@raylinux.internal>
References: <NEBBICCJKLGJHMMNBPIKIEKLEHAA.sbisgaard@xtrasource.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-pgU0cHLA9PeGz5yhJOCx"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBICCJKLGJHMMNBPIKIEKLEHAA.sbisgaard@xtrasource.com>
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


--=-pgU0cHLA9PeGz5yhJOCx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-19 at 12:58, Steffen Bisgaard wrote:
> Hallo,
>=20
> I keep getting the following coming on my screen when iptables is running=
.
> My guess is that it is a backupexec client trying to reach the 10.2.0.13
> server. Can someone help me allowing this through?
>=20
Based on /etc/services I would guess that it is some kind of network
time protocol:

firefly:/etc/rc.d/rc3.d # grep 6101 /etc/services
synchronet-rtc  6101/tcp        # SynchroNet-rtc
synchronet-rtc  6101/udp        # SynchroNet-rtc


> CHAININ=3D OUT=3Deth0 SRC=3D10.2.10.8 DST=3D10.2.10.3 LEN=3D60 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D64 ID=3D21580 DF PROTO=3DTCP SPT=3D8193 DPT=3D6101 WINDOW=3D5840 RE=
S=3D0x00 SYN
> URGP=3D0
> END OF OUTPUT
>=20
> Many thanks in advance.

--=-pgU0cHLA9PeGz5yhJOCx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+eFAKh1fuR/Bv+ygRAjwkAJ9KboEGDz8tsTOHTDkL736xkYR43QCgr2V4
kGVGykIeyPnO97n1oFPnqWA=
=LhNO
-----END PGP SIGNATURE-----

--=-pgU0cHLA9PeGz5yhJOCx--


