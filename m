From: "david" <david@aid.inf.cu>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 11:25:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <015601c22405$f21c42d0$8703000a@aid.inf.cu>
References: <002701c2242f$9498cd20$0a01a8c0@ed>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0153_01C22416.B5866740"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: blacknet@simplyaquatics.com
Cc: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0153_01C22416.B5866740
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

OK , I agree.In fact I  am just trying.
I heve tested a simpler script :

# Standard default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

am here you have the output.
/etc/rc.d/init.d/iptables : command not found
iptables: bad police name
iptables: bad police name
iptables: bad police name
/etc/rc.d/init.d/iptables : command not found


  ----- Original Message -----=20
  From: Ed Street=20
  Cc: netfilter@lists.samba.org=20
  Sent: Friday, July 05, 2002 4:23 PM
  Subject: RE: I need help , please


  Hello,

  =20

  First this script is not coded that well (not clean at all) second I =
would recommend changing scripts.  If you are going to keep this script =
I would urge you to do some serious house cleaning.  For the errors you =
can put breakpoints thru the script to determine the problems (bet =
there's several here)

  =20

  This type of script is not something you should just pick up and run =
blindly.

  =20

  Ed

  =20

  -----Original Message-----
  From: netfilter-admin@lists.samba.org =
[mailto:netfilter-admin@lists.samba.org] On Behalf Of david
  Sent: Friday, July 05, 2002 4:01 AM
  To: mimom@rcn.com; George Vieira; jesse.linux
  Cc: netfilter@lists.samba.org
  Subject: Fw: I need help , please

  =20

  Hi:

  =20

  George and Jesse:

  =20

  Here i am sending you all that I have done:

  KERNEL

  Enable loadble modulo support   Y

  Network packet Filtering  Y

  IP netfilter configuration   Y

  IP table support   Y

  =20

  everything else as modules.

  =20

  make bzImage

  make modules

  make modules_Install

  reboot

  uname -a

  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

  =20

  chkconfig --level 0123456 ipchains off

  /etc/rc.d/init.d/ipchains stop

  chkconfig --level 2345 iptables on

  /etc/rc.d/init.d/iptables start

  =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

  =20

  Here are my script (/etc/rc.d/init.d/iptables) and the errors.

  =20

  david

  =20

  Thanks to all of you


------=_NextPart_000_0153_01C22416.B5866740
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:v =3D=20
"urn:schemas-microsoft-com:vml" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<META content=3D"Microsoft Word 10" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C2240E.0D503EA0" rel=3DFile-List><!--[if gte =
mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<STYLE>@font-face {
	font-family: Tahoma;
}
P.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
LI.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
DIV.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline; text-underline: single
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline; text-underline: single
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline; text-underline: single
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline; text-underline: single
}
SPAN.EmailStyle17 {
	COLOR: navy; FONT-FAMILY: Arial; mso-style-type: personal-reply; =
mso-style-noshow: yes; mso-ansi-font-size: 10.0pt; mso-bidi-font-size: =
10.0pt; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; =
mso-bidi-font-family: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]--></HEAD>
<BODY bgColor=3Dwhite lang=3DEN-US link=3Dblue style=3D"tab-interval: =
.5in"=20
vLink=3Dpurple>
<DIV><FONT face=3DArial size=3D2>OK , I agree.In fact I&nbsp; am just=20
trying.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I heve tested a simpler script =
:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Standard default policies<BR>iptables =
-P INPUT=20
DROP<BR>iptables -P FORWARD DROP<BR>iptables -P OUTPUT =
DROP<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>am here you have the =
output.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/etc/rc.d/init.d/iptables : command not =

found</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables: bad police name</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial size=3D2>iptables: =
bad police=20
name</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial size=3D2>iptables: =
bad police=20
name</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>/etc/rc.d/init.d/iptables : command not =

found</FONT></DIV><BR></DIV></FONT>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:blacknet@simplyaquatics.com"=20
  title=3Dblacknet@simplyaquatics.com>Ed Street</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A=20
  href=3D"mailto:netfilter@lists.samba.org"=20
  title=3Dnetfilter@lists.samba.org>netfilter@lists.samba.org</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, July 05, 2002 =
4:23 PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: I need help , =
please</DIV>
  <DIV><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt">Hello,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: 10pt">First this =
script is=20
  not coded that well (not clean at all) second I would recommend =
changing=20
  scripts.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>If you are =
going to keep=20
  this script I would urge you to do some serious house cleaning.<SPAN=20
  style=3D"mso-spacerun: yes">&nbsp; </SPAN>For the errors you can put =
breakpoints=20
  thru the script to determine the problems (bet there&#8217;s several=20
  here)<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: 10pt">This type =
of script=20
  is not something you should just pick up and run=20
  blindly.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt">Ed<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT color=3Dnavy face=3DArial size=3D2><SPAN=20
  style=3D"COLOR: navy; FONT-FAMILY: Arial; FONT-SIZE: =
10pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DTahoma =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Tahoma; FONT-SIZE: 10pt">-----Original=20
  Message-----<BR><B><SPAN style=3D"FONT-WEIGHT: bold">From:</SPAN></B>=20
  netfilter-admin@lists.samba.org =
[mailto:netfilter-admin@lists.samba.org]=20
  <B><SPAN style=3D"FONT-WEIGHT: bold">On Behalf Of =
</SPAN></B>david<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, July 05, 2002 =
4:01=20
  AM<BR><B><SPAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B> =
mimom@rcn.com; George=20
  Vieira; jesse.linux<BR><B><SPAN style=3D"FONT-WEIGHT: =
bold">Cc:</SPAN></B>=20
  netfilter@lists.samba.org<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> Fw: I need help ,=20
  please</SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">Hi:</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">George and=20
  Jesse:</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Here i am sending you =
all that I=20
  have done:</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">KERNEL</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Enable loadble modulo=20
  support&nbsp;&nbsp; Y</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Network packet =
Filtering&nbsp;=20
  Y</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">IP netfilter=20
  configuration&nbsp;&nbsp; Y</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">IP table =
support&nbsp;&nbsp;=20
  Y</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">everything else as=20
  modules.</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">make=20
  bzImage</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">make=20
  modules</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">make=20
  modules_Install</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">reboot</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">uname=20
  -a</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">chkconfig --level =
0123456 ipchains=20
  off</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">/etc/rc.d/init.d/ipchains=20
  stop</SPAN></FONT><o:p></o:p></P></DIV>
  <DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">chkconfig --level 2345 =
iptables=20
  on<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">/etc/rc.d/init.d/iptables=20
  start<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Here are my script=20
  (/etc/rc.d/init.d/iptables) and the =
errors.<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">david<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">&nbsp;<o:p></o:p></SPAN></FONT></P></DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Thanks to all of=20
  =
you<o:p></o:p></SPAN></FONT></P></DIV></DIV></DIV></BLOCKQUOTE></BODY></H=
TML>

------=_NextPart_000_0153_01C22416.B5866740--


