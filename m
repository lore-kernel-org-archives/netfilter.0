From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: RE: How to Block Mac Address ?
Date: Sun, 15 Jun 2003 22:50:45 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616055045.89712.qmail@web40704.mail.yahoo.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6EAE@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1253065757-1055742645=:89710"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6EAE@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

--0-1253065757-1055742645=:89710
Content-Type: text/plain; charset=us-ascii

I have done by adding two lines in my script and it is working
 
 
iptables -A FORWARD -j MACtest
iptables -A INPUT -j MACtest




George Vieira <georgev@citadelcomputer.com.au> wrote:I have learnt that mac address matching only worked in certain chains.. I think it was INPUT and FORWARD only but not sure.. and I don't know why this was the case..
 
try it on other chains and see the results.

Thanks,

 
____________________________________________
George Vieira
Citadel Computer Systems Pty LtdSystems Managergeorgev AT citadelcomputer DOT com DOT auCitadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644HelpDesk: +61 2 9955 2698http://www.citadelcomputer.com.au
 
 
-----Original Message-----
From: Mohammad Shakir [mailto:shakirz1@yahoo.com]
Sent: Sunday, June 15, 2003 4:56 PM
To: netfilter@lists.samba.org
Subject: How to Block Mac Address ?



I want to block a mac address for this I complie this rule 
but it is not working, any friend who can slove this problem.


#  Flush all Rules
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-cha
/sbin/iptables -N MACtest

#  to block this MAC Address
/sbin/iptables -t filter -A FORWARD -j MACtest
/sbin/iptables -A MACtest -m mac --mac-source 00:02:55:EE:65:D8 -j DROP

#  for MASQUREADE
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE

echo "1" > /proc/sys/net/ipv4/ip_forward




---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month! 


---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-1253065757-1055742645=:89710
Content-Type: text/html; charset=us-ascii

<DIV>I have done by adding two lines in my script and it is working</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables&nbsp;-A FORWARD -j MACtest<BR>iptables&nbsp;-A INPUT -j MACtest<BR><BR><BR><BR><BR><B><I>George Vieira &lt;georgev@citadelcomputer.com.au&gt;</I></B> wrote:
<BLOCKQUOTE style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=589323000-16062003>I have learnt that mac address matching only worked in certain chains.. I think it was INPUT and FORWARD only but not sure.. and I don't know why this was the case..</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=589323000-16062003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=589323000-16062003>try it on other chains and see the results.</SPAN></FONT></DIV>
<DIV>
<P><FONT face=Arial size=2><SPAN class=674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=Arial size=2><SPAN class=674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV style="HEIGHT: 232px; WIDTH: 305px">
<MARQUEE behavior=slide direction=down id=Marquee1 loop=1 scrollAmount=1 scrollDelay=20 style="HEIGHT: 57px; WIDTH: 220px" trueSpeed border="2"><FONT size=1>____________________________________________</FONT></MARQUEE><BR><B><FONT color=#000066 size=2></FONT><FONT color=#000066 face=Verdana size=2>George Vieira<BR></FONT></B>
<MARQUEE behavior=slide id=Marquee2 loop=1 scrollAmount=1 scrollDelay=3 style="HEIGHT: 17px; WIDTH: 240px" trueSpeed border="0"><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1><B>Citadel Computer Systems Pty Ltd</B></FONT></MARQUEE>
<MARQUEE behavior=slide id=Marquee2 loop=1 scrollAmount=1 scrollDelay=3 style="HEIGHT: 17px; WIDTH: 240px" trueSpeed border="0"><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1><B>Systems Manager</B></FONT></MARQUEE><FONT face=Verdana>
<MARQUEE behavior=slide direction=right height=16 id=Marquee3 loop=1 scrollAmount=2 scrollDelay=5 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 255px" trueSpeed width=300 border="0"><FONT color=#000099 face="Verdana, Verdana, Helvetica, sans-serif" size=1>georgev AT citadelcomputer DOT com DOT au</FONT></MARQUEE>
<MARQUEE behavior=slide id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"></MARQUEE></FONT>
<DIV><FONT color=black face="Verdana, Verdana, Helvetica, sans-serif" size=1>Citadel Computer Systems Pty Ltd</FONT><FONT face=Verdana></DIV>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><FONT color=black size=1>Phone : +61 2 9955 2644</FONT></MARQUEE></FONT><FONT face=Verdana>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=1 scrollDelay=3 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><FONT color=black size=1>HelpDesk: +61 2 9955 2698</FONT></MARQUEE></FONT>
<MARQUEE behavior=slide direction=right id=Marquee3 loop=1 scrollAmount=4 scrollDelay=5 style="FONT-SIZE: 10pt; HEIGHT: 17px; WIDTH: 220px" trueSpeed border="0"><A href="http://www.citadelcomputer.com.au/"><FONT color=#000099 face="Verdana, Verdana, Helvetica, sans-serif" size=1><A href="http://www.citadelcomputer.com.au/">http://www.citadelcomputer.com.au</FONT></A></MARQUEE></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma size=2>-----Original Message-----<BR><B>From:</B> Mohammad Shakir [mailto:shakirz1@yahoo.com]<BR><B>Sent:</B> Sunday, June 15, 2003 4:56 PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> How to Block Mac Address ?<BR><BR></FONT></DIV>
<P>I want to block a mac address for this I complie this rule <BR>but it is not working, any friend who can slove this problem.</P>
<P><BR>#&nbsp; Flush all Rules<BR>/sbin/iptables --flush<BR>/sbin/iptables --table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables --table nat --delete-cha<BR>/sbin/iptables -N MACtest</P>
<P>#&nbsp; to block this MAC Address<BR>/sbin/iptables -t filter -A FORWARD -j MACtest<BR>/sbin/iptables -A MACtest -m mac --mac-source 00:02:55:EE:65:D8 -j DROP</P>
<P>#&nbsp; for MASQUREADE<BR>/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE</P>
<P>echo "1" &gt; /proc/sys/net/ipv4/ip_forward<BR></P>
<DIV></DIV>
<P>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</A> - Now only $29.95 per month! </BLOCKQUOTE></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-1253065757-1055742645=:89710--

