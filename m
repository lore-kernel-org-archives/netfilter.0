From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: help on  NAT Configuration
Date: Tue, 21 Oct 2003 15:04:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E101199090@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----_=_NextPart_001_01C397D3.E5BE26E6";
	type="multipart/alternative"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter list <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C397D3.E5BE26E6
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C397D3.E5BE26E6"


------_=_NextPart_002_01C397D3.E5BE26E6
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I wouldn't place default policies of drop on mangle or nat tables.
Furthermore, on your INPUT chain, you can kill all the spt rules. Better =
create OUTPUT rules for those services and leave the ESTABLISHED,RELATED =
in the INPUT.
I would limit the masquerade by setting the outgoing interface and use =
-s <localnet>/<localnetmask>. At quick glance, I see nothing else amiss.
=20
Gaby Schilders
IBFD network admin

-----Original Message-----
From: Gilles Yue [mailto:gyue@novelgmt.intnet.mu]
Sent: maandag 20 oktober 2003 15:12
To: netfilter@lists.netfilter.org
Subject: help on NAT Configuration



Dear all

=20

I want to share internet access on my LAN and my configurations are as =
below. (see picture)

=20

Is my NAT configuration correct? I want to allow only some users to =
access the internet-and check mail using outlook express.

=20

Thanks for helping.

=20

Rgds

gy

=20

iptables -vnL

=20

> Chain INPUT (policy DROP 485 packets, 51391 bytes)

=20

> pkts bytes target     prot opt in     out     source              =20

> destination

>    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:53

>   21  4504 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:53

>    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:80

>  813  704K ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:80

>    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:443

>   16  3793 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:443

>    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          state RELATED,ESTABLISHED

>    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0           =20

> 0.0.0.0/0

>

> Chain FORWARD (policy DROP 0 packets, 0 bytes)

> pkts bytes target     prot opt in     out     source              =20

> destination

>    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0           =20

> 0.0.0.0/0          state RELATED,ESTABLISHED

>    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0           =20

> 0.0.0.0/0

>

> Chain OUTPUT (policy ACCEPT 3465 packets, 286K bytes)

> pkts bytes target     prot opt in     out     source              =20

> destination

=20

=20

=20

> [root@rh9 root]# iptables -t nat -L

> Chain PREROUTING (policy ACCEPT)

> target     prot opt source               destination

>

> Chain POSTROUTING (policy DROP)

> target     prot opt source               destination

> MASQUERADE  all  --  anywhere             anywhere

>

> Chain OUTPUT (policy ACCEPT)

> target     prot opt source               destination

=20

=20

=20



=20

=20

=20

=20

=20

=20

=20

=20

=20

=20


  _____ =20


=20

=20


------_=_NextPart_002_01C397D3.E5BE26E6
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE>@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.25in 1.0in =
1.25in; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
P.MsoPlainText {
	FONT-SIZE: 10pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Courier New"
}
LI.MsoPlainText {
	FONT-SIZE: 10pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Courier New"
}
DIV.MsoPlainText {
	FONT-SIZE: 10pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Courier New"
}
SPAN.EmailStyle18 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =
size=3D2>I=20
wouldn't place default policies of drop on mangle or nat=20
tables.</FONT></SPAN></DIV>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =

size=3D2>Furthermore, on your INPUT chain, you can kill all the spt =
rules. Better=20
create&nbsp;OUTPUT rules for those services and leave the =
ESTABLISHED,RELATED in=20
the INPUT.</FONT></SPAN></DIV>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =
size=3D2>I=20
would limit the masquerade by setting the outgoing interface and use -s=20
&lt;localnet&gt;/&lt;localnetmask&gt;. At quick glance, I see nothing =
else=20
amiss.</FONT></SPAN></DIV>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =
size=3D2>Gaby=20
Schilders</FONT></SPAN></DIV>
<DIV><SPAN class=3D536045912-21102003><FONT face=3DArial color=3D#0000ff =
size=3D2>IBFD=20
network admin</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Gilles Yue=20
  [mailto:gyue@novelgmt.intnet.mu]<BR><B>Sent:</B> maandag 20 oktober =
2003=20
  15:12<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
help on=20
  NAT Configuration<BR><BR></FONT></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Dear =
all</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I want to share internet =
access on=20
  my LAN and my configurations are as below. (see =
picture)</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Is my NAT configuration =
correct? I=20
  want to allow only some users to access the internet-and check mail =
using=20
  outlook express.</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Thanks for=20
  helping.</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Rgds</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">gy</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">iptables &#8211;vnL</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoPlainText><B><FONT face=3D"Courier New" color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">&gt; Chain =
INPUT=20
  (policy DROP 485 packets, 51391 bytes)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot=20
  opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; destination</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
  spt:53</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp; 21 &nbsp;4504=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
  spt:53</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
  spt:80</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp; 813&nbsp; 704K=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0.0.0.0/0&nbsp;=20
  =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN></FONT=
></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
  spt:80</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp=20
  spt:443</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp; 16&nbsp; 3793=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
  spt:443</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; 0 =
&nbsp;&nbsp;&nbsp;&nbsp;0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state=20
  RELATED,ESTABLISHED</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
lo&nbsp;&nbsp;&nbsp;&nbsp;=20
  *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; 0.0.0.0/0</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; </SPAN></FONT><B><FONT color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">Chain FORWARD =
(policy=20
  DROP 0 packets, 0 bytes)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot=20
  opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; destination</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth1&nbsp;&nbsp;=20
  eth0&nbsp;&nbsp;&nbsp;=20
  =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state=20
  RELATED,ESTABLISHED</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
  ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth0&nbsp;&nbsp;=20
  eth1&nbsp;&nbsp;&nbsp;=20
  0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  &nbsp;</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; 0.0.0.0/0</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; </SPAN></FONT><B><FONT color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">Chain OUTPUT =
(policy=20
  ACCEPT 3465 packets, 286K bytes)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot=20
  opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  </SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; destination</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; [root@rh9 root]# iptables -t nat=20
  -L</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; </SPAN></FONT><B><FONT color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">Chain =
PREROUTING=20
  (policy ACCEPT)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =

  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; </SPAN></FONT><B><FONT color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">Chain =
POSTROUTING=20
  (policy DROP)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =

  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; MASQUERADE&nbsp; all&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt;</SPAN></FONT></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; </SPAN></FONT><B><FONT color=3Dred =
size=3D3><SPAN=20
  style=3D"FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: red">Chain OUTPUT =
(policy=20
  ACCEPT)</SPAN></FONT></B></P>
  <P class=3DMsoPlainText><FONT face=3D"Courier New" size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt">&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =

  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"><IMG height=3D411=20
  src=3D"cid:536045912@21102003-2589" width=3D818></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial"></SPAN></FONT>&nbsp;</P>
  <DIV class=3DMsoNormal style=3D"TEXT-ALIGN: center" =
align=3Dcenter><FONT=20
  face=3D"Times New Roman" size=3D3><SPAN style=3D"FONT-SIZE: 12pt">
  <HR align=3Dcenter width=3D"100%" SIZE=3D2>
  </SPAN></FONT></DIV>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"></SPAN></FONT>&nbsp;</P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: =
12pt"></SPAN></FONT>&nbsp;</P></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_002_01C397D3.E5BE26E6--

------_=_NextPart_001_01C397D3.E5BE26E6
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <536045912@21102003-2589>
Content-Description: image001.gif
Content-Location: image001.gif

R0lGODlhMgObAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALD8ANADb
AiMBgwAAAAAAAAcGBgwKCwUEBAsJCgoICQYFBQcGBwsKCggHBwMDAwkICAkHCP///wECAwT/EMhJ
q7046827/2AojmRpnmiqrmzrvnAsz25A33iu73zv/8CgcEgsngLIpDLgWC6N0Kh0Sq1ar9is1rN0
eL/gsLip3JrP6LR6zW67N8mxfC5Pvu/4vH7P76/jdIGCYHZ+hoeIiYqLjEiDj5BehYyUlZaXmJkx
gJGdj0iaoaKjpKWHjp6pkaA8Tq6vsLGys7S1tre4ubqspr2+vzOoqsOQvDdMxMnKy8zNzjbA0dLT
I8jO11/GMtbY3d7f4IPQ1OTl5sLhzePb6e3u78zr5vP0pOjwyto1+Pz9/mLy6gkc2OifOnYGEyoE
F5Cgw4d57i1UpU8Ft4kYM6ZqCLGjxzMX/zVSfBFSpMmTYTh+XMlSSkmUq/YR20Wzps2bOGPVacmz
J5SXMGOyACouqNF4Y1T6XMp0E9Gj4pSGeBqIKtSrdZI23coVhlWsVS3OBEv2k9auaNOW+Fp2jlQu
Y9vKTXpWrd27GtjOrbs27t6/Jd/iHbxV71+AR/welhuYsOO7hhenNBGZkOS5jR9r5lr5cra+wzp7
Vph5s+meokc3IZGa6hIBA7J1IYOEQIE61tBxepUyJCokBiTlHu6gQIADXw4EuN2t9OnnH1OPFnyh
tSBUxhHIBogMQYAESYl7MY6E+fbw3IUTEH6ejBcFAYIbCKDgm3Po+AlKV029gvWq4rnX2/949KHH
3nsBCFAgIS9J9BtwAkYozAILDEAhQ3zlp+E8+6m22lSK4daeg7mtl96BDiwQwAABLDCggQwKt8B6
wtRozXwQ2pfhhjxK06GHH37wHx2ozKedcEqgKBFtSRYXgHbemRfhizGSwUB8NrbngHLIYYhYj2Bm
kAsfPwIZZAdDuqWEAFW2uWSWDsAnXwANtEnleY7MCOeUXIZzX5g9NrnKJG6UCWR/AKQponFdojii
iycKSMCKkpjoqJ0HOnLlnsLgGJ+XkwEa6JIbVWSGoWb2p6iBV9Z5qYDG1RepIwm4At6rrz7ohYrW
TJqNpRRaCKk3f4pqGifXELoFqmaemVf/iDCqGNuUB3p3K5WONPCpF/O5Sq2WmSKz6RdXMuBAtwjO
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
1L3yQO+3yg24zF300CsMCzsTC0p/vx+c0hEAADs=

------_=_NextPart_001_01C397D3.E5BE26E6--

