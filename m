From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Sun, 12 Jul 2009 19:02:32 +0100 (WEST)
Message-ID: <2487.87.196.17.191.1247421752.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
    <4A48B3F4.8000705@trash.net>
    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
    <4A48B97C.1060803@trash.net>
    <3238.192.168.1.3.1247247415.squirrel@webmail.decimal.pt>
    <4A58C81E.4010606@trash.net>
    <2026.87.196.17.191.1247346190.squirrel@webmail.decimal.pt>
    <4A59F314.6010309@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A59F314.6010309@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

>> Let me see if i can explain myself.
>> When I'm on a call, and the person for the other side ends the call, the
>> sessions remains active.
>> Without loadling the modules, it works fine.
>
> That sounds like some packets are dropped by the helper. You could
> try this patch in combination with ulogd(2) to capture the packet
> in pcap format.

Patrick,
I can test that, you just have to explain to me how to i get that pcap
file for you.
I have no idea how... i'm not familiar with that!
I'm going to patch kernel with your patch as you tell me howto get the
pcap file.

Jorge,

