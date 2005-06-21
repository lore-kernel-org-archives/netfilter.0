From: Feizhou <feizhou@linuxmail.org>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 17:36:13 +0800
Message-ID: <42B7DF8D.3060304@linuxmail.org>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506201055.25861.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org


> I do see that you've disabled CONFIG_IP_NF_CONNTRACK, which is a very 
> odd choice. Connection tracking is the strength of iptables!

You mean weakness.

netfilter's conntrack module sucks in performance and at the same time 
is not fully stateful.

If I wanted a stateful firewall, I would go for a OpenBSD solution.

For filtering to host, netfilter is ok without connection tracking.

