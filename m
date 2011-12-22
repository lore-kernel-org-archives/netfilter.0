From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering on bridges
Date: Thu, 22 Dec 2011 23:05:10 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112222302410.28561@frira.zrqbmnf.qr>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com> <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
 <4EF30CCC.4090703@opendium.com> <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr> <4EF36A9A.3040803@opendium.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EF36A9A.3040803@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Hill <steve@opendium.com>
Cc: netfilter@vger.kernel.org


On Thursday 2011-12-22 18:36, Steve Hill wrote:

> On 22/12/11 16:28, Jan Engelhardt wrote:
>
>>>So at the moment, the only way I can think of doing the filtering
>>>is to allow the packet to run through *all* the iptables rules
>>>without matching the physical output NIC and set one bit of the
>>>fwmark for each physical interface I would let the packet egress.
>>>Then in ebtables (where we know the physical interface) filter the
>>>packets by looking at the fwmark bit that I've used to indicate
>>>that interface. This method is pretty unscalable (fwmark is 32
>>>bits)
>>
>>As for filtering, which I had gathered was what you wanted, you
>>could set the fwmark to indicate drop-or-not-drop (rather than a
>>bit for each interface).
>
>Nope, can't do that - the iptables rules aren't going to know
>whether the packet needs to be dropped or not since it doesn't know
>which physical NIC it will egress

What I mean is that with the mark, you record whether this is a
potential candidate for dropping. E.g. if

  tcp 22 eth0 -> drop, tcp 22 eth1 -> accept

you could

  -A OUTPUT -o br0 -p tcp --dport 22 -j MARK --set-mark [ssh-candidate-bit]
  ebtables -m mark --mark ssh-candidate-bit/ssh-candidate-bit -o [eth0/eth1] -j [DROP/ACCEPT]...
