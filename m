From: "Rodrigo Leme de Mello" <rodrigo@idg.com.br>
Subject: Re: Doubt about DNAT
Date: Tue, 10 Sep 2002 18:19:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <029501c2590f$b10bfe90$0100a8c0@desktop>
References: <FLEKIPPLAEDMJMOOBBDPIEDHCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0291_01C258F6.8B5A8680"
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
To: stewart.thompson@shaw.ca, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0291_01C258F6.8B5A8680
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Stewart,

Yeap! I have and my SQL Server is set with the default configuration, that
put it to listen on 1433.
I've also did a port scan to check if the port is open and it is.

Thanks for youe help

Rodrigo

----- Original Message -----
From: Stewart Thompson
To: Rodrigo Leme de Mello ; netfilter@lists.samba.org
Sent: Tuesday, September 10, 2002 5:27 PM
Subject: RE: Doubt about DNAT


Hi Rodrigo:



            Do you have a Forward rule to match the Prerouting rule?

Is your SQL server on the Internal Net expecting connections on

Port 1433?



Stu...





-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rodrigo Leme de
Mello
Sent: September 10, 2002 7:17 AM
To: netfilter@lists.samba.org
Subject: Doubt about DNAT



Hi all,



I am in trouble to do a rule. Anybody can help me?



I want to redirect all traffic from a specific valid ip and specific
destination port to a machine located inside a LAN.



This rule is to access SQL Server that is located inside a LAN and i have a
valid ip address in a linux machine with iptables.



I've tried the following:



Lan IP with SQL Server: 192.168.0.10

Valid IP with iptables: 200.221.98.123

Valid IP that will acess SQL Server. 200.206.123.112



This rule i've put in the machine 200.221.98.123



iptables -t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j
DNAT --to 192.168.0.10



And now i configure my SQL Server to connect to 200.221.98.123 but i still
can't connect. Dou you have any idea why it is not working?



The ip's i've mentioned are just for example.



Thanks a lot



Rodrigo














------=_NextPart_000_0291_01C258F6.8B5A8680
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<META content=3D"Microsoft Word 9" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C258CD.D58AF970" rel=3DFile-List><!--[if gte =
mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:DrawingGridHorizontalSpacing>9.35 =
pt</w:DrawingGridHorizontalSpacing>
 </w:WordDocument>
</xml><![endif]-->
<STYLE>@font-face {
	font-family: Tahoma;
}
@page Section1 {size: 612.0pt 792.0pt; margin: 2.0cm 1.0cm 2.0cm 2.0cm; =
mso-header-margin: 35.45pt; mso-footer-margin: 2.0cm; mso-paper-source: =
0; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
P.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
LI.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
DIV.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
SPAN.EmailStyle15 {
	COLOR: navy; mso-style-type: personal-reply; mso-ansi-font-size: =
10.0pt; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; =
mso-bidi-font-family: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1027"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1"/>
 </o:shapelayout></xml><![endif]--></HEAD>
<BODY lang=3DEN-CA style=3D"tab-interval: 36.0pt" bgColor=3Dwhite>
<DIV><FONT face=3DArial size=3D2>Hi Stewart,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Yeap! I have and my SQL Server is set =
with the=20
default configuration, that put it to listen on 1433. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I've also did a port scan to check if =
the port is=20
open and it is.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for youe help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Rodrigo</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV style=3D"FONT: 10pt arial">----- Original Message -----=20
<DIV style=3D"BACKGROUND: #e4e4e4; font-color: black"><B>From:</B> <A=20
title=3Dstewart.thompson@shaw.ca =
href=3D"mailto:stewart.thompson@shaw.ca">Stewart=20
Thompson</A> </DIV>
<DIV><B>To:</B> <A title=3Drodrigo@idg.com.br=20
href=3D"mailto:rodrigo@idg.com.br">Rodrigo Leme de Mello</A> ; <A=20
title=3Dnetfilter@lists.samba.org=20
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A> =
</DIV>
<DIV><B>Sent:</B> Tuesday, September 10, 2002 5:27 PM</DIV>
<DIV><B>Subject:</B> RE: Doubt about DNAT</DIV></DIV>
<DIV><BR></DIV>
<DIV class=3DSection1>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt">Hi=20
Rodrigo:<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><SPAN=20
style=3D"mso-tab-count: =
1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>Do you have a Forward rule to match the Prerouting=20
rule?<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt">Is your=20
SQL server on the Internal Net expecting connections=20
on<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt">Port=20
1433?<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt">Stu=85=85=85<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal><SPAN class=3DEmailStyle15><FONT face=3DArial =
color=3Dnavy=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DTahoma =
color=3D#060606=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Tahoma">-----Original=20
Message-----<BR><B><SPAN style=3D"FONT-WEIGHT: bold">From:</SPAN></B> <A =

href=3D"mailto:netfilter-admin@lists.netfilter.org">netfilter-admin@lists=
.netfilter.org</A>=20
[mailto:netfilter-admin@lists.netfilter.org]<B><SPAN=20
style=3D"FONT-WEIGHT: bold">On Behalf Of </SPAN></B>Rodrigo Leme de=20
Mello<BR><B><SPAN style=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> September =
10, 2002=20
7:17 AM<BR><B><SPAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B> <A=20
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A><B=
R><B><SPAN=20
style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> Doubt about =
DNAT</SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Hi=20
all,</SPAN></FONT><FONT color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">I am in=20
trouble to do a rule. Anybody can help me?</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">I want=20
to redirect all traffic from a specific valid ip and specific =
destination port=20
to a machine located inside a LAN.</SPAN></FONT><FONT =
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">This=20
rule is to access SQL Server that is located inside a LAN and i have a =
valid ip=20
address in a linux machine with iptables.</SPAN></FONT><FONT =
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">I've=20
tried the following:</SPAN></FONT><FONT color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Lan IP=20
with SQL Server: 192.168.0.10</SPAN></FONT><FONT color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Valid=20
IP with iptables: 200.221.98.123</SPAN></FONT><FONT =
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Valid=20
IP that will acess SQL Server. 200.206.123.112</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">This=20
rule i've put in the machine 200.221.98.123</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: Arial">iptables =
-t nat -A=20
PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j DNAT --to=20
192.168.0.10</SPAN></FONT><FONT color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">And now=20
i configure my SQL Server to connect to 200.221.98.123 but i still can't =

connect. Dou you have any idea why it is not working?</SPAN></FONT><FONT =

color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">The=20
ip's i've mentioned are just for example.</SPAN></FONT><FONT =
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Thanks=20
a lot</SPAN></FONT><FONT color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3DArial =
color=3D#060606=20
size=3D2><SPAN=20
style=3D"FONT-SIZE: 10pt; COLOR: #060606; FONT-FAMILY: =
Arial">Rodrigo</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN-LEFT: 36pt"><FONT face=3D"Times New =
Roman"=20
color=3D#060606 size=3D3><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: #060606">&nbsp;</SPAN></FONT><FONT=20
color=3D#060606><SPAN=20
style=3D"COLOR: #060606; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P></DIV></BODY></HTML>

------=_NextPart_000_0291_01C258F6.8B5A8680--


