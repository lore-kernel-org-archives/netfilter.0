From: ads nat <adsnat@yahoo.com>
Subject: Re: iptables installation problem
Date: Fri, 5 Sep 2003 05:50:10 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905125010.458.qmail@web20708.mail.yahoo.com>
References: <1062764916.1164.16.camel@india.nsecure.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-255659646-1062766210=:99854"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062764916.1164.16.camel@india.nsecure.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

--0-255659646-1062766210=:99854
Content-Type: text/plain; charset=us-ascii

Yes that was the error.
It has worked.
 
Thanks

"Dharmendra.T" <dharmu@nsecure.net> wrote:
On Fri, 2003-09-05 at 17:39, ads nat wrote: Hi, 
It has got following commands : 
  
*** 
iptables --flush 
iptables --table nat --flush 
iptables --delete-chain 
iptables --table nat --delete-chain 
iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE 
iptables --append FORWARD --in-interface eth1 -j ACCEPT 
iptables -t -nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128 
This should be iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128 Make sure that you have removed (-) from -nat above. This is a syntax error. 

Regards 
Dharmendra T. *** 
 Thanks 
  
  
"Dharmendra.T" <dharmu@nsecure.net> wrote: Hi, 

On Fri, 2003-09-05 at 16:47, ads nat wrote: Hi, 
I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server. 
I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. 
by using command 
"tar -xf iptables-1.2.8.tar" 
it has created iptables-1.2.8 directory in which all files are extracted. After this you have to compile the iptables.   
I don't know how to go further. 
I tried make and make install. 
  
Then when i gave command "/etc/rc.d/rc.local" 
it gives following error. Tell me what this file contais. Is this a script which has iptables rules? "[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local 
SIOCDELRT: No such process 
RTNETLINK answers: File exists 
SIOCADDRT: File exists 
SIOCADDRT: File exists 
iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?) 
Perhaps iptables or your kernel needs to be upgraded. 
  
How to go ahead now? 
  
Thanks 




---------------------------------
Do you Yahoo!? 
Yahoo! SiteBuilder - Free, easy-to-use web site design software 
-- RegardsDharmendra.Tdharmu@nsecure.netThis message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.

---------------------------------
Do you Yahoo!? 
Yahoo! SiteBuilder - Free, easy-to-use web site design software 
-- RegardsDharmendra.Tdharmu@nsecure.netThis message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-255659646-1062766210=:99854
Content-Type: text/html; charset=us-ascii

<DIV>Yes that was the error.</DIV>
<DIV>It has worked.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks<BR><BR><B><I>"Dharmendra.T" &lt;dharmu@nsecure.net&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<META content=GtkHTML/1.0.4 name=GENERATOR>On Fri, 2003-09-05 at 17:39, ads nat wrote: 
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>Hi,</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>It has got following commands :</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>***</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --flush</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --table nat --flush</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --delete-chain</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --table nat --delete-chain</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables --append FORWARD --in-interface eth1 -j ACCEPT</FONT></FONT></I> </BLOCKQUOTE><FONT size=3></FONT><BR><FONT size=3></FONT>
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>iptables -t -nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</FONT></FONT></I> </BLOCKQUOTE><FONT size=3></FONT><BR><FONT size=3>This should be </FONT>
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</FONT></FONT></I> </BLOCKQUOTE><FONT size=3>Make sure that you have removed (-) from -nat above. This is a syntax error.</FONT> <BR><FONT size=3></FONT><BR><FONT size=3>Regards</FONT> <BR><FONT size=3>Dharmendra T.</FONT> 
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>***</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;Thanks</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><B><I>"Dharmendra.T" &lt;dharmu@nsecure.net&gt;</FONT></FONT></B></I><FONT color=#73273a><FONT size=3><I> wrote:</FONT></FONT></I> 
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>Hi, </FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I></FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I>On Fri, 2003-09-05 at 16:47, ads nat wrote: </FONT></FONT></I>
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>Hi,</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server.</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. </FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I>by using command </FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I>"tar -xf iptables-1.2.8.tar"</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>i</FONT></FONT></I><FONT color=#73273a><FONT size=3><I>t has created iptables-1.2.8 directory in which all files are extracted.</FONT></FONT></I> </BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>After this you have to compile the iptables. </FONT></FONT></I>
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>I don't know how to go further.</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>I tried make and make install.</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>Then when i gave command "/etc/rc.d/rc.local"</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>it gives following error.</FONT></FONT></I> </BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>Tell me what this file contais. Is this a script which has iptables rules?</FONT></FONT></I> 
<BLOCKQUOTE><FONT color=#73273a><FONT size=3><I>"[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>SIOCDELRT: No such process</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>RTNETLINK answers: File exists</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>SIOCADDRT: File exists</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>SIOCADDRT: File exists</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?)</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>Perhaps iptables or your kernel needs to be upgraded.</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>How to go ahead now?</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>&nbsp;</FONT></FONT></I> <BR><FONT color=#73273a><FONT size=3><I>Thanks</FONT></FON
 T></I>
 <BR><FONT color=#73273a><FONT size=3><I></FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I></FONT></FONT></I><BR><FONT color=#73273a><FONT size=3><I></FONT></FONT></I><BR>
<HR SIZE=1>
<FONT color=#73273a><FONT size=3><I>Do you Yahoo!?</FONT></FONT></I> <BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com"><FONT size=3><I>Yahoo! SiteBuilder</FONT></I></A><FONT color=#73273a><FONT size=3><I> - Free, easy-to-use web site design software</FONT></FONT></I> </BLOCKQUOTE>
<TABLE cellPadding=0 cellSpacing=0 width="100%">
<TBODY>
<TR></TR>
<TR></TR>
<TR>
<TD><PRE><FONT color=#73273a><FONT size=3><I>-- </FONT></FONT></I>
<FONT color=#73273a><FONT size=3><I>Regards</FONT></FONT></I>
<FONT color=#73273a><FONT size=3><I>Dharmendra.T</FONT></FONT></I>
<FONT color=#73273a><FONT size=3><I>dharmu@nsecure.net</FONT></FONT></I>
<FONT color=#73273a><FONT size=3><I></FONT></FONT></I>
<FONT color=#73273a><FONT size=3><I>This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</FONT></FONT></I></PRE></TD></TR></TBODY></TABLE></BLOCKQUOTE>
<HR SIZE=1>
<FONT color=#73273a><FONT size=3><I>Do you Yahoo!?</FONT></FONT></I> <BR><A href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com"><FONT size=3><I>Yahoo! SiteBuilder</FONT></I></A><FONT color=#73273a><FONT size=3><I> - Free, easy-to-use web site design software</FONT></FONT></I> </BLOCKQUOTE>
<TABLE cellPadding=0 cellSpacing=0 width="100%">
<TBODY>
<TR>
<TD><PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE></TD></TR></TBODY></TABLE></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-255659646-1062766210=:99854--

