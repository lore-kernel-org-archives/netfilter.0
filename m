From: Loc Huynh <loc.huynh@oz.quest.com>
Subject: Iptables forwarding
Date: Wed, 26 Jun 2002 17:41:37 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <1C61B9073EBFBD40B45FA90B8265B2DD1BDF@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C21CE4.E75D5550"
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
To: netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C21CE4.E75D5550
Content-Type: text/plain;
	charset="iso-8859-1"

Hi all,
 
I finally had the iptables 1.2.6a installed and it's working great (on
Redhat 7.3)
However, I have a small problem.
I have the following setup for forwarding on port 80 to our IIS web server.
 
$IPTABLES -A FORWARD -i $INTERNALIF -p tcp --dport 80 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $INTERNALIP --dport 80 -j DNAT
--to-destination $HTTPFWDIP:80

The above worked fine if I have the "FORWARD" to be open to ACCEPT
ie: $IPTABLES -P FORWARD ACCEPT

Of course, I don't want the default is open to "ACCEPT", is there anyway to
avoid this please ?
 
Thanks in advance,
LH

------_=_NextPart_001_01C21CE4.E75D5550
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2716.2200" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>Hi 
all,</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>I 
finally had the iptables 1.2.6a installed and it's working great (on Redhat 
7.3)</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2>However, I have a small problem.</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>I have 
the following setup for forwarding on port 80&nbsp;to our IIS web 
server.</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2>$IPTABLES -A FORWARD -i $INTERNALIF -p tcp --dport 80 -j 
ACCEPT<BR>$IPTABLES -A PREROUTING -t nat -p tcp -d $INTERNALIP --dport 80 -j 
DNAT --to-destination $HTTPFWDIP:80<BR></FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>The 
above worked fine if I have the "FORWARD" to be open to 
ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>ie: 
$IPTABLES -P FORWARD ACCEPT<BR></FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>Of 
course, I don't want the default is open to "ACCEPT", is there anyway to avoid 
this please ?</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff size=2>Thanks 
in advance,</FONT></SPAN></DIV>
<DIV><SPAN class=837413407-26062002><FONT face=Arial color=#0000ff 
size=2>LH</DIV></FONT></SPAN></BODY></HTML>

------_=_NextPart_001_01C21CE4.E75D5550--

