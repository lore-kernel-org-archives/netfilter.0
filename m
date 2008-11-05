From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Basic Routing
Date: Wed, 5 Nov 2008 19:22:58 +0100
Message-ID: <9C4B6E684A354E9B8C325F30A70EC501@dcyb.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com> <018001c93f06$6d8869e0$48993da0$@info> <4911C21F.5000907@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4911C21F.5000907@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter list' <netfilter@vger.kernel.org>

>> Grant is doing too good a job... :-)
> 
> Thank you.  :)

You're welcome.. Heheh.

>> Just enable and allow all forwarding, add the routes you need and
>> your magic box will shine like a magic lantern. :^)
> 
> Um, mostly agreed.

You mean you don't agree to the shining part?

>> iptables -P FORWARD ACCEPT
>> iptables -F FORWARD
>> echo 1 > /proc/sys/net/ipv4/ip_forward
>> route add -net [...etc...]
> 
> The part that I want to point out is that the routes that you
> add will not be on the Linux router, but rather the systems on
> the networks.

Yes, well, in the basic example I was refering to (A <-> C <-> D <-> B),
routers C and D already know the routes to the networks they're connected to
(and I assume that hosts in A and B have a (default) route to C and D resp)
so they don't need extra routes. But they do need forwarding set to ACCEPT
and allowed. In a more complex situation things are different.

>> Have a look at http://www.fwbuilder.org/.
>> I'm not using it, I'm not endorsing it, don't know anything of how it
>> builds it's ruleset, etc. It just looks nice if you're coming from MS
>> ISA and you might actually find it handy.
> 
> With out having ever used (but have heard of) FWBuilder my self I
> can't comment on it.  However considering how Daniel is asking how
> things work and appears to be trying to learn, I don't think jumping
> directly in to some sort of application that hides this knowledge from
> him is that good of an idea.

No, I don't think so too. I already pointed him to Oskars iptables tutorial
which I think still mostly holds and I hope he'll read (and understand) it.
Writing your own script is still more flexible and you learn more about what
you're doing and dealing with.


Grts,
Rob

