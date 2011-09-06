From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Altering outgoing IP Address without Connection Tracking
Date: Wed, 7 Sep 2011 06:10:02 +0700
Message-ID: <CAA2qdGWh6ofrFfee5v+_fxsinM2pi2PWq4C2zrjNqDVxyhTUBA@mail.gmail.com>
References: <4E66A5B8.4030700@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E66A5B8.4030700@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Burroughs <chris.burroughs@gmail.com>, netfilter@vger.kernel.org

(Sorry for top posting; Gmail java mobile client sucks)

IIRC, You can do stateless NAT using iproute2.

Rgds,


On 2011-09-07, Chris Burroughs <chris.burroughs@gmail.com> wrote:
> I'd like to alter the outgoing IP address (from internal to external LB)
> on all packets sent on a specific port, without incurring the overhead
> of running conntrack.  DNAT of course requires conntrack. But I can't
> think of a reason why this simple substitution would require stateful
> representation of packet flows.  I was able to find one reference to
> someone trying to mange the RAW packets [1] in 2008, but apparently
> without success.
>
> Is it currently possible to alter outgoing IP addresses without
> connection tracking?
>
> [1]
> http://www.linuxquestions.org/questions/linux-networking-3/iptables-notrack-670012/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
