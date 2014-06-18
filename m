From: =?UTF-8?B?w4FsdmFybyBOZWlyYSBBeXVzbw==?= <alvaroneay@gmail.com>
Subject: Re: Aw: Re: Problems to get started with nftables
Date: Wed, 18 Jun 2014 13:10:41 +0200
Message-ID: <53A173B1.3030308@gmail.com>
References: <trinity-3a9fb6b3-7e0d-45aa-b7a5-6be4a31a2a5d-1402931994020@3capp-gmx-bs50>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=NTsnx0MqdrSJyUJvxrCAob446w6wRbv63qFyBCeIkD4=;
        b=ZNspr1MRAXIZesMmAeGHqWKV4KJpb6sZI0rImQNUQ5cP/0ApvppVtT5YE5mAcfLfzT
         /PGd8dKs+7Qs0JhQqlAnoWC9uqBJb/5P6nR3WuZ3maIGIEW0hbFDHfUSugJHydApUXhN
         PS+/eloWxA/dZIDbc0DWqsPfdNfKh8azFaFm9oOuuv4ieVIlyPFU4mPPwbuRO6jQ7Wun
         LktnVFKoV+9uqG09GCYdh+z+O2dJY/W9Hj80A6l/WSNekrpWrD5qCXCTbkHZCRclO1/u
         FOW5RHneNzIYewvUVMH4JB2bXmQCQJZXX2rZ9bs6qHt41bAWqyqruH4WX03MfZCR2Kam
         IBBg==
In-Reply-To: <trinity-3a9fb6b3-7e0d-45aa-b7a5-6be4a31a2a5d-1402931994020@3capp-gmx-bs50>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: pistenflitzer@alpenjodel.de
Cc: netfilter user mailinglist <netfilter@vger.kernel.org>

Dear Michael

El 16/06/14 17:19, pistenflitzer@alpenjodel.de escribi=C3=B3:
> Dear =C3=81lvaro,
>
> thank you for your detailed answers. Some questions still remain, unf=
ortunately.
>
>>>                    icmp type { echo-request } limit rate 5/second c=
ounter accept
>>                              ^^^^^^^^^^^^^^^^
>> It's a single element, you don't need to use a set. You can use the =
rule
>
> I just added the braces to be consistent throughout the ruleset.

Ok, if you want to do that but the kernel creates a set with only one=20
element (in your case). It's overkill.

>
>>> What I observe when I load these rules is that the accept in the lo=
g1 line is
>>> not enough to accept the packets. They are ultimately dropped in th=
e log3
>>> rule. How do I get the packets through both rule chains?
>>
>> Because you have a table inet and a table ip6. The table ip6 filter
>> sees the ip6 traffic and the table inet filter sees the ip4 and ip6
>> traffic. You have defined the priority of the first chain at 0 so
>> nftables checks the rules there and after nftables checks the rules
>> inside of the filter chain in inet.
>>
>> I suggest you to use one singles filter table like inet.
>
> How would the rule look like? I tried to just copy it to the inet sec=
tion,
> but I get "Error: conflicting protocols specified: inet-service vs. i=
cmpv6".
>
> I created the separate ip and ip6 tables only for icmp and icmp, beca=
use I
> couldn't get past this issue:
> $ nft add rule inet filter input icmp type { echo-request } limit rat=
e 5/second counter accept
> <cmdline>:1:28-36: Error: conflicting protocols specified: inet-servi=
ce vs. icmp
> $ sudo nft add rule inet filter input icmpv6 type { echo-request } li=
mit rate 5/second counter accept
> <cmdline>:1:28-38: Error: conflicting protocols specified: inet-servi=
ce vs. icmpv6
> $ nft add rule ip6 filter input icmpv6 type { echo-request } limit ra=
te 5/second counter accept
> <works>

You have found a bug. A temporary solution is use the rules adding meta=
=20
nfproto, for example:

nft add rule inet filter input meta nfproto ipv4 \
	icmp type echo-request counter accept

nft add rule inet filter input meta nfproto ipv6 \
	icmp6 type echo-request counter accept

I'm working in a fix for that.

>
>>> #                 udp sport bootps dport bootpc accept
>>
>> The rules is like that:
>>
>> nft add rule filter input udp sport bootps udp dport bootpc accept
>
> OK, I overlooked the second udp. Now, it works fine.
>
>>> And finally: Is there a way to match the destination mac address of=
 an
>>> incoming packet?
>>
>> You must to add a rule with ether like this:
>>
>> nft add rule filter input ether daddr 20:16:d8:a2:59:33 counter
>
> In what section would that go? When I just execute the command, I get=
:
> "<cmdline>:1:1-59: Error: Could not process rule: No such file or dir=
ectory
> add rule filter input ether daddr 20:16:d8:a2:59:33 counter"

If you follow this trace:

nft add table filter
nft add chain filter input { type filter hook input priority 0 \; }
nft add rule filter input ether daddr 20:16:d8:a2:59:33 counter

it works for me. Try it and tell me if you have problem. Maybe you have=
=20
forgot to add the table or the chain?

Regards

=C3=81lvaro
