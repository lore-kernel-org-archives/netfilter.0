From: Elitesyntax <elitesyntax@yahoo.com>
Subject: Re: iptable question
Date: Wed, 18 Jun 2003 08:37:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618153707.72539.qmail@web14707.mail.yahoo.com>
References: <200306181120.35468.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306181120.35468.Alistair@nerdnet.ca>
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
Content-Transfer-Encoding: 7bit
To: Alistair@nerdnet.ca, netfilter@lists.netfilter.org

#!/bin/sh
 #
# The location of the IPTables binary file on your
 system.

<<SNIPPED FOR BREVITY >>

$IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 8 -m limit --limit
1/second -j ACCEPT
$IPT -A INPUT -p icmp -j DROP



Are you saying this where all my error are?This my
first iptables firewall script.So i maybe have some
question on iptables and i do have a red hat linux
firewall book that help me some.



Sorry for send this post out 2 time.

=====
EliteSyntax  www.linuxnewbie.org





__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

