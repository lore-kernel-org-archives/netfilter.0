From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: why packet get through the netfilter even if i drop all in FORWARD
Date: Mon, 9 Jun 2003 09:21:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DF8@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C32E14.BE9B8956"
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
To: Calvin <calvinproject@ihug.com.au>, netfilter-devel-request@lists.netfilter.org, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C32E14.BE9B8956
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

IPSEC usually creates a device called ipsec0.
Your rules specifically says "-i eth0 -o eth1" and doesn't say anything =
about ipsec0 etc.etc..
Once your tunnel comes up, the routes for the other network reroute via =
ipsec0 device and bypasses your forward rule.
=20
-----Original Message-----
From: Calvin [mailto:calvinproject@ihug.com.au]
Sent: Sunday, June 08, 2003 4:07 PM
To: netfilter-devel-request@lists.netfilter.org; =
netfilter@lists.netfilter.org
Subject: why packet get through the netfilter even if i drop all in =
FORWARD


Dear all,
=20
I got a funny problem here and got no idea why it happen.
my simple network is
A
 |(eth0)
GWa
||(eth1)
||
||(eth1)
GWb
|(eth0)
=20
I running netfilter with freeswan, I add a rule in FORWARD chain to drop =
all packets forward from
internal iface(eth0) to public iface(eth1).
    iptables - A FORWARD -i eth0 -i eth1 -j DROP
=20
it works fine when , when i try to ping GWb's eth0 from machine A, it =
get blocked.
=20
however once I start up the IPSEC, I do the ping again and A can ping =
GWb's eth0. The rule in FORWARD chain is still there.
=20
Why does this happen? Is that anyway I can fix this?
=20
Thanks very much
Calvin
=20

------_=_NextPart_001_01C32E14.BE9B8956
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dbig5">


<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D395372423-08062003><FONT face=3DArial color=3D#0000ff =
size=3D2>IPSEC=20
usually creates a device called ipsec0.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395372423-08062003><FONT face=3DArial color=3D#0000ff =
size=3D2>Your=20
rules specifically says "-i eth0 -o eth1" and doesn't say anything about =
ipsec0=20
etc.etc..</FONT></SPAN></DIV>
<DIV><SPAN class=3D395372423-08062003><FONT face=3DArial color=3D#0000ff =
size=3D2>Once=20
your tunnel comes up, the routes for the other network reroute via =
ipsec0 device=20
and bypasses your forward rule.</FONT></SPAN></DIV>
<DIV><SPAN class=3D395372423-08062003></SPAN>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> Calvin=20
[mailto:calvinproject@ihug.com.au]<BR><B>Sent:</B> Sunday, June 08, 2003 =
4:07=20
PM<BR><B>To:</B> netfilter-devel-request@lists.netfilter.org;=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> why packet get through =
the=20
netfilter even if i drop all in FORWARD<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Dear all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I got a funny problem here and got no =
idea why it=20
happen.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>my simple network is</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>A</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;|(eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>GWa</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||(eth1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||(eth1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>GWb</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>|(eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I running netfilter with freeswan, I =
add a rule in=20
FORWARD chain to drop all packets forward from</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>internal iface(eth0) to public=20
iface(eth1).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables - A FORWARD =
-i eth0 -i=20
eth1 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>it works fine when , when i try to ping =
GWb's eth0=20
from machine A, it get blocked.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>however once I start up the IPSEC, I do =
the ping=20
again and A can ping GWb's eth0. The rule in FORWARD chain is still=20
there.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Why does this happen? Is that anyway I =
can fix=20
this?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks very much</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Calvin</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C32E14.BE9B8956--

