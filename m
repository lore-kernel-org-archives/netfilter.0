From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: simple PC-based router using IPTABLES
Date: Thu, 13 Jan 2005 10:24:33 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0501131021030.2774-100000@e-smith.charlieb.ott.istop.com>
References: <20050112084540.55383.qmail@web12508.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050112084540.55383.qmail@web12508.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lim Boon Ping <syseeker@yahoo.com>
Cc: netfilter@lists.netfilter.org


On Wed, 12 Jan 2005, Lim Boon Ping wrote:

> I need some help on using IPTABLES to setup a simple PC-based router
> (for LAN usage). The PC consists of a 10/100 NIC on eth0, and a gigabit
> fiber NIC on eth1. The gigabit fiber NIC is connected to another
> fiber-based port, whereas the 10/100 NIC is connected to a 10/100 hub.
> Now, for all packets coming from eth0, forward it to eth1, and vice
> versa.  Could anyone verify/suggest commands to set for this setting?

You don't need to use iptables at all if you just want a router. And 
perhaps you want to set up a bridge, anyway.

> # iptables -A FORWARD -i eth0 -o eth1 
> # iptables -A FORWARD -i eth1 -o eth0 
>  
> Is it that's all we need to do?

Those commands don't do anything useful.

I suggest you start here:

http://www.faqs.org/docs/iptables/

Google will also find you many, many descriptive articles on setting up 
routers and firewalls using netfilter/iptables.

---
Charlie


