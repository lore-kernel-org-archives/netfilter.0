From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables suddently stop working
Date: Wed, 6 Nov 2002 18:15:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211061815.gA6IFhe21468@vulcan.rissington.net>
References: <NABBIDJPNCAGKGOFGHBFKEGNPIAA.luba@assist.com.gt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NABBIDJPNCAGKGOFGHBFKEGNPIAA.luba@assist.com.gt>
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

On Wednesday 06 November 2002 6:09 pm, Luis Fernando Barrera wrote:

> Hi all,
>
> I have a strange behavior in my Red Hat 7.3 box using iptables...I allow
> certain users to send ICMP packages across the firewall, using the FORWARD
> chain and NAT table(with SNAT).
>
> However sometimes the firewall stop routing the packets, but only certain
> traffic. In my
> case is the traffic accross the FORWARD chain.
> Then... I just restart (flush) the iptables script and it works again.
> I'm wondering whether there is some buffer which is getting full, so the
> iptables code stop routing the packets?
>
> Is there anything I should check? I use state-full connections in all the
> rules.

I don't seriously think it can be your connection tracking table, because 
that does not get cleared simply by flushing and reloading the rules.

However:

1. What do you get for
wc -l /proc/net/ip_conntrack

2. What do you get for
cat /proc/sys/net/ipv4/ip_conntrack_max

3. How much memory do you have in your firewall ?

Antony.

-- 

Most people have more than the average number of legs.

