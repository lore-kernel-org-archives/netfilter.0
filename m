From: Chetan Nagaraja <chetanmn_in@yahoo.com>
Subject: ICMP Connections ...
Date: Tue, 24 Aug 2004 06:36:10 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-864952120-1093354570=:79151"
Return-path: <netfilter-admin@lists.netfilter.org>
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

--0-864952120-1093354570=:79151
Content-Type: text/plain; charset=us-ascii

Dear All,
First of all, let me introduce as a total newbie in filtering and iptables.
 
To ping a host in a different network, I have configured a dual homed[ two network interfaces] linux system to act as NAT router.
I have add a rule in the NAT table of iptables, to achieve the following.
If the Linux system recieves a icmp packet from a particular host in NETWORK A addressed to a particular HOST in NETWORK B , perform SNAT of the ICMP packet to that of the Linux System, so that the icmp replies reaches the Linux system.
 
The above is working very fine. The ICMP requests are reaching the expected destination. 
But I'am unable to understand the fact that the ICMP replies are reaching the host in NETWORK A which had generated the requests, without adding a DNAT rule for the same.
How is this possible, does iptables automatically redirect ICMP replies ?
And How to avoid the same.
 
Thanking you,
Chetan M N


		
---------------------------------
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
--0-864952120-1093354570=:79151
Content-Type: text/html; charset=us-ascii

<DIV>Dear All,</DIV>
<DIV>First of all, let me introduce as a total newbie in filtering and iptables.</DIV>
<DIV>&nbsp;</DIV>
<DIV>To ping a host in a different network, I have configured a dual homed[ two network interfaces]&nbsp;linux system to act as NAT router.</DIV>
<DIV>
<DIV>I have add a rule in the NAT table of iptables, to achieve the following.</DIV>
<DIV>If the Linux system recieves a icmp packet from a particular host in NETWORK A addressed to a particular HOST in&nbsp;NETWORK B , perform SNAT of the ICMP packet to that of the Linux System, so that the icmp replies reaches the Linux system.</DIV>
<DIV>&nbsp;</DIV>
<DIV>The above is working very fine. The ICMP requests are reaching the expected destination. </DIV>
<DIV>But I'am unable to understand the fact that the ICMP replies are reaching the host in NETWORK A which had generated the requests, without adding a DNAT rule for the same.</DIV>
<DIV>How is this possible, does iptables automatically redirect ICMP replies ?</DIV>
<DIV>And How to avoid the same.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanking you,</DIV>
<DIV>Chetan M N</DIV></DIV><p>
		<hr size=1>Do you Yahoo!?<br>
Yahoo! Mail is new and improved - <a href="http://us.rd.yahoo.com/mail_us/taglines/new/*http://promotions.yahoo.com/new_mail">Check it out!</a>
--0-864952120-1093354570=:79151--

