From: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>
Subject: Port forward
Date: Tue, 4 Feb 2003 11:31:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D007132BBC42D5118FD20002A52844414BCF2B@ASC01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CC38.8C4D3460"
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

------_=_NextPart_001_01C2CC38.8C4D3460
Content-Type: text/plain;
	charset="iso-8859-1"

Hi all,
 
Iam trying to set up a port forward for several hours now, but I don't seem
to get it working right.
When I type the following command:
iptables -A PREROUTING -p tcp --destination-port 25 -i eth0 -j DNAT
--to-destination 192.168.22.6:25
I get this output:
iptables: Invalid argument
I did do iptables -X PREROUTING so the chain does exist.
Can anyone please help me out..
What I want is that all incoming connections on eth0 on port 25 are routed
to another machine on the internal network 192.168.22.6
 
Thanks in advance,
Ronald Roeleveld 
System Administrator 

ASCINTERNATIONAL 
Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands 
Tel. +31 (0)70 3178400, Fax +31 (0)70 3204760
E-mail: r.roeleveld@ascinternational.nl
<mailto:r.roeleveld@ascinternational.nl> , Website:
http://www.ascinternational.nl <http://www.ascinternational.nl/>  

 

------_=_NextPart_001_01C2CC38.8C4D3460
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>Hi 
all,</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>Iam trying to set up 
a port forward for several hours now, but I don't seem to get it working 
right.</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>When I type the 
following command:</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>iptables -A 
PREROUTING -p tcp --destination-port 25 -i eth0 -j DNAT --to-destination 
192.168.22.6:25</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>I get this 
output:</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>iptables: Invalid 
argument</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>I did do iptables -X 
PREROUTING so the chain does exist.</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>Can anyone please 
help me out..</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>What I want is that 
all incoming connections on eth0 on port 25 are routed to another machine on the 
internal network 192.168.22.6</FONT></SPAN></DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=109152710-04022003><FONT face=Arial size=2>Thanks in 
advance,</FONT></SPAN></DIV><B><FONT face=Arial size=2>
<P>Ronald Roeleveld&nbsp;<BR><FONT size=1>System Administrator</FONT>&nbsp;</P>
<P><B><FONT face=Arial color=#000080 size=2>ASC</FONT><FONT face=Arial 
color=#808080 size=2>INTERNATIONAL</FONT></B> <BR><FONT face=Arial color=#808080 
size=1>Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands</FONT> <BR><FONT 
face=Arial color=#808080 size=1>Tel. +31 (0)70 3178400, Fax +31 (0)70 
3204760<BR></FONT><FONT face=Arial color=#808080 size=1>E-mail: <A 
href="mailto:r.roeleveld@ascinternational.nl">r.roeleveld@ascinternational.nl</A>, 
Website: </FONT><U><B><FONT face=Arial color=#0000ff size=1><A 
href="http://www.ascinternational.nl/" 
target=_blank>http://www.ascinternational.nl</A></FONT></B></U><B></B> 
</P></FONT></B>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C2CC38.8C4D3460--

