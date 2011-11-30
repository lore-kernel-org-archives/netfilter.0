From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: [nfqueue] verdict NF_ACCEPT doesn't continue
Date: Wed, 30 Nov 2011 19:34:31 +0100
Message-ID: <4ED67737.6030803@mutluit.com>
References: <jb4nnu$s0u$1@dough.gmane.org> <1322640465.2816.16.camel@ice-age.regit.org> <jb4qts$gsp$1@dough.gmane.org> <alpine.LNX.2.01.1111301108410.19102@frira.zrqbmnf.qr> <jb5j7j$7bh$1@dough.gmane.org> <8509432a-b261-412c-8688-705014007520@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8509432a-b261-412c-8688-705014007520@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Eric Leblond <eric@regit.org>

Eric Leblond wrote, On 2011-11-30 17:09:
> Hello
>
>
> "U.Mutlu"<for-gmane@mutluit.com>  a =C3=A9crit :
>
>> Jan Engelhardt wrote, On 2011-11-30 11:09:
>>> On Wednesday 2011-11-30 09:53, U.Mutlu wrote:
>>>
>>>> Eric Leblond wrote, On 2011-11-30 09:07:
>>>>> Hello,
>>>>>
>>>>> Le mercredi 30 novembre 2011 =C3=A0 08:58 +0100, U.Mutlu a =C3=A9=
crit :
>>>>>> nfq_set_verdict() or nfq_set_verdict2():
>>>>>> NF_DROP discard the packet
>>>>>> NF_ACCEPT the packet passes, continue iterations
>>>>>>
>>>>>> In my callback I pass NF_ACCEPT to let the packet continue its
>> travel
>>>>>> through the subsequent rules (normal iptables rules).
>>>>>
>>>>> When NF_ACCEPT is issued, the packet is accepted for the current
>> table.
>>>>> It will then only be checked by rules in other tables.
>>>>
>>>> I need to just inspect the hdrs and then let it continue its usual
>> way.
>>>> What is needed to realize this functionality?
>>>
>>> Figuring out a way what to do with the packet if the ruleset change=
s
>>> while the packet is out in userspace for an indefinite time.
>>
>> Sorry, Jan, I don't get it. Why do you say the ruleset changes, it
>> doesn't IMO.
>
> The fact ruleset can change is a generic problem that explain the lac=
k of a real return.
>
>>
>> I must be missing some important API-information I guess, if even su=
ch
>> a simple thing like reading the payload hdrs is not possible
>> w/o disturbing the normal flow.
>>
>> I tried also NF_QUEUE, but the net result is the same like NF_ACCEPT=
,
>> not what I need.
>> I need a simple "NF_RETURN", but that is undefined...
>
>
> Looks like you could use a sniffing library like pcap?
>
> For advanced usage of nfq you can have a look at http://home.regit.or=
g/2011/04/some-new-features-of-ips-mode-in-suricata-1-1beta2/
>
> BR,


I finally managed to get it working by marking the currently processed =
pkt and
reinjecting it with NF_REPEAT. This seems to do what I wanted/needed; s=
till testing...

