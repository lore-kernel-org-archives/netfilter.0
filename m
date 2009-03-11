From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Determining number of active connections
Date: Wed, 11 Mar 2009 10:16:37 +0100
Message-ID: <49B78175.7010608@netfilter.org>
References: <1236694715.945517171@192.168.1.202>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1236694715.945517171@192.168.1.202>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jason.faulkner@mailtrust.com
Cc: netfilter@vger.kernel.org

jason.faulkner@mailtrust.com wrote:
> Hi all,
> 
> I'd like to be able to monitor (trend) the number of tracked connections in iptables; however, doing something like "cat /proc/net/ip_conntrack | wc -l" eats up too much CPU to run with regularity (we track somewhere in the realm of 200,000 connections).
> 
> Is there a way to just pull the total number? It'd be nice to know that we aren't even getting close to the number of connections set in the sysctl. 

$ cat /proc/sys/net/netfilter/nf_conntrack_count

or with the conntrack-tools-0.9.11

# conntrack -C

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
