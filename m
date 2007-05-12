From: Nicholas Kline <kakster7@sbcglobal.net>
Subject: Questions about DHCP firewall rules
Date: Fri, 11 May 2007 18:55:25 -0700 (PDT)
Message-ID: <729129.22320.qm@web83819.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings,

I am in the process of learning Netfilter/IPtables.  I
plan on using Netfilter/IPtables to protect my Linux
desktop computers and servers.  We're talking
host-based firewalls, not one firewall protecting all
of the desktops and servers.

I have a basic question I am hoping someone on this
mailing list can answer.  I am a little confused about
configuring Netfilter/IPtables on a Linux desktop
computer.  Specifically, this situation:

a linux desktop computer that is configured to use
DHCP
and configured to use the following rule:

$IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix
"Spoofed source IP"
$IPTABLES -A INPUT -s $IP_LOCAL -j DROP

I would like to include the previous rule as part of a
standard rule set.

From how I understand this situation, the firewall
would have to be able to automatically detect when the
computers IP address changes, right?  Manually
inputting the computers IP address each time it
changes would get really old.

I'm using several books as references for learning
Netfilter/IPtables and they discuss implementing
"dynamic firewall scripts".  In this case, a dynamic
firewall script that recognizes when the computers IP
address changes.

So, my questions are:

1.) If I am using a computer that is configured to
obtain its IP address through DHCP, what firewall
rules do I need to setup?

2.) Additionally, how do I configure the firewall to
automatically detect changes in the computers network
configuration (IP address change, etc.)?

Thank you for your time,

*Nick*

