From: "Craig Packard" <cpackard@zoominternet.net>
Subject: UDP DNAT Problem
Date: Thu, 3 Apr 2003 22:14:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c2fa58$5cd5b290$0b19a8c0@rock1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C2FA2E.73D677B0"
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

------=_NextPart_000_000C_01C2FA2E.73D677B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From what I understand if I setup a DNAT rule, when a packet matching =
the rule comes in it is sent to the specified host, obviously this is =
done by changing the destination field to be the system 'behind' the =
firewall.  It was however my understanding--and what I've seen in =
practice--that the source field would not be changed.  So in other words =
the source of the packet would still be the host out on the internet =
that actually sent the original packet.  However I have made a set of =
DNAT rules that I couldn't get to work. So a setup a packet sniffer at =
several points.  Here is what I noticed and has me confused.

The inside computer (A) sends out a UDP packet to the internet connected =
computer (B), of course this packet goes through firewall (FW).

The packet goes out as expect srcA dstB
But the weird part is the response comes back in srcFW dst(A)   Where I =
would like it would be src(B) dst(A)!!!

I think this is screwing up the communications.  Can anyone help me =
understand what is happening?

-    Craig

------=_NextPart_000_000C_01C2FA2E.73D677B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>From what I understand if I setup a =
DNAT rule, when=20
a packet matching the rule comes in it is sent to the specified host, =
obviously=20
this is done by changing the destination field to be the system 'behind' =
the=20
firewall.&nbsp; It was however my understanding--and what I've seen in=20
practice--that the source field would not be changed.&nbsp; So in other =
words=20
the source of the packet would still be the host out on the internet =
that=20
actually sent the original packet.&nbsp; However I have made a set of =
DNAT rules=20
that I couldn't get to work. So a setup a packet sniffer at several=20
points.&nbsp; Here is what I noticed and has me confused.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The inside computer (A) sends out a UDP =
packet to=20
the internet connected computer (B), of course this packet goes through =
firewall=20
(FW).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The packet goes out as expect srcA=20
dstB</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But the weird part is&nbsp;the =
response&nbsp;comes=20
back in srcFW dst(A)&nbsp;&nbsp; Where I would like it would be src(B)=20
dst(A)!!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I think this is screwing up the=20
communications.&nbsp; Can anyone help me understand what is=20
happening?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-&nbsp;&nbsp;&nbsp; Craig</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000C_01C2FA2E.73D677B0--


