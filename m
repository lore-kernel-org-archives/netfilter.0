From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 11:01:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078995674.15566.65.camel@raylinux.internal>
References: <001201c40744$1f34a190$2a245cc2@cea05>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Mea3FJIGDF/OVphW2RL+"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c40744$1f34a190$2a245cc2@cea05>
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


--=-Mea3FJIGDF/OVphW2RL+
Content-Type: multipart/alternative; boundary="=-sz4gW/8+JsQx+SA2goEy"


--=-sz4gW/8+JsQx+SA2goEy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-03-11 at 10:37, Tomasz Macioszek wrote:

> Hello!!
> I would like to block all known p2p program ( Kazaa, eDonkey, ...). I wou=
ld
> like to find patch of iptables (p-o-m) which blocks all this programs??
>=20

iptables -P FORWARD DROP


> Thanks for your help
> Tomek

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-sz4gW/8+JsQx+SA2goEy
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.9">
</HEAD>
<BODY>
On Thu, 2004-03-11 at 10:37, Tomasz Macioszek wrote:
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#0c00a9"><I>Hello!!
I would like to block all known p2p program ( Kazaa, eDonkey, ...). I would
like to find patch of iptables (p-o-m) which blocks all this programs??
</I></FONT></PRE>
</BLOCKQUOTE>
iptables -P FORWARD DROP<BR>
<BR>
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#0c00a9"><I>Thanks for your help
Tomek</I></FONT></PRE>
</BLOCKQUOTE>
<PRE><TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
<TR>
<TD>
<PRE>--=20
--
Raymond Leach &lt;raymondl@knowledgefactory.co.za&gt;
Network Support Specialist
http://www.knowledgefactory.co.za
&quot;lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import&quot;
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--</PRE>
</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-sz4gW/8+JsQx+SA2goEy--

--=-Mea3FJIGDF/OVphW2RL+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAUCrah1fuR/Bv+ygRAjSaAKC1t3oAdHIQAYv+SL9lFa+nx1Cw0QCeN9as
zIDiPApl70O6IjhLRcBZO+I=
=eQ3Q
-----END PGP SIGNATURE-----

--=-Mea3FJIGDF/OVphW2RL+--


