From: "Sundaram" <sun@percipia.com>
Subject: Routing rule for two gateways.
Date: Thu, 19 Sep 2002 22:19:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ce01c26051$994ca630$0200000a@ramasamy>
Reply-To: "Sundaram" <sun@percipia.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_009F_01C2602A.B13070F0"
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

------=_NextPart_000_009F_01C2602A.B13070F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Routing rule for two gateways.

=20

I have two Linux netfilter gateways for my network  (1) 192.168.1.10, =
(1) 192.168.1.100 public IP in the external interface. Inside LAN I am =
running ftp server (192.168.1.50) with default gateway as 192.168.1.10. =
From Internet using Fist gateway public IP address I was able to access =
the ftp server, but using second gateway public IP address I was not =
able to access the ftp server.

=20

Where I need to set the routing, so that I can access the ftp server =
using both gateway.

=20

Thanks in advance=20

-SR

=20


------=_NextPart_000_009F_01C2602A.B13070F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3D"Times =
New Roman"=20
size=3D3>Routing rule for two gateways.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT size=3D3><FONT=20
face=3D"Times New Roman">&nbsp;<?xml:namespace prefix =3D o ns =3D=20
"urn:schemas-microsoft-com:office:office" =
/><o:p></o:p></FONT></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3D"Times =
New Roman"=20
size=3D3>I have two Linux netfilter gateways for my network <SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN>(1) 192.168.1.10, (1) =
192.168.1.100=20
public IP in the external interface. Inside LAN I am running ftp server=20
(192.168.1.50) with default gateway as 192.168.1.10. From Internet using =
Fist=20
gateway public IP address I was able to access the ftp server, but using =
second=20
gateway public IP address I was not able to access the ftp =
server.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT size=3D3><FONT=20
face=3D"Times New Roman">&nbsp;<o:p></o:p></FONT></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3D"Times =
New Roman"=20
size=3D3>Where I need to set the routing, so that I can access the ftp =
server=20
using both gateway.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT size=3D3><FONT=20
face=3D"Times New Roman">&nbsp;<o:p></o:p></FONT></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3D"Times =
New Roman"=20
size=3D3>Thanks in advance </FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3D"Times =
New Roman"=20
size=3D3>-SR</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT size=3D3><FONT=20
face=3D"Times New =
Roman">&nbsp;<o:p></o:p></FONT></FONT></P></FONT></DIV></BODY></HTML>

------=_NextPart_000_009F_01C2602A.B13070F0--


