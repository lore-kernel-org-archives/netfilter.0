From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 11:09:35 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111301108410.19102@frira.zrqbmnf.qr>
References: <jb4nnu$s0u$1@dough.gmane.org> <1322640465.2816.16.camel@ice-age.regit.org> <jb4qts$gsp$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jb4qts$gsp$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-11-30 09:53, U.Mutlu wrote:

> Eric Leblond wrote, On 2011-11-30 09:07:
>> Hello,
>>
>> Le mercredi 30 novembre 2011 =C3=A0 08:58 +0100, U.Mutlu a =C3=A9cri=
t :
>>> nfq_set_verdict() or nfq_set_verdict2():
>>>    NF_DROP    discard the packet
>>>    NF_ACCEPT  the packet passes, continue iterations
>>>
>>> In my callback I pass NF_ACCEPT to let the packet continue its trav=
el
>>> through the subsequent rules (normal iptables rules).
>>
>> When NF_ACCEPT is issued, the packet is accepted for the current tab=
le.
>> It will then only be checked by rules in other tables.
>
> I need to just inspect the hdrs and then let it continue its usual wa=
y.
> What is needed to realize this functionality?

=46iguring out a way what to do with the packet if the ruleset changes=20
while the packet is out in userspace for an indefinite time.
