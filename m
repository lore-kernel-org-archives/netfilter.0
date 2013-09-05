From: Phil Oester <kernel@linuxace.com>
Subject: Re: Limit rule for ICMP not working properly?
Date: Thu, 5 Sep 2013 08:11:54 -0700
Message-ID: <20130905151153.GA14774@linuxace.com>
References: <002e01ce83d7$ad77f410$0867dc30$@hnup.de>
 <CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com>
 <000901ceaa48$60fe2a40$22fa7ec0$@hnup.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000901ceaa48$60fe2a40$22fa7ec0$@hnup.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: podo <podo@hnup.de>
Cc: 'netfilter' <netfilter@vger.kernel.org>

On Thu, Sep 05, 2013 at 04:58:27PM +0200, podo wrote:
> Hi,
> 
> the default is DROP:
> 
> iptables -L -n -v
> Chain INPUT (policy DROP 314 packets, 98684 bytes)
> pkts bytes target     prot opt in     out     source
> destination
>   963 66540 ACCEPT     tcp  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>    29  1740 ACCEPT     icmp --  *      *       0.0.0.0/0
> 0.0.0.0/0            icmptype 8 limit: avg 1/sec burst 5
>    39  2836 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0            state ESTABLISHED
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> pkts bytes target     prot opt in     out     source
> destination
> 
> Chain OUTPUT (policy ACCEPT 5384 packets, 387K bytes)
> pkts bytes target     prot opt in     out     source
> destination
> 
> The problem is, that the second rule gets hit, even if it shoud not (my
> opinion). ICMP can not be "established". Or ?

I think you mean _third_ rule in the above example.  When you successfully
ping the box, an entry is added to /proc/net/nf_conntrack.  Until that
entry expires (30 seconds by default for icmp), then any additional icmp
packet with the same ID will match that conntrack entry and be considered
"established".  

Wait > 30 seconds between (single) pings and you should not see the established
rule hitcount increasing.

Phil
