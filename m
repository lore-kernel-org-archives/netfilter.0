From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: Help on IPTABLES
Date: Sat, 11 Oct 2003 11:32:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c39004$861778e0$8b00000a@casa>
References: <3F855272.2080201@novelgmt.intnet.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0016_01C38FEB.5F77D040"
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
To: info <info@novelgmt.intnet.mu>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0016_01C38FEB.5F77D040
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


    You'll probably browse with no problems if you use IP addresses. If =
you try to browse using names (www.something.com), you'll need to do a =
DNS request for the IP of that hostname. The request will go out with no =
problems, as OUTPUT is ACCEPT. But DNS reply will be blocked, as INPUT =
only allows port 80 traffic.

    For allowing web browsing ONLY, you'll have to allow AT LEAST =
packets with source port 53 (TCP and UDP - almost all will be UDP but =
TCP can be also used). Dont forget HTTPS too, which is port 443.

    You should also analyse the RH-Lokkit-0-50-INPUT chain. As packets =
are getting to this chain BEFORE reaching your rules, if something gets =
blocked there, it will NEVER reach YOUR rules.

    For static rules, you can create them on /etc/rc.d/rc.local. This =
file will be executed after ALL daemons got UP on the reboot process.

    Sincerily,
    Leonardo Rodrigues

  ----- Original Message -----=20
  From: info=20
  To: netfilter@lists.netfilter.org=20
  Sent: Thursday, October 09, 2003 9:20 AM
  Subject: Help on IPTABLES


  hi all,

   Can somebody explain to me why is when i changed my Chain INPUT Rules =
from ACCEPT to DROP, i cannot browse the internet despite opening port =
80 in the INPUT rule.
  However, when Chain INPUT is changed to ACCEPT, browsing the internet =
works fine. (Note: CHAIN Output is accept for ALL)


  The configurations on my IPTABLES are as follows

  Chain INPUT (policy DROP)
  target     prot opt source               destination
  RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
  ACCEPT     tcp  --  anywhere             anywhere           tcp =
spt:http
  ACCEPT     udp  --  anywhere             anywhere           udp =
spt:http

  Note that my OUTPUT Rules are as follows:

  Chain OUTPUT (policy ACCEPT)
  target     prot opt source               destination

  I have two network cards installed on my pc - running Red Hat 9.0

  Routing for static routes are follows:

  xx.yy.zz.aa        0.0.0.0         255.255.255.0       U     0      0  =
      0 eth0
  xx.0.0.0           0.0.0.0         255.0.0.0           U     0      0  =
      0 eth1
  127.0.0.0          0.0.0.0         255.0.0.0           U     0      0  =
      0 lo
  0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0  =
      0 eth0
  0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0  =
      0 eth1

  where zz.zz.zz.zz is my gateway to the internet.
  eth0 - Interface with local address
  eth1 - Interface with Internet address.

  By the way, is there a way to save static routes because when i reboot =
my pc, all routes are lost.

  Thanks for any help.

  guy



------=_NextPart_000_0016_01C38FEB.5F77D040
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; You'll probably =
browse with no=20
problems if you use IP addresses. If you try to browse using names (<A=20
href=3D"http://www.something.com">www.something.com</A>), you'll need to =
do a DNS=20
request for the IP of that hostname. The request will go out with no =
problems,=20
as OUTPUT is ACCEPT. But DNS reply will be blocked, as INPUT only allows =
port 80=20
traffic.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; For allowing web =
browsing ONLY,=20
you'll have to allow AT LEAST packets with source port 53 (TCP and UDP - =
almost=20
all will be UDP but TCP can be also used). Dont forget HTTPS too, which =
is port=20
443.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; You should also =
analyse the=20
RH-Lokkit-0-50-INPUT chain. As packets are getting to this =
chain&nbsp;BEFORE=20
reaching your rules, if something gets blocked there, it will NEVER =
reach YOUR=20
rules.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; For static rules, =
you can create=20
them on /etc/rc.d/rc.local. This file will be executed after ALL daemons =
got UP=20
on the reboot process.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
Sincerily,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Leonardo =
Rodrigues</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dinfo@novelgmt.intnet.mu=20
  href=3D"mailto:info@novelgmt.intnet.mu">info</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, October 09, =
2003 9:20=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Help on IPTABLES</DIV>
  <DIV><BR></DIV>hi all,<BR><BR>&nbsp;Can somebody explain to me why is =
when i=20
  changed my Chain INPUT Rules from ACCEPT to DROP, i cannot browse the =
internet=20
  despite opening port 80 in the INPUT rule.<BR>However, when Chain =
INPUT is=20
  changed to ACCEPT, browsing the internet works fine. (Note: CHAIN =
Output is=20
  accept for ALL)<BR><BR><BR>The configurations on my IPTABLES are as=20
  follows<BR><BR><FONT color=3D#ff6600><U><B>Chain INPUT (policy=20
  DROP)</B></U></FONT><BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination<BR>RH-Lokkit-0-50-INPUT&nbsp; all&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tcp=20
  spt:http<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp=20
  spt:http<BR><BR>Note that my OUTPUT Rules are as follows:<BR><FONT=20
  color=3D#ff6600><BR><U><B>Chain OUTPUT (policy=20
  ACCEPT)</B></U></FONT><BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination<BR><BR>I have two network cards installed on my pc - =
running Red=20
  Hat 9.0<BR><BR>Routing for static routes are follows:<BR><BR><FONT=20
  face=3D"Courier New, Courier, monospace">xx.yy.zz.aa=20
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  255.255.255.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; =

  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  eth0<BR>xx.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;=20
  0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
  U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  eth1<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=20
  0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
  U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;=20
  zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=20
  UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  eth0<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;=20
  zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=20
  UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</FONT><BR><BR>where =

  zz.zz.zz.zz is my gateway to the internet.<BR>eth0 - Interface with =
local=20
  address<BR>eth1 - Interface with Internet address.<BR><BR>By the way, =
is there=20
  a way to save static routes because when i reboot my pc, all routes =
are=20
  lost.<BR><BR>Thanks for any=20
help.<BR><BR>guy<BR><BR><BR></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0016_01C38FEB.5F77D040--


