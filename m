From: "Alexandru Coseru" <alexcos@home.ro>
Subject: DNAT problem
Date: Sun, 30 Mar 2003 17:58:33 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004701c2f6cc$d6192a90$0200a8c0@lynx>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0044_01C2F6E5.FAEF36C0"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0044_01C2F6E5.FAEF36C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

   =20

hello.. I have the folowing problem...  I have a linux gateway with the =
external IP x.x.x.x  and internal Ip 192.168.0.1.    I want to make a =
DNAT and mask a conection from the external IP , forwarded to one of my =
lan's computer , and the lan computer to see it as 192.168.0.1 , not =
x.x.x.x



Example:    If a packet comes from linux.org to a specific port (let's =
say 1345) ,   i want to forward it to a lan computer ( 192.168.0.5) , =
and mask that connection in a way that 192.168.0.5 sees the packet comes =
from 192.168.0.1 , and not from linux.org      (it's exactly as =
masquarading , but in reverse way...)



                                                                         =
                                                               Alex

------=_NextPart_000_0044_01C2F6E5.FAEF36C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </FONT><BR></DIV>
<DIV><FONT face=3DArial size=3D2>hello.. I have the folowing =
problem...&nbsp; I have=20
a linux gateway with the external IP x.x.x.x&nbsp; and internal Ip=20
192.168.0.1.&nbsp;&nbsp;&nbsp; I want to make a DNAT and mask a =
conection from=20
the external IP , forwarded to one of my lan's computer , and the lan =
computer=20
to see it as 192.168.0.1 , not x.x.x.x</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Example:&nbsp;&nbsp;&nbsp; If a packet =
comes from=20
linux.org to a specific port (let's say 1345) ,&nbsp;&nbsp; i want to =
forward it=20
to a lan computer ( 192.168.0.5) , and mask that connection in a way =
that=20
192.168.0.5 sees the packet comes from 192.168.0.1 , and not from=20
linux.org&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (it's exactly as masquarading , =
but in=20
reverse way...)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
Alex</FONT></DIV></BODY></HTML>

------=_NextPart_000_0044_01C2F6E5.FAEF36C0--



