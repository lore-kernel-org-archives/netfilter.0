From: ads nat <adsnat@yahoo.com>
Subject: Re: Blocking file type by iptables?
Date: Sun, 24 Aug 2003 22:55:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825055506.47437.qmail@web20709.mail.yahoo.com>
References: <007e01c36acb$59e39be0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1410511950-1061790906=:46743"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007e01c36acb$59e39be0$c2bf09ca@Housecall>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: hare ram <hareram@sol.net.in>, netfilter@lists.netfilter.org

--0-1410511950-1061790906=:46743
Content-Type: text/plain; charset=us-ascii

Please tell me what is POM. I tried blocking url_regen from squid. It has blocked kazza sites but still users are able to down load through search. I have just started learning Iptables, totally new. But by going through mail archieve i think STRING blocking is similer to URL_regen blocking in squid. 
Thanks 

hare ram <hareram@sol.net.in> wrote:
Hi
 
If you want to block Kazaa
use STRING from POM, it will work great 
 
hare
----- Original Message ----- 
From: ads nat 
To: George Vieira ; netfilter@lists.netfilter.org 
Sent: Monday, August 25, 2003 8:28 AM
Subject: RE: Blocking file type by iptables?


Even if you block all ports except 80. Kazza manages to access through port 80. So I don't think this will work.
Thanks

George Vieira <georgev@citadelcomputer.com.au> wrote:
No because this is a bad idea. not only does the CPU have a bad day goign through every packet sniffing for file extensions but also that other innocent data can get blocked when it shouldn't be..
 
1. The only thing you can do is block all outgoing/incoming ports and allow only some (25,80)
2. Use transparent squid proxy to limit access and get it to use regex expressions on URLs you may also want to block.
3. Block any and all MSN/Kazaa/ICQ servers addresses
 
You could also setup a fake primary DNS domain like aol.com and icq.com and point to yourself... this is what I've done for ICQ to stop those damn ADs.. if the clients can't resolve the DNS for those domains then they also can't connect. But then they get smart and put a hosts file in their machine.. ;)
 
 
 
 

Thanks,

 
____________________________________________
George Vieira
Citadel Computer Systems Pty LtdSystems Managergeorgev AT citadelcomputer DOT com DOT auCitadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644HelpDesk: +61 2 9955 2698http://www.citadelcomputer.com.au
 
 
-----Original Message-----
From: ads nat [mailto:adsnat@yahoo.com]
Sent: Monday, August 25, 2003 2:22 AM
To: netfilter@lists.netfilter.org
Subject: Blocking file type by iptables?


Hi,
I have gone through mail archives to check whether can be blocked. I also checked squid mailing list. But thre is no definite solution to block kazza file downloads. I would like t know whether using iptables can i block particular type of file. If I block .mpeg, .mp3 files through IPtables then it does not matter from which site file is coming. It will get blocked.
Any suggestion and solutions.
Thanks


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software 

---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software

---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1410511950-1061790906=:46743
Content-Type: text/html; charset=us-ascii

<DIV>Please tell me what is POM. I tried blocking url_regen from squid. It has blocked kazza sites but still users are able to down load through search. I have just started learning Iptables, totally new. But by going through mail archieve i think STRING blocking is similer to URL_regen blocking in squid. </DIV>
<DIV>Thanks&nbsp;<BR><BR><B><I>hare ram &lt;hareram@sol.net.in&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<STYLE></STYLE>

<DIV><FONT face=Arial size=2>Hi</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>If you want to block Kazaa</FONT></DIV>
<DIV><FONT face=Arial size=2>use STRING from POM, it will work great </FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>hare</FONT></DIV>
<BLOCKQUOTE style="BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: 0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
<DIV style="FONT: 10pt arial">----- Original Message ----- </DIV>
<DIV style="BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: black"><B>From:</B> <A href="mailto:adsnat@yahoo.com" title=adsnat@yahoo.com>ads nat</A> </DIV>
<DIV style="FONT: 10pt arial"><B>To:</B> <A href="mailto:georgev@citadelcomputer.com.au" title=georgev@citadelcomputer.com.au>George Vieira</A> ; <A href="mailto:netfilter@lists.netfilter.org" title=netfilter@lists.netfilter.org>netfilter@lists.netfilter.org</A> </DIV>
<DIV style="FONT: 10pt arial"><B>Sent:</B> Monday, August 25, 2003 8:28 AM</DIV>
<DIV style="FONT: 10pt arial"><B>Subject:</B> RE: Blocking file type by iptables?</DIV>
<DIV><BR></DIV>
<DIV>Even if you block all ports except 80. Kazza manages to access through port 80. So I don't think this will work.</DIV>
<DIV>Thanks<BR><BR><B><I>George Vieira &lt;<A href="mailto:georgev@citadelcomputer.com.au">georgev@citadelcomputer.com.au</A>&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2>No because this is a bad idea. not only does the CPU have a bad day goign through every packet sniffing for file extensions but also that other innocent data can get blocked when it shouldn't be..</FONT></SPAN></DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2>1. The only thing you can do is block all outgoing/incoming ports and allow only some (25,80)</FONT></SPAN></DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2>2. Use transparent squid proxy to limit access and get it to use regex expressions on URLs you may also want to block.</FONT></SPAN></DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2>3. Block any and all MSN/Kazaa/ICQ servers addresses</FONT></SPAN></DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2>You could also setup a fake primary DNS domain like aol.com and icq.com and point to yourself... this is what I've done for ICQ to stop those damn ADs.. if the clients can't resolve the DNS for those domains then they also can't connect. But then they get smart and put a hosts file in their machine.. ;)</FONT></SPAN></DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=528422422-24082003></SPAN><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=528422422-24082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
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
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma size=2>-----Original Message-----<BR><B>From:</B> ads nat [mailto:adsnat@yahoo.com]<BR><B>Sent:</B> Monday, August 25, 2003 2:22 AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> Blocking file type by iptables?<BR><BR></FONT></DIV>
<DIV>Hi,</DIV>
<DIV>I have gone through mail archives to check whether can be blocked. I also checked squid mailing list. But thre is no definite solution to block kazza file downloads. I would like t know whether using iptables can i block particular type of file. If I block .mpeg, .mp3 files through IPtables then it does not matter from which site file is coming. It will get blocked.</DIV>
<DIV>Any suggestion and solutions.</DIV>
<DIV>Thanks</DIV>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</A> - Free, easy-to-use web site design software </BLOCKQUOTE>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</A> - Free, easy-to-use web site design software</BLOCKQUOTE></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1410511950-1061790906=:46743--

