From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Logging - where does it go??
Date: Tue, 2 Jul 2002 21:16:12 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1D5@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C221B9.DF97A940"
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
To: 'Russell Seymour' <russell.seymour@energis.com>
Cc: netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C221B9.DF97A940
Content-Type: text/plain;
	charset="iso-8859-1"

The "--log-level DEBUG" means use the debug from syslog.
Check your /etc/syslog.conf for any "*.debug" or similar as this is probably
where it'll end up.. if not it'll go to the console.
 
RTFM (Read The Fabulous Manual) on iptables on the section of --log-level
 
 
-----Original Message-----
From: Russell Seymour [mailto:russell.seymour@energis.com]
Sent: Tuesday, 02 July 2002 8:55 PM
To: netfilter@lists.samba.org
Subject: Logging - where does it go??



I have setup my firewall as I want it and I have a logging parameter set in
each of the chains INPUT, FORWARD, OUTPUT.

This logging statement was copied from the Netfilter tutorial.

 

Iptables -A INPUT -m limit -limit 3/minute -limit-burst 3 -j LOG -log-level
DEBUG -log-prefix "INPUT packet:"

 

When I run the command:

 

Iptables -v -list

 

I can see that at times I am actually logging information (or rather it
indicates this by saying that so many packets etc have been captured by this
rule).

 

Now this my question.  I assumed that this would be logged to the syslog
daemon and then would be in /var/log/messages (I am running Linux RedHat
7.3), but it does not appear to be there.  Has anyone got any ideas where
this maybe going?


Thanks very much,

 

Russell

 


------_=_NextPart_001_01C221B9.DF97A940
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.00.3315.2870" name=GENERATOR>
<STYLE>P.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
}
LI.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
}
DIV.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
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
P.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
}
LI.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
}
DIV.MsoAutoSig {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt
}
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=EN-US link=blue vLink=purple>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=010501311-02072002>The 
"--log-level DEBUG" means use the debug from syslog.</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=010501311-02072002>Check 
your /etc/syslog.conf for any "*.debug" or similar as this is probably where 
it'll end up.. if not it'll go to the console.</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=010501311-02072002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=010501311-02072002>RTFM 
(Read The Fabulous Manual) on iptables on the section of 
--log-level</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=010501311-02072002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=010501311-02072002></SPAN></FONT>&nbsp;</DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma 
size=2>-----Original Message-----<BR><B>From:</B> Russell Seymour 
[mailto:russell.seymour@energis.com]<BR><B>Sent:</B> Tuesday, 02 July 2002 8:55 
PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> Logging - where 
does it go??<BR><BR></FONT></DIV>
<DIV class=Section1>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">I have setup my firewall as I want 
it and I have a logging parameter set in each of the chains INPUT, FORWARD, 
OUTPUT.</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">This logging statement was copied 
from the Netfilter tutorial.</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">Iptables &#8211;A INPUT &#8211;m limit &#8211;limit 
3/minute &#8211;limit-burst 3 &#8211;j LOG &#8211;log-level DEBUG &#8211;log-prefix &#8220;INPUT 
packet:&#8221;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">When I run the 
command:</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">Iptables &#8211;v &#8211;list</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">I can see that at times I am 
actually logging information (or rather it indicates this by saying that so many 
packets etc have been captured by this rule).</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">Now this my question.&nbsp; I 
assumed that this would be logged to the syslog daemon and then would be in 
/var/log/messages (I am running Linux RedHat 7.3), but it does not appear to be 
there.&nbsp; Has anyone got any ideas where this maybe going?</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt"><BR>Thanks very 
much,</SPAN></FONT></P>
<P class=MsoNormal><FONT face=Arial size=2><SPAN lang=EN-GB 
style="FONT-FAMILY: Arial; FONT-SIZE: 10pt">&nbsp;</SPAN></FONT></P>
<P class=MsoAutoSig><FONT face="Times New Roman" size=3><SPAN 
style="FONT-SIZE: 12pt">Russell</SPAN></FONT></P>
<P class=MsoNormal><FONT face="Times New Roman" size=3><SPAN lang=EN-GB 
style="FONT-SIZE: 12pt">&nbsp;</SPAN></FONT></P></DIV></BODY></HTML>

------_=_NextPart_001_01C221B9.DF97A940--

