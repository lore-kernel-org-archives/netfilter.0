From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: TWO ROUTING
Date: Fri, 21 Nov 2003 08:44:32 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AD45@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/related;
	type="multipart/alternative";
	boundary="----_=_NextPart_001_01C3AFAF.7BCA50E0"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?iso-8859-1?Q?Jos=E9_Gomes?= <jgomes@datas.com.br>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3AFAF.7BCA50E0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C3AFAF.7BCA50E0"


------_=_NextPart_002_01C3AFAF.7BCA50E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

He is asking what has been asked alot lately which is how to make a =
machine respond to both internet links via it's appropriate IP =
addresses.
=20
So when a client accesses the machine via ww.xx.yy.zz, the firewall =
responds back via that IP/ether, if a different client accesses it via =
the aa.bb.cc.dd address, it responds back via that address/ether.
=20
There was talk before about using CONNTRACK and marking packets on the =
list before.. I think this is the solution but I didn't see a successful =
response..
=20

Thanks,

George Vieira.
=20

-----Original Message-----
From: Jos=E9 Gomes [mailto:jgomes@datas.com.br]
Sent: Thursday, 20 November 2003 2:17 AM
To: netfilter@lists.netfilter.org
Subject: TWO ROUTING


=20

 Hello All,

=20

I Need to setup one Linux box with 3 Nics and two valid ip address, my =
question is:

=20

Nic1: 192.168.14.0/24

Nic2: 200.204.x.x/29 route to internet

Nic3: 200.171.x.x/29 route to internet=20

=20

How can both Ips with different routes response to requests with both =
routes enable ???

=20

Please help-me.

=20

=20

=20

Best Regards,

=20

=20

Jos=E9 Gomes

Network Specialist

Redbox Networks Ltda

jgomes@redbox.com.br

 <http://www.redbox.com.br/> http://www.redbox.com.br

+ 5511 3816-3720 R. 212

=20


------_=_NextPart_002_01C3AFAF.7BCA50E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE>@page Section1 {size: 595.3pt 841.9pt; margin: 70.85pt 3.0cm =
70.85pt 3.0cm; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; COLOR: black; FONT-FAMILY: Arial
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; COLOR: black; FONT-FAMILY: Arial
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; COLOR: black; FONT-FAMILY: Arial
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.EmailStyle17 {
	COLOR: black; mso-style-type: personal-compose
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]--></HEAD>
<BODY lang=3DPT-BR vLink=3Dpurple link=3Dblue bgColor=3Dwhite=20
background=3Dcid:498104221@20112003-0ca8>
<DIV><SPAN class=3D498104221-20112003><FONT face=3D"Courier New" =
size=3D2>He is asking=20
what has been asked alot lately which is how to make a machine respond =
to both=20
internet links via it's appropriate IP addresses.</FONT></SPAN></DIV>
<DIV><SPAN class=3D498104221-20112003><FONT face=3D"Courier New"=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D498104221-20112003><FONT face=3D"Courier New" =
size=3D2>So when a=20
client accesses the machine via ww.xx.yy.zz, the firewall responds back =
via that=20
IP/ether, if a different client accesses it via the aa.bb.cc.dd address, =
it=20
responds back via that address/ether.</FONT></SPAN></DIV>
<DIV><SPAN class=3D498104221-20112003><FONT face=3D"Courier New"=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D498104221-20112003><FONT face=3D"Courier New" =
size=3D2>There was=20
talk before about using CONNTRACK and marking packets on the list =
before.. I=20
think this is the solution but I didn't see a successful=20
response..</FONT></SPAN></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV>
<P><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D498104221-20112003>George=20
Vieira.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Jos=E9 Gomes=20
  [mailto:jgomes@datas.com.br]<BR><B>Sent:</B> Thursday, 20 November =
2003 2:17=20
  AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> TWO=20
  ROUTING<BR><BR></FONT></DIV><IMG class=3Dshape=20
  style=3D"DISPLAY: none; WIDTH: 0px; HEIGHT: 0px" height=3D0=20
  src=3D"cid:498104221@20112003-0ca8" width=3D0 v:shapes=3D"_x0000_Mail" =

  v:src=3D"cid:image001.gif@01C3AE9F.6DEBAA20">=20
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">&nbsp;</SPAN></FONT><FONT face=3D"Courier =
New"=20
  color=3Dblack size=3D2><SPAN lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Hello=20
  All,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">I Need=20
  to setup one Linux box with 3 Nics and two valid ip address, my =
question=20
  is:<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Nic1:=20
  192.168.14.0/24<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Nic2:=20
  200.204.x.x/29 route to internet<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Nic3:=20
  200.171.x.x/29 route to internet <o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">How can=20
  both Ips with different routes response to requests with both routes =
enable=20
  ???<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Please=20
  help-me.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Best=20
  Regards,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Jos=E9=20
  Gomes<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Network=20
  Specialist<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">Redbox=20
  Networks Ltda<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">jgomes@redbox.com.br<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><A=20
  href=3D"http://www.redbox.com.br/"><SPAN=20
  lang=3DEN-US>http://www.redbox.com.br</SPAN></A></SPAN></FONT><FONT=20
  face=3D"Courier New" color=3Dblack size=3D2><SPAN lang=3DEN-US=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Courier New" color=3Dblack =
size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: windowtext; FONT-FAMILY: 'Courier =
New'">+ 5511=20
  3816-3720 R. 212<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: =
12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML=
>

------_=_NextPart_002_01C3AFAF.7BCA50E0--

------_=_NextPart_001_01C3AFAF.7BCA50E0
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <498104221@20112003-0ca8>
Content-Description: image001.gif
Content-Location: image001.gif

R0lGODlhFAAUAPcAAP//////zP//mf//Zv//M///AP/M///MzP/Mmf/MZv/MM//MAP+Z//+ZzP+Z
mf+ZZv+ZM/+ZAP9m//9mzP9mmf9mZv9mM/9mAP8z//8zzP8zmf8zZv8zM/8zAP8A//8AzP8Amf8A
Zv8AM/8AAMz//8z/zMz/mcz/Zsz/M8z/AMzM/8zMzMzMmczMZszMM8zMAMyZ/8yZzMyZmcyZZsyZ
M8yZAMxm/8xmzMxmmcxmZsxmM8xmAMwz/8wzzMwzmcwzZswzM8wzAMwA/8wAzMwAmcwAZswAM8wA
AJn//5n/zJn/mZn/Zpn/M5n/AJnM/5nMzJnMmZnMZpnMM5nMAJmZ/5mZzJmZmZmZZpmZM5mZAJlm
/5lmzJlmmZlmZplmM5lmAJkz/5kzzJkzmZkzZpkzM5kzAJkA/5kAzJkAmZkAZpkAM5kAAGb//2b/
zGb/mWb/Zmb/M2b/AGbM/2bMzGbMmWbMZmbMM2bMAGaZ/2aZzGaZmWaZZmaZM2aZAGZm/2ZmzGZm
mWZmZmZmM2ZmAGYz/2YzzGYzmWYzZmYzM2YzAGYA/2YAzGYAmWYAZmYAM2YAADP//zP/zDP/mTP/
ZjP/MzP/ADPM/zPMzDPMmTPMZjPMMzPMADOZ/zOZzDOZmTOZZjOZMzOZADNm/zNmzDNmmTNmZjNm
MzNmADMz/zMzzDMzmTMzZjMzMzMzADMA/zMAzDMAmTMAZjMAMzMAAAD//wD/zAD/mQD/ZgD/MwD/
AADM/wDMzADMmQDMZgDMMwDMAACZ/wCZzACZmQCZZgCZMwCZAABm/wBmzABmmQBmZgBmMwBmAAAz
/wAzzAAzmQAzZgAzMwAzAAAA/wAAzAAAmQAAZgAAMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAFAAUAEAIQwBJCBxI
sKBBAAgTKlyYUCDDhwsdQpwoceLDihYjksh4cSNHjR9BhmzocSQAjCFRflTJkWVGlxZhUiw5UiZE
gzhzBgQAOw==

------_=_NextPart_001_01C3AFAF.7BCA50E0--

