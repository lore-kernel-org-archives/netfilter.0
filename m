From: "Kevin Lee" <kclee@ece.cmu.edu>
Subject: rule lookup
Date: Wed, 25 Feb 2004 23:33:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402260432.i1Q4Wgir021487@smtp3.andrew.cmu.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003B_01C3FBF7.C88D6770"
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
Cc: 'Joseph Giampapa' <garof+@cs.cmu.edu>

This is a multi-part message in MIME format.

------=_NextPart_000_003B_01C3FBF7.C88D6770
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Does anyone know how a table (nat, filter, mangle, etc.) is implemented in
netfilter?  In particular, when a rule is looked up as a packet comes in,
how is a rule searched through the table?  Is there some kind of hash table
mechanism that allows lookup time to be constant?  

 

Thanks,
Kevin


------=_NextPart_000_003B_01C3FBF7.C88D6770
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Does anyone know how a table (nat, filter, mangle, =
etc.) is
implemented in netfilter?&nbsp; In particular, when a rule is looked up =
as a
packet comes in, how is a rule searched through the table?&nbsp; Is =
there some
kind of hash table mechanism that allows lookup time to be =
constant?&nbsp; <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<br>
Kevin<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_003B_01C3FBF7.C88D6770--


