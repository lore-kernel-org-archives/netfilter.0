From: ads nat <adsnat@yahoo.com>
Subject: RE: SMTP HTTP port allow
Date: Wed, 27 Aug 2003 04:49:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827114958.60579.qmail@web20704.mail.yahoo.com>
References: <FDEMKKNJDLAJDPNDPCDDMEHBNFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1125703825-1061984998=:56268"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDMEHBNFAA.georgev@citadelcomputer.com.au>
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

--0-1125703825-1061984998=:56268
Content-Type: text/plain; charset=us-ascii

My code has become as follows :
 
******
iptables -A POSTROUTING -t nat -p tcp --dport 25 -j MASQUERADE

iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d 207.106.22.35 --dport 21 -j MASQUERADE
iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE

iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
*****

Is this O.K.
Thanks

George Vieira <georgev@citadelcomputer.com.au> wrote:
You have not used MASQUERADE in your POSTROUTING rules or haven't showed it..
 
iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d 207.106.22.35 --dport 80 -j MASQUERADE
iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE
 
 
without the rules above, the 192.168.0.XX packets leave the network out into the internet and eventually get dropped by some ISP...
 
-----Original Message-----
From: netfilter-admin@lists.netfilter.org [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of ads nat
Sent: Wednesday, August 27, 2003 4:53 PM
To: netfilter@lists.netfilter.org
Subject: SMTP HTTP port allow


I am implimenting iptables for first time. 
I want to allow all my LAN users to send emails to SMTP (port no. 25) all destination with following code. :
 
***
iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
***
 
I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to upload contents to webserver on ip 207.106.22.35 (outside of LAN) with following code. 
 
***
iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d 207.106.22.35 --dport 80 -j ACCEPT
***
 
I would loke know whether It works or not.
Tell me whether my code is O.K. also where can i check logs.
Thanks




---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software 

---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1125703825-1061984998=:56268
Content-Type: text/html; charset=us-ascii

<DIV>My code has become as follows :</DIV>
<DIV>&nbsp;</DIV>
<DIV>******</DIV>
<DIV>iptables -A POSTROUTING -t nat&nbsp;-p tcp --dport 25 -j MASQUERADE<BR><BR>iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE</DIV>
<DIV><BR>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128<BR>*****<BR></DIV>
<DIV>Is this O.K.</DIV>
<DIV>Thanks</DIV>
<DIV><BR><B><I>George Vieira &lt;georgev@citadelcomputer.com.au&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META content="MSHTML 6.00.2800.1170" name=GENERATOR>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2>You have not used MASQUERADE in your POSTROUTING rules or haven't showed it..</FONT></SPAN></DIV>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV>iptables -A&nbsp;<SPAN class=736143810-27082003>POSTROUTING -t nat </SPAN>-p tcp -s 192.168.0.42<SPAN class=736143810-27082003> -d 207.106.22.35 --dport 80 -j MASQUERADE</SPAN></DIV>
<DIV><SPAN class=736143810-27082003></SPAN>iptables -A&nbsp;<SPAN class=736143810-27082003>POSTROUTING -t nat </SPAN>-p tcp -s 192.168.0.<SPAN class=736143810-27082003>23 </SPAN>-d 207.106.22.35 --dport 80 -j MASQUERADE</DIV>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2>without the rules above, the 192.168.0.XX packets leave the network out into the internet and eventually get dropped by some ISP...</FONT></SPAN></DIV>
<DIV><SPAN class=736143810-27082003><FONT color=#0000ff face=Arial size=2></FONT></SPAN>&nbsp;</DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma size=2>-----Original Message-----<BR><B>From:</B> netfilter-admin@lists.netfilter.org [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>ads nat<BR><B>Sent:</B> Wednesday, August 27, 2003 4:53 PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> SMTP HTTP port allow<BR><BR></FONT></DIV>
<DIV>I am implimenting iptables for first time. </DIV>
<DIV>I want to allow all my LAN users to send emails to SMTP (port no. 25)&nbsp;all destination with following code. :</DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp --dport 25 -j ACCEPT<BR>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to upload contents to webserver on ip 207.106.22.35 (outside of LAN)&nbsp;with following code. </DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d 207.106.22.35 --dport 80 -j ACCEPT</DIV>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I would loke know whether It works or not.</DIV>
<DIV>Tell me whether my code is O.K. also where can i check logs.</DIV>
<DIV>Thanks<BR></DIV></DIV>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</A> - Free, easy-to-use web site design software </BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1125703825-1061984998=:56268--

