From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Sun, 20 Nov 2011 08:25:44 -0600
Message-ID: <op.v48006r2x1lyi3@debiandesk2.net>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
 <1321480803.2382.62.camel@andybev-desktop> <op.v419zu1bx1lyi3@debiandesk2.net>
 <1321796319.2382.948.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321796319.2382.948.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

On Sun, 20 Nov 2011 07:38:39 -0600, Andrew Beverley <andy@andybev.com> wrote:

> On Wed, 2011-11-16 at 16:56 -0600, Lloyd Standish wrote:
>> Can I assume from your comments that you think queuing in the router
>>  should not cause big latency problems as long as interactive traffic
>>  is given highest priority?
>
> My personal opinion is that it should be okay, although depends what you
> define as "big latency". I've been running the rules previously
> described for a while now, and whilst they're not perfect, the latency
> is minimal (I comfortably use SSH whilst the link is saturated).
>
> You might also want to check out some of the "buffer bloat" discussions:
>
> http://netoptimizer.blogspot.com/
>
> http://gettys.wordpress.com/2010/12/03/introducing-the-criminal-mastermind-bufferbloat/
>
> Andy
>

Hi Andy,
Thanks much for your insights, and for the "buffer bloat" links.

We will be implementing per-user bandwidth-limiting in a couple of weeks.  However, for the moment I was (urgently) asked to skip the bandwidth-limiting and just get a load-balancing router going with some traffic shaping.  That allowed me to stop using qdiscs on the LAN interface.  I have an HTB qdisc on egress of each outward-facing interface, and a policing qdisc on each ingress.

It appears to be load-balancing OK, using "nexthop" to multiple routing tables in the default route, but I can't set a default route in each of the "custom" routing tables.  (See my other thread.)

--
Lloyd
