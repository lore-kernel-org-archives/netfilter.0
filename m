From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: forwarding (continued)
Date: Mon, 8 Jul 2002 12:20:09 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA26D@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C22625.FBB0D230"
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
To: 'Tim' <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C22625.FBB0D230
Content-Type: text/plain;
	charset="iso-8859-1"

sure your haven natted icmp too?? or just tcp??

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au <http://www.citadelcomputer.com.au/> 

-----Original Message-----
From: Tim [mailto:twr@bellsouth.net]
Sent: Monday, 08 July 2002 2:54 PM
To: iptables-list
Subject: Re: forwarding (continued)


Antony,
 
INTERNAL IP = 192.168.1.0/24  -- range 1 thru 11
DMZ IP = 172.16.1.0/24 -- range 1 thru 5
 
The reason I believe I know it is not forwarding....is that when I ping from
the DMZ I get a "request time out", although come to think of it, it is
actually giving me a response, its just not necessarily the response I want.
 
Well in any case I issue the command iptables -L -n -v and it reports that
packets did get to the forwarding rule it just looks like I got a "request
time out" response. So, (having some enlightenment), do I need to specify a
rule for icmp types here?
 
On the files attached I use ping from a box on the DMZ to ping an INTERNAL
box I ran the command "iptables -L -n -v -x and iptables -L -n -v -x -t nat"
and the results are in the files Lvnx and Lvnxtnat text files.
 
I then used ping from a box from an INTERNAL box to ping a DMZ box and ran
the same commands as mentioned and the results are in the Lvnx2 and
Lvnxtnat2 text file. The other files are obvious.
 
It really goes back to the sig, routing, routing and routing......I just
can't seem to put my finger on it. Thanks for the assist, I appreciate the
time and patience.
 
Tim Rodriguez
Network Security Student
--
To me, being a student means that misconceptions and errors
are a way of learning. Frustration means that I'm learning.
Perseverance is of the utmost if one wants to learn. Having
someone to turn to ask for clarification is invaluable.
 
Thank you.
--
 
 
 
 
 

------_=_NextPart_001_01C22625.FBB0D230
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2716.2200" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><SPAN class=729281902-08072002><FONT face=Arial color=#0000ff size=2>sure 
your&nbsp;haven natted icmp too?? or just tcp??</FONT></SPAN></DIV>
<P><FONT size=2>thanks,<BR>George Vieira<BR>Systems Manager<BR>Citadel Computer 
Systems P/L<BR><A href="http://www.citadelcomputer.com.au/" 
target=_blank>http://www.citadelcomputer.com.au</A></FONT></P>
<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
size=2>-----Original Message-----<BR><B>From:</B> Tim 
[mailto:twr@bellsouth.net]<BR><B>Sent:</B> Monday, 08 July 2002 2:54 
PM<BR><B>To:</B> iptables-list<BR><B>Subject:</B> Re: forwarding 
(continued)<BR><BR></FONT></DIV>
<DIV><FONT face=Arial size=2>Antony,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>INTERNAL IP = 192.168.1.0/24&nbsp; -- range 1 thru 
11</FONT></DIV>
<DIV><FONT face=Arial size=2>DMZ IP = 172.16.1.0/24 -- range 1 thru 
5</FONT></DIV>
<DIV><FONT face=Arial color=#0000ff size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>The reason I believe I know it is not 
forwarding....is that when I ping from the DMZ I get a "request time out", 
although come to think of it, it is actually giving me a response, its just not 
necessarily the response I want.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Well in any case I issue the command iptables -L -n 
-v and it reports that packets did get to the forwarding rule it just looks like 
I got a "request time out" response. So, (having some enlightenment), do I need 
to specify a rule for icmp types here?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>On the files attached I use ping from a box on the 
DMZ to ping an INTERNAL box I ran the command "iptables -L -n -v -x and iptables 
-L -n -v -x -t nat" and the results are in the files Lvnx and Lvnxtnat text 
files.</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>I then used ping from a box from&nbsp;an 
INTERNAL&nbsp;box to ping a&nbsp;DMZ box and ran the same commands as mentioned 
and the results are in the Lvnx2 and&nbsp;Lvnxtnat2 text file. The other files 
are obvious.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>It really goes back to the sig, routing, routing 
and routing......I just can't seem to put my finger on it. Thanks for the 
assist, I appreciate the time and patience.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Tim Rodriguez</FONT></DIV>
<DIV><FONT face=Arial size=2>Network Security Student</FONT></DIV>
<DIV><FONT face=Arial size=2>--</FONT></DIV>
<DIV><FONT face=Arial size=2>To me, being a student means that misconceptions 
and errors</FONT></DIV>
<DIV><FONT face=Arial size=2>are a way of learning. Frustration means that I'm 
learning.</FONT></DIV>
<DIV><FONT face=Arial size=2>Perseverance is of the utmost if one wants to 
learn. Having</FONT></DIV>
<DIV><FONT face=Arial size=2>someone to turn to ask for clarification is 
invaluable.</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Thank you.</FONT></DIV>
<DIV><FONT face=Arial size=2>--</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C22625.FBB0D230--

