From: "Russell Seymour" <russell.seymour@energis.com>
Subject: Logging - where does it go??
Date: Tue, 2 Jul 2002 11:54:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <057638BF9D8C4045B3D809250015FA62A4FDF0@EXCL-GRL-01V1.mas.corp.energis.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C221B6.E18BBDF4"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C221B6.E18BBDF4
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

I have setup my firewall as I want it and I have a logging parameter set
in each of the chains INPUT, FORWARD, OUTPUT.

This logging statement was copied from the Netfilter tutorial.

=20

Iptables -A INPUT -m limit -limit 3/minute -limit-burst 3 -j LOG
-log-level DEBUG -log-prefix "INPUT packet:"

=20

When I run the command:

=20

Iptables -v -list

=20

I can see that at times I am actually logging information (or rather it
indicates this by saying that so many packets etc have been captured by
this rule).

=20

Now this my question.  I assumed that this would be logged to the syslog
daemon and then would be in /var/log/messages (I am running Linux RedHat
7.3), but it does not appear to be there.  Has anyone got any ideas
where this maybe going?


Thanks very much,

=20

Russell

=20


------_=_NextPart_001_01C221B6.E18BBDF4
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I have setup my firewall as I want it and I =
have a
logging parameter set in each of the chains INPUT, FORWARD, =
OUTPUT.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>This logging statement was copied from the =
Netfilter
tutorial.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Iptables &#8211;A INPUT &#8211;m limit =
&#8211;limit 3/minute
&#8211;limit-burst 3 &#8211;j LOG &#8211;log-level DEBUG =
&#8211;log-prefix &#8220;INPUT
packet:&#8221;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>When I run the command:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Iptables &#8211;v =
&#8211;list</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I can see that at times I am actually logging
information (or rather it indicates this by saying that so many packets =
etc have
been captured by this rule).</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Now this my question.&nbsp; I assumed that =
this would
be logged to the syslog daemon and then would be in /var/log/messages (I =
am
running Linux RedHat 7.3), but it does not appear to be there.&nbsp; Has =
anyone
got any ideas where this maybe going?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><br>
Thanks very much,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoAutoSig><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Russell</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-GB
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C221B6.E18BBDF4--

