From: "Juliano Dapper" <juliano@dualcon.com.br>
Subject: z-newnat16 - Implementation of the new nat API for kernel 2.4.19-pre4 and above.
Date: Tue, 22 Oct 2002 17:20:57 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c27a00$26e18de0$3200a8c0@dualcon.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C279EF.625557A0"
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

------=_NextPart_000_0007_01C279EF.625557A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I Have problems after compile kernel 2.4.19 with patch-o-matic20020825, =
option z-newnat16.
After compile and restart my linux box, i try insert basic rule:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE and result is:
ARGUMENT INVALID
My iptables is version 1.2.7a and kernel 2.4.19.

Tkz.

------=_NextPart_000_0007_01C279EF.625557A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I Have problems after compile kernel =
2.4.19 with=20
patch-o-matic20020825, option z-newnat16.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>After compile and restart my linux box, =
i try=20
insert basic rule:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o eth0 =
-j=20
MASQUERADE and result is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ARGUMENT INVALID</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>My iptables is version 1.2.7a and =
kernel=20
2.4.19.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tkz.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0007_01C279EF.625557A0--


