From: ads nat <adsnat@yahoo.com>
Subject: RE: SMTP HTTP port allow
Date: Sat, 30 Aug 2003 00:23:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030830072307.32059.qmail@web20713.mail.yahoo.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1E1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-456173305-1062228187=:30915"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C1E1@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

--0-456173305-1062228187=:30915
Content-Type: multipart/alternative; boundary="0-690386673-1062228187=:30915"

--0-690386673-1062228187=:30915
Content-Type: text/plain; charset=us-ascii

Sorry for delay in reply. I was away.
I tried as you said but didi not worked.
 
I will brief about my settings and problems. Also attaching my rc.local file.
 
I am getting bandwidth form ISP. It comes to my Linux 8.0 server which acts as router(through tennelling). Squid is installed on Linux server which distributes bandwidth to LAN users.
 
I am attching rc.local file which gives settings. IPTABLES file is totally commented.
 
Problem -1.
When I try to send email to squid mailing list from LAN user I get following :
 
Hi. This is the qmail-send program at squid-cache.org.
I'm afraid I wasn't able to deliver your message to the following error :
****
This is a permanent error; I've given up. Sorry it didn't work out.
<squid-users@squid-cache.org>:
ezmlm-reject: fatal: Sorry, I don't accept messages of MIME 
Content-Type 'multipart/alternative' (#5.2.3)
--- Below this line is a copy of the message.
Return-Path: <adssquid@yahoo.com>
Received: (qmail 65674 invoked from network); 27 Aug 2003 11:00:53 
-0000
Received: from web20502.mail.yahoo.com (216.136.226.137)
  by squid-cache.org with SMTP; 27 Aug 2003 11:00:53 -0000
Message-ID: <20030827110050.81255.qmail@web20502.mail.yahoo.com>
Received: from [203.94.221.44] by web20502.mail.yahoo.com via HTTP; 
Wed, 27 Aug 2003 04:00:50 PDT
Date: Wed, 27 Aug 2003 04:00:50 -0700 (PDT)
From: ads squid <adssquid@yahoo.com>
Subject: RE: [squid-users] delay pool problem
To: Adam Aube <aaube@firstindependent.net>, squid-users@squid-cache.org
In-Reply-To: <000001c36c08$42969990$647fa8c0@firstindependent.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
boundary="0-181363567-1061982050=:80891"
--0-181363567-1061982050=:80891
Content-Type: text/plain; charset=us-ascii

*****
PROBLEM -1 
 
Also LAN user can not send send email from outlook express.
 
When I send it from users machine with Dialup connection (Not my LAN supply) then mail goes in both cases.
 
PROBLEM -2
When I try to upload files to UNIX ftp server/ web server of web service provider who hosts my web site (Different from bandwidth provider) it gives following error :
 

Login successful

COMMAND:> TYPE I

200 Type set to I.

COMMAND:> pwd

257 "/" is current directory.

COMMAND:> TYPE A

200 Type set to A.

STATUS:> Retrieving directory listing...

COMMAND:> PORT 192,168,0,42,4,62

500 Illegal PORT command.

STATUS:> Error opening data socket :

 
I am using Cute ftp for uploading.
 
When I upload through dialup connection it goes without problem
 
I spoke with bandwidth supplier and webserver provider. They there must be problems with my settings.
 
Thanks for help
 
 
 
 
George Vieira <georgev@citadelcomputer.com.au> wrote:
Well... have you tried it??
 

Thanks,

 
____________________________________________
George Vieira
Citadel Computer Systems Pty LtdSystems Managergeorgev AT citadelcomputer DOT com DOT auCitadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644HelpDesk: +61 2 9955 2698http://www.citadelcomputer.com.au
 
 
-----Original Message-----
From: ads nat [mailto:adsnat@yahoo.com]
Sent: Wednesday, August 27, 2003 9:50 PM
To: George Vieira; netfilter@lists.netfilter.org
Subject: RE: SMTP HTTP port allow


My code has become as follows :
 
******
iptables -A POSTROUTING -t nat -p tcp --dport 25 -j MASQUERADE

iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d 207.106.22.35 --dport 21 -j MASQUERADE
iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE

iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
*****

Is this O.K.
Thanks



---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-690386673-1062228187=:30915
Content-Type: text/html; charset=us-ascii

<DIV>
<DIV>Sorry for delay in reply. I was away.</DIV>
<DIV>I tried as you said but didi not worked.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I will brief about my settings and problems. Also attaching my rc.local file.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am getting bandwidth form ISP. It comes to my Linux 8.0 server which acts as router(through tennelling). Squid is installed on Linux server which distributes bandwidth to LAN users.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am attching rc.local file which gives settings. IPTABLES file is totally commented.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Problem -1.</DIV>
<DIV>When I try to send email to squid mailing list from LAN user I get following :</DIV>
<DIV>&nbsp;</DIV>
<DIV>Hi. This is the qmail-send program at squid-cache.org.<BR>I'm afraid I wasn't able to deliver your message to the following error :</DIV>
<DIV>****<BR>This is a permanent error; I've given up. Sorry it didn't work out.</DIV>
<DIV>&lt;<A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A>&gt;:<BR>ezmlm-reject: fatal: Sorry, I don't accept messages of MIME <BR>Content-Type 'multipart/alternative' (#5.2.3)</DIV>
<DIV>--- Below this line is a copy of the message.</DIV>
<DIV>Return-Path: &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Received: (qmail 65674 invoked from network); 27 Aug 2003 11:00:53 <BR>-0000<BR>Received: from web20502.mail.yahoo.com (216.136.226.137)<BR>&nbsp; by squid-cache.org with SMTP; 27 Aug 2003 11:00:53 -0000<BR>Message-ID: &lt;<A href="mailto:20030827110050.81255.qmail@web20502.mail.yahoo.com">20030827110050.81255.qmail@web20502.mail.yahoo.com</A>&gt;<BR>Received: from [203.94.221.44] by web20502.mail.yahoo.com via HTTP; <BR>Wed, 27 Aug 2003 04:00:50 PDT<BR>Date: Wed, 27 Aug 2003 04:00:50 -0700 (PDT)<BR>From: ads squid &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Subject: RE: [squid-users] delay pool problem<BR>To: Adam Aube &lt;<A href="mailto:aaube@firstindependent.net">aaube@firstindependent.net</A>&gt;, <A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A><BR>In-Reply-To: &lt;<A
 href="mailto:000001c36c08$42969990$647fa8c0@firstindependent.net">000001c36c08$42969990$647fa8c0@firstindependent.net</A>&gt;<BR>MIME-Version: 1.0<BR>Content-Type: multipart/alternative; <BR>boundary="0-181363567-1061982050=:80891"</DIV>
<DIV>--0-181363567-1061982050=:80891<BR>Content-Type: text/plain; charset=us-ascii</DIV>
<DIV><BR>*****</DIV>
<DIV>PROBLEM -1 </DIV>
<DIV>&nbsp;</DIV>
<DIV>Also&nbsp;LAN user can not send&nbsp;send email from outlook express.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I send it from users machine with Dialup connection (Not my LAN supply) then mail goes&nbsp;in both cases.</DIV>
<DIV>&nbsp;</DIV>
<DIV>PROBLEM -2</DIV>
<DIV>When I try to upload files to UNIX ftp server/ web server of web service provider who hosts my web site (Different from bandwidth provider) it gives following error :</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=#0000ff face="MS Sans Serif" size=2>
<P>Login successful</P>
<P></FONT><FONT color=#008000 face="MS Sans Serif" size=2>COMMAND:&gt; TYPE I</P></FONT><FONT color=#000000 face="MS Sans Serif" size=2>
<P>200 Type set to I.</P></FONT><FONT color=#008000 face="MS Sans Serif" size=2>
<P>COMMAND:&gt; pwd</P></FONT><FONT color=#000000 face="MS Sans Serif" size=2>
<P>257 "/" is current directory.</P></FONT><FONT color=#008000 face="MS Sans Serif" size=2>
<P>COMMAND:&gt; TYPE A</P></FONT><FONT color=#000000 face="MS Sans Serif" size=2>
<P>200 Type set to A.</P></FONT><FONT color=#0000ff face="MS Sans Serif" size=2>
<P>STATUS:&gt; Retrieving directory listing...</P></FONT><FONT color=#008000 face="MS Sans Serif" size=2>
<P>COMMAND:&gt; PORT 192,168,0,42,4,62</P></FONT><FONT color=#000000 face="MS Sans Serif" size=2>
<P>500 Illegal PORT command.</P></FONT><FONT color=#0000ff face="MS Sans Serif" size=2>
<P>STATUS:&gt; Error opening data socket :</P></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>I am using Cute ftp for uploading.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I upload through dialup connection it goes without problem</DIV>
<DIV>&nbsp;</DIV>
<DIV>I spoke with bandwidth supplier and webserver provider. They there must be problems with&nbsp;my settings.</DIV>
<DIV>&nbsp;</DIV>
<DIV><B><I>Thanks for help</I></B></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><B><I></I></B>&nbsp;</DIV>
<DIV><B><I>George Vieira &lt;georgev@citadelcomputer.com.au&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<DIV><SPAN class=886392501-29082003><FONT color=#0000ff face=Arial size=2>Well... have you tried it??</FONT></SPAN></DIV>
<DIV><FONT color=#0000ff face=Arial size=2></FONT>&nbsp;</DIV>
<DIV>
<P><FONT face=Arial size=2><SPAN class=674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=Arial size=2><SPAN class=674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV style="HEIGHT: 232px; WIDTH: 305px">
<MARQUEE behavior=slide direction=down id=Marquee1 loop=1 scrollAmount=1 scrollDelay=20 style="HEIGHT: 57px; WIDTH: 220px" trueSpeed border="2"><FONT size=1>____________________________________________</FONT></MARQUEE><BR><B><FONT color=#000066 size=2></FONT><FONT color=#000066 face=Verdana size=2>George Vieira<BR></FONT></B>
<MARQUEE behavior=slide height=19 id=Marquee2 loop=1 scrollAmount=1 scrollDelay=3 style="HEIGHT: 17px; WIDTH: 240px" trueSpeed width=281 border="0"><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1><B>Citadel Computer Systems Pty Ltd</B></FONT></MARQUEE>
<MARQUEE behavior=slide id=Marquee2 loop=1 scrollAmount=1 scrollDelay=3 style="HEIGHT: 17px; WIDTH: 240px" trueSpeed border="0"><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1><B>Systems Manager</B></FONT></MARQUEE><FONT face=Verdana>
<MARQUEE behavior=slide direction=right height=16 id=Marquee3 loop=1 scrollAmount=2 scrollDelay=5 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 255px" trueSpeed width=300 border="0"><FONT color=#000099 face="Verdana, Verdana, Helvetica, sans-serif" size=1>georgev AT citadelcomputer DOT com DOT au</FONT></MARQUEE>
<MARQUEE behavior=slide id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"></MARQUEE></FONT>
<DIV><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1>Citadel Computer Systems Pty Ltd</FONT><FONT face=Verdana></DIV>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><FONT color=black size=1>Phone : +61 2 9955 2644</FONT></MARQUEE></FONT><FONT face=Verdana>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><FONT color=black size=1>HelpDesk: +61 2 9955 2698</FONT></MARQUEE></FONT>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=4 scrollDelay=5 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><A href="http://www.citadelcomputer.com.au/"><FONT color=#000099 face="Verdana, Verdana, Helvetica, sans-serif" size=1><A href="http://www.citadelcomputer.com.au/">http://www.citadelcomputer.com.au</FONT></A></MARQUEE></DIV>
<DIV><FONT color=#0000ff face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT color=#0000ff face=Arial size=2></FONT>&nbsp;</DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma size=2>-----Original Message-----<BR><B>From:</B> ads nat [mailto:adsnat@yahoo.com]<BR><B>Sent:</B> Wednesday, August 27, 2003 9:50 PM<BR><B>To:</B> George Vieira; netfilter@lists.netfilter.org<BR><B>Subject:</B> RE: SMTP HTTP port allow<BR><BR></FONT></DIV>
<DIV>My code has become as follows :</DIV>
<DIV><FONT color=#0000ff face=Arial size=2></FONT>&nbsp;</DIV>
<DIV>******</DIV>
<DIV>iptables -A POSTROUTING -t nat&nbsp;-p tcp --dport 25 -j MASQUERADE<BR><BR>iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE</DIV>
<DIV><FONT color=#0000ff face=Arial size=2></FONT><BR>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128<BR>*****<BR></DIV>
<DIV>Is this O.K.</DIV>
<DIV>Thanks</DIV></BLOCKQUOTE></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-690386673-1062228187=:30915--

--0-456173305-1062228187=:30915
Content-Type: application/octet-stream; name="rc.local"
Content-Transfer-Encoding: base64
Content-Description: rc.local
Content-Disposition: attachment; filename="rc.local"

IyEvYnMgc2NyaXB0IHdpbGwgYmUgZXhlY3V0ZWQgKmFmdGVyKiBhbGwgdGhl
IG90aGVyIGluaXQgc2NyaXB0cy4NCiMgWW91IGNhbiBwdXQgeW91ciBvd24g
aW5pdGlhbGl6YXRpb24gc3R1ZmYgaW4gaGVyZSBpZiB5b3UgZG9uJ3QNCiMg
d2FudCB0byBkbyB0aGUgZnVsbCBTeXMgViBzdHlsZSBpbml0IHN0dWZmLg0K
DQojIS9icyBzY3JpcHQgd2lsbCBiZSBleGVjdXRlZCAqYWZ0ZXIqIGFsbCB0
aGUgb3RoZXIgaW5pdCBzY3JpcHRzLg0KIyBZb3UgY2FuIHB1dCB5b3VyIG93
biBpbml0aWFsaXphdGlvbiBzdHVmZiBpbiBoZXJlIGlmIHlvdSBkb24ndA0K
IyB3YW50IHRvIGRvIHRoZSBmdWxsIFN5cyBWIHN0eWxlIGluaXQgc3R1ZmYu
DQoNCnRvdWNoIC92YXIvbG9jay9zdWJzeXMvbG9jYWwNCnJvdXRlIGRlbCBk
ZWZhdWx0IGd3IDIwMi4xODMuNjkuMTI5IGRldiBldGgwDQppcHR1bm5lbCBh
ZGQgdHVubmVsMCBtb2RlIGlwaXAgbG9jYWwgMjAyLjE4My42OS4xMzAgcmVt
b3RlIDIwMi4xODMuNzMuMjA2IHR0bCAyNTUNCmlwIGxpbmsgc2V0IHR1bm5l
bDAgdXANCmlwIGFkZHIgYWRkIDIwMi42My4xNjIuNjIvMzAgZGV2IHR1bm5l
bDANCnJvdXRlIGFkZCBkZWZhdWx0IGd3IDIwMi42My4xNjIuNjEgZGV2IHR1
bm5lbDANCnJvdXRlIGFkZCAtbmV0IDIwMi4xODMuNzMuMjA0IG5ldG1hc2sg
MjU1LjI1NS4yNTUuMjUyIGd3IDIwMi4xODMuNjkuMTI5DQplY2hvIDEgPiAv
cHJvYy9zeXMvbmV0L2lwdjQvaXBfZm9yd2FyZA0KDQppcHRhYmxlcyAtLWZs
dXNoDQppcHRhYmxlcyAtLXRhYmxlIG5hdCAtLWZsdXNoDQppcHRhYmxlcyAt
LWRlbGV0ZS1jaGFpbg0KaXB0YWJsZXMgLS10YWJsZSBuYXQgLS1kZWxldGUt
Y2hhaW4NCmlwdGFibGVzIC0tdGFibGUgbmF0IC0tYXBwZW5kIFBPU1RST1VU
SU5HIC0tb3V0LWludGVyZmFjZSB0dW5uZWwwIC1qIE1BU1FVRVJBREUNCmlw
dGFibGVzIC0tYXBwZW5kIEZPUldBUkQgLS1pbi1pbnRlcmZhY2UgZXRoMSAt
aiBBQ0NFUFQNCg0KI2lwdGFibGVzIC10IG5hdCAtQSBQT1NUUk9VVElORyAt
cCB0Y3AgLS1kcG9ydCAyNSAtaiBNQVNRVUVSQURFDQojaXB0YWJsZXMgLXQg
bmF0IC1BIFBPU1RST1VUSU5HIC1wIHRjcCAtbyBldGgxICAtaiBTTkFUIC0t
dG8gMjA3LjEwNi4yMi4zNTo4MA0KI2lwdGFibGVzIC10IG5hdCAtQSBQT1NU
Uk9VVElORyAtcCB0Y3AgLXMgMTkyLjE2OC4wLjIzIC1kIDIwNy4xMDYuMjIu
MzUgLS1kcG9ydCAyMSAtaiBNQVNRVUVSQURFDQojaXB0YWJsZXMgLXQgbmF0
IC1BIFBPU1RST1VUSU5HIC1wIHRjcCAtcyAxOTIuMTY4LjAuMjMgLWQgMjA3
LjEwNi4yMi4zNSAtLWRwb3J0IDgwIC1qIE1BU1FVRVJBREUNCiNpcHRhYmxl
cyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLXAgdGNwIC1zIDE5Mi4xNjguMC4y
MyAtZCAyMDcuMTA2LjIyLjM1IC0tZHBvcnQgMjEgLWogTUFTUVVFUkFERQ0K
I2lwdGFibGVzIC10IG5hdCAtQSBQT1NUUk9VVElORyAtcCB0Y3AgLXMgMTky
LjE2OC4wLjIzIC1kIDIwNy4xMDYuMjIuMzUgLS1kcG9ydCA4MCAtaiBNQVNR
VUVSQURFDQppcHRhYmxlcyAtdCBuYXQgLUEgUFJFUk9VVElORyAtcCBUQ1Ag
LS1kcG9ydCA4MCAtaiBSRURJUkVDVCAtLXRvLXBvcnQgMzEyOA0KDQojaXB0
YWJsZXMgLUEgRk9SV0FSRCAtcyAwLzAgLWQgMC8wIC1wIHRjcCAtLWRwb3J0
IDQ2NjIgLWogRFJPUA0KI2lwdGFibGVzIC1BIEZPUldBUkQgLXMgMC8wIC1k
IDAvMCAtcCB0Y3AgLS1kcG9ydCAxMjE0IC1qIERST1ANCiNpcHRhYmxlcyAt
QSBGT1JXQVJEIC1zIDAvMCAtZCAwLzAgLXAgdGNwIC0tZHBvcnQgNDY3MiAt
aiBEUk9QDQoNCiMNCmhlIG90aGVyIGluaXQgc2NyaXB0cy4NCg0KI2lwdGFi
bGVzIC10IG5hdCAtQSBQT1NUUk9VVElORyAtcCB0Y3AgLS1kcG9ydCAyNSAt
aiBNQVNRVUVSQURFDQojaXB0YWJsZXMgLXQgbmF0IC1BIFBPU1RST1VUSU5H
IC1wIHRjcCAtbyBldGgxICAtaiBTTkFUIC0tdG8gMjA3LjEwNi4yMi4zNTo4
MA0KI2lwdGFibGVzIC10IG5hdCAtQSBQT1NUUk9VVElORyAtcCB0Y3AgLXMg
MTkyLjE2OC4wLjIzIC1kIDIwNy4xMDYuMjIuMzUgLS1kcG9ydCAyMSAtaiBN
QVNRVUVSQURFDQojaXB0YWJsZXMgLXQgbmF0IC1BIFBPU1RST1VUSU5HIC1w
IHRjcCAtcyAxOTIuMTY4LjAuMjMgLWQgMjA3LjEwNi4yMi4zNSAtLWRwb3J0
IDgwIC1qIE1BU1FVRVJBREUNCiNpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJP
VVRJTkcgLXAgdGNwIC1zIDE5Mi4xNjguMC4yMyAtZCAyMDcuMTA2LjIyLjM1
IC0tZHBvcnQgMjEgLWogTUFTUVVFUkFERQ0KI2lwdGFibGVzIC10IG5hdCAt
QSBQT1NUUk9VVElORyAtcCB0Y3AgLXMgMTkyLjE2OC4wLjIzIC1kIDIwNy4x
MDYuMjIuMzUgLS1kcG9ydCA4MCAtaiBNQVNRVUVSQURFDQppcHRhYmxlcyAt
dCBuYXQgLUEgUFJFUk9VVElORyAtcCBUQ1AgLS1kcG9ydCA4MCAtaiBSRURJ
UkVDVCAtLXRvLXBvcnQgMzEyOA0K

--0-456173305-1062228187=:30915--

