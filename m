From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: forward is not forwarding
Date: Thu, 05 Sep 2002 22:43:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPGEMACNAA.stewart.thompson@shaw.ca>
References: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_aBfgVQTXWcMu27y7rzexeg)"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Abraham Kim <abraham.kim@veritas.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--Boundary_(ID_aBfgVQTXWcMu27y7rzexeg)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE

Abraham:

            Did you turn on forwarding in the Kernel? In Redhat you
can use Sysctl, I usually do it my iptables script as such:

echo "1" > /proc/sys/net/ipv4/ip_forward

Stu=85=85=85..


-----Original Message-----
=46rom: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Abraham Kim
Sent: September 5, 2002 10:36 PM
To: 'netfilter@lists.netfilter.org'
Subject: forward is not forwarding

Just installed RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.
Added 2 rules in FORWARD, but I can't ping from 10.1.1.2 to 192.168.1=
.2,
vice versa.
(those 2 are Sun machines, got default route to 10.1.1.1 and 192.168.=
1.1
each)

iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT

Did I miss anything simple here?
Should I arrange a routing module separately?

Thanks in advance,
Abraham


--Boundary_(ID_aBfgVQTXWcMu27y7rzexeg)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=
=3D"urn:schemas-microsoft-com:office:word" xmlns=3D"http://www.w3.org=
/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8=
859-1">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C2552D.A5039580">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:DrawingGridHorizontalSpacing>9.35 pt</w:DrawingGridHorizontalSpa=
cing>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
@font-face
=09{font-family:Tahoma;
=09panose-1:2 11 6 4 3 5 4 4 2 4;
=09mso-font-charset:0;
=09mso-generic-font-family:swiss;
=09mso-font-pitch:variable;
=09mso-font-signature:553679495 -2147483648 8 0 66047 0;}
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{mso-style-parent:"";
=09margin:0cm;
=09margin-bottom:.0001pt;
=09mso-pagination:widow-orphan;
=09font-size:12.0pt;
=09font-family:"Times New Roman";
=09mso-fareast-font-family:"Times New Roman";}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09mso-pagination:widow-orphan;
=09font-size:12.0pt;
=09font-family:"Times New Roman";
=09mso-fareast-font-family:"Times New Roman";}
span.EmailStyle15
=09{mso-style-type:personal-reply;
=09mso-ansi-font-size:10.0pt;
=09mso-ascii-font-family:Arial;
=09mso-hansi-font-family:Arial;
=09mso-bidi-font-family:Arial;
=09color:navy;}
@page Section1
=09{size:612.0pt 792.0pt;
=09margin:2.0cm 1.0cm 2.0cm 2.0cm;
=09mso-header-margin:35.45pt;
=09mso-footer-margin:2.0cm;
=09mso-paper-source:0;}
div.Section1
=09{page:Section1;}
-->
</style>
</head>

<body lang=3DEN-CA style=3D'tab-interval:36.0pt'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'>Abraham:<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font>=
</span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><span
style=3D'mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; </span>Did
you turn on forwarding in the Kernel? In Redhat you<o:p></o:p></span>=
</font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'>can use
Sysctl, I usually do it my iptables script as such:<o:p></o:p></span>=
</font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font>=
</span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'>echo
&quot;1&quot; &gt; /proc/sys/net/ipv4/ip_forward<o:p></o:p></span></f=
ont></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font>=
</span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'>Stu&#8230;&#8230;&#8230;..<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font>=
</span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 color=
=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial=
'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font>=
</span></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma;colo=
r:black'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]<b><span style=3D'font-we=
ight:bold'>On
Behalf Of </span></b>Abraham Kim<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> September 5, 200=
2 10:36 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b>
'netfilter@lists.netfilter.org'<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> forward is no=
t forwarding</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'><![if !supp=
ortEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Just
installed RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.</span=
></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Added 2
rules in FORWARD, but I can't ping from 10.1.1.2 to 192.168.1.2, vice=
 versa.</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>(those
2&nbsp;are Sun machines, got default route to 10.1.1.1 and 192.168.1.=
1 each)</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3 colo=
r=3Dblack
face=3D"Times New Roman"><span style=3D'font-size:12.0pt;color:black'=
>&nbsp;</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>iptables
-i eth0 -o eth1 -A FORWARD -j ACCEPT</span></font><font color=3Dblack=
><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>iptables
-i eth1 -o eth0 -A FORWARD -j ACCEPT</span></font><font color=3Dblack=
><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3 colo=
r=3Dblack
face=3D"Times New Roman"><span style=3D'font-size:12.0pt;color:black'=
>&nbsp;</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Did I
miss anything simple here?</span></font><font color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Should
I arrange a routing module separately?</span></font><font color=3Dbla=
ck><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3 colo=
r=3Dblack
face=3D"Times New Roman"><span style=3D'font-size:12.0pt;color:black'=
>&nbsp;</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Thanks
in advance,</span></font><font color=3Dblack><span style=3D'color:bla=
ck;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 colo=
r=3Dblack
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial;color:=
black'>Abraham</span></font><font
color=3Dblack><span style=3D'color:black;mso-color-alt:windowtext'><o=
:p></o:p></span></font></p>

</div>

</body>

</html>


--Boundary_(ID_aBfgVQTXWcMu27y7rzexeg)--

