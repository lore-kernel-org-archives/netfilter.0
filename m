From: Kerin Millar <kfm@plushkava.net>
Subject: Re: IP Addresses Changed to Hostnames in IPTables
Date: Mon, 28 Jun 2021 21:58:11 +0100
Message-ID: <20210628215811.55a87828961dcd87ae1f4612@plushkava.net>
References: <bda96448-fbd7-0c99-1bff-c3776bdfafff.ref@att.net>
        <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
        <20210628213643.468805a4c8f262984ee530a6@plushkava.net>
        <cb8649b5-a2aa-8101-7701-9fc13e2f5db0@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        5hnvgKk8HpCp76VGtv0Bp2g/VXcujJtk3FeiEEUjhzo=; b=pqLxpKa2ZFv4Nb6R
        /8xVLHBA349EXhkwnHmJopbtHG6Q6w4A5i+rS/MIfrIA0JOOyWKarkiu1dri08hb
        IZhKHtyk1kKDpL+o93HJatxsjNYPcNNvSGIpMGnfq3prG/MAOXguxb00hiGau6bH
        PYpVLbZ+01+gCHRDyhcKqjPhF47raGAUka94ottuTPa0a4EqM3p8NNU2vRlPAGUE
        qkhTkD54xIJYhujiWFk4CtjbrtQQSQj5WURItktLirP3geZT1eHTfwASD21IeobJ
        9MNS4aZUu9Tv6Lq8yrz9RHaKjRpfw3eoO/cfKohAZSLMIj72GVcnq/1R2kjyigey
        R3FZtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=5hnvgKk8HpCp76VGtv0Bp2g/VXcujJtk3FeiEEUjh
        zo=; b=k4p2zoWN/MyIH+XwVZbgd8X2VDC32SDvLf5WlGxYDGd2pcShqWFfKavoS
        warisY284iq3utwv+gGuFSxNtKyve5AWg0A+P0wQhGYTWhma4KXHnNu/nqd5qZdN
        pslsY2pfyPP0T86JurZxh56MaNvHCCmfrPkN1aqkk8ZoIL8m+ZZ48FvDsTxlre9N
        BIF2fgqrSb5KUp/GXtl5FObsICk45CShS4pteZmhbcoG7zBfFCO1m5FIhtPzwcCN
        b1ZsM1rKn2m5mr67S9Cn+0xvBtqiMzDK+15YqGvEx3FYCfiqB9/49pZaFQpn8uer
        j4i5Xe00+oicwtNCR8y1xu8tjazJw==
In-Reply-To: <cb8649b5-a2aa-8101-7701-9fc13e2f5db0@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

On Mon, 28 Jun 2021 16:47:46 -0400
slow_speed@att.net wrote:

> On 6/28/21 4:36 PM, Kerin Millar wrote:
> > On Mon, 28 Jun 2021 15:57:30 -0400
> > slow_speed@att.net wrote:
> > 
> >> I created a ruleset in iptables and it was saved in
> >> /etc/iptables.up.rules as expected.  However, when viewing the file, all
> >> IP addresses had been translated to hostnames.
> >>
> >> Why would it ever do such a thing, when I had entered them as IP
> >> addresses and they would have to be converted to IP addresses anyway?
> > 
> > Here's how it works. One may supply hostnames to iptables/iptables-restore but they will be resolved at the point that the rule/ruleset is loaded into the kernel. If using `iptables -L` to list the currently loaded ruleset, reverse DNS lookups will be performed upon IP addresses before displaying. This behaviour can be suppressed by also using the -n option. As for `iptables -S` and `iptables-save`, neither of these will perform reverse DNS lookups.
> > 
> > In summary, it's not at all clear how you ended up with hostnames in your iptables.up.rules file. Can you reduce this phenomonen to a simple, well-defined test case?
> > 
> 
> Okay, I was incorrect.  The viewing of the file showed just numbers.  It 
> was the iptables -L that caused the misinformation.  It should 
> definitely default to -n.  That is a big issue to the new person in this 
> area.  Bad programming strikes again.
> 
> Thank you so much for pointing that out.  I will add that to my 
> instructions.

The -L format is deficient in several respects. About the only thing it's good for is displaying counters (with -v), yet iptables-save already does this. My suggestion would be to avoid -L outright. If you want to list rules with iptables instead of iptables-save, the -S option is much more useful.

Also, please use Reply All next time. I am adding the list back to the CC field.

-- 
Kerin Millar
