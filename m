From: Deshwal Chand <CDD@kampsax.co.in>
Subject: RE: Using IPTABLES, cannot go to External Interface
Date: Mon, 16 Jun 2003 18:29:43 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <88116A11E9DFD411870900508BEC3831803B4B@CPQ01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C33407.27B64D20"
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
To: 'George Vieira' <georgev@citadelcomputer.com.au>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C33407.27B64D20
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have service running on 2 machines.

One for DNS and SMTP, which is DNS for our domain. 2nd is a Web Server.
External IPs are placed on eth0 for the externa traffic to be routed =
for
these machines. The DNS server maintains the IP address of Web Server.=20

To enable the router to send traffic for eth0:1..., they have been put =
on
eht0.=20

=20

=20

Regards,

Chand Deshwal (M.Tech CS&E, MCSE, CCNA) =09

-----Original Message-----
From: George Vieira [mailto:georgev@citadelcomputer.com.au]
Sent: Monday, June 16, 2003 7:16 PM
Cc: Netfilter (E-mail)
Subject: RE: Using IPTABLES, cannot go to External Interface


You don't need to put the External IPs on the eth0 device for the =
internal
machines to be DNATed. What's the reason you have eth0:0 0:1 and 0:2?

	-----Original Message-----=20
	From: Deshwal Chand [mailto:CDD@kampsax.co.in]=20
	Sent: Mon 16-Jun-03 8:51 PM=20
	To: 'Cedric Blancher'=20
	Cc: Netfilter (E-mail)=20
	Subject: RE: Using IPTABLES, cannot go to External Interface
=09
=09

	HI=20


	The setup is like this=20

	I have a RedHat linux with three LAN cards into it.=20

	eth0 =3D Public IP=20
	eth0:0 =3D Public IP=20
	eth0:0 - eth0:3 =3D Public IPs=20

	eth1 =3D Private IP (Internal Net)=20
	eth2 =3D DMZ IPs (Private ones)(Here I have 4 machines with DMZ IPs)=20

	DNAT    - Anything entering to eht0 (External Interface) looking for
eth0:0 - eth0:3 should be DNATted to DMZ Ips.=20
	        - Anything entering to eth1 (Internal Interface) looking for
eth0:0 - eth0:3 should be DNATted to DMZ Ips=20
	        - Anything entering to eth2 (DMZ Interface) looking for
eth0:0 - eth0:3 should be DNATted to DMZ Ips=20

	SNAT - Anything going out from (Source eth1 (Internal Net) and (DMZ
NET) Destination 0.0.0.0/0 and eth2) should be=20

	     - Anything from DMZ to Internal should be SNATted to DMZ_IF=20
	       =20

	SNATted --to-source eth0=20

	All the traffice from External World is able to reach to my servers
in the DMZ. I mean, if someone has to log on to the web server at =
eth0:0
port 80, he/she is able to do so.

	But, No one from INTERNAL NET is able to reach to the servers. If I
have a mchine with Internal IP Address and want to log onto the web =
server
from within my network, I cannot do so.

	If I access Yahoo.com or anyother site, I can do so from withing my
network using Internal IP Address.=20

	Hope this explains.=20






	-----Original Message-----=20
	From: Cedric Blancher [mailto:blancher@cartel-securite.fr]=20
	Sent: Monday, June 16, 2003 3:46 PM=20
	To: Deshwal Chand=20
	Cc: Netfilter (E-mail)=20
	Subject: Re: Using IPTABLES, cannot go to External Interface=20


	Le lun 16/06/2003 =C3=A0 09:51, Deshwal Chand a =C3=A9crit :=20
	> I am running a script for IPTABLES.=20
	> I have assigned 3 more IP addresses to my external interface.=20
	> eth0 - x.y.z.1=20
	> eth0:0 - x.y.z.2=20
	> eth0:1 - x.y.z.3=20
	> eth0:2 - x.y.z.4=20
	> I have SNATed my internal network to eth0. I can do all the
things.=20
	> But, I cannot reach to any of IP addresses x.y.z.1 - 3.=20

	Reach them from where ? SNAT is handled through FORWARD. Local
trafic is=20
	handled though INPUT and OUTPUT. Maybe there's something to look at=20
	there.=20

	> Though, I can go to any host in the world, but cannot go directly
to=20
	> eth0.=20

	Can you be a little more explicit in your setup and what you exactly

	want to do ?=20
	     =20
	--=20
	C=C3=A9dric Blancher  <blancher@cartel-securite.fr>=20
	Consultant en s=C3=A9curit=C3=A9 des syst=C3=A8mes et r=C3=A9seaux - =
Cartel S=C3=A9curit=C3=A9=20
	T=C3=A9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99=20
	PGP KeyID:157E98EE
FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE=20


------_=_NextPart_001_01C33407.27B64D20
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUTF-8">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Using IPTABLES, cannot go to External Interface</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>I have service running on 2 machines.</FONT>
</P>

<P><FONT SIZE=3D2>One for DNS and SMTP, which is DNS for our domain. =
2nd is a Web Server. External IPs are placed on eth0 for the externa =
traffic to be routed for these machines. The DNS server maintains the =
IP address of Web Server. </FONT></P>

<P><FONT SIZE=3D2>To enable the router to send traffic for eth0:1..., =
they have been put on eht0. </FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>Regards,</FONT>
</P>

<P><FONT SIZE=3D2>Chand Deshwal (M.Tech CS&amp;E, MCSE, CCNA) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: George Vieira [<A =
HREF=3D"mailto:georgev@citadelcomputer.com.au">mailto:georgev@citadelcom=
puter.com.au</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Monday, June 16, 2003 7:16 PM</FONT>
<BR><FONT SIZE=3D2>Cc: Netfilter (E-mail)</FONT>
<BR><FONT SIZE=3D2>Subject: RE: Using IPTABLES, cannot go to External =
Interface</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>You don't need to put the External IPs on the eth0 =
device for the internal machines to be DNATed. What's the reason you =
have eth0:0 0:1 and 0:2?</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>-----Original Message----- </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>From: =
Deshwal Chand [<A =
HREF=3D"mailto:CDD@kampsax.co.in">mailto:CDD@kampsax.co.in</A>] </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Sent: Mon =
16-Jun-03 8:51 PM </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>To: =
'Cedric Blancher' </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Cc: =
Netfilter (E-mail) </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Subject: =
RE: Using IPTABLES, cannot go to External Interface</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>HI </FONT>
</P>
<BR>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>The setup =
is like this </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>I have a =
RedHat linux with three LAN cards into it. </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>eth0 =3D =
Public IP </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>eth0:0 =
=3D Public IP </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>eth0:0 - =
eth0:3 =3D Public IPs </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>eth1 =3D =
Private IP (Internal Net) </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>eth2 =3D =
DMZ IPs (Private ones)(Here I have 4 machines with DMZ IPs) </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>DNAT&nbsp;&nbsp;&nbsp; - Anything entering to eht0 (External =
Interface) looking for eth0:0 - eth0:3 should be DNATted to DMZ Ips. =
</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Anything entering =
to eth1 (Internal Interface) looking for eth0:0 - eth0:3 should be =
DNATted to DMZ Ips </FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Anything entering =
to eth2 (DMZ Interface) looking for eth0:0 - eth0:3 should be DNATted =
to DMZ Ips </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>SNAT - =
Anything going out from (Source eth1 (Internal Net) and (DMZ NET) =
Destination 0.0.0.0/0 and eth2) should be </FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; - Anything from DMZ to Internal =
should be SNATted to DMZ_IF </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>SNATted =
--to-source eth0 </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>All the =
traffice from External World is able to reach to my servers in the DMZ. =
I mean, if someone has to log on to the web server at eth0:0 port 80, =
he/she is able to do so.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>But, No =
one from INTERNAL NET is able to reach to the servers. If I have a =
mchine with Internal IP Address and want to log onto the web server =
from within my network, I cannot do so.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>If I =
access Yahoo.com or anyother site, I can do so from withing my network =
using Internal IP Address. </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Hope this =
explains. </FONT>
</P>
<BR>
<BR>
<BR>
<BR>
<BR>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>-----Original Message----- </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>From: =
Cedric Blancher [<A =
HREF=3D"mailto:blancher@cartel-securite.fr">mailto:blancher@cartel-secur=
ite.fr</A>] </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Sent: =
Monday, June 16, 2003 3:46 PM </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>To: =
Deshwal Chand </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Cc: =
Netfilter (E-mail) </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Subject: =
Re: Using IPTABLES, cannot go to External Interface </FONT>
</P>
<BR>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Le lun =
16/06/2003 =C3=A0 09:51, Deshwal Chand a =C3=A9crit : </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; I am =
running a script for IPTABLES. </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; I =
have assigned 3 more IP addresses to my external interface. </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; eth0 =
- x.y.z.1 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; =
eth0:0 - x.y.z.2 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; =
eth0:1 - x.y.z.3 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; =
eth0:2 - x.y.z.4 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; I =
have SNATed my internal network to eth0. I can do all the things. =
</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; But, =
I cannot reach to any of IP addresses x.y.z.1 - 3. </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Reach them =
from where ? SNAT is handled through FORWARD. Local trafic is </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>handled =
though INPUT and OUTPUT. Maybe there's something to look at </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>there. =
</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; =
Though, I can go to any host in the world, but cannot go directly to =
</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>&gt; =
eth0. </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Can you be =
a little more explicit in your setup and what you exactly </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>want to =
do ? </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>-- =
</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>C=C3=A9dric Blancher&nbsp; &lt;blancher@cartel-securite.fr&gt; =
</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>Consultant en s=C3=A9curit=C3=A9 des syst=C3=A8mes et =
r=C3=A9seaux - Cartel S=C3=A9curit=C3=A9 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>T=C3=A9l: =
+33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99 </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>PGP =
KeyID:157E98EE&nbsp; =
FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C33407.27B64D20--

