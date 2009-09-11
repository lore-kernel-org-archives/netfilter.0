From: Michal Soltys <soltys@ziu.info>
Subject: Re: SFQ hash question
Date: Fri, 11 Sep 2009 17:12:54 +0200
Message-ID: <4AAA68F6.6020804@ziu.info>
References: <0322d4853c39162f0819db9263a210ed@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0322d4853c39162f0819db9263a210ed@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

Julien Vehent wrote:
> 
> OK for "h" and h2" before the "if", but what does this "if
> (!(iph->frag_off&htons(IP_MF|IP_OFFSET))" really does?
> 

It checks whenever the packet is not a fragment. htons(IP_MF|IP_OFFSET) 
functions as a mask which is and'ed with frag_off (which covers both fragment 
offset and "more fragments" flag).

> And, also, I'm not sure about this: "h2 ^= *(((u32*)iph) + iph->ihl);"
> 
> Does it XOR h2 with the first 32 bits of the L4 protocol header ?
> 

Yes. Excluding ESP, it basically means source and destination port (if L3's payload 
is not a fragment, thus the previous test).

Btw - if you need better control of what contributes to hash used by sfq, check out 
flow filter:

http://marc.info/?l=linux-netdev&m=120180241422360&w=2

