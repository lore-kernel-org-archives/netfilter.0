From: "Gongya Yu" <yu@gongya.net>
Subject: -i and -o options for iptables FORWARD chain
Date: Wed, 31 Dec 2003 15:36:34 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0097_01C3CFB3.DF42F9F0"
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

------=_NextPart_000_0097_01C3CFB3.DF42F9F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, I just updated Linux kernel to 2.6.0 with iptables and ebtables =
enabled.

But iptables ignores -i and -o options for FORWARD chain. Wheneneve I =
use something like -i eth0 or -o eth0, the rule is just ignored.

Any suggestions ?

thanks in advance!!

Gongya Yu
------=_NextPart_000_0097_01C3CFB3.DF42F9F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi, I just updated Linux kernel to =
2.6.0 with=20
iptables and ebtables enabled.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But iptables ignores -i and -o options =
for FORWARD=20
chain. Wheneneve I use something like -i eth0 or -o eth0, the rule is =
just=20
ignored.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any suggestions ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks in advance!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Gongya Yu</FONT></DIV></BODY></HTML>

------=_NextPart_000_0097_01C3CFB3.DF42F9F0--


