From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables suddently stop working
Date: Wed, 6 Nov 2002 22:39:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021106223940.UUGR292.mta03-svc.ntlworld.com@there>
References: <NABBIDJPNCAGKGOFGHBFGEHBPIAA.luba@assist.com.gt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NABBIDJPNCAGKGOFGHBFGEHBPIAA.luba@assist.com.gt>
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

On Wednesday 06 November 2002 9:57 pm, Luis Fernando Barrera wrote:

> My output is the following:
>
> (right now everything is working)
>
> # wc -l /proc/net/ip_conntrack
>     	156 /proc/net/ip_conntrack
> # cat /proc/sys/net/ipv4/ip_conntrack_max
> 	65424
>
> My box has 1GB RAM.

Okay, so this means you have 156 connections being tracked through your 
firewall (seems a perfectly reasonable number for 200 users), with capacity 
for up to 65424 connections before the box gets overloaded.

If you ever got more than 65424 connections from 200 users it would indicate 
a serious problem (eg Nimda on the machines...) - I would never expect that 
to happen.

So, can you check the next time things lock up:

1. wc -l /proc/net/ip_conntrack
just to see how many connection there are at that time

2. top
to see what process is using up most cpu time (and also what the current 
system load is).

Anyone else got any ideas on how to investigate this ?

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

