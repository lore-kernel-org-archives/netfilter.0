From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Wed, 05 Nov 2008 09:56:15 -0600
Message-ID: <4911C21F.5000907@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com> <018001c93f06$6d8869e0$48993da0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <018001c93f06$6d8869e0$48993da0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/04/08 23:21, Rob Sterenborg wrote:
> Grant is doing too good a job... :-)

Thank you.  :)

> Since these IP's are all private you do NOT need NAT.

Agreed.

> Do NOT use NAT in this situation unless you tried plain routing and for 
> some fancy reason, strange situation or requirement you find out you 
> might actually need NAT here. But in your case I don't think you will 
> come to that conclusion unless there's something you haven't told us yet 
> (again: I don't think so).

Agreed.

> Just enable and allow all forwarding, add the routes you need and your 
> magic box will shine like a magic lantern. :^)

Um, mostly agreed.

> iptables -P FORWARD ACCEPT
> iptables -F FORWARD
> echo 1 > /proc/sys/net/ipv4/ip_forward
> route add -net [...etc...]

The part that I want to point out is that the routes that you add will 
not be on the Linux router, but rather the systems on the networks.

Let's look at this example.


          :
        +-+-+         +---+
        | C +---(z)---+ 3 |
        +---+    |    +---+
                 |
   :             |             :
+-+-+         +-+-+         +-+-+
| A +---(x)---+ R +---(y)---+ B |
+---+    |    +---+    |    +---+
          |             |
+---+    |             |    +---+
| 1 +----+             +----+ 2 |
+---+                       +---+

Let's say that this is three independent networks (x, y, and z) with 
their own internet connections (A, B, and C) that you are trying to tie 
together with the Linux router (R).  Each host (1, 2, and 3) will use 
their own internet router (A, B, and C respectively) as their default 
gateway.

One of two things will happen when host 1 wants to talk to host 3.
  1)  Host 1 will not have a route to network z that host 3 is on, so 
host 1 will send the traffic to its default gateway A which would have 
to have a route to send the traffic to router R.
  2)  Host 1 will have a route to network z by way of router R and send 
traffic directly to router R which will then send the traffic to host 3.

> No, this is not secure, but that's not what we're talking about here. 
> This way, your box will effectively be a router. No fancy filtering, 
> NAT-ing, whatever.

Correct.  However that is not to say that filtering and / or NATing 
can't be added if you want to, because they can when you are ready / 
want to do something like that.

> Have a look at http://www.fwbuilder.org/. 
> I'm not using it, I'm not endorsing it, don't know anything of how it 
> builds it's ruleset, etc. It just looks nice if you're coming from MS 
> ISA and you might actually find it handy.

With out having ever used (but have heard of) FWBuilder my self I can't 
comment on it.  However considering how Daniel is asking how things work 
and appears to be trying to learn, I don't think jumping directly in to 
some sort of application that hides this knowledge from him is that good 
of an idea.



Grant. . . .
