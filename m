From: "ale" <mystic@tin.it>
Subject: Condition
Date: Sun, 9 Mar 2003 20:19:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004201c2e670$e03301c0$4201a8c0@decibelq2g3k3v>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003F_01C2E679.41F2D5E0"
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
To: "lists.netfilter.org" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_003F_01C2E679.41F2D5E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi.

The string in the Example (iptables -A INPUT -p tcp -m condition =
--condition web_ok --dport 80 -j ACCEPT)
doesn't work (error: multipe condition),bat if I invert the position of =
--dport 80 and -m condition --condition web_ok (iptables -A INPUT -p tcp =
--dport 80 -m condition --condition web_ok -j ACCEPT) it works properly.

BY.
------=_NextPart_000_003F_01C2E679.41F2D5E0
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
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>The string in the =
Example</FONT>=20
(<FONT size=3D3>iptables -A INPUT -p tcp -m condition --condition web_ok =
--dport=20
80 -j ACCEPT)</FONT></FONT></DIV>
<DIV><FONT face=3DArial>doesn't work (error: multipe condition),bat if I =
invert=20
the position of --dport 80 and -m condition --condition web_ok (iptables =
-A=20
INPUT -p tcp --dport 80 -m condition --condition web_ok -j ACCEPT) =
</FONT><FONT=20
face=3DArial>it works properly.</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>BY.</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_003F_01C2E679.41F2D5E0--


