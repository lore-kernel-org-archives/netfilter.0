From: "Hlynur Thor Olason" <thorolason@web.de>
Subject: forwarding local traffic
Date: Thu, 11 Dec 2003 11:52:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c3bfd4$d80cdf00$b84526c0@thor>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002E_01C3BFDD.39728530"
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

------=_NextPart_000_002E_01C3BFDD.39728530
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have 2 Ethernet cards in a box.

=20

Call them eth0 with IP address 192.168.0.1    and

eth1 with IP =3D 192.168..0.2

=20

eth1=3D 192.168.0.2 is connected to another computer a gateway which has =
the IP address 192.168.0.3. This computer is then connected to an =
external network which is again connected to eth0=3D192.168.0.1 in the =
first box.=20

=20

Now the problem is I want to get locally generated packages in the box =
destined for 192.168.0.2 (eth1 in the box) to leave the box and be =
routed trough the network to the box again.=20

=20

I have been trying to use iptables but not found a solution.=20

=20

Any suggestion would be welcome?  / Thor=20

------=_NextPart_000_002E_01C3BFDD.39728530
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
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">I=20
have 2 Ethernet cards in a box.<?xml:namespace prefix =3D o ns =3D=20
"urn:schemas-microsoft-com:office:office" =
/><o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><o:p><FONT face=3D"Times New Roman"=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">Call=20
them eth0 with IP address 192.168.0.1<SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;=20
</SPAN>and<o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">eth1=20
with IP =3D 192.168..0.2<o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><o:p><FONT face=3D"Times New Roman"=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">eth1=3D=20
192.168.0.2 is connected to another computer a gateway which has the IP =
address=20
192.168.0.3. This computer is then connected to an external network =
which is=20
again connected to eth0=3D192.168.0.1 in the first box.=20
<o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><o:p><FONT face=3D"Times New Roman"=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">Now=20
the problem is I want to get locally generated packages in the box =
destined for=20
192.168.0.2 (eth1 in the box) to leave the box and be routed trough the =
network=20
to the box again. <o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><o:p><FONT face=3D"Times New Roman"=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">I=20
have been trying to use iptables but not found a solution.=20
<o:p></o:p></FONT></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><o:p><FONT face=3D"Times New Roman"=20
size=3D3>&nbsp;</FONT></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D"mso-ansi-language: EN-US"><FONT size=3D3><FONT face=3D"Times =
New Roman">Any=20
suggestion would be welcome?<SPAN style=3D"mso-spacerun: yes">&nbsp; =
</SPAN>/ Thor=20
<o:p></o:p></FONT></FONT></SPAN></P></FONT></DIV></FONT></DIV></BODY></HT=
ML>

------=_NextPart_000_002E_01C3BFDD.39728530--


