From: manisha s <cdac_manisha@yahoo.com>
Subject: Re: Iptables command failed
Date: Thu, 8 Apr 2004 00:18:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408071811.94845.qmail@web61010.mail.yahoo.com>
References: <004701c41ca3$31c2e640$1202a8c0@admin>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-324007777-1081408691=:94377"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004701c41ca3$31c2e640$1202a8c0@admin>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

--0-324007777-1081408691=:94377
Content-Type: text/plain; charset=us-ascii

Hi,
I have downloaded iptables-1.2.9 from netfilter.org and installed using  make and make install commands after compiling the kernel with network packet filtering (replaces ipchains) option having value yes
 
also the settings under IP netfilter configuration are. 
 
connection tracking   module
FTP, amanda ,TFTP,IRC support no
IP tables support (required for filtering/masq/NAT)  module
 
Packet filtering                  module
full NAT                            module
Redirect support               module
ipchains 2.2 style support  no
ipchains 2.0 style support no
 
then i compiled kernel and rebooted machine
But when i issued the following command
> 
> iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
> 
> i got the following error
> 
> /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
> unresolved symbol nf_register_sockopt_Rsmp_f5985dce

plz give me more insight on this issue
 


Rob Sterenborg <rob@sterenborg.info> wrote:
 
> I m using kernel 2.4.22 and iptables rpm 1.2.7a-2.
> I compiled a kernel to support the Network filtering
> successfully. But when i issued the following command
> 
> iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
> 
> i got the following error
> 
> /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
> unresolved symbol nf_register_sockopt_Rsmp_f5985dce
> 
....
> 
> iptables v1.2.7a: can't initialize iptables table
> `filter': iptables who? (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
> 
> 
> what this error means?do i need to update the iptables
> or kernel?

Did you compile a new kernel without updating iptables ?
If so, compile a new iptables (1.2.9) too.


Gr,
Rob



---------------------------------
Do you Yahoo!?
Yahoo! Small Business $15K Web Design Giveaway - Enter today
--0-324007777-1081408691=:94377
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>I have downloaded iptables-1.2.9 from netfilter.org and installed using&nbsp; make and make install commands after compiling the kernel with network packet filtering (replaces ipchains) option having value yes</DIV>
<DIV>&nbsp;</DIV>
<DIV>also the settings under IP netfilter configuration are. </DIV>
<DIV>&nbsp;</DIV>
<DIV>connection tracking&nbsp;&nbsp; module</DIV>
<DIV>FTP, amanda ,TFTP,IRC&nbsp;support no</DIV>
<DIV>IP tables support (required for filtering/masq/NAT)&nbsp; module</DIV>
<DIV>&nbsp;</DIV>
<DIV>Packet filtering&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module</DIV>
<DIV>full NAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module</DIV>
<DIV>Redirect support&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module</DIV>
<DIV>ipchains 2.2 style support&nbsp; no</DIV>
<DIV>ipchains 2.0 style support no</DIV>
<DIV>&nbsp;</DIV>
<DIV>then i compiled kernel and rebooted machine</DIV>
<DIV>But when i issued the following command<BR>&gt; <BR>&gt; iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP<BR>&gt; <BR>&gt; i got the following error<BR>&gt; <BR>&gt; /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:<BR>&gt; unresolved symbol nf_register_sockopt_Rsmp_f5985dce<BR></DIV>
<DIV>plz give me more insight on this issue</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR><BR><B><I>Rob Sterenborg &lt;rob@sterenborg.info&gt;</I></B> wrote:</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">&gt; I m using kernel 2.4.22 and iptables rpm 1.2.7a-2.<BR>&gt; I compiled a kernel to support the Network filtering<BR>&gt; successfully. But when i issued the following command<BR>&gt; <BR>&gt; iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP<BR>&gt; <BR>&gt; i got the following error<BR>&gt; <BR>&gt; /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:<BR>&gt; unresolved symbol nf_register_sockopt_Rsmp_f5985dce<BR>&gt; <BR>....<BR>&gt; <BR>&gt; iptables v1.2.7a: can't initialize iptables table<BR>&gt; `filter': iptables who? (do you need to insmod?)<BR>&gt; Perhaps iptables or your kernel needs to be upgraded.<BR>&gt; <BR>&gt; <BR>&gt; what this error means?do i need to update the iptables<BR>&gt; or kernel?<BR><BR>Did you compile a new kernel without updating iptables ?<BR>If so, 
 compile a new iptables (1.2.9) too.<BR><BR><BR>Gr,<BR>Rob<BR><BR></BLOCKQUOTE><p><hr size=1><font
 face=arial size=-1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=23609/*http://promotions.yahoo.com/design_giveaway/static/index2.html">Yahoo! Small Business $15K Web Design Giveaway</a> - Enter today
--0-324007777-1081408691=:94377--

