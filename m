From: "Aldo Lagana" <alagana@discmail.com>
Subject: Filtering in the nat table - opinions wanted
Date: Mon, 24 Mar 2003 13:20:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003501c2f232$1c0a5140$6d64a8c0@discmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0032_01C2F208.331A3190"
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

------=_NextPart_000_0032_01C2F208.331A3190
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

by default I set the nat chains (PREROUTING POSTROUTING, etc) to ACCEPT. =
 first off is this bad?

For my web & mail servers using DNAT, I need to add rules - and I do.  =
Same w/ SNAT rules...

The problem has come up with our mail server - we were getting spam from =
one IP address - since my DNAT rule was ACCEPT and forward, the mail =
server kept getting these spam messages.  I stopped the SPAM by adding a =
rule to the beginning of PREROUTING to DROP packets from that address.

This made me start thinking - am I doing it right by having all the nat =
chains default ACCEPT?

aldo




------=_NextPart_000_0032_01C2F208.331A3190
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
<DIV><FONT face=3DArial size=3D2>by default I set the nat chains =
(PREROUTING=20
POSTROUTING, etc) to ACCEPT.&nbsp; first off is this bad?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For my web &amp; mail servers using =
DNAT, I need to=20
add rules - and I do.&nbsp; Same w/ SNAT rules...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The problem has come up with our mail =
server - we=20
were getting spam from one IP address - since my DNAT rule was ACCEPT =
and=20
forward, the mail server kept getting these spam messages.&nbsp; I =
stopped the=20
SPAM by adding a rule to the beginning of PREROUTING to DROP packets =
from that=20
address.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This made me start thinking - am I =
doing it right=20
by having all the nat chains default ACCEPT?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>aldo</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0032_01C2F208.331A3190--


