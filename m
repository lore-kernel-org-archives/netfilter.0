From: "Adesina Adebiyi" <aadebiyi@shee.com>
Subject: Is outbound rule needed for http responses?
Date: Sun, 7 Mar 2004 16:37:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c4048c$74e8c180$3702a8c0@ARAQI>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C40462.8B9DD7A0"
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

------=_NextPart_000_000E_01C40462.8B9DD7A0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello gentle expert,

I am trying to adapt the iptables firewall for my hosting server.  That =
is, http, https will be running on it to serve ecommerce clients.  I =
have adapted rules to allow tcp inbound services for port 80 and 443.  =
To be able to respond to the requesting clients, do I need corresponding =
tcp outbound services on port 80 and 443? Or does the first inbound rule =
take care of this automatically since anyone that makes a tcp request is =
most likely to expect a reply?

Regards,

Adesina



------=_NextPart_000_000E_01C40462.8B9DD7A0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello gentle expert,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am trying to adapt the iptables =
firewall for my=20
hosting server.&nbsp; That is, http, https will be running on it to =
serve=20
ecommerce clients.&nbsp; I have adapted rules to allow tcp inbound =
services for=20
port 80 and 443.&nbsp; To be able to respond to the requesting clients, =
do I=20
need corresponding tcp outbound services on port 80 and 443? Or does the =
first=20
inbound rule take care of this automatically since anyone that makes a =
tcp=20
request is most likely to expect a reply?</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Adesina<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_000E_01C40462.8B9DD7A0--



