From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Filtering on bridges
Date: Fri, 23 Dec 2011 10:03:29 +0530
Message-ID: <4EF40499.3020005@atc.tcs.com>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com> <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr> <4EF30CCC.4090703@opendium.com> <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr> <4EF36A9A.3040803@opendium.com> <alpine.LNX.2.01.1112222302410.28561@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1112222302410.28561@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Hill <steve@opendium.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Friday 23 December 2011 03:35 AM, Jan Engelhardt wrote:
>
> On Thursday 2011-12-22 18:36, Steve Hill wrote:
>
>> On 22/12/11 16:28, Jan Engelhardt wrote:
>>
>>>> So at the moment, the only way I can think of doing the filtering
>>>> is to allow the packet to run through *all* the iptables rules
>>>> without matching the physical output NIC and set one bit of the
>>>> fwmark for each physical interface I would let the packet egress.
>>>> Then in ebtables (where we know the physical interface) filter the
>>>> packets by looking at the fwmark bit that I've used to indicate
>>>> that interface. This method is pretty unscalable (fwmark is 32
>>>> bits)
>>>
>>> As for filtering, which I had gathered was what you wanted, you
>>> could set the fwmark to indicate drop-or-not-drop (rather than a
>>> bit for each interface).
>>
>> Nope, can't do that - the iptables rules aren't going to know
>> whether the packet needs to be dropped or not since it doesn't know
>> which physical NIC it will egress

Sorry for interrupting your discussion. I am following this thread from 
the beginning. However, I couldn't get exactly how your setup looks 
like. If possible, could you please give a simple (ascii) pictorial 
representation of your setup. This may help more people (normal iptable 
users like me) to understand the discussion better. Thank you.

Regards,
Vignesh


>
> What I mean is that with the mark, you record whether this is a
> potential candidate for dropping. E.g. if
>
>    tcp 22 eth0 ->  drop, tcp 22 eth1 ->  accept
>
> you could
>
>    -A OUTPUT -o br0 -p tcp --dport 22 -j MARK --set-mark [ssh-candidate-bit]
>    ebtables -m mark --mark ssh-candidate-bit/ssh-candidate-bit -o [eth0/eth1] -j [DROP/ACCEPT]...
