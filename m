From: "Craig Packard" <cpackard@zoominternet.net>
Subject: UDP DNAT help
Date: Mon, 7 Apr 2003 22:31:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007f01c2fd77$39578dd0$0b19a8c0@rock1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0076_01C2FD55.7E657120"
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

------=_NextPart_000_0076_01C2FD55.7E657120
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

**********Original Post***********

From what I understand if I setup a DNAT rule, when a packet matching =
the rule comes in it is sent to the specified host, obviously this is =
done by changing the destination field to be the system 'behind' the =
firewall.  It was however my understanding--and what I've seen in =
practice--that the source field would not be changed.  So in other words =
the source of the packet would still be the host out on the internet =
that actually sent the original packet.  However I have made a set of =
DNAT rules that I couldn't get to work. So a setup a packet sniffer at =
several points.  Here is what I noticed and has me confused.


The inside computer (A) sends out a UDP packet to the internet connected =
computer (B), of course this packet goes through firewall (FW).

The packet goes out as expect srcA dstB
But the weird part is the response comes back in srcFW dst(A)   Where I =
would like it would be src(B) dst(A)!!!

I think this is screwing up the communications.  Can anyone help me =
understand what is happening?

-    Craig

**********New Info**************

I've been continueing to troubleshoot this thing and have found the =
following information that may help someone.

Here is what I see in the middle of a connection attempt from conntrack:
 udp      17 27 src=3D192.168.25.11 dst=3D66.250.84.85 sport=3D137 =
dport=3D137 [UNREPLIED]=20
  src=3D66.*.*.* dst=3D24.154.175.175 sport=3D137 dport=3D137 use=3D1

 udp      17 29 src=3D66.*.*.* dst=3D24.154.175.175 sport=3D5199 =
dport=3D5198 [UNREPLIED]
  src=3D192.168.25.11 dst=3D192.168.25.1 sport=3D5198 dport=3D5199 =
use=3D1

 udp      17 24 src=3D66.*.*.* dst=3D24.154.175.175 sport=3D5199 =
dport=3D5199 [UNREPLIED]=20
  src=3D192.168.25.11 dst=3D192.168.25.1 sport=3D5199 dport=3D5199 =
use=3D1

Note the first one appears to be a attempt to resolve the system name =
via NetBlewy.  The next two are the actual connections coming in.  Note =
they appear to *want* the outbound packets to be addressed to 25.1 (The =
IPtables box).  This would mean my understanding above is wrong.  Here =
is a trace from the iptables box:

16:21:28.884621 66.*.*.*.5199 > 24.154.175.175.5198:  udp 144
16:21:28.884735 192.168.25.1.5199 > 192.168.25.11.5198:  udp 144
16:21:28.963044 66.*.*.* .5199 > 24.154.175.175.5198:  udp 144
16:21:28.963167 192.168.25.1.5199 > 192.168.25.11.5198:  udp 144
16:21:29.041030 66.*.*.* .5199 > 24.154.175.175.5198:  udp 144
16:21:29.041178 192.168.25.1.5199 > 192.168.25.11.5198:  udp 144

As you can see, as the live connection comes in, it then goes out to the =
'inside' system.  Note also that the source does infact change to the =
iptables system from the outside system.

Here is a trace from the inside system:

21:04:14.737871 IP 192.168.25.1.5199 > 192.168.25.11.5198: udp 144
21:04:14.814408 IP 192.168.25.1.5199 > 192.168.25.11.5198: udp 144
21:04:14.893168 IP 192.168.25.1.5199 > 192.168.25.11.5198: udp 144
21:04:14.954960 IP 192.168.25.11.3903 > 66.*.*.* .5199: udp 96

Now the problem is, that since this is UDP I don't know if the last =
packet is an ack type packet or a retry on the initial setup (i.e. it =
doesn't 'know' that 192.168.25.1 is answer its 66.xx.xx.xx request?)

I'm totaly stuck.  Can anyone at least turn me in the direction of some =
more troubleshooting tools I can use.  Because it is UDP i'm having a =
lot of trouble, because I can't figure out what was recieved and what =
wasn't (no ack).

    - Craig




---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.467 / Virus Database: 266 - Release Date: 4/1/2003
------=_NextPart_000_0076_01C2FD55.7E657120
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>**********Original =
Post***********</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>From what I understand if I setup a =
DNAT rule, when=20
a packet matching the rule comes in it is sent to the specified host, =
obviously=20
this is done by changing the destination field to be the system 'behind' =
the=20
firewall.&nbsp; It was however my understanding--and what I've seen in=20
practice--that the source field would not be changed.&nbsp; So in other =
words=20
the source of the packet would still be the host out on the internet =
that=20
actually sent the original packet.&nbsp; However I have made a set of =
DNAT rules=20
that I couldn't get to work. So a setup a packet sniffer at several=20
points.&nbsp; Here is what I noticed and has me confused.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>The inside computer (A) sends out a UDP =
packet to=20
the internet connected computer (B), of course this packet goes through =
firewall=20
(FW).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The packet goes out as expect srcA=20
dstB</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But the weird part is&nbsp;the =
response&nbsp;comes=20
back in srcFW dst(A)&nbsp;&nbsp; Where I would like it would be src(B)=20
dst(A)!!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I think this is screwing up the=20
communications.&nbsp; Can anyone help me understand what is=20
happening?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-&nbsp;&nbsp;&nbsp; =
Craig</FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>**********New =
Info**************</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've been continueing to troubleshoot =
this thing=20
and have found the following information that may help =
someone.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is what I see in the middle of a =
connection=20
attempt from conntrack:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;udp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
17 27=20
src=3D192.168.25.11 dst=3D66.250.84.85 sport=3D137 dport=3D137 =
[UNREPLIED]=20
<BR>&nbsp;&nbsp;src=3D66.*.*.* dst=3D24.154.175.175 sport=3D137 =
dport=3D137=20
use=3D1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;udp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
17 29=20
src=3D66.*.*.* dst=3D24.154.175.175 sport=3D5199 dport=3D5198=20
[UNREPLIED]<BR>&nbsp;&nbsp;src=3D192.168.25.11 dst=3D192.168.25.1 =
sport=3D5198=20
dport=3D5199 use=3D1</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;udp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
17 24=20
src=3D66.*.*.* dst=3D24.154.175.175 sport=3D5199 dport=3D5199 =
[UNREPLIED]=20
<BR>&nbsp;&nbsp;src=3D192.168.25.11 dst=3D192.168.25.1 sport=3D5199 =
dport=3D5199=20
use=3D1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Note the first one appears to be a =
attempt to=20
resolve the system name via NetBlewy.&nbsp; The next two are the actual=20
connections coming in.&nbsp; Note they appear to *want* the outbound =
packets to=20
be addressed to 25.1 (The IPtables box).&nbsp; This would mean my =
understanding=20
above is wrong.&nbsp; Here is a trace from the iptables =
box:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>16:21:28.884621 66.*.*.*.5199 &gt;=20
24.154.175.175.5198:&nbsp; udp 144<BR>16:21:28.884735 192.168.25.1.5199 =
&gt;=20
192.168.25.11.5198:&nbsp; udp 144<BR>16:21:28.963044 66.*.*.* .5199 &gt; =

24.154.175.175.5198:&nbsp; udp 144<BR>16:21:28.963167 192.168.25.1.5199 =
&gt;=20
192.168.25.11.5198:&nbsp; udp 144<BR>16:21:29.041030 66.*.*.* .5199 &gt; =

24.154.175.175.5198:&nbsp; udp 144<BR>16:21:29.041178 192.168.25.1.5199 =
&gt;=20
192.168.25.11.5198:&nbsp; udp 144</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>As you can see, as the live connection =
comes in, it=20
then goes out to the 'inside' system.&nbsp; Note also that the source =
does=20
infact change to the iptables system from the outside =
system.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is a trace from the inside=20
system:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>21:04:14.737871 IP 192.168.25.1.5199 =
&gt;=20
192.168.25.11.5198: udp 144<BR>21:04:14.814408 IP 192.168.25.1.5199 &gt; =

192.168.25.11.5198: udp 144<BR>21:04:14.893168 IP 192.168.25.1.5199 &gt; =

192.168.25.11.5198: udp 144<BR>21:04:14.954960 IP 192.168.25.11.3903 =
&gt;=20
66.*.*.* .5199: udp 96</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now the problem is, that since this is =
UDP I don't=20
know if the last packet is an ack type packet or a retry on the initial =
setup=20
(i.e. it doesn't 'know' that 192.168.25.1 is answer its 66.xx.xx.xx=20
request?)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm totaly stuck.&nbsp; Can anyone at =
least turn me=20
in the direction of some more troubleshooting tools I can use.&nbsp; =
Because it=20
is UDP i'm having a lot of trouble, because I can't figure out what was =
recieved=20
and what wasn't (no ack).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; - Craig</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><BR>---<BR>Outgoing mail is certified =
Virus=20
Free.<BR>Checked by AVG anti-virus system (<A=20
href=3D"http://www.grisoft.com">http://www.grisoft.com</A>).<BR>Version: =
6.0.467 /=20
Virus Database: 266 - Release Date: =
4/1/2003</FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_0076_01C2FD55.7E657120--


