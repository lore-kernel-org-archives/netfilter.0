From: "Jan Kleinsorge" <wobble@gmx.de>
Subject: UDP forwarding: multiple targets
Date: Tue, 17 Feb 2004 13:05:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c3f54e$4a6c94b0$0200a8c0@wobstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0022_01C3F556.ABE72270"
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

------=_NextPart_000_0022_01C3F556.ABE72270
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a problem concerning UDP forwarding. My local network is =
connected to the internet. One of the local computers receives a =
constant stream of UDP data - this stream gets forwarded by a =
linux-based gateway. The situation now is as follows: I need to route a =
'copy' of that stream to another local computer.

Is it possible to forward to multiple targets ? Another way I thought of =
is to reset the header-information, creating broadcast-packets out of =
those unicasts.

Thanks in advance !


Jan

------=_NextPart_000_0022_01C3F556.ABE72270
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2734.1600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a problem concerning UDP =
forwarding. My=20
local network is connected to the internet. One of the local computers =
receives=20
a constant stream of UDP data - this stream gets forwarded by a =
linux-based=20
gateway. The situation now is as follows: I need to&nbsp;route a 'copy' =
of that=20
stream to another local computer.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Is it possible to forward to multiple =
targets ?=20
Another way I thought of is to reset the header-information, creating=20
broadcast-packets out of those unicasts.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance !</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jan</FONT></DIV></BODY></HTML>

------=_NextPart_000_0022_01C3F556.ABE72270--


