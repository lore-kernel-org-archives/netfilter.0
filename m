From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RPC Module Questions
Date: Fri, 17 Oct 2003 16:46:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F301E8005A@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C394F8.141164B1"
Content-Transfer-Encoding: 7bit
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C394F8.141164B1
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm trying to add the RPC connection tracking module (the one from =
patch-o-matic). It is compiled in to the kernel (I also did string at =
the same time) and string is working but RPC is not. I have tried =
manually loading the modules (string loads the module automatically) and =
a couple of other things but regardless I get the return:
=20
No chain/target/match by that name.
=20
I'm using the example command I always see of "iptables -A INPUT -m =
record_rpc -j ACCEPT". Is there a walkthrough for this somewhere or =
would somebody please tell me what else I need to do to get this =
working.
=20
Thank you,
=20
B. Hildebrand
=20

----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

------_=_NextPart_001_01C394F8.141164B1
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C394CE.2A687B10">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEve=
ry>
  =
<w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>
  <w:UseMarginsForDrawingGridOrigin/>
  <w:Compatibility>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:DoNotUseHTMLParagraphAutoSpacing/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
  </w:Compatibility>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
@font-face
	{font-family:"Arial Black";
	panose-1:2 11 10 4 2 1 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
@font-face
	{font-family:Garamond;
	panose-1:2 2 4 4 3 3 1 1 8 3;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
h1
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:none;
	mso-outline-level:1;
	font-size:16.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Arial Black";
	color:gray;
	mso-font-kerning:0pt;
	layout-grid-mode:line;
	font-weight:normal;}
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:none;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Garamond;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	layout-grid-mode:line;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle16
	{mso-style-type:personal-compose;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:black;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
</head>

<body lang=3DEN-US style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I&#8217;m trying to add
the RPC connection tracking module (the one from patch-o-matic). It is =
compiled
in to the kernel (I also did string at the same time) and string is =
working but
RPC is not. I have tried manually loading the modules (string loads the =
module
automatically) and a couple of other things but regardless I get the =
return:<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>No
chain/target/match by that name.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>I&#8217;m using the
example command I always see of &#8220;iptables &#8211;A INPUT &#8211;m =
record_rpc &#8211;j ACCEPT&#8221;. Is
there a walkthrough for this somewhere or would somebody please tell me =
what
else I need to do to get this =
working.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>Thank =
you,<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>B. =
Hildebrand<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

</div>


<p></p>
<DIV name=3Duccdisclaimer>
----------------------------------------<br>The information transmitted =
in this message is intended only for the person or entity to whom it is =
addressed and may contain confidential and/or privileged material.  Any =
review, retransmission, dissemination or other use of, or taking of any =
action in reliance upon this information by persons or entities other =
than the intended recipient is prohibited.  If you received this in =
error, please contact the sender and destroy any copies of this =
document.
</DIV>
</body>

</html>

------_=_NextPart_001_01C394F8.141164B1--

