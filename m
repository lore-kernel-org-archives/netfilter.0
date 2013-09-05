From: Phil Oester <kernel@linuxace.com>
Subject: Re: Limit rule for ICMP not working properly?
Date: Thu, 5 Sep 2013 11:23:59 -0700
Message-ID: <20130905182359.GA20267@linuxace.com>
References: <002e01ce83d7$ad77f410$0867dc30$@hnup.de>
 <CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com>
 <000901ceaa48$60fe2a40$22fa7ec0$@hnup.de>
 <20130905151153.GA14774@linuxace.com>
 <000a01ceaa4e$bd406c90$37c145b0$@hnup.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000a01ceaa4e$bd406c90$37c145b0$@hnup.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: podo <podo@hnup.de>
Cc: 'netfilter' <netfilter@vger.kernel.org>

On Thu, Sep 05, 2013 at 05:43:59PM +0200, podo wrote:
> Hi Phil,
> Yes, I ment the 3th rule (Established accept).
> 
> Please what do you mean by "same ID" ? And is this not exactly the problem ?
> nf_conntrack is even not needed, when only the first rule is present:
> -A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT

By "ID" I mean ICMP ID.  Do some testing on your own with something like this:

     while : ; do grep icmp  /proc/net/nf_conntrack ; sleep 1 ; done

while you have a ping going.  You'll note that as long as the ICMP ID (and
src/dst IPs) are identical, only one conntrack entry is utilized.  If you continually
ping, the only update will be the timer refreshing to 30 seconds.  During this time,
you will note your "established" rule increasing.  If you ping 5 times, the established
rule should register 4 hits.  

If you allow the conntrack to expire (by waiting 30 seconds), then the cycle starts
over again.

> ICMP should not be tracked as established...
> In my opinion the behaviour is not correct. 

This is optimal behavior.  Also, without this, DoS attacks against conntrack
would be much simpler.

Phil
