From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 09:53:16 +0100
Message-ID: <jb4qts$gsp$1@dough.gmane.org>
References: <jb4nnu$s0u$1@dough.gmane.org> <1322640465.2816.16.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1322640465.2816.16.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Eric Leblond wrote, On 2011-11-30 09:07:
> Hello,
>
> Le mercredi 30 novembre 2011 =C3=A0 08:58 +0100, U.Mutlu a =C3=A9crit=
 :
>> nfq_set_verdict() or nfq_set_verdict2():
>>     NF_DROP    discard the packet
>>     NF_ACCEPT  the packet passes, continue iterations
>>
>> In my callback I pass NF_ACCEPT to let the packet continue its trave=
l
>> through the subsequent rules (normal iptables rules).
>
> When NF_ACCEPT is issued, the packet is accepted for the current tabl=
e.
> It will then only be checked by rules in other tables.

I need to just inspect the hdrs and then let it continue its usual way.
What is needed to realize this functionality?


