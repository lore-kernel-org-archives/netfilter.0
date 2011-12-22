From: Steve Hill <steve@opendium.com>
Subject: Re: Filtering on bridges
Date: Thu, 22 Dec 2011 17:36:26 +0000
Message-ID: <4EF36A9A.3040803@opendium.com>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com> <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr> <4EF30CCC.4090703@opendium.com> <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1112221222570.3495@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 22/12/11 16:28, Jan Engelhardt wrote:

>> So at the moment, the only way I can think of doing the filtering is to allow
>> the packet to run through *all* the iptables rules without matching the
>> physical output NIC and set one bit of the fwmark for each physical interface I
>> would let the packet egress.  Then in ebtables (where we know the physical
>> interface) filter the packets by looking at the fwmark bit that I've used to
>> indicate that interface. This method is pretty unscalable (fwmark is 32
>> bits)
>
> As for filtering, which I had gathered was what you wanted, you could
> set the fwmark to indicate drop-or-not-drop (rather than a bit for each
> interface).

Nope, can't do that - the iptables rules aren't going to know whether 
the packet needs to be dropped or not since it doesn't know which 
physical NIC it will egress - each NIC has its own (different) set of 
filtering rules, so without knowing the NIC, iptables won't know which 
set of filtering rules to apply and therefore whether the packet is to 
be dropped or not.

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
