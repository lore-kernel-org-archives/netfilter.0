From: "V. A.H." <vlhip@yahoo.com>
Subject: Re: Firewall question...
Date: Tue, 30 Mar 2004 01:34:08 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330093408.49895.qmail@web41410.mail.yahoo.com>
References: <200403300856.27236.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1385410952-1080639248=:48946"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403300856.27236.Antony@Soft-Solutions.co.uk>
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

--0-1385410952-1080639248=:48946
Content-Type: text/plain; charset=us-ascii

Thx for your answer.
Still a little bit confused.
This is the scheme with ip addresses:
 
Internet (Different ISP)
        |
Subnet Y (10.0.0.0/20)
        |
(eth0)-10.0.1.254
Firewall
(eth1)-10.0.1.253
        |
My Subnet(10.0.1.0/24)
        |
(eth1)-10.0.1.1(default route for My Subnet)
Firewall/Router(SNAT)
(eth0)-some real ip address
        |
Internet (My ISP).

 
 
<<What you need to do is make sure the bottom firewall (which I assume is the 
default route for the machines in your Subnet 10.0.1.0/24) has a route for 
Subnet Y pointing to eth1 as the next hop.
The top firewall just needs to know about the two networks on either side of 
it, which is automatic under Linux - it will only need a default gateway of 
its own if it needs to contact the Internet for its own reasons (eg DNS?).>>
 
The top firewall box doesn't need to contact the Internet. Will have to forward packets between the interfaces and filter the traffic.
 
Best regards.



---------------------------------
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
--0-1385410952-1080639248=:48946
Content-Type: text/html; charset=us-ascii

<DIV>Thx for your answer.</DIV>
<DIV>Still a little bit confused.</DIV>
<DIV>This is the scheme with ip addresses:</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<DIV>Internet (Different ISP)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>Subnet Y (10.0.0.0/20)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>(eth0)-10.0.1.254<BR>Firewall<BR>(eth1)-10.0.1.253<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;|<BR>My Subnet(10.0.1.0/24)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</DIV>
<DIV>(eth1)-10.0.1.1(default route for My Subnet)</DIV>
<DIV>Firewall/Router(SNAT)</DIV>
<DIV>(eth0)-some real ip address</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>Internet (My ISP).</DIV></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&lt;&lt;What you need to do is make sure the bottom firewall (which I assume is the <BR>default route for the machines in your Subnet 10.0.1.0/24) has a route for <BR>Subnet Y pointing to eth1 as the next hop.<BR>The top firewall just needs to know about the two networks on either side of <BR>it, which is automatic under Linux - it will only need a default gateway of <BR>its own if it needs to contact the Internet for its own reasons (eg DNS?).&gt;&gt;</DIV>
<DIV>&nbsp;</DIV>
<DIV>The top firewall box doesn't need to contact the Internet.&nbsp;Will have to forward packets between the interfaces and filter the traffic.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Best regards.<BR></DIV><p><hr size=1><font face=arial size=-1>Do you Yahoo!?<br>
<a href="http://taxes.yahoo.com/filing.html"><b>Yahoo! Finance Tax Center</a></b> - File online. File on time.
--0-1385410952-1080639248=:48946--

