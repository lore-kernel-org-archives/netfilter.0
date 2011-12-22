From: Steve Hill <steve@opendium.com>
Subject: Re: Filtering on bridges
Date: Thu, 22 Dec 2011 10:56:12 +0000
Message-ID: <4EF30CCC.4090703@opendium.com>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com> <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 21/12/11 23:31, Jan Engelhardt wrote:

>>> Yes you do know where it is going; the route is set on FORWARD/OUTPUT
>>> (see nf-packet-flow.svg)
>>
>> I only know it is going to the bridge.  I don't know which member of
>> that bridge it will eventually be sent out of.  In short: I don't know
>> where it is going (in enough detail to be useful).
>
> But the kernel knows, and that's really all that is needed.

I think we have a misunderstanding somewhere:

I need to filter traffic from the local IP stack (whether that be 
locally generated or routed - lets concentrate on the locally generated 
traffic for now), and which set of iptables rules apply is to be based 
on which physical NIC the traffic will egress.

In the iptables/ip6tables OUTPUT chain, the -o option matches against 
which bridge the traffic is going to (not the physical NIC).  However, 
this is not useful because I'm interested in the physical interface, not 
the bridge interface.  I used to be able to use --physdev-out to match 
the physical NIC, but this is no longer allowed in OUTPUT.

Looking at http://jengelh.medozas.de/images/nf-packet-flow.svg, it could 
probably use some arrows to help understand the direction that some of 
the links should be followed in (the direction of the link between 
"routing decision" and "bridging decision" seems ambiguous to me). 
However, I can't see any "bridging decision" for locally generated 
traffic, so I'm not sure at what point the physical output NIC is 
determined.  I _presume_ that the bridging decision is made between 
"iptables-nat-postrouting" and "ebtables-nat-output", in which case 
there does indeed seem to be no way to match the physical output 
interface from iptables, since no iptables rules are invoked after that 
point.  I guess what is really needed is an extra iptables filter chain 
between "ebtables-nat-postrouting" and "egress".

So at the moment, the only way I can think of doing the filtering is to 
allow the packet to run through *all* the iptables rules without 
matching the physical output NIC and set one bit of the fwmark for each 
physical interface I would let the packet egress.  Then in ebtables 
(where we know the physical interface) filter the packets by looking at 
the fwmark bit that I've used to indicate that interface.  This method 
is pretty unscalable (fwmark is 32 bits long, so we're limited to 32 
interfaces, minus any other things that the fwmark will be used for, 
such as QoS) and also will be absolute hell to manage.

So any other good ideas for how to accomplish this filtering?  (I 
understand the reasons for removing the physdev-out support for 
unbridged traffic, but why on earth hasn't it been replaced with 
something to do a similar job, such as an additional iptables chain 
after the bridging decision rather than wholesale removing a useful 
feature?)

-- 

  - Steve Hill
    Technical Director
    Opendium Limited     http://www.opendium.com

Direct contacts:
    Instant messager: xmpp:steve@opendium.com
    Email:            steve@opendium.com
    Phone:            sip:steve@opendium.com

Sales / enquiries contacts:
    Email:            sales@opendium.com
    Phone:            +44-844-9791439 / sip:sales@opendium.com

Support contacts:
    Email:            support@opendium.com
    Phone:            +44-844-4844916 / sip:support@opendium.com
