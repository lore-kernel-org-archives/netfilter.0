From: Deshwal Chand <CDD@kampsax.co.in>
Subject: RE: Using IPTABLES, cannot go to External Interface
Date: Mon, 16 Jun 2003 16:21:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <88116A11E9DFD411870900508BEC3831803B47@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C333F5.344BE8E0"
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
To: 'Cedric Blancher' <blancher@cartel-securite.fr>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C333F5.344BE8E0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

HI


The setup is like this

I have a RedHat linux with three LAN cards into it.=20

eth0 =3D Public IP
eth0:0 =3D Public IP
eth0:0 - eth0:3 =3D Public IPs

eth1 =3D Private IP (Internal Net)
eth2 =3D DMZ IPs (Private ones)(Here I have 4 machines with DMZ IPs)

DNAT	- Anything entering to eht0 (External Interface) looking for =
eth0:0
- eth0:3 should be DNATted to DMZ Ips.
	- Anything entering to eth1 (Internal Interface) looking for eth0:0
- eth0:3 should be DNATted to DMZ Ips
	- Anything entering to eth2 (DMZ Interface) looking for eth0:0 -
eth0:3 should be DNATted to DMZ Ips

SNAT - Anything going out from (Source eth1 (Internal Net) and (DMZ =
NET)
Destination 0.0.0.0/0 and eth2) should be=20

     - Anything from DMZ to Internal should be SNATted to DMZ_IF
     =09

SNATted --to-source eth0

All the traffice from External World is able to reach to my servers in =
the
DMZ. I mean, if someone has to log on to the web server at eth0:0 port =
80,
he/she is able to do so.

But, No one from INTERNAL NET is able to reach to the servers. If I =
have a
mchine with Internal IP Address and want to log onto the web server =
from
within my network, I cannot do so.

If I access Yahoo.com or anyother site, I can do so from withing my =
network
using Internal IP Address.

Hope this explains.






-----Original Message-----
From: Cedric Blancher [mailto:blancher@cartel-securite.fr]
Sent: Monday, June 16, 2003 3:46 PM
To: Deshwal Chand
Cc: Netfilter (E-mail)
Subject: Re: Using IPTABLES, cannot go to External Interface


Le lun 16/06/2003 =E0 09:51, Deshwal Chand a =E9crit :
> I am running a script for IPTABLES.
> I have assigned 3 more IP addresses to my external interface.=20
> eth0 - x.y.z.1
> eth0:0 - x.y.z.2
> eth0:1 - x.y.z.3
> eth0:2 - x.y.z.4
> I have SNATed my internal network to eth0. I can do all the things.
> But, I cannot reach to any of IP addresses x.y.z.1 - 3.

Reach them from where ? SNAT is handled through FORWARD. Local trafic =
is
handled though INPUT and OUTPUT. Maybe there's something to look at
there.

> Though, I can go to any host in the world, but cannot go directly to
> eth0.

Can you be a little more explicit in your setup and what you exactly
want to do ?
     =20
--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel =
S=E9curit=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  =
FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

------_=_NextPart_001_01C333F5.344BE8E0
Content-Type: text/html;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-15">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Using IPTABLES, cannot go to External Interface</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>HI</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>The setup is like this</FONT>
</P>

<P><FONT SIZE=3D2>I have a RedHat linux with three LAN cards into it. =
</FONT>
</P>

<P><FONT SIZE=3D2>eth0 =3D Public IP</FONT>
<BR><FONT SIZE=3D2>eth0:0 =3D Public IP</FONT>
<BR><FONT SIZE=3D2>eth0:0 - eth0:3 =3D Public IPs</FONT>
</P>

<P><FONT SIZE=3D2>eth1 =3D Private IP (Internal Net)</FONT>
<BR><FONT SIZE=3D2>eth2 =3D DMZ IPs (Private ones)(Here I have 4 =
machines with DMZ IPs)</FONT>
</P>

<P><FONT SIZE=3D2>DNAT&nbsp;&nbsp;&nbsp; - Anything entering to eht0 =
(External Interface) looking for eth0:0 - eth0:3 should be DNATted to =
DMZ Ips.</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>- =
Anything entering to eth1 (Internal Interface) looking for eth0:0 - =
eth0:3 should be DNATted to DMZ Ips</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>- =
Anything entering to eth2 (DMZ Interface) looking for eth0:0 - eth0:3 =
should be DNATted to DMZ Ips</FONT>
</P>

<P><FONT SIZE=3D2>SNAT - Anything going out from (Source eth1 (Internal =
Net) and (DMZ NET) Destination 0.0.0.0/0 and eth2) should be </FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; - Anything from DMZ to =
Internal should be SNATted to DMZ_IF</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </FONT>
</P>

<P><FONT SIZE=3D2>SNATted --to-source eth0</FONT>
</P>

<P><FONT SIZE=3D2>All the traffice from External World is able to reach =
to my servers in the DMZ. I mean, if someone has to log on to the web =
server at eth0:0 port 80, he/she is able to do so.</FONT></P>

<P><FONT SIZE=3D2>But, No one from INTERNAL NET is able to reach to the =
servers. If I have a mchine with Internal IP Address and want to log =
onto the web server from within my network, I cannot do so.</FONT></P>

<P><FONT SIZE=3D2>If I access Yahoo.com or anyother site, I can do so =
from withing my network using Internal IP Address.</FONT>
</P>

<P><FONT SIZE=3D2>Hope this explains.</FONT>
</P>
<BR>
<BR>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Cedric Blancher [<A =
HREF=3D"mailto:blancher@cartel-securite.fr">mailto:blancher@cartel-secur=
ite.fr</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Monday, June 16, 2003 3:46 PM</FONT>
<BR><FONT SIZE=3D2>To: Deshwal Chand</FONT>
<BR><FONT SIZE=3D2>Cc: Netfilter (E-mail)</FONT>
<BR><FONT SIZE=3D2>Subject: Re: Using IPTABLES, cannot go to External =
Interface</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Le lun 16/06/2003 =E0 09:51, Deshwal Chand a =E9crit =
:</FONT>
<BR><FONT SIZE=3D2>&gt; I am running a script for IPTABLES.</FONT>
<BR><FONT SIZE=3D2>&gt; I have assigned 3 more IP addresses to my =
external interface. </FONT>
<BR><FONT SIZE=3D2>&gt; eth0 - x.y.z.1</FONT>
<BR><FONT SIZE=3D2>&gt; eth0:0 - x.y.z.2</FONT>
<BR><FONT SIZE=3D2>&gt; eth0:1 - x.y.z.3</FONT>
<BR><FONT SIZE=3D2>&gt; eth0:2 - x.y.z.4</FONT>
<BR><FONT SIZE=3D2>&gt; I have SNATed my internal network to eth0. I =
can do all the things.</FONT>
<BR><FONT SIZE=3D2>&gt; But, I cannot reach to any of IP addresses =
x.y.z.1 - 3.</FONT>
</P>

<P><FONT SIZE=3D2>Reach them from where ? SNAT is handled through =
FORWARD. Local trafic is</FONT>
<BR><FONT SIZE=3D2>handled though INPUT and OUTPUT. Maybe there's =
something to look at</FONT>
<BR><FONT SIZE=3D2>there.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; Though, I can go to any host in the world, but =
cannot go directly to</FONT>
<BR><FONT SIZE=3D2>&gt; eth0.</FONT>
</P>

<P><FONT SIZE=3D2>Can you be a little more explicit in your setup and =
what you exactly</FONT>
<BR><FONT SIZE=3D2>want to do ?</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>C=E9dric Blancher&nbsp; =
&lt;blancher@cartel-securite.fr&gt;</FONT>
<BR><FONT SIZE=3D2>Consultant en s=E9curit=E9 des syst=E8mes et =
r=E9seaux - Cartel S=E9curit=E9</FONT>
<BR><FONT SIZE=3D2>T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 =
99</FONT>
<BR><FONT SIZE=3D2>PGP KeyID:157E98EE&nbsp; =
FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C333F5.344BE8E0--

