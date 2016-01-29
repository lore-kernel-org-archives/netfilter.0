From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: About using -i with MASQUERADE
Date: Fri, 29 Jan 2016 15:40:52 +0530
Message-ID: <56AB3AAC.9060907@atc.tcs.com>
References: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabio Pedretti <fabio.pedretti@unibs.it>, netfilter@vger.kernel.org

On 01/22/2016 05:23 PM, Fabio Pedretti wrote:
> Hi, I would like to do the following:
> -t nat -A POSTROUTING -i eth3 -j MASQUERADE
>
> but I get this error:
> iptables v1.4.21: Can't use -i with POSTROUTING
>
> So I am plannig to use:
> -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
>
> However I find the latter, working solution less smarter than the
> first, non working. For example I should add rules for every network
> coming from that interface that may also change in the future.
>
> Is there a reason why -i is forbidden?

I think, the incoming interface information of a packet is not retained 
until the POSTROUTING chain. (only available upto INPUT/FORWARD chain).

> Is there a better solution than using -s?

In the FORWARDING chain, you can mark the packets based on incoming 
Interface. Then use the mark to MASQUERADE the packets at the 
POSTROUTING chain. eg.,

-t nat -A FORWARD -i eth3 -j MARK --set-mark 0xffff
-t nat -A POSTROUTING -m mark --mark 0xffff  -j MASQUERADE

(I hope this should work. However, I haven't tried this by myself.)

Vignesh
