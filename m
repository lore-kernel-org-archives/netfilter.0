From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Yet Another Kazaa Issue
Date: Thu, 21 Nov 2002 17:15:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c291ab$897c8730$3864a8c0@discmail.com>
References: <001101c2900e$055b0bf0$0200000a@parseerror.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0025_01C29181.A0A67F30"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001101c2900e$055b0bf0$0200000a@parseerror.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?iso-8859-1?Q?'Matias_Bj=F8rling'?= <mb@ncparty.dk>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0025_01C29181.A0A67F30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The only real way to stop KaZaA, messenger, etc. is to use an
Application Proxy and use the power of the proxy to stop traffic.  For
example on Linux you could use the TIS toolkit, or Squid as
proxies...you would redirect all traffic from iptables to them and then
they would use their advanced methods of looking into the packets to
allow or drop the packet.
=20
=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Matias
Bj=F8rling
Sent: Tuesday, November 19, 2002 3:55 PM
To: netfilter@lists.netfilter.org
Subject: Yet Another Kazaa Issue


Hey
=20
Im trying like hell to get Kazaa to stop connect successfully...
Whatever i do, blocking port 1214 in ANY possible way, it still resist
and connect sucessfully, even with thoes firewall rules
=20
iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j DROP
iptables -A FORWARD -m string --string "Kazaa" -j DROP
=20
Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere           STRING match
X-Kazaa-Username:
DROP       all  --  anywhere             anywhere           STRING match
X-Kazaa-Network:
DROP       all  --  anywhere             anywhere           STRING match
X-Kazaa-IP:
DROP       all  --  anywhere             anywhere           STRING match
X-Kazaa-SupernodeIP
DROP       all  --  anywhere             anywhere           STRING match
Kazaa
LOG        all  --  anywhere             anywhere           STRING match
User  LOG level warning
DROP       all  --  anywhere             anywhere           STRING match
User
state_chk  all  --  anywhere             anywhere

=20
It catch the "kazaa" thingie on the homepage... But.. anyhow it somehow
seem to connect to the supernode outside... Im getting nuts.. Why can't
i stop it?.. What am i doing wrong.. I tried to ages now.. and it dont
work :(
=20
Any help will be appreciated :D
=20
Thanks
=20
- SilverWolf


------=_NextPart_000_0025_01C29181.A0A67F30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D187501222-21112002><FONT face=3DArial color=3D#0000ff =
size=3D2>The=20
only real way to stop KaZaA, messenger, etc. is to use an =
Application&nbsp;Proxy=20
and use the power of the proxy to stop traffic.&nbsp; For example on =
Linux you=20
could use the TIS toolkit, or Squid as proxies...you would redirect all =
traffic=20
from iptables to them and then they would use their advanced methods of =
looking=20
into the packets to allow or drop the packet.</FONT></SPAN></DIV>
<DIV><SPAN class=3D187501222-21112002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D187501222-21112002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of =
</B>Matias=20
  Bj=F8rling<BR><B>Sent:</B> Tuesday, November 19, 2002 3:55 =
PM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> Yet Another Kazaa=20
  Issue<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Hey</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Im trying like hell to get Kazaa to =
stop connect=20
  successfully... Whatever i do, blocking port 1214 in ANY possible way, =
it=20
  still resist and connect sucessfully, even with thoes firewall=20
  rules</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -m string =
--string=20
  "X-Kazaa-Username:" -j DROP<BR>iptables -A FORWARD -m string --string=20
  "X-Kazaa-Network:" -j DROP<BR>iptables -A FORWARD -m string --string=20
  "X-Kazaa-IP:" -j DROP<BR>iptables -A FORWARD -m string --string=20
  "X-Kazaa-SupernodeIP" -j DROP<BR>iptables -A FORWARD -m string =
--string=20
  "Kazaa" -j DROP</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>Chain=20
  FORWARD (policy DROP)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
  =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
  destination<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match X-Kazaa-Username:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
  --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match X-Kazaa-Network:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
  --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match X-Kazaa-IP:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
  --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match X-Kazaa-SupernodeIP<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  all&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match Kazaa<BR>LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =

  --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match User&nbsp; LOG level =
warning<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  all&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
  match User<BR>state_chk&nbsp; all&nbsp; --&nbsp;=20
  =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  anywhere<BR></FONT>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>It catch the "kazaa" thingie on the =
homepage...=20
  But.. anyhow it somehow seem to connect to the supernode outside... Im =
getting=20
  nuts.. Why can't i stop it?.. What am i doing wrong.. I tried to ages =
now..=20
  and it dont work :(</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Any help will be appreciated =
:D</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>-=20
SilverWolf</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0025_01C29181.A0A67F30--


