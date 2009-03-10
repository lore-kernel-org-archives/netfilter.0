From: Erik Wasser <erik.wasser@iquer.net>
Subject: Re: Determining number of active connections
Date: Tue, 10 Mar 2009 16:22:35 +0100
Message-ID: <200903101622.35671.erik.wasser@iquer.net>
References: <1236694715.945517171@192.168.1.202>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1236694715.945517171@192.168.1.202>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: jason.faulkner@mailtrust.com

On Tuesday 10 March 2009, jason.faulkner@mailtrust.com wrote:
> Hi all,
>
> I'd like to be able to monitor (trend) the number of tracked
> connections in iptables; however, doing something like "cat
> /proc/net/ip_conntrack | wc -l" eats up too much CPU to run with
> regularity (we track somewhere in the realm of 200,000 connections).
>
> Is there a way to just pull the total number? It'd be nice to know
> that we aren't even getting close to the number of connections set in
> the sysctl.

Hi,

check out the following files:

/proc/sys/net/ipv4/netfilter/{ip_conntrack_count,ip_conntrack_max}

-- 
So long... Fuzz
