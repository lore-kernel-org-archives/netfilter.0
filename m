From: "jherschel" <jherschel@quarry.com>
Subject: PASV rules opening up my high-ports!
Date: Mon, 26 May 2003 14:35:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FKEKLDLBAFLHIMEKAJJAEECICAAA.jherschel@quarry.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0054_01C32394.136CB850"
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

------=_NextPart_000_0054_01C32394.136CB850
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Howdy,

Thanks in advance for reading this, if this is a common issue, I apologize =
=96
but could you point me to a searchable archive so I don=92t bug this list w=
ith
previously asked questions?

Anyways =96 here goes =85

I=92ve got rules for FTP inbound/outbound for both PORT and PASV connection=
s.
I=92m also running MySQL, which defaults to port 3306.

If FTP PASV rules are enabled, either as a server or client, it seems all my
high ports are open to be connected to.  I=92ve tried enforcing state, but I
end up either breaking the rule so that FTP doesn=92t work, or I end up
opening the high-ports again.

Is there a way to fix this by developing a better rule? Or should I limit my
PASV ports to a range that does not overlap with other services?

Here are the related rules =85 (the PASV rules are commented out)

#
# General rules
#
modprobe ip_tables
modprobe ip_conntrack
modprobe ip_conntrack_ftp

#################################################################
# Kernel configuration section and cleansing of the filter, nat,#
# and mangle tables                                             #
#################################################################
echo -n $"clearing old rules from tables:"

$IPTABLES -F && \
$IPTABLES -t filter -F INPUT && \
$IPTABLES -t filter -F FORWARD && \
# commands to zero chain counters - needed on restart
$IPTABLES -X
$IPTABLES -t filter -Z && \

success $"clearing old rules from tables" || \
failure $"clearing old rules from tables"
echo

# set all filtering to DROP as default
echo -n $"setting default rules to DROP: "

# used to be IPTABLES -t filter -P ...

$IPTABLES -P INPUT DROP && \
$IPTABLES -P FORWARD DROP && \
$IPTABLES -P OUTPUT DROP  && \

success $"setting default rules to DROP" || \
failure $"setting default rules to DROP"
echo

#
# FTP RULES
#

if [[ $FTP_client =3D=3D 1 ]] ; then
        echo -n $"adding FTP client rules: "

        # Outgoing Request

        $IPTABLES -A INPUT -i $IFACE -p tcp \
                        -s any/0 --sport 21 \
                        -d $LOCAL_IP --dport 1024: \
                        -m state --state ESTABLISHED \
                        -j ACCEPT &&\
        $IPTABLES -A OUTPUT -o $IFACE -p tcp \
                        -s $LOCAL_IP --sport 1024: \
                        -d any/0 --dport 21 \
                        -m state --state NEW,ESTABLISHED \
                        -j ACCEPT &&\

        # PORT FTP Connections

        $IPTABLES -A INPUT -i $IFACE -p tcp \
                        -s any/0 --sport 20 \
                        -d $LOCAL_IP --dport 1024: \
                        -m state --state ESTABLISHED,RELATED \
                        -j ACCEPT &&\
        $IPTABLES -A OUTPUT -o $IFACE -p tcp \
                        -s $LOCAL_IP --sport 1024: \
                        -d any/0 --dport 20 \
                        -m state --state ESTABLISHED \
                        -j ACCEPT &&\

        # PASV FTP Connections

#       $IPTABLES -A INPUT -i $IFACE -p tcp \
#                       -s any/0 --sport 1024: \
#                       -d $LOCAL_IP --dport 1024: \
#                       -m state --state ESTABLISHED \
#                       -j ACCEPT &&\
#       $IPTABLES -A OUTPUT -o $IFACE -p tcp \
#                       -s $LOCAL_IP --sport 1024: \
#                       -d any/0 --dport 1024: \
#                       -m state --state ESTABLISHED,RELATED \
#                      -j ACCEPT &&\

        success $"adding FTP client rules" || \
        failure $"adding FTP client rules"
        echo
fi

Thanks again,

James

------=_NextPart_000_0054_01C32394.136CB850
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C32394.131EBF60">
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle15
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

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Howdy,<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Thanks in advance for reading this, if this is a common issue, I =
apologize
&#8211; but could you point me to a searchable archive so I don&#8217;t =
bug this list with
previously asked questions?<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Anyways &#8211; here goes =
&#8230;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>I&#8217;ve got rules for FTP inbound/outbound for both PORT and =
PASV
connections.<span style=3D"mso-spacerun: yes">&nbsp; </span>I&#8217;m =
also running
MySQL, which defaults to port 3306.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>If FTP PASV rules are enabled, either as a server or client, it =
seems
all my high ports are open to be connected to.<span =
style=3D"mso-spacerun:
yes">&nbsp; </span>I&#8217;ve tried enforcing state, but I end up either =
breaking the
rule so that FTP doesn&#8217;t work, or I end up opening the high-ports =
again.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Is there a way to fix this by developing a better rule? Or should =
I
limit my PASV ports to a range that does not overlap with other =
services?<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Here are the related rules &#8230; (the PASV rules are commented =
out)<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># General rules<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>modprobe ip_tables<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>modprobe ip_conntrack<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>modprobe ip_conntrack_ftp<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#################################################################<=
o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># Kernel configuration section and cleansing of the filter, =
nat,#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># and mangle tables<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#################################################################<=
o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>echo -n $&quot;clearing old rules from =
tables:&quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -F &amp;&amp; \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -t filter -F INPUT &amp;&amp; =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -t filter -F FORWARD &amp;&amp; =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># commands to zero chain counters - needed on =
restart<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -X<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -t filter -Z &amp;&amp; =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>success $&quot;clearing old rules from tables&quot; || =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>failure $&quot;clearing old rules from =
tables&quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>echo<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># set all filtering to DROP as =
default<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>echo -n $&quot;setting default rules to DROP: =
&quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># used to be IPTABLES -t filter -P =
...<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -P INPUT DROP &amp;&amp; =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -P FORWARD DROP &amp;&amp; =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>$IPTABLES -P OUTPUT DROP<span style=3D"mso-spacerun: yes">&nbsp;
</span>&amp;&amp; \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>success $&quot;setting default rules to DROP&quot; || =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>failure $&quot;setting default rules to =
DROP&quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>echo<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'># FTP RULES<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>if [[ $FTP_client =3D=3D 1 ]] ; =
then<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>echo -n =
$&quot;adding
FTP client rules: &quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span># Outgoing =
Request<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>$IPTABLES -A =
INPUT -i
$IFACE -p tcp \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s any/0 --sport 21 \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d $LOCAL_IP --dport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun: yes">&nbsp;&nbsp; </span><span
style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>-m
state --state ESTABLISHED \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>$IPTABLES -A =
OUTPUT -o
$IFACE -p tcp \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s $LOCAL_IP --sport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d any/0 --dport 21 \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-m state --state NEW,ESTABLISHED =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span># PORT FTP =
Connections<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>$IPTABLES -A =
INPUT -i
$IFACE -p tcp \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s any/0 --sport 20 \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d $LOCAL_IP --dport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-m state --state ESTABLISHED,RELATED =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>$IPTABLES -A =
OUTPUT -o
$IFACE -p tcp \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s $LOCAL_IP --sport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d any/0 --dport 20 \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-m state --state ESTABLISHED =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span># PASV FTP =
Connections<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>$IPTABLES -A INPUT -i $IFACE -p tcp =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s any/0 --sport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d $LOCAL_IP --dport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-m state --state ESTABLISHED =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>$IPTABLES -A OUTPUT -o $IFACE -p tcp =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-s $LOCAL_IP --sport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-d any/0 --dport 1024: \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-m state --state ESTABLISHED,RELATED =
\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>#<span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>-j ACCEPT &amp;&amp;\<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>success =
$&quot;adding
FTP client rules&quot; || \<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>failure =
$&quot;adding
FTP client rules&quot;<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun:
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>echo<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>fi<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Thanks again,<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>James<o:p></o:p></span></font></span></p>

</div>

</body>

</html>

------=_NextPart_000_0054_01C32394.136CB850--


