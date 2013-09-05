From: "podo" <podo@hnup.de>
Subject: RE: Limit rule for ICMP not working properly?
Date: Thu, 5 Sep 2013 17:43:59 +0200
Message-ID: <000a01ceaa4e$bd406c90$37c145b0$@hnup.de>
References: <002e01ce83d7$ad77f410$0867dc30$@hnup.de> <CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com> <000901ceaa48$60fe2a40$22fa7ec0$@hnup.de> <20130905151153.GA14774@linuxace.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130905151153.GA14774@linuxace.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Phil Oester' <kernel@linuxace.com>
Cc: 'netfilter' <netfilter@vger.kernel.org>

Hi Phil,
Yes, I ment the 3th rule (Established accept).

Please what do you mean by "same ID" ? And is this not exactly the problem ?
nf_conntrack is even not needed, when only the first rule is present:
-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT

ICMP should not be tracked as established...
In my opinion the behaviour is not correct. 

Podo

-----Original Message-----
From: Phil Oester [mailto:kernel@linuxace.com] 
Sent: 05 September, 2013 17:12
To: podo
Cc: 'netfilter'
Subject: Re: Limit rule for ICMP not working properly?

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

Wait > 30 seconds between (single) pings and you should not see the
established
rule hitcount increasing.

Phil


