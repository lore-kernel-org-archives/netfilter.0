From: Tom Eastep <teastep@shorewall.net>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 14:49:10 -0700
Message-ID: <4C97D6D6.9040805@shorewall.net>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC1EFD53FCC5DBFB524403755"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9756AB.5040304@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC1EFD53FCC5DBFB524403755
Content-Type: multipart/mixed;
 boundary="------------030800040601070709030608"

This is a multi-part message in MIME format.
--------------030800040601070709030608
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 9/20/10 5:42 AM, Mr Dash Four wrote:

> The output of SECMARK_print is seen when I list the mangle table with
> iptables ('iptables -t mangle -L -n' for example) and there is the
> SELinux context in full view as I originally registered the rule match
> with. So, if I am to kindly ask the devs maintaining the iptables code
> to change the above function to include the following line:
>=20
> printf("selctx %s [%u]", info->u.sel.selctx,info->u.sel.selsid);\
>=20
> instead of:
>=20
> printf("selctx %s ", info->u.sel.selctx);\
>=20

That breaks iptables-save/-restore. The attached patch does not.

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________

--------------030800040601070709030608
Content-Type: text/plain;
 name="SECMARK.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="SECMARK.diff"

--- libxt_SECMARK.c~	2009-06-16 07:37:44.000000000 -0700
+++ libxt_SECMARK.c	2010-09-20 11:57:58.000000000 -0700
@@ -65,7 +65,7 @@
 {
 	switch (info->mode) {
 	case SECMARK_MODE_SEL:
-		printf("selctx %s ", info->u.sel.selctx);\
+	        printf("selctx %s [%u] ", info->u.sel.selctx, info->u.sel.selsi=
d);
 		break;
 =09
 	default:
@@ -83,13 +83,25 @@
 	print_secmark(info);
 }
=20
+static void save_secmark(const struct xt_secmark_target_info *info)
+{
+	switch (info->mode) {
+	case SECMARK_MODE_SEL:
+		printf("selctx %s ", info->u.sel.selctx);\
+		break;
+=09
+	default:
+		xtables_error(OTHER_PROBLEM, PFX "invalid mode %hhu\n", info->mode);
+	}
+}
+
 static void SECMARK_save(const void *ip, const struct xt_entry_target *t=
arget)
 {
 	const struct xt_secmark_target_info *info =3D
 		(struct xt_secmark_target_info*)target->data;
=20
 	printf("--");
-	print_secmark(info);
+	save_secmark(info);
 }
=20
 static struct xtables_target secmark_target =3D {

--------------030800040601070709030608--

--------------enigC1EFD53FCC5DBFB524403755
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyX1tYACgkQO/MAbZfjDLKLMwCfUmk0c68yImUhkrxiikr2Rrke
nDsAnAxpSqo0rDmOvZ34LO6griR/USIT
=9Be3
-----END PGP SIGNATURE-----

--------------enigC1EFD53FCC5DBFB524403755--
