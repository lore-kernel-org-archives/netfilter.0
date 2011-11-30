From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 16:48:02 +0100
Message-ID: <jb5j7j$7bh$1@dough.gmane.org>
References: <jb4nnu$s0u$1@dough.gmane.org> <1322640465.2816.16.camel@ice-age.regit.org> <jb4qts$gsp$1@dough.gmane.org> <alpine.LNX.2.01.1111301108410.19102@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1111301108410.19102@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt wrote, On 2011-11-30 11:09:
> On Wednesday 2011-11-30 09:53, U.Mutlu wrote:
>
>> Eric Leblond wrote, On 2011-11-30 09:07:
>>> Hello,
>>>
>>> Le mercredi 30 novembre 2011 =C3=A0 08:58 +0100, U.Mutlu a =C3=A9cr=
it :
>>>> nfq_set_verdict() or nfq_set_verdict2():
>>>>     NF_DROP    discard the packet
>>>>     NF_ACCEPT  the packet passes, continue iterations
>>>>
>>>> In my callback I pass NF_ACCEPT to let the packet continue its tra=
vel
>>>> through the subsequent rules (normal iptables rules).
>>>
>>> When NF_ACCEPT is issued, the packet is accepted for the current ta=
ble.
>>> It will then only be checked by rules in other tables.
>>
>> I need to just inspect the hdrs and then let it continue its usual w=
ay.
>> What is needed to realize this functionality?
>
> Figuring out a way what to do with the packet if the ruleset changes
> while the packet is out in userspace for an indefinite time.

Sorry, Jan, I don't get it. Why do you say the ruleset changes, it does=
n't IMO.

I must be missing some important API-information I guess, if even such
a simple thing like reading the payload hdrs is not possible
w/o disturbing the normal flow.

I tried also NF_QUEUE, but the net result is the same like NF_ACCEPT, n=
ot what I need.
I need a simple "NF_RETURN", but that is undefined...

