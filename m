From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: Port Forwarding
Date: Thu, 24 Apr 2003 01:58:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C627C1E@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C30A26.7B534564"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C30A26.7B534564
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C30A26.7B534564"


------_=_NextPart_002_01C30A26.7B534564
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all. =20
=20
I'm using iptables on RH 8.0 to route and firewall my cable connection
to the rest of the lan.  My problem is joining games (Ghost Recon) on
ubi.com from behind the firewall.  Ubi.com requires port 80 for http
which works fine, port 6667 for chat which also works fine, and
40000-42000 for the game (I'm assuming) which seems to be random when I
run nmap on machines running the game with no firewall.  Is there a way
to allow one or multiple machines behind the firewall to join/host a
game by forwarding the ports.  I attached my iptables script that I'm
currently using.
=20
Thanks,
Matt
=20

------_=_NextPart_002_01C30A26.7B534564
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C30A05.135508C0">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
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
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello all.<span style=3D'mso-spacerun:yes'>&nbsp; =
</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m using <span class=3DSpellE>iptables</span> =
on RH 8.0
to route and firewall my cable connection to the rest of the <span
class=3DSpellE><span class=3DGramE>lan</span></span>.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>My problem is joining games =
(Ghost Recon) on
ubi.com from behind the firewall.<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>Ubi.com
requires port 80 for http which works fine, port 6667 for chat which =
also works
fine, and 40000-42000 for the game (I&#8217;m assuming) which seems to =
be
random when I run <span class=3DSpellE>nmap</span> on machines running =
the game
with no firewall.<span style=3D'mso-spacerun:yes'>&nbsp; </span>Is there =
a way to
allow one or multiple machines behind the firewall to join/host a game =
by
forwarding the <span class=3DGramE>ports.</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>I attached my <span class=3DSpellE>iptables</span> script that =
I&#8217;m
currently using.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Matt<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_002_01C30A26.7B534564--

------_=_NextPart_001_01C30A26.7B534564
Content-Type: text/plain;
	name="route.rtf.txt"
Content-Transfer-Encoding: base64
Content-Description: route.rtf.txt
Content-Disposition: attachment;
	filename="route.rtf.txt"

CiMhL2Jpbi9zaAojCiMgcmMuZmlyZXdhbGwgLSBJbml0aWFsIFNJTVBMRSBJUCBGaXJld2FsbCBz
Y3JpcHQgZm9yIExpbnV4IDIuNC54IGFuZCBpcHRhYmxlcwojCiMgQ29weXJpZ2h0IChDKSAyMDAx
ICBPc2thciBBbmRyZWFzc29uICZsdDtibHVlZmx1eEBrb2ZmZWluLm5ldCZndDsKIwojIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5CiMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcyBwdWJsaXNoZWQgYnkKIyB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJz
aW9uIDIgb2YgdGhlIExpY2Vuc2UuCiMKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFO
VFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNIQU5UQUJJTElU
WSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKIyBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgojCiMgWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9u
ZyB3aXRoIHRoaXMgcHJvZ3JhbSBvciBmcm9tIHRoZSBzaXRlIHRoYXQgeW91IGRvd25sb2FkZWQg
aXQKIyBmcm9tOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24s
IEluYy4sIDU5IFRlbXBsZQojIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgIDAyMTExLTEz
MDcgICBVU0EKIwoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiMKIyAxLiBDb25maWd1cmF0aW9uIG9wdGlv
bnMuCiMKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojCiMgTG9jYWwgQXJlYSBOZXR3b3JrIGNvbmZpZ3Vy
YXRpb24uCiMKIyB5b3VyIExBTidzIElQIHJhbmdlIGFuZCBsb2NhbGhvc3QgSVAuIC8yNCBtZWFu
cyB0byBvbmx5IHVzZSB0aGUgZmlyc3QgMjQgCiMgYml0cyBvZiB0aGUgMzIgYml0IElQIGFkcmVz
cy4gdGhlIHNhbWUgYXMgbmV0bWFzayAyNTUuMjU1LjI1NS4wCiMKCkxBTl9JUD0iMTkyLjE2OC4w
LjI1NCIKTEFOX0lQX1JBTkdFPSIxOTIuMTY4LjAuMC8xNiIKTEFOX0JDQVNUX0FEUkVTUz0iMTky
LjE2OC4yNTUuMjU1IgpMQU5fSUZBQ0U9ImV0aDEiCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIwp3CiMg
TG9jYWxob3N0IENvbmZpZ3VyYXRpb24uCiMKCkxPX0lGQUNFPSJsbyIKTE9fSVA9IjEyNy4wLjAu
MSIKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojCiMgSW50ZXJuZXQgQ29uZmlndXJhdGlvbi4KIwoKSU5F
VF9JUD0iMTIuMjUxLjE2My4yMTQiCklORVRfSUZBQ0U9ImV0aDAiCgojIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIwojIElQVGFibGVzIENvbmZpZ3VyYXRpb24uCiMKCklQVEFCTEVTPSIvc2Jpbi9pcHRhYmxl
cyIKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwojCiMgMi4gTW9kdWxlIGxvYWRpbmcuCiMKCiMKIyBOZWVk
ZWQgdG8gaW5pdGlhbGx5IGxvYWQgbW9kdWxlcwojCi9zYmluL2RlcG1vZCAtYQoKIwojIEFkZHMg
c29tZSBpcHRhYmxlcyB0YXJnZXRzIGxpa2UgTE9HLCBSRUpFQ1QgYW5kIE1BU1FVQVJBREUuCiMK
L3NiaW4vbW9kcHJvYmUgaXBfY29ubnRyYWNrCi9zYmluL21vZHByb2JlIGlwX3RhYmxlcwovc2Jp
bi9tb2Rwcm9iZSBpcHRhYmxlX2ZpbHRlcgovc2Jpbi9tb2Rwcm9iZSBpcHRhYmxlX21hbmdsZQov
c2Jpbi9tb2Rwcm9iZSBpcHRhYmxlX25hdAovc2Jpbi9tb2Rwcm9iZSBpcHRfTE9HCiMvc2Jpbi9t
b2Rwcm9iZSBpcHRfUkVKRUNUCiMvc2Jpbi9tb2Rwcm9iZSBpcHRfTUFTUVVFUkFERQoKIwojIFN1
cHBvcnQgZm9yIG93bmVyIG1hdGNoaW5nCiMKIy9zYmluL21vZHByb2JlIGlwdF9vd25lcgoKIwoj
IFN1cHBvcnQgZm9yIGNvbm5lY3Rpb24gdHJhY2tpbmcgb2YgRlRQIGFuZCBJUkMuCiMKIy9zYmlu
L21vZHByb2JlIGlwX2Nvbm50cmFja19mdHAKIy9zYmluL21vZHByb2JlIGlwX2Nvbm50cmFja19p
cmMKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIwojIDMuIC9wcm9jIHNldCB1cC4KIwojIEVuYWJsZSBp
cF9mb3J3YXJkIGlmIHlvdSBoYXZlIHR3byBvciBtb3JlIG5ldHdvcmtzLCBpbmNsdWRpbmcgdGhl
CiMgSW50ZXJuZXQsIHRoYXQgbmVlZHMgZm9yd2FyZGluZyBvZiBwYWNrZXRzIHRocm91Z2ggdGhp
cyBib3guIFRoaXMgaXMKIyBjcml0aWNhbCBzaW5jZSBpdCBpcyB0dXJuZWQgb2ZmIGFzIGRlZmF1
bHQgaW4gTGludXguCiMKCmVjaG8gIjEiID4gL3Byb2Mvc3lzL25ldC9pcHY0L2lwX2ZvcndhcmQK
CiMKIyBEeW5hbWljIElQIHVzZXJzOgojCiNlY2hvICIxIiA+IC9wcm9jL3N5cy9uZXQvaXB2NC9p
cF9keW5hZGRyCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIwojIDQuIElQVGFibGVzIHJ1bGVzIHNldCB1
cC4KIwojIFNldCBkZWZhdWx0IHBvbGljaWVzIGZvciB0aGUgSU5QVVQsIEZPUldBUkQgYW5kIE9V
VFBVVCBjaGFpbnMuCiMgRHJvcCBBTEwgcGFja2V0cwoKJElQVEFCTEVTIC1QIElOUFVUIERST1AK
JElQVEFCTEVTIC1QIE9VVFBVVCBEUk9QCiRJUFRBQkxFUyAtUCBGT1JXQVJEIERST1AKCiMKIyBi
YWRfdGNwX3BhY2tldHMgY2hhaW4KIwojIFRha2UgY2FyZSBvZiBiYWQgVENQIHBhY2tldHMgdGhh
dCB3ZSBkb24ndCB3YW50LgojCgokSVBUQUJMRVMgLU4gYmFkX3RjcF9wYWNrZXRzCiRJUFRBQkxF
UyAtQSBiYWRfdGNwX3BhY2tldHMgLXAgdGNwICEgLS1zeW4gLW0gc3RhdGUgLS1zdGF0ZSBORVcg
LWogTE9HIFwKLS1sb2ctcHJlZml4ICJOZXcgbm90IHN5bjoiCiRJUFRBQkxFUyAtQSBiYWRfdGNw
X3BhY2tldHMgLXAgdGNwICEgLS1zeW4gLW0gc3RhdGUgLS1zdGF0ZSBORVcgLWogRFJPUAoKIwoj
IERvIHNvbWUgY2hlY2tzIGZvciBvYnZpb3VzbHkgc3Bvb2ZlZCBJUCdzCiMKCiRJUFRBQkxFUyAt
QSBiYWRfdGNwX3BhY2tldHMgLWkgJElORVRfSUZBQ0UgLXMgMTkyLjE2OC4wLjAvMTYgLWogRFJP
UAokSVBUQUJMRVMgLUEgYmFkX3RjcF9wYWNrZXRzIC1pICRJTkVUX0lGQUNFIC1zIDEwLjAuMC4w
LzggLWogRFJPUAokSVBUQUJMRVMgLUEgYmFkX3RjcF9wYWNrZXRzIC1pICRJTkVUX0lGQUNFIC1z
IDE3Mi4xNi4wLjAvMTIgLWogRFJPUAoKIwojIEVuYWJsZSBzaW1wbGUgSVAgRm9yd2FyZGluZyBh
bmQgTmV0d29yayBBZGRyZXNzIFRyYW5zbGF0aW9uCiMKCiRJUFRBQkxFUyAtdCBuYXQgLUEgUE9T
VFJPVVRJTkcgLW8gJElORVRfSUZBQ0UgLWogU05BVCAtLXRvLXNvdXJjZSAkSU5FVF9JUAoKIwoj
IEJhZCBUQ1AgcGFja2V0cyB3ZSBkb24ndCB3YW50CiMKCiRJUFRBQkxFUyAtQSBGT1JXQVJEIC1w
IHRjcCAtaiBiYWRfdGNwX3BhY2tldHMKCiMKIyBBY2NlcHQgdGhlIHBhY2tldHMgd2UgYWN0dWFs
bHkgd2FudCB0byBmb3J3YXJkCiMKCiRJUFRBQkxFUyAtQSBGT1JXQVJEIC1pICRMQU5fSUZBQ0Ug
LWogQUNDRVBUCiRJUFRBQkxFUyAtQSBGT1JXQVJEIC1tIHN0YXRlIC0tc3RhdGUgRVNUQUJMSVNI
RUQsUkVMQVRFRCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIEZPUldBUkQgLW0gbGltaXQgLS1saW1p
dCAzL21pbnV0ZSAtLWxpbWl0LWJ1cnN0IDMgLWogTE9HIFwKLS1sb2ctbGV2ZWwgREVCVUcgLS1s
b2ctcHJlZml4ICJJUFQgRk9SV0FSRCBwYWNrZXQgZGllZDogIgoKIwojIENyZWF0ZSBzZXBhcmF0
ZSBjaGFpbnMgZm9yIElDTVAsIFRDUCBhbmQgVURQIHRvIHRyYXZlcnNlCiMKCiRJUFRBQkxFUyAt
TiBpY21wX3BhY2tldHMKJElQVEFCTEVTIC1OIHRjcF9wYWNrZXRzCiRJUFRBQkxFUyAtTiB1ZHBp
bmNvbWluZ19wYWNrZXRzCgojCiMgVGhlIGFsbG93ZWQgY2hhaW4gZm9yIFRDUCBjb25uZWN0aW9u
cwojCgokSVBUQUJMRVMgLU4gYWxsb3dlZAokSVBUQUJMRVMgLUEgYWxsb3dlZCAtcCBUQ1AgLS1z
eW4gLWogQUNDRVBUCiRJUFRBQkxFUyAtQSBhbGxvd2VkIC1wIFRDUCAtbSBzdGF0ZSAtLXN0YXRl
IEVTVEFCTElTSEVELFJFTEFURUQgLWogQUNDRVBUCiRJUFRBQkxFUyAtQSBhbGxvd2VkIC1wIFRD
UCAtaiBEUk9QCgojCiMgSUNNUCBydWxlcwojCgojIENoYW5nZWQgcnVsZXMgdG90YWxseQokSVBU
QUJMRVMgLUEgaWNtcF9wYWNrZXRzIC1wIElDTVAgLXMgMC8wIC0taWNtcC10eXBlIDggLWogQUND
RVBUCiRJUFRBQkxFUyAtQSBpY21wX3BhY2tldHMgLXAgSUNNUCAtcyAwLzAgLS1pY21wLXR5cGUg
MTEgLWogQUNDRVBUCgojCiMgVENQIHJ1bGVzCiMKCiRJUFRBQkxFUyAtQSB0Y3BfcGFja2V0cyAt
cCBUQ1AgLXMgMC8wIC0tZHBvcnQgMjEgLWogYWxsb3dlZAokSVBUQUJMRVMgLUEgdGNwX3BhY2tl
dHMgLXAgVENQIC1zIDAvMCAtLWRwb3J0IDIyIC1qIGFsbG93ZWQKJElQVEFCTEVTIC1BIHRjcF9w
YWNrZXRzIC1wIFRDUCAtcyAwLzAgLS1kcG9ydCAyNSAtaiBhbGxvd2VkCiRJUFRBQkxFUyAtQSB0
Y3BfcGFja2V0cyAtcCBUQ1AgLXMgMC8wIC0tZHBvcnQgODAgLWogYWxsb3dlZAokSVBUQUJMRVMg
LUEgdGNwX3BhY2tldHMgLXAgVENQIC1zIDAvMCAtLWRwb3J0IDExMCAtaiBhbGxvd2VkCiRJUFRB
QkxFUyAtQSB0Y3BfcGFja2V0cyAtcCBUQ1AgLXMgMC8wIC0tZHBvcnQgMTEzIC1qIGFsbG93ZWQK
JElQVEFCTEVTIC1BIHRjcF9wYWNrZXRzIC1wIFRDUCAtcyAwLzAgLS1kcG9ydCAxNzIzIC1qIGFs
bG93ZWQKCiMKIyBVRFAgcG9ydHMKIwoKIyBub25kb2N1bWVudGVkIGNvbW1lbnRpbmcgb3V0IG9m
IHRoZXNlIHJ1bGVzCiMkSVBUQUJMRVMgLUEgdWRwaW5jb21pbmdfcGFja2V0cyAtcCBVRFAgLXMg
MC8wIC0tc291cmNlLXBvcnQgNTMgLWogQUNDRVBUCiMkSVBUQUJMRVMgLUEgdWRwaW5jb21pbmdf
cGFja2V0cyAtcCBVRFAgLXMgMC8wIC0tc291cmNlLXBvcnQgMTIzIC1qIEFDQ0VQVAokSVBUQUJM
RVMgLUEgdWRwaW5jb21pbmdfcGFja2V0cyAtcCBVRFAgLXMgMC8wIC0tc291cmNlLXBvcnQgMjA3
NCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIHVkcGluY29taW5nX3BhY2tldHMgLXAgVURQIC1zIDAv
MCAtLXNvdXJjZS1wb3J0IDQwMDAgLWogQUNDRVBUCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwojIElOUFVUIGNoYWluCiMKIyBCYWQgVENQIHBhY2tldHMgd2UgZG9uJ3Qgd2FudC4KIwoKJElQ
VEFCTEVTIC1BIElOUFVUIC1wIHRjcCAtaiBiYWRfdGNwX3BhY2tldHMKCiMKIyBSdWxlcyBmb3Ig
aW5jb21pbmcgcGFja2V0cyBmcm9tIHRoZSBpbnRlcm5ldC4KIwoKJElQVEFCTEVTIC1BIElOUFVU
IC1wIElDTVAgLWkgJElORVRfSUZBQ0UgLWogaWNtcF9wYWNrZXRzCiRJUFRBQkxFUyAtQSBJTlBV
VCAtcCBUQ1AgLWkgJElORVRfSUZBQ0UgLWogdGNwX3BhY2tldHMKJElQVEFCTEVTIC1BIElOUFVU
IC1wIFVEUCAtaSAkSU5FVF9JRkFDRSAtaiB1ZHBpbmNvbWluZ19wYWNrZXRzCgojCiMgVlBOIGZv
ciBpbmNvbWluZyBjb25uZWN0aW9ucyB0byAxOTIuMTY4LjAuMQojCgokSVBUQUJMRVMgLXQgbmF0
IC1BIFBSRVJPVVRJTkcgLWkgZXRoMCAtcCB0Y3AgLS1kcG9ydCAxNzIzIC1qIEROQVQgLS10byAx
OTIuMTY4LjAuMQokSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLWkgZXRoMCAtcCA0NyAt
aiBETkFUIC0tdG8gMTkyLjE2OC4wLjEKJElQVEFCTEVTIC1BIEZPUldBUkQgLXAgdGNwIC1kIDE5
Mi4xNjguMC4xLzE2IC0tZHBvcnQgMTcyMyAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIEZPUldBUkQg
LXAgNDcgLWQgMTkyLjE2OC4wLjEvMTYgLWogQUNDRVBUCgojCiNFLU1haWwgcm91dGVzIHRvIDE5
Mi4xNjguMC4xIAojCgokSVBUQUJMRVMgLXQgbmF0IC1BIFBSRVJPVVRJTkcgLWkgZXRoMCAtcCB0
Y3AgLS1kcG9ydCAyNSAtaiBETkFUIC0tdG8gMTkyLjE2OC4wLjEKJElQVEFCTEVTIC10IG5hdCAt
QSBQUkVST1VUSU5HIC1pIGV0aDAgLXAgdGNwIC0tZHBvcnQgMTEwIC1qIEROQVQgLS10byAxOTIu
MTY4LjAuMQokSVBUQUJMRVMgLUEgRk9SV0FSRCAtcCB0Y3AgLWQgMTkyLjE2OC4wLjEgLS1kcG9y
dCAyNSAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIEZPUldBUkQgLXAgdGNwIC1zIDE5Mi4xNjguMC4x
IC0tZHBvcnQgMjUgLWogQUNDRVBUCgojIFJ1bGVzIGZvciBzcGVjaWFsIG5ldHdvcmtzIG5vdCBw
YXJ0IG9mIHRoZSBJbnRlcm5ldAojCgokSVBUQUJMRVMgLUEgSU5QVVQgLXAgQUxMIC1pICRMQU5f
SUZBQ0UgLWQgJExBTl9CQ0FTVF9BRFJFU1MgLWogQUNDRVBUCiRJUFRBQkxFUyAtQSBJTlBVVCAt
cCBBTEwgLWkgJExPX0lGQUNFIC1zICRMT19JUCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIElOUFVU
IC1wIEFMTCAtaSAkTE9fSUZBQ0UgLXMgJExBTl9JUCAtaiBBQ0NFUFQKJElQVEFCTEVTIC1BIElO
UFVUIC1wIEFMTCAtaSAkTE9fSUZBQ0UgLXMgJElORVRfSVAgLWogQUNDRVBUCiRJUFRBQkxFUyAt
QSBJTlBVVCAtcCBBTEwgLWkgJExBTl9JRkFDRSAtcyAkTEFOX0lQX1JBTkdFIC1qIEFDQ0VQVAok
SVBUQUJMRVMgLUEgSU5QVVQgLXAgQUxMIC1kICRJTkVUX0lQIC1tIHN0YXRlIC0tc3RhdGUgRVNU
QUJMSVNIRUQsUkVMQVRFRCBcCi1qIEFDQ0VQVAokSVBUQUJMRVMgLUEgSU5QVVQgLW0gbGltaXQg
LS1saW1pdCAzL21pbnV0ZSAtLWxpbWl0LWJ1cnN0IDMgLWogTE9HIFwKLS1sb2ctbGV2ZWwgREVC
VUcgLS1sb2ctcHJlZml4ICJJUFQgSU5QVVQgcGFja2V0IGRpZWQ6ICIKCiMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIyBPVVRQVVQgY2hhaW4KIwojCiMgQmFkIFRDUCBwYWNrZXRzIHdl
IGRvbid0IHdhbnQuCiMKCiRJUFRBQkxFUyAtQSBPVVRQVVQgLXAgdGNwIC1qIGJhZF90Y3BfcGFj
a2V0cwoKIwojIFNwZWNpYWwgT1VUUFVUIHJ1bGVzIHRvIGRlY2lkZSB3aGljaCBJUCdzIHRvIGFs
bG93LgojCgokSVBUQUJMRVMgLUEgT1VUUFVUIC1wIEFMTCAtcyAkTE9fSVAgLWogQUNDRVBUCiRJ
UFRBQkxFUyAtQSBPVVRQVVQgLXAgQUxMIC1zICRMQU5fSVAgLWogQUNDRVBUCiRJUFRBQkxFUyAt
QSBPVVRQVVQgLXAgQUxMIC1zICRJTkVUX0lQIC1qIEFDQ0VQVAoKIwojIExvZyB3ZWlyZCBwYWNr
ZXRzIHRoYXQgZG9uJ3QgbWF0Y2ggdGhlIGFib3ZlLgojCgokSVBUQUJMRVMgLUEgT1VUUFVUIC1t
IGxpbWl0IC0tbGltaXQgMy9taW51dGUgLS1saW1pdC1idXJzdCAzIC1qIExPRyBcCi0tbG9nLWxl
dmVsIERFQlVHIC0tbG9nLXByZWZpeCAiSVBUIE9VVFBVVCBwYWNrZXQgZGllZDogIgoK

------_=_NextPart_001_01C30A26.7B534564--

