From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: IPTables counters
Date: Wed, 10 Jul 2002 07:55:15 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA288@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C22793.4EC033D0"
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
To: 'Dotan Lior' <Lior.Dotan@innowave-ws.com>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C22793.4EC033D0
Content-Type: text/plain;
	charset="iso-8859-1"

What I do is put the rule you want to count in the FORWARD chain... even
better use my counting method to be more accurate..
 
$IPTABLES -N COUNT
$IPTABLES -I INPUT 1 -j COUNT
$IPTABLES -I OUTPUT 1 -j COUNT
$IPTABLES -I FORWARD 1 -j COUNT
 
then add all you counters you require into the COUNT chain.. this is what
I'm currently doing for my scripts.. Also I'm rewriting my script to only
flush all chains BUT my counters so I don't lose them when I rerun my
firewall.. still in testing.......

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au <http://www.citadelcomputer.com.au/> 

-----Original Message-----
From: Dotan Lior [mailto:Lior.Dotan@innowave-ws.com]
Sent: Tuesday, 09 July 2002 11:41 PM
To: 'netfilter@lists.samba.org'
Subject: IPTables counters



Hello, 

I have a simple setup. A linux RH7.3 box doing NAT and connected to the
internet with one windows2000 client sitting behind it. I've set up iptables
to NAT the windows internal address to a legal IP address.

So far it works well, However when I inspect the NAT table with "iptables -L
-t nat -v -n -x", 
the bytes counter shows extremely low values. I've transfer a 200Kb file via
FTP on the windows 
client, but the counter was less than 100 bytes. It seems as if only the
first packet of a connection 
is listed. 
Is there a way to see the real bytes count? Also I would to know the number
of bytes that traveled 
on both ways (from the client and to the client), is that also possible
using iptables? 

Thanks. 


------_=_NextPart_001_01C22793.4EC033D0
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<TITLE>IPTables counters</TITLE>

<META content="MSHTML 6.00.2716.2200" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=188365221-09072002><FONT face=Arial color=#0000ff size=2>What I 
do is put the rule you want to count in the FORWARD chain... even better use my 
counting method to be more accurate..</FONT></SPAN></DIV>
<DIV><SPAN class=188365221-09072002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=188365221-09072002><FONT face=Arial color=#0000ff 
size=2>$IPTABLES -N COUNT</FONT></SPAN></DIV>
<DIV><SPAN class=188365221-09072002><FONT face=Arial color=#0000ff 
size=2>$IPTABLES -I INPUT 1 -j COUNT</FONT></SPAN></DIV>
<DIV><SPAN class=188365221-09072002><SPAN class=188365221-09072002><FONT 
face=Arial color=#0000ff size=2>$IPTABLES -I&nbsp;OUTPUT 1 -j 
COUNT</FONT></SPAN></SPAN></DIV>
<DIV><SPAN class=188365221-09072002><SPAN class=188365221-09072002><SPAN 
class=188365221-09072002><FONT face=Arial color=#0000ff size=2>$IPTABLES 
-I&nbsp;FORWARD 1 -j COUNT</FONT></SPAN></SPAN></SPAN></DIV>
<DIV><SPAN class=188365221-09072002><SPAN class=188365221-09072002><SPAN 
class=188365221-09072002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN></SPAN></SPAN>&nbsp;</DIV>
<DIV><SPAN class=188365221-09072002><SPAN class=188365221-09072002><SPAN 
class=188365221-09072002><FONT face=Arial color=#0000ff size=2>then add all you 
counters you require into the COUNT chain.. this is what I'm currently doing for 
my scripts.. Also I'm rewriting my script to only flush all chains BUT my 
counters so I don't lose them when I rerun my firewall.. still in 
testing.......</FONT></SPAN></SPAN></SPAN></DIV>
<P><FONT size=2>thanks,<BR>George Vieira<BR>Systems Manager<BR>Citadel Computer 
Systems P/L<BR><A href="http://www.citadelcomputer.com.au/" 
target=_blank>http://www.citadelcomputer.com.au</A></FONT></P>
<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
size=2>-----Original Message-----<BR><B>From:</B> Dotan Lior 
[mailto:Lior.Dotan@innowave-ws.com]<BR><B>Sent:</B> Tuesday, 09 July 2002 11:41 
PM<BR><B>To:</B> 'netfilter@lists.samba.org'<BR><B>Subject:</B> IPTables 
counters<BR><BR></FONT></DIV>
<P><FONT face=Tahoma size=2>Hello,</FONT> </P>
<P><FONT face=Tahoma size=2>I have a simple setup. A linux RH7.3 box doing NAT 
and connected to the internet with one windows2000 client sitting behind it. 
I've set up iptables to NAT the windows internal address to a legal IP 
address.</FONT></P>
<P><FONT face=Tahoma size=2>So far it works well, However when I inspect the NAT 
table with "iptables -L -t nat -v -n -x", </FONT><BR><FONT face=Tahoma 
size=2>the bytes counter shows extremely low values. I've transfer a 200Kb file 
via FTP on the windows</FONT> <BR><FONT face=Tahoma size=2>client, but the 
counter was less than 100 bytes. It seems as if only the first packet of a 
connection</FONT> <BR><FONT face=Tahoma size=2>is listed.</FONT> <BR><FONT 
face=Tahoma size=2>Is there a way to see the real bytes count? Also I would to 
know the number of bytes that traveled</FONT> <BR><FONT face=Tahoma size=2>on 
both ways (from the client and to the client), is that also possible using 
iptables?</FONT> </P>
<P><FONT face=Tahoma size=2>Thanks.</FONT> </P></BODY></HTML>

------_=_NextPart_001_01C22793.4EC033D0--

