From: "Shook, Tim - AES" <Tim.Shook@itt.com>
Subject: Broadcast layer2 forwarding (ff:ff:ff:ff:ff:ff)
Date: Mon, 6 Jan 2003 11:52:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407C4612AF574244AD03C43504FB74CB19A74F@alexva-mail.aes.de.ittind.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-4967f611-eca5-440e-8537-a2dd811f0d92"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------=_NextPartTM-000-4967f611-eca5-440e-8537-a2dd811f0d92
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2B5A3.EFE81E4E"

------_=_NextPart_001_01C2B5A3.EFE81E4E
Content-Type: text/plain

Hello,

 

            I'm currently trying something rather unique with IPtables and
need an opinion.  I'm trying to forward and manipulate a packet with the
following ip address:

 

Source 192.0.0.1  

Destination 192.0.0.2

 

If the MAC addresses on these are standard, manufacturer assigned addresses,
everything works fine.  If I manipulate the MACs with ifconfig and set them
to ALMOST any other MAC, everything works fine, however when I set the MAC
to a layer 2 broadcast (FF:FF:FF:FF:FF:FF), IPTables stops forwarding the
packet. 

 

Now, the question is:

 

Where is this packet being trapped and dropped?  Is it in the kernel
(routing)? Or is IPtables dropping it?  Is the Ethernet card dropping it?

 

I'm going to try to build a test version of the latest iptables source and
put some debug stuff in to find out if iptables is seeing this packet,
however I was hoping someone well educated with IPtables might enlighten me
as too what is happening here.

 

NOTE:  I am fully aware of the bizarre setup that I am using and the MAC
layer address issue.  This is not standard.  I've been tasked to fix a
custom software broken IP problem with a device that will mangle packets for
me and retransmit them as if they were not broken.  Linux is of course the
obvious choice and iptables does 99.9999 % of what I need it to do.  It
works fine and does well up to this broadcast MAC.  I just can't get passed
this last hurdle.

 

Any ideas or suggestions would be helpful

 

Thanks

 

Tim

 


************************************ 
If this email is not intended for you, or you are not responsible for the
delivery of this message to the addressee, please note that this message may
contain ITT Privileged/Proprietary Information.  In such a case, you may not
copy or deliver this message to anyone.  You should destroy this message and
kindly notify the sender by reply email.  Information contained in this
message that does not relate to the business of ITT is neither endorsed by
nor attributable to ITT. 
************************************ 


------_=_NextPart_001_01C2B5A3.EFE81E4E
Content-Type: text/html

<html>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=US-ASCII">


<meta name=Generator content="Microsoft Word 10 (filtered)">

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
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=EN-US link=blue vlink=purple>

<div class=Section1>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Hello,</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I&#8217;m
currently trying something rather unique with IPtables and need an
opinion.&nbsp; I&#8217;m trying to forward and manipulate a packet with the
following ip address:</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Source 192.0.0.1&nbsp; </span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Destination 192.0.0.2</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>If the MAC addresses on these are standard, manufacturer
assigned addresses, everything works fine.&nbsp; If I manipulate the MACs with ifconfig
and set them to ALMOST any other MAC, everything works fine, however when I set
the MAC to a layer 2 broadcast (FF:FF:FF:FF:FF:FF), IPTables stops forwarding
the packet. </span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Now, the question is:</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Where is this packet being trapped and dropped?&nbsp; Is it
in the kernel (routing)? Or is IPtables dropping it?&nbsp; Is the Ethernet card
dropping it?</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>I&#8217;m going to try to build a test version of the latest
iptables source and put some debug stuff in to find out if iptables is seeing
this packet, however I was hoping someone well educated with IPtables might
enlighten me as too what is happening here.</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>NOTE:&nbsp; I am fully aware of the bizarre setup that I am using
and the MAC layer address issue.&nbsp; This is not standard.&nbsp; I&#8217;ve
been tasked to fix a custom software broken IP problem with a device that will
mangle packets for me and retransmit them as if they were not broken.&nbsp;
Linux is of course the obvious choice and iptables does 99.9999 % of what I
need it to do.&nbsp; It works fine and does well up to this broadcast
MAC.&nbsp; I just can&#8217;t get passed this last hurdle.</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Any ideas or suggestions would be helpful</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Thanks</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>Tim</span></font></p>

<p class=MsoNormal><font size=2 face=Arial><span style='font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
<BR>

<P><FONT SIZE=2 FACE="Arial">************************************<BR>
<I>If this email is not intended for you, or you are not responsible for the delivery of this message to the addressee, please note that this message may contain ITT Privileged/Proprietary Information.  In such a case, you may not copy or deliver this message to anyone.  You should destroy this message and kindly notify the sender by reply email.  Information contained in this message that does not relate to the business of ITT is neither endorsed by nor attributable to ITT.<BR>
************************************ </I></FONT></P>
<BR>

------_=_NextPart_001_01C2B5A3.EFE81E4E--

------=_NextPartTM-000-4967f611-eca5-440e-8537-a2dd811f0d92--


