From: "Vlad H." <cpsgx@yahoo.com>
Subject: How to build a better security setup for my problem?
Date: Sat, 13 Mar 2004 09:41:06 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040313174106.31077.qmail@web41610.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-971330950-1079199666=:29968"
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

--0-971330950-1079199666=:29968
Content-Type: text/plain; charset=us-ascii

Hello to all,
 
I have to give internet access to a small group of users from a local network. Internet interface is eth0 and local lan interface is eth1. I guess these rules are ok for my intention:

iptables -t mangle -A FORWARD -i eth1 -o eth0 -s x.x.x.x -m mac --mac-source aa:aa:aa:aa:aa:aa -j ACCEPT
iptables -t mangle -A FORWARD -i eth1 -o eth0 -s y.y.y.y -m mac --mac-source bb:bb:bb:bb:bb:bb -j ACCEPT
iptables -t mangle -A FORWARD -i eth1 -o eth0 -j DROP

But I recently found out that mac address can be changed. So, I need a third security identifier for iptables or any other solution to increase security. Any clues on this? thx.



Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
--0-971330950-1079199666=:29968
Content-Type: text/html; charset=us-ascii

<DIV>Hello to all,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have to give internet access to a&nbsp;small group of&nbsp;users from a local network. Internet interface is eth0 and local lan interface is eth1. I guess these rules are ok for my intention:<BR>
<P>iptables -t mangle -A FORWARD -i eth1 -o eth0 -s x.x.x.x -m mac --mac-source aa:aa:aa:aa:aa:aa -j ACCEPT<BR>iptables -t mangle -A FORWARD -i eth1 -o eth0 -s y.y.y.y -m mac --mac-source bb:bb:bb:bb:bb:bb -j ACCEPT<BR><FONT size=2>iptables -t mangle -A FORWARD -i eth1 -o eth0 -j DROP<BR><BR>But I recently&nbsp;found out that mac address can be changed. So, I need a third security identifier for iptables or any other solution to increase security. Any clues on this? thx.<BR></FONT><FONT size=2></P></DIV></FONT><p><font face=arial size=-1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/mailtag_us/*http://mail.yahoo.com" target="_blank"><b>Yahoo! Mail</a></b> - More reliable, more storage, less spam
--0-971330950-1079199666=:29968--

