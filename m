From: "Aldo Lagana" <alagana@discmail.com>
Subject: RE: Performance losings with iptables
Date: Tue, 13 May 2003 12:48:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305131651.h4DGprlN010480@discmail.com>
References: <00ec01c31968$5b3bba40$3a51a8c0@memmingen>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0086_01C3194D.FFA51150"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ec01c31968$5b3bba40$3a51a8c0@memmingen>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Michael Albrecht' <michael@crypta.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0086_01C3194D.FFA51150
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

not sure what version of iptables you have, but I have 707 rules in all =
the
various tables of filter and nat - none in the mangle table yet I have =
seen
zero (0) performance degradation on a P3 500 that also runs squid proxy, =
has
a DMZ with a web farm, and has about 100 ipsec tunnels=20




  _____ =20

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Michael =
Albrecht
Sent: Tuesday, May 13, 2003 11:57 AM
To: netfilter@lists.netfilter.org


=20
Hello,
i use iptables with Debian-Linux (2.4.20).
Wenn i install 150 Input-Chains like this:
iptables -A input -s 192.168.81.xxx
i will lose a lot of perfomance (for example: apache take a lot of time, =
ssh
...)
Wenn i show the perfomance with vmstat - vmstat says that 99 % is =
idel...
Wer is the Problem ???
=20
Thanks for helping ... Michael


------=_NextPart_000_0086_01C3194D.FFA51150
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir=3Dltr><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D935274216-13052003><FONT face=3DArial color=3D#0000ff =
size=3D2>not=20
sure what version of iptables you have, but I have 707 rules in all the =
various=20
tables of filter and nat - none in the mangle table y</FONT></SPAN><SPAN =

class=3D935274216-13052003><FONT face=3DArial color=3D#0000ff =
size=3D2>et I have seen=20
zero (0) performance degradation on a P3 500 that also runs squid proxy, =
has a=20
DMZ with a web farm, and has about 100 ipsec tunnels =
</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT><FONT =
face=3DArial=20
  color=3D#0000ff size=3D2></FONT><FONT face=3DArial color=3D#0000ff=20
  size=3D2></FONT><BR><BR></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
  <HR tabIndex=3D-1>
  <FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of =
</B>Michael=20
  Albrecht<BR><B>Sent:</B> Tuesday, May 13, 2003 11:57 AM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR></FONT><BR></DIV>
  <DIV></DIV>
  <DIV dir=3Dltr align=3Dleft>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>i use iptables with Debian-Linux=20
  (2.4.20).</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Wenn i install 150 Input-Chains like=20
  this:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -A input -s =
192.168.81.xxx</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>i will lose a lot of perfomance (for =
example:=20
  apache take a lot of time, ssh ...)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Wenn i show the perfomance with =
vmstat - vmstat=20
  says that 99 % is idel...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Wer is the Problem ???</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks for helping ...=20
Michael</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0086_01C3194D.FFA51150--


