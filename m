From: =?ISO-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: table "mangling" is missing, but she shouldn' t
Date: Mon, 14 Jun 2004 12:33:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FF73@smtp.retecal.es>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C451FB.06F2C0B0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C451FB.06F2C0B0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi

You perhaps dont have loaded iptable_magle module.

try lsmod=20

and if you don=B4t see the mangle module try insmod iptable_mangle


David=20


- -----Mensaje original-----
De: Akao [mailto:technique@akao.fr]
Enviado el: lunes, 14 de junio de 2004 12:21
Para: netfilter@lists.netfilter.org
Asunto: table "mangling" is missing, but she shouldn' t


Hello
I have a linux box , linux-2.4.26 with netfilter (and iptables 1.2.9)=20
built in the kernel, with the mangling option.
There aren' t any modules compiled. All is builtin.

"iptables -t mangle -L"
gives :

iptables v1.2.9: can't initialize iptables table `mangle': Table does=20
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

and :

"cat /proc/net/ip_tables_names" gives

nat
filter

I have not set any rules for the moment, just activated IP-forwarding=20
with "echo 1 > /proc/sys/net/ipv4/ip_forward"

What can be the problem ?

Thanks in advance.
Regards.

Axel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iD8DBQFAzX6zLAbi8+mz68kRAuKkAKCf54LmgHaGX4vJ/TPvzNVDL/FfyQCcD0pM
3Cn4hVfWGCq5GX5HQCMPVEE=3D
=3DIwYh
-----END PGP SIGNATURE-----

------_=_NextPart_001_01C451FB.06F2C0B0
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DISO-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: table &quot;mangling&quot; is missing, but she shouldn' =
t</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>-----BEGIN PGP SIGNED MESSAGE-----</FONT>
<BR><FONT SIZE=3D2>Hash: SHA1</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hi</FONT>
</P>

<P><FONT SIZE=3D2>You perhaps dont have loaded iptable_magle =
module.</FONT>
</P>

<P><FONT SIZE=3D2>try lsmod </FONT>
</P>

<P><FONT SIZE=3D2>and if you don=B4t see the mangle module try insmod =
iptable_mangle</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>David </FONT>
</P>
<BR>

<P><FONT SIZE=3D2>- -----Mensaje original-----</FONT>
<BR><FONT SIZE=3D2>De: Akao [<A =
HREF=3D"mailto:technique@akao.fr">mailto:technique@akao.fr</A>]</FONT>
<BR><FONT SIZE=3D2>Enviado el: lunes, 14 de junio de 2004 12:21</FONT>
<BR><FONT SIZE=3D2>Para: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Asunto: table &quot;mangling&quot; is missing, but =
she shouldn' t</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hello</FONT>
<BR><FONT SIZE=3D2>I have a linux box , linux-2.4.26 with netfilter =
(and iptables 1.2.9) </FONT>
<BR><FONT SIZE=3D2>built in the kernel, with the mangling =
option.</FONT>
<BR><FONT SIZE=3D2>There aren' t any modules compiled. All is =
builtin.</FONT>
</P>

<P><FONT SIZE=3D2>&quot;iptables -t mangle -L&quot;</FONT>
<BR><FONT SIZE=3D2>gives :</FONT>
</P>

<P><FONT SIZE=3D2>iptables v1.2.9: can't initialize iptables table =
`mangle': Table does </FONT>
<BR><FONT SIZE=3D2>not exist (do you need to insmod?)</FONT>
<BR><FONT SIZE=3D2>Perhaps iptables or your kernel needs to be =
upgraded.</FONT>
</P>

<P><FONT SIZE=3D2>and :</FONT>
</P>

<P><FONT SIZE=3D2>&quot;cat /proc/net/ip_tables_names&quot; =
gives</FONT>
</P>

<P><FONT SIZE=3D2>nat</FONT>
<BR><FONT SIZE=3D2>filter</FONT>
</P>

<P><FONT SIZE=3D2>I have not set any rules for the moment, just =
activated IP-forwarding </FONT>
<BR><FONT SIZE=3D2>with &quot;echo 1 &gt; =
/proc/sys/net/ipv4/ip_forward&quot;</FONT>
</P>

<P><FONT SIZE=3D2>What can be the problem ?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks in advance.</FONT>
<BR><FONT SIZE=3D2>Regards.</FONT>
</P>

<P><FONT SIZE=3D2>Axel</FONT>
</P>

<P><FONT SIZE=3D2>-----BEGIN PGP SIGNATURE-----</FONT>
<BR><FONT SIZE=3D2>Version: GnuPG v1.2.4 (MingW32)</FONT>
</P>

<P><FONT =
SIZE=3D2>iD8DBQFAzX6zLAbi8+mz68kRAuKkAKCf54LmgHaGX4vJ/TPvzNVDL/FfyQCcD0p=
M</FONT>
<BR><FONT SIZE=3D2>3Cn4hVfWGCq5GX5HQCMPVEE=3D</FONT>
<BR><FONT SIZE=3D2>=3DIwYh</FONT>
<BR><FONT SIZE=3D2>-----END PGP SIGNATURE-----</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C451FB.06F2C0B0--

