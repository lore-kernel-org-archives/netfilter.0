From: Abraham Kim <Abraham.Kim@veritas.com>
Subject: RE: forward is not forwarding
Date: Fri, 6 Sep 2002 16:22:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EF33C96B91C212479FA2B0B0A96868F80102C887@sydxch02.veritas.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2556D.C9321DBA"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2556D.C9321DBA
Content-Type: text/plain;
	charset="iso-8859-1"

Dear Stewart, Chris, Steve, and many others...
 
Thanks for giving me help on this.
 
I changed "0" to "1" in the ip_forward and
those 2 machines can talk to each other now. (Wow!)
 
Everything's perfect, except (this except is always a pain...)
telnet from Linux to Solaris takes too long to be established
(it looks hung after the Escape character... message)
 
It almost takes 1 minutes to give login prompt!
rlogin is the same (get the command prompt after 1 min!)
(did not test ssh yet...)
 
From Solaris to Linux or Solaris to Solaris is not a problem.
 
I know it does not quite fit to this mailing list, but could anyone
shout at me if you had similar experience and a tip together?
 
Thanks,
 
Abraham

------_=_NextPart_001_01C2556D.C9321DBA
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<META content=3D"Microsoft Word 9" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C2552D.A5039580" rel=3DFile-List><!--[if gte =
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
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New =
Roman"
}
LI.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New =
Roman"
}
DIV.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New =
Roman"
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
</HEAD>
<BODY lang=3DEN-CA style=3D"tab-interval: 36.0pt">
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>Dear=20
Stewart, Chris, Steve, and many others...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>Thanks=20
for giving me help on this.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>I=20
changed "0" to "1" in the ip_forward and</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>those=20
2 machines can talk to each other now. (Wow!)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002>Everything's perfect, except (this except is =
always a=20
pain...)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>telnet=20
from Linux to Solaris takes too long to be =
established</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>(it=20
looks hung after the Escape character... message)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>It=20
almost takes 1 minutes to give login prompt!</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>rlogin=20
is the same (get the command prompt after 1 min!)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>(did=20
not test ssh yet...)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>From=20
Solaris to Linux or Solaris to Solaris is not a =
problem.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>I know=20
it does&nbsp;not quite fit to this mailing list, but could=20
anyone</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D100311606-06092002>shout=20
at me if you had similar experience and a tip =
together?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D100311606-06092002>Abraham</SPAN></FONT><![if =
!supportEmptyParas]><![endif]><![if !supportEmptyParas]><![endif]><![if =
!supportEmptyParas]><![endif]><![if !supportEmptyParas]><![endif]><![if =
!supportEmptyParas]><![endif]><![if =
!supportEmptyParas]><![endif]></DIV></BODY></HTML>

------_=_NextPart_001_01C2556D.C9321DBA--

