From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Thu, 13 Dec 2012 22:59:05 +0200
Message-ID: <CA+4D1scXWSk=jy7-H2+1WLdopASmON03a0KpKzcf=VxYkdADBQ@mail.gmail.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
	<3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
	<50B84725.3080608@nottheoilrig.com>
	<50B851E8.8070107@ngtech.co.il>
	<50BC6639.3090502@nottheoilrig.com>
	<50BC9297.3050507@ngtech.co.il>
	<50BCB80F.4090208@nottheoilrig.com>
	<CA+4D1sfikOc6BqVpGNxyYUOv-CA9j0ofSf-QJ_Fvz+JSw=SH3w@mail.gmail.com>
	<50BF1011.1050709@ngtech.co.il>
	<50BF5786.3050208@nottheoilrig.com>
	<CA+4D1sdBSzM6QKH1xrgXsG3SS1Quu63omvJtGPDyt1b1gDgiiA@mail.gmail.com>
	<50C60B48.70003@nottheoilrig.com>
	<CA+4D1sdwNr3zi41YaKDBg3x7O8k1VxnfbCy1RTDX=KsrTLKvow@mail.gmail.com>
	<50C8A1D0.9010303@nottheoilrig.com>
	<CAKTPYJT6VsNASyLN1Z4qEagSnyA5sZrBztuWr+5wqCHPoK1GmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RRZsV+dZ9BuKgT4EvEOU8gY9tDVe+jncwyumDi2cutY=;
        b=YvL9eGbeNx4zi9XjnHIAZxgSHjPaykMT1dk3beDgjbKt3YyICGIvXBpKx4tDjS5gnK
         Z85o7noKexxsZ2Wc8zLJiY5UETA9MIc4V/z3e+EXYqpIBt8Ldkxp8c8aOdlqWvW0yMwf
         7LDEtpQ8VAl6jpanr7Qk2J8E7cfCPNWatDXsOYWCiwxmmJNVw4++/ghtN7+32eDqbIfL
         Q8gByZLFgbTmc57lyVKRKnCSq0wpF9ydGdw6Geh6riEtJiuuHIJSZoEdwnVFxyfk5Krq
         f0JeUevKZevA4W2csVoEaJG9ACxv0RSSURBbbxp3ffrWyrd/QA+yI4ESyrASXjLuHxfk
         URxg==
In-Reply-To: <CAKTPYJT6VsNASyLN1Z4qEagSnyA5sZrBztuWr+5wqCHPoK1GmQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Collins <bsderandrew@gmail.com>
Cc: netfilter@vger.kernel.org

2012/12/13, Andrew Collins <bsderandrew@gmail.com>:
>> Here is the corrected script:
>>
>>
>>    1: iptables -N NEW_CONN -t mangle
>>    2: iptables -A NEW_CONN -t mangle -m tos --tos 12 -j MARK --set-mark 1
>>    3: iptables -A NEW_CONN -t mangle -m tos --tos 28 -j MARK --set-mark 2
>>    4: iptables -A NEW_CONN -t mangle -m mark --mark 0 -j MARK --set-mark
>> 3
>>    5: iptables -A NEW_CONN -t mangle -j CONNMARK --save-mark
>>    6:
>>    7: iptables -A PREROUTING -t mangle -m conntrack --ctstate INVALID -j
>> DROP
>>    8: iptables -A PREROUTING -t mangle -m conntrack --ctstate ESTABLISHED
>> -j
>> CONNMARK --restore-mark
>>    9: iptables -A PREROUTING -t mangle -m conntrack --ctstate NEW,RELATED
>> -j
>> NEW_CONN
>
> Ingress qdisc traffic is handled before conntrack has seen the
> traffic, so the mark you're restoring hasn't actually been restored at
> the time when your classifier rules are executing.  It's a general
> problem that makes ingress shaping based upon connection information
> difficult to achieve.
>
> The only way I've found to solve this is to classify directly in TC
> without the use of conntrack/marks, or use IMQ
> (http://www.linuximq.net/).  Perhaps there's a clever way to hook into
> connmark with act_ipt, but I haven't found it.
>

The traffic will be ingress on eth0.2, but it will be treated as
egress on ifb0 device.
Using ifb is a common scheme to overcome the above-mentioned limitation.



-- 
Best regards
Anatoly Muliarski
