From: "Luis Fernando Barrera" <luba@assist.com.gt>
Subject: RE: iptables suddently stop working
Date: Wed, 6 Nov 2002 15:57:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBIDJPNCAGKGOFGHBFGEHBPIAA.luba@assist.com.gt>
References: <200211061815.gA6IFhe21468@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211061815.gA6IFhe21468@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

My output is the following:

(right now everything is working)

# wc -l /proc/net/ip_conntrack
    	156 /proc/net/ip_conntrack
# cat /proc/sys/net/ipv4/ip_conntrack_max
	65424

My box has 1GB RAM.

It gives Internet access to about 200 people, and also the server is
used as a proxy/cache (using Squid).

Thanks

Luis


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Wednesday, November 06, 2002 12:16
To: netfilter@lists.netfilter.org
Subject: Re: iptables suddently stop working


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



