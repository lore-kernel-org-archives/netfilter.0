From: Ashraf Zia <ashrafszia@yahoo.com>
Subject: RE: NAT + Web based authentication ?
Date: Sun, 17 Aug 2003 19:14:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030818021456.36500.qmail@web11505.mail.yahoo.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C105@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2111230222-1061172896=:36090"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C105@wardrive.citadelcomputer.com.au>
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

--0-2111230222-1061172896=:36090
Content-Type: text/plain; charset=us-ascii

Thanks George,
 
How would I know which 192.168.1.x ip has been authenticated so that I can create a respective rule for, as the web server would be receving the ip for eth0 which is the external interface for internet. 
 
Also, need help with the rules as well.
 
Thanks
Zia


George Vieira <georgev@citadelcomputer.com.au> wrote:
Do what I do and write a special php script which they authenticate and it places entries into the database.
 
Then have a "root" process which continously runs (like a service) and scans the database for flagged entries which represent new authenticated users and it resets the flag and create a rule for them.
 
Then the rest is up to you how you want to keep/remove the rules.. ie. have the websession refresh every 30 seconds and it deletes the rules if they close the browser etc..etc..
 
this is handy for wireless folks who don't really give a damn about mac/ip spoofing but don't want ANYONE to just hop on easily...
 

Thanks,

 
____________________________________________
George Vieira
Citadel Computer Systems Pty LtdSystems Managergeorgev AT citadelcomputer DOT com DOT auCitadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644HelpDesk: +61 2 9955 2698http://www.citadelcomputer.com.au
 
 
-----Original Message-----
From: Ashraf Zia [mailto:ashrafszia@yahoo.com]
Sent: Monday, August 18, 2003 10:13 AM
To: netfilter@lists.netfilter.org
Subject: NAT + Web based authentication ?




HI everybody,

I am new to iptables. Need to figure out a solution.

- Want to create an authentication based NAT. 

- Have the gateway machine running DHCP server on eth1 that gives up 192.168.1.x ip addresses.

- eth0 on the gateway has a real ip. 

- I have an web based authentication working at lets say www.abc.com on a remote web server.

- Now I have the Masquerading working at the gateway machine but I need to restrict the internet access to ip addresses who can authenticate themselves at www.abc.com. How do I interface authentication from web server with Iptables NAT and what rules do I use to get this done.

- Also I need that any port 80 request from address 192.168.1.x by defaults goes to www.abc.com 

I think it can be done using script, but I am not sure how to use iptables for this. 

Thanks in advance.

Zia

 


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software 

---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-2111230222-1061172896=:36090
Content-Type: text/html; charset=us-ascii

<DIV>Thanks George,</DIV>
<DIV>&nbsp;</DIV>
<DIV>How would I know which 192.168.1.x ip has been authenticated so that I can create a respective rule for, as the web server would be receving the ip for eth0 which is the external interface for internet. </DIV>
<DIV>&nbsp;</DIV>
<DIV>Also, need help with the rules as well.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks</DIV>
<DIV>Zia</DIV>
<DIV><BR><BR><B><I>George Vieira &lt;georgev@citadelcomputer.com.au&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px; WIDTH: 100%"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2>Do what I do and write a special php script which they authenticate and it places entries into the database.</FONT></SPAN></DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2>Then have a "root" process which continously runs (like a service) and scans the database for flagged entries which represent new authenticated users and it resets the flag and create a rule for them.</FONT></SPAN></DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2>Then the rest is up to you how you want to keep/remove the rules.. ie. have the websession refresh every 30 seconds and it deletes the rules if they close the browser etc..etc..</FONT></SPAN></DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=911122300-18082003><FONT color=#0000ff face=Arial size=2>this is handy for wireless folks who don't really give a damn about mac/ip spoofing but don't want ANYONE to just hop on easily...</FONT></SPAN></DIV>
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
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma size=2>-----Original Message-----<BR><B>From:</B> Ashraf Zia [mailto:ashrafszia@yahoo.com]<BR><B>Sent:</B> Monday, August 18, 2003 10:13 AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> NAT + Web based authentication ?<BR><BR></FONT></DIV>
<DIV></DIV>
<P>HI everybody,</P>
<P>I am new to iptables. Need to figure out a solution.</P>
<P>- Want to create an authentication based NAT. </P>
<P>- Have the gateway machine running DHCP server on eth1 that gives up 192.168.1.x ip addresses.</P>
<P>- eth0 on the gateway has a real ip.&nbsp;</P>
<P>- I have an web based authentication working at lets say <A href="http://www.abc.com/">www.abc.com</A> on a remote web server.</P>
<P>- Now I have the Masquerading working at the gateway machine but I need to restrict the internet access to ip addresses who can authenticate themselves at <A href="http://www.abc.com/">www.abc.com</A>. How do I interface authentication from web server with Iptables NAT and what rules do I use to get this done.</P>
<P>- Also I need that any port 80 request from address 192.168.1.x by defaults goes to <A href="http://www.abc.com/">www.abc.com</A> </P>
<P>I think it can be done using script, but I am not sure how to use iptables for this. </P>
<P>Thanks in advance.</P>
<P>Zia</P>
<P>&nbsp;</P>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</A> - Free, easy-to-use web site design software </BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-2111230222-1061172896=:36090--

