From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: About using -i with MASQUERADE
Date: Fri, 29 Jan 2016 12:26:02 +0100
Message-ID: <56AB4C4A.7020709@chello.at>
References: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
 <56AB3AAC.9060907@atc.tcs.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56AB3AAC.9060907@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: Fabio Pedretti <fabio.pedretti@unibs.it>, netfilter@vger.kernel.org

On 29.01.2016 11:10, Vigneswaran R wrote:
[...]
>
> In the FORWARDING chain, you can mark the packets based on incoming
> Interface. Then use the mark to MASQUERADE the packets at the
> POSTROUTING chain. eg.,
>
> -t nat -A FORWARD -i eth3 -j MARK --set-mark 0xffff
> -t nat -A POSTROUTING -m mark --mark 0xffff  -j MASQUERADE
>
> (I hope this should work. However, I haven't tried this by myself.)
>
> Vignesh


Hello,

there is no FORWARD chain in the nat table. And marking in the nat table 
will only mark packets of conntrack state NEW.
Better do the marking in the mangle or filter table.

Best regards,

Mart

