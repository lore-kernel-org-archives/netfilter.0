From: "Michael Albrecht" <michael@crypta.net>
Subject: Performance losings with iptables
Date: Tue, 13 May 2003 17:57:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ec01c31968$5b3bba40$3a51a8c0@memmingen>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E9_01C31979.1E738410"
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

------=_NextPart_000_00E9_01C31979.1E738410
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello,
i use iptables with Debian-Linux (2.4.20).
Wenn i install 150 Input-Chains like this:
iptables -A input -s 192.168.81.xxx
i will lose a lot of perfomance (for example: apache take a lot of time, =
ssh ...)
Wenn i show the perfomance with vmstat - vmstat says that 99 % is =
idel...
Wer is the Problem ???

Thanks for helping ... Michael
------=_NextPart_000_00E9_01C31979.1E738410
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>&nbsp;</DIV>
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
<DIV><FONT face=3DArial size=3D2>Wenn i show the perfomance with vmstat =
- vmstat=20
says that 99 % is idel...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Wer is the Problem ???</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for helping ...=20
Michael</FONT></DIV></BODY></HTML>

------=_NextPart_000_00E9_01C31979.1E738410--


