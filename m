From: michael@floog.net
Subject: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 09:23:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084206191.409fac6f1176a@webmail.floog.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Group:

Setup:

Linux box acting as gateway/router/firewall for a LAN connected to the
internet by way of DSL connection.
eth0 - goes to the internet
eth1 - is gateway for the LAN
Linux box is using iptables version 1.2.9

Environment:

The LAN currently has 5 computers connected to it with static IP
addresses:

192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6

I will be adding 3 more machines with with static IP addresses:

192.168.1.7
192.168.1.8
192.168.1.9

Issue:

*.9 needs to remain accessible from *.7 and *.8; however, I need to
restrict any connection or accessibility to *.9 from *.2 - *.6.

I know how to restrict all access to *.9 by doing the following rule:

$IPTABLES -t filter -A FORWARD -p all --destination 192.168.1.9 -j DROP
or
$IPTABLES -t filter -A FORWARD -p all --destination 192.168.1.9 -j
REJECT

But I don't know how to craft a rule that allows only some machines to
send/receive data packets to/from *.9 while blocking other machines'
access to *.9 on the LAN.

I don't think prerouting or postrouting is the answer for this situation
but I could be wrong.  Thank you for your time and assistance.  All
guidance and responses are greatly appreciated.

Mike 



