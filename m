From: "V. A.H." <vlhip@yahoo.com>
Subject: Re: Firewall question...
Date: Tue, 30 Mar 2004 07:53:34 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330155334.56475.qmail@web41404.mail.yahoo.com>
References: <200403301058.37604.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-322882363-1080662014=:55552"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403301058.37604.Antony@Soft-Solutions.co.uk>
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

--0-322882363-1080662014=:55552
Content-Type: text/plain; charset=us-ascii

This is how the whole setup is looking for the moment:
 
Internet (Different ISP)
        |
Subnet Y (10.0.0.0/20)
        |
        |
My Subnet(10.0.1.0/24)
        |
(eth1)-10.0.1.1(default route for My Subnet)
Firewall/Router(SNAT)
(eth0)-some real ip address
        |
Internet (My ISP).


 
<<I'm not surprised you are a little bit confused if these IP addresses are 
accurate :)
Please confirm: is eth0 10.0.1.254, or 10.0.0.254?
And: you have one subnet 10.0.0.0/20, with another connected network 
10.0.1.0/24 (ie a subnet of the original network)???>>

10.0.0.0/20 is a metropolitan network; in order to access this network I have a /24 subnet available, 10.0.1.0 and the netmask for my clients is 255.255.240.0 (/20). As I mentioned before, I have to setup this firewall between metropolitan network and my clients. And I'm stuck :-) The network interfaces from my furure firewall (I hope) can take only an ip from my available /24 network.
 
Thank You.


---------------------------------
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
--0-322882363-1080662014=:55552
Content-Type: text/html; charset=us-ascii

<DIV>This is how the whole setup is looking for the moment:</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<DIV>Internet (Different ISP)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>Subnet Y (10.0.0.0/20)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<BR>My Subnet(10.0.1.0/24)</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</DIV>
<DIV>(eth1)-10.0.1.1(default route for My Subnet)</DIV>
<DIV>Firewall/Router(SNAT)</DIV>
<DIV>(eth0)-some real ip address</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>Internet (My ISP).</DIV></DIV>
<DIV><BR>&nbsp;</DIV>
<DIV>&lt;&lt;I'm not surprised you are a little bit confused if these IP addresses are <BR>accurate :)<BR>Please confirm: is eth0 10.0.1.254, or 10.0.0.254?<BR>And: you have one subnet 10.0.0.0/20, with another connected network <BR>10.0.1.0/24 (ie a subnet of the original network)???&gt;&gt;<BR></DIV>
<DIV>10.0.0.0/20 is a metropolitan network; in order to access this network I have&nbsp;a /24 subnet available, 10.0.1.0 and the netmask for my clients&nbsp;is 255.255.240.0 (/20). As I mentioned before, I have to setup&nbsp;this firewall between metropolitan network and my clients. And I'm stuck :-) The network interfaces from my furure firewall (I hope) can take only an ip from my available /24 network.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thank You.</DIV><p><hr size=1><font face=arial size=-1>Do you Yahoo!?<br>
<a href="http://taxes.yahoo.com/filing.html"><b>Yahoo! Finance Tax Center</a></b> - File online. File on time.
--0-322882363-1080662014=:55552--

