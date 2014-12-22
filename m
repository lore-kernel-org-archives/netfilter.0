From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Mon, 22 Dec 2014 16:15:56 -0500
Message-ID: <CAPJdpdARE6kEFj4LNK=xsFftirQ4g5_8+Mv=+wQ=eK6CgjS_0A@mail.gmail.com>
References: <CAPJdpdD+Ziiy_keV=Re92-v53PtMA8N7XK6rKXYHvzj3QJcOQg@mail.gmail.com>
	<14852223.382712.1419261854310.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=7ArQQRveGASnbllsuY1tzOSuMmwDpUDmCIce3o1cq+A=;
        b=eX8oNwpCaPs2gG6hmVU8LQGBqY7/ISaVEu6mUdpdYYlxSrex3WIOSttgbpsiuMCzX+
         zD4IrvsrK2VTowIh/okfVbiyGmfSQXN6PLpdvBjG3Yc9Hm3Gr1qDW2yyp43P61mcVSjj
         njxU+ErVAt9/6qOWuSBC3RH+VZL7zsuQMfteAsH01pqMnPisWFxu1DrUV03sTnTOh5FM
         /zwbc9H6HkS+Ia6ssSviT6i2uS4Qt6wjVqpR/LnV5NDaCDlt28UA6wVF4A5+nH61jFNw
         1pGKMhUO8CZ/5wPfKcWgR+dNCWdAk+B45LrWqMd3aO2t/VXPvbp+j3RZbg4qOUT6ppVg
         qPZw==
In-Reply-To: <14852223.382712.1419261854310.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Nelson <tnelson@rockbochs.com>
Cc: netfilter <netfilter@vger.kernel.org>

unfortunately no.

The problem you have unfortunately requires you to use two physical
untagged interfaces according to every test I've done in the past.


The only thing Ive found related but not exactly what you are doing is
this from http://ebtables.netfilter.org/misc/brnf-faq.html but on the
surface it almost the opposite of what you want to do but may work.
You could try then adding the base interface and the vlan interface to
the bridge, I haven't tested it so I can not be sure. Also what this
means is that 3rd vlan you don't want to bridge may need special
handling as well.

quote from " http://ebtables.netfilter.org/misc/brnf-faq.html"
"
How do I let vlan-tagged traffic go through a vlan bridge port and the
other traffic through a non-vlan bridge port? Suppose eth0 and eth0.15
are ports of br0. Without countermeasures all traffic, including
traffic vlan-tagged with tag 15, entering the physical device eth0
will go through the bridge port eth0. To make the 15-tagged traffic go
through the eth0.15 bridge port, use the following ebtables rule:

ebtables -t broute -A BROUTING -i eth0 --vlan-id 15 -j DROP

With the above rule, 15-tagged traffic will enter the bridge on the
physical device eth0, will then be brouted and enter the bridge port
eth0.15, the vlan header will be stripped, after which the packet is
bridged. The packet thus enters the BROUTING chain twice, the first
time with input device eth0 and the second time with input device
eth0.15. The other chains are only traversed once. All other traffic
will be bridged with input device eth0.
"
That said I still think you will need to split the traffic across 2
physical interfaces to make this work, and I think it needs a revers
matching rule to make the communications work in both directions.


On Mon, Dec 22, 2014 at 10:24 AM, Tim Nelson <tnelson@rockbochs.com> wrote:
> ----- Original Message -----
>> I get the scenario but not the why. Is it a subset of specific things
>> you need to do a layer 2 bridge for or do you need it for something
>> else.
>>
>> For example I have a firewall where I need to forward broadcast
>> (255.255.255.255,xxx.xxx.xxx.255) messages between different segments
>> in the network. Most people would think of bridging for this but I
>> did
>> something completely different involving setting both interfaces to a
>> /32, adding a static route for each subnet, adding a static arp table
>> entry on each interface for the broadcast IP addresses mapped to the
>> broadcast mac addresses then simple iptables rules.
>>
>
> Greetings Paul-
>
> I believe you mentioned this previously. While the mechanism is 'different', does the end result still operate the same, allowing a device on one interface to have an IP from the other interface, and still operate as though a bridge was in place?
>
> Thank you,
>
> --Tim
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
