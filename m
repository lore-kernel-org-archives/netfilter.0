From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: icmp-type question
Date: Thu, 28 Jun 2007 12:26:42 +0200
Message-ID: <20070628102642.GA29575@outback.rfc2324.org>
References: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>
	<35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
	<468299E4.3020906@mailinator.com>
	<4682B79C.3040304@riverviewtech.net>
	<35f70db10706280048o72c1bc8u5b20a5cceddf3fd8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <35f70db10706280048o72c1bc8u5b20a5cceddf3fd8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Thursday, den 28 June hub Ross Cameron folgendes in die Tasten:

[filter icmp timestamp-*]

> How do you create sub-chains?
> I've heard the term before but never found an example that uses it.

This is a simple task:

 iptables -N yourChainName

For your problem:

 iptables -N icmp_timestamp
 iptables -A icmp_timestamp -p icmp --icmp-type timestamp-request -j REJECT --reject-with icmp-admin-prohibited
 iptables -A icmp_timestamp -p icmp --icmp-type timestamp-reply -j REJECT --reject-with icmp-admin-prohibited
 
 iptables -A INPUT -i eth0 -p icmp -j icmp_timestamp
 iptables -A OUTPUT -o eth0 -p icmp -j icmp_timestamp

(The interesting question here might be if it is wise to put these two
 simple rules in a subchain when thinking about rule processing
 speed.)

HTH
Ciao
Max
-- 
	Follow the white penguin.

