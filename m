From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Do I need to write a module?
Date: 24 Jun 2003 08:57:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056437845.2764.57.camel@raylinux.internal>
References: <sef70417.087@mail.stone-ware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-y8mLlHKkMs5G8KWhYjtW"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sef70417.087@mail.stone-ware.com>
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


--=-y8mLlHKkMs5G8KWhYjtW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Why don't you get the Java app to export some kind of text that you can
get netfilter to parse with regular unix utilities (sed, awk, grep).

Create a cron job to parse the file every 10 minutes (if that's regular
enough) that parses the text file and reloads your iptables rules as per
the file.

Ray

On Mon, 2003-06-23 at 20:43, Tony Thompson wrote:
> I am investigating an option to use netfilter to allow/deny traffic from
> the local subnet based on rules/accounting information that is in
> another (Java based) system.  I am new to netfilter so, I can someone
> offer some suggestions:
>=20
> 1. Is netfilter the right place to hook or should I look at a firewall
> that may provide some higher level hooks for authentication and
> accounting?
>=20
> 2. If I should hook into netfilter, is it a good idea to call into a
> JVM from a netfilter module?
>=20
> 3. I am not sure what kind of control I have when using the userspace
> driver but, should I use that in this situation?  Can I use that
> directly from Java so I wouldn't have the hassel of calling into a JVM
> from a native process?
>=20
> If anyone can offer any other suggestions or examples, that would be
> appreciated.
>=20
> Thanks.
> Tony
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-y8mLlHKkMs5G8KWhYjtW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+9/ZVh1fuR/Bv+ygRAixgAKCUvamE/LpE75fT21PG0WEe82geawCgs0pM
cU995NOEI9xsAjPLWSP0ouk=
=DzuW
-----END PGP SIGNATURE-----

--=-y8mLlHKkMs5G8KWhYjtW--


