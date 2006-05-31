From: Alexander Samad <alex@samad.com.au>
Subject: Re: block dhcp service based on mac
Date: Wed, 31 May 2006 11:07:00 +1000
Message-ID: <20060531010700.GY13804@hufpuf.lan1.hme1.samad.com.au>
References: <WorldClient-F200605301121.AA21510331@nepalbank.com.np>
	<02BB8A4AC86C564C89C7F14CF98CE0C4012780@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vIq7vvlOcsOjFaxi"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C4012780@knowledge.wizdom.nu>
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


--vIq7vvlOcsOjFaxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2006 at 03:08:45PM +0200, Sietse van Zanen wrote:
> 1. With iptables -I you would usually need to specify a rule number where=
 to insert your new rule. Instead use iptables -A to add the rule to the en=
d of the chain.
> =20
> 2. I see 2 different MAC addresses for 1 machine? You 100% sure that's ok=
 and that the machine in question uses these two MAC's and they are not fro=
m other machines?
> =20
> 3. Post the output of iptables -L (-nv).
> =20
> -Sietse
>=20
> ________________________________
>=20
> From: netfilter-bounces@lists.netfilter.org on behalf of System Admin
> Sent: Tue 30-May-06 7:36
> To: netfilter@lists.netfilter.org
> Subject: block dhcp service based on mac
>=20
>=20
>=20
> hello all
>=20
> I have an dhcp server and i want to block a particular mac address (that
> pc is virus infected) from using my dhcp service so that it will not get
> any valid ip address.
>=20
> for that i have used
>=20
> /sbin/iptables -I INPUT -i eth2 -p all -m mac --mac-source
> 00:02:E3:34:EA:77 -j DROP
>=20
> or
>=20
> /sbin/iptables -I INPUT -i eth2 -p udp --dport 67:68 -m mac --mac-source
> 00:05:5D:4A:8A:3B -j DROP

I think this has more to do with the way that dhcp-server listens on the
network. You would be better off configuring the dhcp server to not
listen to that mac, or give it a silly address like 127.254.254.254 !

>=20
> while the iptables rule match count do increase but the pc is still
> getting ip address from my dhcp server which is seen from dhcpd log file.
>=20
> does the packet goes to dhcp service before going to iptables stack?
> I am using redhat 9 with dhcp-3.0pl1-23 dhcp server.
>=20
> Thank you
>=20
>=20
>=20
>=20
>=20
>=20
> -------------------------------------------------  DISCLAIMER  ----------=
-----------------------------------------------
> This email is intended for the exclusive use by the person(s) mentioned a=
s recipient(s) and  may contain information that is confidential and/or pri=
vileged.This email does not  constitute any commitment from Nepal Bank Limi=
ted or its subsidiaries except when expressly agreed in a written agreement=
 between the intended recipient and Nepal Bank Limited or its subsidiaries.=
 If you receive this email by mistake, please notify the sender or notify b=
y emailing at postmaster@nepalbank.com.np and delete this email immediately=
 from your system and destroy  all copies of it. You may not, directly or i=
ndirectly, use, disclose, distribute, print or  copy this email or any part=
 of it if you are not the intended recipient.
>=20
>=20
>=20
>=20
>=20
>=20

--vIq7vvlOcsOjFaxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEfOw0kZz88chpJ2MRAsyBAKClPo144PPT5rqo9FB6lpmUSyPwJgCgpc3G
wLkE/eRw671JSEV0MvmRsqk=
=9tz3
-----END PGP SIGNATURE-----

--vIq7vvlOcsOjFaxi--

