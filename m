From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DHCP /MAC
Date: Sat, 08 Nov 2003 09:44:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAD0160.5080005@Loudoun-Fairfax.com>
References: <20031108130517.88285.qmail@web60210.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108130517.88285.qmail@web60210.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
kannel sms wrote:<br>
<blockquote type="cite"
 cite="mid20031108130517.88285.qmail@web60210.mail.yahoo.com">
  <pre wrap="">As u said i did all , but it will not reach my
requirement, because when i added that rule with a
specific MAC address , according to ur mail it will
allow  to get all the dhcp facilities . 
But other machines also doing samething . so seems to
be somewhere has a small problem , 
  </pre>
</blockquote>
<br>
You said in one of your other postings that you're new to iptables.
Have you read this tutorial yet?<br>
<br>
<a class="moz-txt-link-freetext" href="http://iptables-tutorial.frozentux.net/">http://iptables-tutorial.frozentux.net/</a><br>
<br>
This is required reading for anyone who is serious about using
iptables. Some other advice:<br>
<blockquote type="cite"
 cite="mid20031108130517.88285.qmail@web60210.mail.yahoo.com">
  <pre wrap="">
i will give u my tabless info

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
  </pre>
</blockquote>
<br>
You also said you're testing with a small LAN. Set the default policies
to ACCEPT until you've got every thing working. Once iptables is
correctly configured very few, if any, packets will reach the end of
these chains and you can safely change this back to DROP. Make sure you
clear all your previous rules and chains before running this script or
you will just be adding rules on top of rules.<br>
<blockquote type="cite"
 cite="mid20031108130517.88285.qmail@web60210.mail.yahoo.com">
  <pre wrap="">#######################################################################################################################
iptables -A INPUT -i lo -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o lo -m state --state NEW -j
ACCEPT

iptables -A INPUT -m state --state RELATED,ESTABLISHED
-j ACCEPT
iptables -A OUTPUT -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW -j ACCEPT
  </pre>
</blockquote>
<br>
Don't bother with this stuff until you have your MAC filtering working
correctly. Then you can add these types of rules back in. I find it
easier to group all the rules together by table rather than by type,
but as long as they're entered in the correct order it doesn't matter
to iptables.<br>
<br>
<blockquote type="cite"
 cite="mid20031108130517.88285.qmail@web60210.mail.yahoo.com">
  <pre wrap="">####################################################################################################################
iptables -N MACcheck
iptables -A MACcheck -m mac --mac-source
00.50.BA.50.36.25 -j ACCEPT
iptables -A MACcheck -j DROP

iptables -I INPUT -i eth0 -j MACcheck
  </pre>
</blockquote>
<br>
These look ok except the last line should have -A INPUT. <br>
<blockquote type="cite"
 cite="mid20031108130517.88285.qmail@web60210.mail.yahoo.com">
  <pre wrap="">######################################################################################################################
iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 67
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 67
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT

iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 68
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 68
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT
  </pre>
</blockquote>
<br>
If you fix the first INPUT rule then none of your traffic from eth0
will ever reach these rules. Since you're directing traffic from eth0
to the MACcheck chain you should put these rules on MACcheck. Follow
Antony's advice and put in lots of logging rules so you can see where
the traffic is going and why.<br>
<br>
<br>
Jeff<br>
<br>
</body>
</html>


