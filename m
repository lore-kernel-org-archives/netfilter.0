From: Evan Davies <evand@voiceplus.com.au>
Subject: Re: Voice IP
Date: Tue, 28 Oct 2003 08:50:30 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067291430.13458.1.camel@proto.voiceplus.com.au>
References: <3F9D8F7C.7010508@adinet.com.uy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=_fileserver.voiceplus.com.au-23309-1067291432-0001-2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9D8F7C.7010508@adinet.com.uy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Manuel Tato <madness@adinet.com.uy>
Cc: Netfilter <netfilter@lists.netfilter.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_fileserver.voiceplus.com.au-23309-1067291432-0001-2
Content-Type: multipart/alternative; boundary="=-pqzd59okKl3++U2tGUTw"


--=-pqzd59okKl3++U2tGUTw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

If you are using H323, there is a module for H323 in the patch-o-matic.
As for SIP I cannot help you.

On Tue, 2003-10-28 at 08:34, Manuel Tato wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> Hi, i'm configuring a firewall/router with a static ip ADSL and a voice
> IP gateway.
> The voiceip gw es in configured at 192.168.1.40.
> With this script i can make calls, but i cant recive any.
>=20
> - ---------------------------------------------------
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> modprobe ip_conntrack_h323
> modprobe ip_nat_h323
>=20
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
>=20
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT
> - --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j
> ACCEPT
> iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT
> - --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -j
> ACCEPT
> - -----------------------------------------------------
>=20
> Any idea?
> i'm blocking ports?
> i need any other module??
> thanks in advance
> thanks a lot...
>=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2 (MingW32)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>=20
> iD8DBQE/nY98W/G6GKzQKp4RAndEAJ4pYh04AZuTc/f8MQ8Ae6RB/GpRFgCgkaCg
> SwAh5HHLSdd0rj68FzTPdXY=3D
> =3DRcOK
> -----END PGP SIGNATURE-----
>=20

Regards
Evan Davies.
Network and System Administrator.

VoicePlus Data Pty Ltd.
1 / 34 Burton St,
Milsons Point. NSW
2061.

Tel: +61 2 9955 3429
Fax: +61 2 9955 3465
Mobile: 0414 422 234
Email: evand@voiceplus.com.au


The email address used for sending this message is not to be added to
any database, list or mailing list without my prior, explicit
permission.

This e-mail is intended for use of the individual or entity above and
may contain information that is confidential and privileged.  Note if
you are the intended recipient, you are hereby notified that any
dissemination, distribution or copying of the e-mail is strictly
prohibited.  If you have received this e-mail in error, please notify us
immediately at evand@voiceplus.com.au and destroy the original message.=20
While this e-mail and any attachments have been scanned for common
computer viruses and found to be virus free, we recommend you also
perform your own virus checking processes before opening any
attachments.

--=-pqzd59okKl3++U2tGUTw
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.9">
</HEAD>
<BODY>
If you are using H323, there is a module for H323 in the patch-o-matic. As =
for SIP I cannot help you.<BR>
<BR>
On Tue, 2003-10-28 at 08:34, Manuel Tato wrote:
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#737373"><I>-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi, i'm configuring a firewall/router with a static ip ADSL and a voice
IP gateway.
The voiceip gw es in configured at 192.168.1.40.
With this script i can make calls, but i cant recive any.

- ---------------------------------------------------
echo 1 &gt; /proc/sys/net/ipv4/ip_forward

modprobe ip_conntrack_h323
modprobe ip_nat_h323

iptables -A INPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT
iptables -A OUTPUT -j ACCEPT

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT
- --to 192.168.1.40:1726:1789
iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j
ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT
- --to 192.168.1.40:1726:1789
iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -j
ACCEPT
- -----------------------------------------------------

Any idea?
i'm blocking ports?
i need any other module??
thanks in advance
thanks a lot...


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (MingW32)
Comment: Using GnuPG with Mozilla - </FONT><A HREF=3D"http://enigmail.mozde=
v.org"><U>http://enigmail.mozdev.org</U></A>
<FONT COLOR=3D"#737373">
iD8DBQE/nY98W/G6GKzQKp4RAndEAJ4pYh04AZuTc/f8MQ8Ae6RB/GpRFgCgkaCg
SwAh5HHLSdd0rj68FzTPdXY=3D
=3DRcOK
-----END PGP SIGNATURE-----
</I></FONT></PRE>
</BLOCKQUOTE>
<PRE><TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
<TR>
<TD>
<FONT SIZE=3D"4"><B>Regards<BR>
Evan Davies.</FONT><BR>
<FONT SIZE=3D"3">Network and System Administrator.</FONT><BR>
<BR>
<FONT COLOR=3D"#0000ff" SIZE=3D"5"><I>VoicePlus Data Pty Ltd.</I></B></FONT=
><BR>
<FONT SIZE=3D"3">1 / 34 Burton St,<BR>
Milsons Point. NSW<BR>
2061.<BR>
<BR>
Tel: +61 2 9955 3429<BR>
Fax: +61 2 9955 3465<BR>
Mobile: 0414 422 234<BR>
Email: </FONT><A HREF=3D"mailto:evand@voiceplus.com.au"><U>evand@voiceplus.=
com.au</U></A><BR>
<BR>
<BR>
<FONT COLOR=3D"#737373" SIZE=3D"2"><I>The email address used for sending th=
is message is not to be added to any database, list or mailing list without=
 my prior, explicit permission.</FONT><BR>
<BR>
<FONT COLOR=3D"#737373" SIZE=3D"2">This e-mail is intended for use of the i=
ndividual or entity above and may contain information that is confidential =
and privileged.&nbsp; Note if you are the intended recipient, you are hereb=
y notified that any dissemination, distribution or copying of the e-mail is=
 strictly prohibited.&nbsp; If you have received this e-mail in error, plea=
se notify us immediately at </FONT><A HREF=3D"mailto:evand@voiceplus.com.au=
"><FONT SIZE=3D"2"><U>evand@voiceplus.com.au</U></FONT></A><FONT COLOR=3D"#=
737373" SIZE=3D"2"> and destroy the original message.&nbsp; While this e-ma=
il and any attachments have been scanned for common computer viruses and fo=
und to be virus free, we recommend you also perform your own virus checking=
 processes before opening any attachments.</I></FONT>
</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-pqzd59okKl3++U2tGUTw--

--=_fileserver.voiceplus.com.au-23309-1067291432-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/nZMmBnmg6+tb+toRAoQkAJ4mke76rGayyE3MfI/XwpEKLHtk6wCggWt3
JZd+ggEsu9bUeox+X1004M4=
=WIgc
-----END PGP SIGNATURE-----

--=_fileserver.voiceplus.com.au-23309-1067291432-0001-2--

