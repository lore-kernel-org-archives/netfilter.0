From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: iptables delay connection phase
Date: 30 Jun 2003 09:33:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056958383.8463.14.camel@raylinux.internal>
References: <002d01c33ed7$360fc600$8101a8c0@tani>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-bRsJo/3PJmVxx/l5b4VO"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002d01c33ed7$360fc600$8101a8c0@tani>
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


--=-bRsJo/3PJmVxx/l5b4VO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Make sure that your rc.firewall allows auth (port 113). That is most
likely causing your delay.

On Mon, 2003-06-30 at 09:14, eNet wrote:
> Hello List,
> =20
> I am new in iptables and list.
> =20
> I have problem when my dialup clients trying to check their emails.
> There is a delay because of iptables. On that box I use linux kernel
> 2.4.19 and rc.firewall=20
> =20
> Here are more details of what is happening:
> =20
> Case  1. without iptables . It is OK. No delay.
> 19:45:51.756818 arp who-has xxx.xxx.xxx.1 tell xxx.xxx.xxx.129
> 19:45:51.756837 arp reply xxx.xxx.xxx.1 is-at yy:yy:yy:yy:yy
> 19:45:51.756920 xxx.xxx.xxx.129.2814 > NS1.enet.org.al.pop3: S
> 1490445489:1490445489(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
> 19:45:51.756988 NS1.enet.org.al.pop3 > xxx.xxx.xxx.129.2814: S
> 401842756:401842756(0) ack 1490445490 win 5840 <mss
> 1460,nop,nop,sackOK>=20
> (DF)
> 19:45:51.757102 xxx.xxx.xxx.129.2814 > NS1.enet.org.al.pop3: . ack 1
> win 17520 (DF)
> 19:45:51.761677 xxx.xxx.xxx.1.48021 > xxx.xxx.xxx.129.auth: S
> 387191140:387191140(0) win 5840 <mss 1460,sackOK,timestamp 251690774=20
> 0,nop,wscale 0> (DF) 19:45:51.761856 xxx.xxx.xxx.129.auth >
> xxx.xxx.xxx.1.48021: R 0:0(0) ack 387191141 win 0
> =20
> etc...
>=20
> Case 2. iptables activated. Problem: delay
> 20:00:43.670848 xxx.xxx.xxx.129.2824 > NS1.enet.org.al.pop3: S
> 1713847144:1713847144(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
> 20:00:43.670903 NS1.enet.org.al.pop3 > xxx.xxx.xxx.129.2824: S
> 1342878817:1342878817(0) ack 1713847145 win 5840 <mss
> 1460,nop,nop,sackOK>=20
> (DF)
> 20:00:43.671015 xxx.xxx.xxx.129.2824 > NS1.enet.org.al.pop3: . ack 1
> win 17520 (DF)
> 20:00:43.672185 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S
> 1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251779965
> 0,nop,wscale 0> (DF)
>=20
> =20
> now it goes around (!!!!!??)
> =20
> 20:00:43.672291 xxx.xxx.xxx.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0)
> ack 1340299400 win 0
> 20:00:46.666594 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S
> 1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251780265
> 0,nop,wscale 0> (DF)
> 20:00:46.666744 192.168.1.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0) ack
> 1 win=20
> 0
> 20:00:52.666607 192.168.1.1.48326 > xxx.xxx.xxx.129.auth: S=20
> 1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251780865
> 0,nop,wscale 0> (DF)
> 20:00:52.666754 xxx.xxx.xxx.129.auth > xxx.xxx.xxx.1.48326: R 0:0(0)
> ack 1 win=20
> 0
>=20
> untill here:
> =20
> 20:01:04.666637 xxx.xxx.xxx.1.48326 > xxx.xxx.xxx.129.auth: S
> 1340299399:1340299399(0) win 5840 <mss 1460,sackOK,timestamp 251782065
> 0,nop,wscale 0> (DF)
>=20
> etc....=20
> =20
> Any help appreciated.
> =20
> Tani
> =20
> =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-bRsJo/3PJmVxx/l5b4VO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+/+evh1fuR/Bv+ygRAhGIAKCrj7yM2RVuaDx3arhIKFQ19vqWzACdGsSl
BkmMU6NsEnWdMnJzqjrtIRo=
=BADh
-----END PGP SIGNATURE-----

--=-bRsJo/3PJmVxx/l5b4VO--


