From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Limit rule for ICMP not working properly?
Date: Thu, 5 Sep 2013 20:10:19 -0400
Message-ID: <CACuyg24fqhA+HGAQNzN43+nDUC13mj=eAxNZ9GWezyCrJNOc1w@mail.gmail.com>
References: <002e01ce83d7$ad77f410$0867dc30$@hnup.de>
	<CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com>
	<000901ceaa48$60fe2a40$22fa7ec0$@hnup.de>
	<20130905151153.GA14774@linuxace.com>
	<000a01ceaa4e$bd406c90$37c145b0$@hnup.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=z4D3WFbmydZHRRHxElr0wf5cABTEE3uK7ZuWzSyDMmM=;
        b=YlV84tPLNivUlHHLepos0FpJEw7R7qth+CPocO9JmbVqEYqUBOfHN3QzQSrr5CB2ER
         K9vEOw71M6KROZmRcuIHa/SgRXtTB/N4rJRjdIy0YuWOS04+0C9Y3XKG7yciKJnAyT5P
         mRnz3HFw7UTAK7HAYboLciwL9VX4qzqBdrs2YNA4pJh9XbtjH3g1bKIb1YGgGCmTwP6Z
         C+brqWGiJHVG6vvMKUe5mRNkN98/1P928UAoPGJMXWl3mlC9Hqvu3Evc2XKXDzlz2eMm
         4onx2mOmopsl/NqCsZbuImdPEVjpreL5lAy9rVXk6ukfBYg2pgIJVUyNTEPeN9wLxu8f
         XErg==
In-Reply-To: <000a01ceaa4e$bd406c90$37c145b0$@hnup.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: podo <podo@hnup.de>, netfilter@vger.kernel.org

Hi,

IMHO, you shouldn't try to limit the packets only with a single ACCEPT
rule (this doesn't work in most cases).
Your "icmp limit" rule isn't limiting anything - only indicates which
icmp-echo frequency will be authorized. So, when authorized by limit
rule, the following icmp-echo sequences will be considered
established.

To set packet limits, make this in a new chain.

iptables -N icmplimit
iptables -A icmplimit -m limit --limit 8/s -j ACCEPT
iptables -A icmplimit -j DROP

iptables -A INPUT -p icmp --icmp-type echo-request -j icmplimit

And it will be best if you use hashlimit.


2013/9/5 podo <podo@hnup.de>:
> Hi Phil,
> Yes, I ment the 3th rule (Established accept).
>
> Please what do you mean by "same ID" ? And is this not exactly the problem ?
> nf_conntrack is even not needed, when only the first rule is present:
> -A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT
>
> ICMP should not be tracked as established...
> In my opinion the behaviour is not correct.
>
> Podo
>
> -----Original Message-----
> From: Phil Oester [mailto:kernel@linuxace.com]
> Sent: 05 September, 2013 17:12
> To: podo
> Cc: 'netfilter'
> Subject: Re: Limit rule for ICMP not working properly?
>
> On Thu, Sep 05, 2013 at 04:58:27PM +0200, podo wrote:
>> Hi,
>>
>> the default is DROP:
>>
>> iptables -L -n -v
>> Chain INPUT (policy DROP 314 packets, 98684 bytes)
>> pkts bytes target     prot opt in     out     source
>> destination
>>   963 66540 ACCEPT     tcp  --  *      *       0.0.0.0/0
>> 0.0.0.0/0
>>    29  1740 ACCEPT     icmp --  *      *       0.0.0.0/0
>> 0.0.0.0/0            icmptype 8 limit: avg 1/sec burst 5
>>    39  2836 ACCEPT     all  --  *      *       0.0.0.0/0
>> 0.0.0.0/0            state ESTABLISHED
>>
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>> pkts bytes target     prot opt in     out     source
>> destination
>>
>> Chain OUTPUT (policy ACCEPT 5384 packets, 387K bytes)
>> pkts bytes target     prot opt in     out     source
>> destination
>>
>> The problem is, that the second rule gets hit, even if it shoud not (my
>> opinion). ICMP can not be "established". Or ?
>
> I think you mean _third_ rule in the above example.  When you successfully
> ping the box, an entry is added to /proc/net/nf_conntrack.  Until that
> entry expires (30 seconds by default for icmp), then any additional icmp
> packet with the same ID will match that conntrack entry and be considered
> "established".
>
> Wait > 30 seconds between (single) pings and you should not see the
> established
> rule hitcount increasing.
>
> Phil
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
