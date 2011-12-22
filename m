From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering on bridges
Date: Thu, 22 Dec 2011 17:28:00 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com> <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
 <4EF30CCC.4090703@opendium.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EF30CCC.4090703@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Hill <steve@opendium.com>
Cc: netfilter@vger.kernel.org


On Thursday 2011-12-22 11:56, Steve Hill wrote:
>>
>> But the kernel knows, and that's really all that is needed.
>
>I think we have a misunderstanding somewhere:
>[...]

>Looking at nf-packet-flow.svg, [...] the direction of the link
>between "routing decision" and "bridging decision" seems ambiguous
>to me).

In that graphic, when there is a choice, the network stack will pick
only one.

>[..]
>So at the moment, the only way I can think of doing the filtering is to allow
>the packet to run through *all* the iptables rules without matching the
>physical output NIC and set one bit of the fwmark for each physical interface I
>would let the packet egress.  Then in ebtables (where we know the physical
>interface) filter the packets by looking at the fwmark bit that I've used to
>indicate that interface. This method is pretty unscalable (fwmark is 32
>bits)

As for filtering, which I had gathered was what you wanted, you could 
set the fwmark to indicate drop-or-not-drop (rather than a bit for each 
interface). As for QoS though, indeed there is a little issue.

>So any other good ideas for how to accomplish this filtering?  (I 
>understand the reasons for removing the physdev-out support for 
>unbridged traffic, but why on earth hasn't it been replaced with 
>something to do a similar job, such as an additional iptables chain 
>after the bridging decision rather than wholesale removing a useful 
>feature?)

Checking the source for possibilities..
