From: ads nat <adsnat@yahoo.com>
Subject: RE: SMTP HTTP port allow
Date: Fri, 29 Aug 2003 03:13:51 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030829101351.20907.qmail@web20713.mail.yahoo.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1E1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-84399041-1062152031=:19141"
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

--0-84399041-1062152031=:19141
Content-Type: text/plain; charset=us-ascii

I have tried it. But it is not working. Anyway. I am giving my settings and problems so that you can understand it better.
 
I am getting bandwidth through ISP coming to my server having Linux 8.0 and acting as Linux router and running squid as proxy and cache server.
 
SETTINGS
 
Following are settings in my "/etc/rc.d/rc.local" file
 
***
touch /var/lock/subsys/local
route del default gw 202.183.69.129 dev eth0
iptunnel add tunnel0 mode ipip local 202.183.69.130 remote 202.183.73.206 ttl 255
ip link set tunnel0 up
ip addr add 202.63.162.62/30 dev tunnel0
route add default gw 202.63.162.61 dev tunnel0
route add -net 202.183.73.204 netmask 255.255.255.252 gw 202.183.69.129
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT
 
iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
*******
 
I have commented file "/etc/sysconf/iptables" totally and it is stopped.

 
PROBLEMS - 1
 
When I try to send email to squid mailing list from LAN user. I get following error.
***
 
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
***
 
My LAN user can send email to this (nat) mailing list.
 
Also my users complain that they can not send email from outlook express to email id  xyz@vsnl.com.  using LAN machine, But can send from outside dialup connection. At the same time they can send emails from yahho.com, hotmail.com, etc.
 
PROBLEM - 2
 
When I try to upload files to my web servrice provider(outside) through my LAN machine It accept login, password. Says Login successful  but gives following error
 
***
retrieving directory listing...
COMMAND:> PORT 192,168,0,42,5,249
500 Illegal PORT command.
STATUS:> Error opening data socket
****
I am using Cuteftp for uploading.
 
When I try to upload same web service provider from dialup connection I can uploads files.
 
I think there is somwthing to be done at my IPtable setting and rc.local settings.
It is blocking access to outside.
 
I spoke to web server provider and ISP and they said they have not blocked anything from their side.
 
I think this will give clear idea about settings and problems so that you can guide in better manner.
 
If you need any more info. let me know.
Sorry for delay in reply.
Thanks

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
--0-84399041-1062152031=:19141
Content-Type: text/html; charset=us-ascii

<DIV>I have tried it. But it is not working. Anyway. I am giving my settings and problems so that you can understand it better.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am getting bandwidth through ISP coming to my server having Linux 8.0 and acting as Linux router and running squid as proxy and cache server.</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>SETTINGS</STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>Following are settings in my "/etc/rc.d/rc.local" file</DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>touch /var/lock/subsys/local<BR>route del default gw 202.183.69.129 dev eth0<BR>iptunnel add tunnel0 mode ipip local 202.183.69.130 remote 202.183.73.206 ttl 255<BR>ip link set tunnel0 up<BR>ip addr add 202.63.162.62/30 dev tunnel0<BR>route add default gw 202.63.162.61 dev tunnel0<BR>route add -net 202.183.73.204 netmask 255.255.255.252 gw 202.183.69.129<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward<BR></DIV>
<DIV>iptables --flush<BR>iptables --table nat --flush<BR>iptables --delete-chain<BR>iptables --table nat --delete-chain<BR>iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE<BR>iptables --append FORWARD --in-interface eth1 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</DIV>
<DIV>*******</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<DIV>I have commented file "/etc/sysconf/iptables" totally and it is stopped.</DIV></DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>PROBLEMS - 1</STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>When I try to send email to squid mailing list from LAN user. I get following error.</DIV>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>This is a permanent error; I've given up. Sorry it didn't work out.</DIV>
<DIV>&lt;<A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A>&gt;:<BR>ezmlm-reject: fatal: Sorry, I don't accept messages of MIME <BR>Content-Type 'multipart/alternative' (#5.2.3)</DIV>
<DIV>--- Below this line is a copy of the message.</DIV>
<DIV>Return-Path: &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Received: (qmail 65674 invoked from network); 27 Aug 2003 11:00:53 <BR>-0000<BR>Received: from web20502.mail.yahoo.com (216.136.226.137)<BR>&nbsp; by squid-cache.org with SMTP; 27 Aug 2003 11:00:53 -0000<BR>Message-ID: &lt;<A href="mailto:20030827110050.81255.qmail@web20502.mail.yahoo.com">20030827110050.81255.qmail@web20502.mail.yahoo.com</A>&gt;<BR>Received: from [203.94.221.44] by web20502.mail.yahoo.com via HTTP; <BR>Wed, 27 Aug 2003 04:00:50 PDT<BR>Date: Wed, 27 Aug 2003 04:00:50 -0700 (PDT)<BR>From: ads squid &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Subject: RE: [squid-users] delay pool problem<BR>To: Adam Aube &lt;<A href="mailto:aaube@firstindependent.net">aaube@firstindependent.net</A>&gt;, <A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A><BR>In-Reply-To: &lt;<A
 href="mailto:000001c36c08$42969990$647fa8c0@firstindependent.net">000001c36c08$42969990$647fa8c0@firstindependent.net</A>&gt;<BR>MIME-Version: 1.0<BR>Content-Type: multipart/alternative; <BR>boundary="0-181363567-1061982050=:80891"</DIV>
<DIV>--0-181363567-1061982050=:80891<BR>Content-Type: text/plain; charset=us-ascii</DIV>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>My LAN user&nbsp;can send email to this (nat) mailing list.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Also my users complain that they can not send email from outlook express to email id&nbsp;<A href="mailto: xyz@vsnl.com.  but through "> xyz@vsnl.com. </A>&nbsp;using LAN machine, But can send from outside dialup connection. At the same time they can send emails from yahho.com, hotmail.com, etc.</DIV>
<DIV><STRONG></STRONG>&nbsp;</DIV>
<DIV><STRONG>PROBLEM - 2</STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>When&nbsp;I try to upload files to my web servrice provider(outside) through my LAN machine It accept login, password. Says Login successful  but gives following error</DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV><FONT color=#0000ff face="MS Sans Serif" size=2>retrieving directory listing...</FONT></DIV>
<DIV><FONT color=#008000 face="MS Sans Serif" size=2>COMMAND:&gt; PORT 192,168,0,42,5,249</FONT></DIV>
<DIV><FONT color=#000000 face="MS Sans Serif" size=2>500 Illegal PORT command.</FONT></DIV>
<DIV><FONT color=#0000ff face="MS Sans Serif" size=2>STATUS:&gt; Error opening data socket</DIV></FONT>
<DIV>****</DIV>
<DIV>I am using Cuteftp for uploading.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I try to upload&nbsp;same web service provider from dialup connection I can uploads files.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I think there is somwthing to be done at my IPtable setting and rc.local settings.</DIV>
<DIV>It is blocking access to outside.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I spoke to web server provider and ISP and they said they have not blocked anything from their side.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I think this will give clear idea about settings and problems so that you can guide in better manner.</DIV>
<DIV>&nbsp;</DIV>
<DIV>If you need any more info. let me know.</DIV>
<DIV>Sorry for delay in reply.</DIV>
<DIV>Thanks<BR><BR><B><I>George Vieira &lt;georgev@citadelcomputer.com.au&gt;</I></B> wrote:</DIV>
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
<DIV>Thanks</DIV></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-84399041-1062152031=:19141--

