From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: ping with netfilter
Date: Tue, 2 Jul 2002 08:08:54 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1C3@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2214B.E3860470"
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
To: 'Luigi Cartuccia' <luigicart@tin.it>, netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2214B.E3860470
Content-Type: text/plain;
	charset="iso-8859-1"

Firstly we don't have a magic wond so sending us a copy of your rules would
help...
Secondly are you logging anything at all? Is there any logs of DROPped
packets?
 
Also is the kernel dual boot with multiple kenel versions? Why are you
reverting back to the old kernel. Your iptables is probably
compiled/configured for the new kernel.
I have a problem where I've reverted back to an old kernel because my boot
for the new one got corrupted and now I have untracked packet drops which I
know it's because I've gone back to an old kernel...
 
We need more information.

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au <http://www.citadelcomputer.com.au/> 

-----Original Message-----
From: Luigi Cartuccia [mailto:luigicart@tin.it]
Sent: Tuesday, 02 July 2002 3:10 AM
To: netfilter@lists.samba.org
Subject: ping with netfilter


Hi to all I'm Luigi.I have recompiled linux-2.4.3 and I set some netfilter
options.I have installed software for multi-hop for wireless that use
netfilter.
With 2.4.3 and the software the ping is not ok,
istead with my old kernel 2.4.7 and the software the ping is ok.
This is a netfilter problem.
Can you help me??
What I set in the make xconfig for netfilter ???
Thank you 
Luigi
 
 

------_=_NextPart_001_01C2214B.E3860470
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2716.2200" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff 
size=2>Firstly we don't have a magic wond so sending us a copy of your rules 
would help...</FONT></SPAN></DIV>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff 
size=2>Secondly are you logging anything at all? Is there any logs of DROPped 
packets?</FONT></SPAN></DIV>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff 
size=2>Also&nbsp;is the kernel dual boot with multiple kenel versions? Why are 
you reverting back to the old kernel. Your iptables is probably 
compiled/configured for the new kernel.</FONT></SPAN></DIV>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff size=2>I have 
a problem where I've reverted back to an old kernel because my boot for the new 
one got corrupted and now I have untracked packet drops which I know it's 
because I've gone back to an old kernel...</FONT></SPAN></DIV>
<DIV><FONT face=Arial color=#0000ff size=2></FONT>&nbsp;</DIV>
<DIV><SPAN class=368070622-01072002><FONT face=Arial color=#0000ff size=2>We 
need more information.</FONT></SPAN></DIV>
<P><FONT size=2>thanks,<BR>George Vieira<BR>Systems Manager<BR>Citadel Computer 
Systems P/L<BR><A href="http://www.citadelcomputer.com.au/" 
target=_blank>http://www.citadelcomputer.com.au</A></FONT></P>
<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
size=2>-----Original Message-----<BR><B>From:</B> Luigi Cartuccia 
[mailto:luigicart@tin.it]<BR><B>Sent:</B> Tuesday, 02 July 2002 3:10 
AM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> ping with 
netfilter<BR><BR></FONT></DIV>
<DIV><FONT face=Arial size=2>Hi to all I'm Luigi.I have recompiled linux-2.4.3 
and I set some netfilter options.I have installed software for multi-hop for 
wireless that use netfilter.</FONT></DIV>
<DIV><FONT face=Arial size=2>With 2.4.3 and the software the ping is not 
ok,</FONT></DIV>
<DIV><FONT face=Arial size=2>istead with my old kernel 2.4.7 and the software 
the ping is ok.</FONT></DIV>
<DIV><FONT face=Arial size=2>This is a netfilter problem.</FONT></DIV>
<DIV><FONT face=Arial size=2>Can you help me??</FONT></DIV>
<DIV><FONT face=Arial size=2>What I set in the make xconfig for netfilter 
???</FONT></DIV>
<DIV><FONT face=Arial size=2>Thank you </FONT></DIV>
<DIV><FONT face=Arial size=2>Luigi</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C2214B.E3860470--

