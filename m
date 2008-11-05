From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Basic Routing
Date: Wed, 5 Nov 2008 06:21:59 +0100
Message-ID: <018001c93f06$6d8869e0$48993da0$@info>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4910E22A.4070705@amfes.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Grant is doing too good a job... :-)

> I guess here's a Linux specific question - as opposed to the more
> general IP/routing discussion we've been having.
> 
> Given a Linux box with multiple networks on one or more interfaces
> (192.168.0.1 on eth0, 192.168.5.1 on eth0:0, 172.26.0.1 on eth1,
> etc.) - and just adding a "1" to /proc/sys/net/ip_forward - will
> this magic box be able to forward packets between the networks
> without further configuration? 

Since these IP's are all private you do NOT need NAT.
Do NOT use NAT in this situation unless you tried plain routing and for
some fancy reason, strange situation or requirement you find out you
might actually need NAT here. But in your case I don't think you will
come to that conclusion unless there's something you haven't told us yet
(again: I don't think so).
Just enable and allow all forwarding, add the routes you need and your
magic box will shine like a magic lantern. :^)

So, like:

iptables -P FORWARD ACCEPT
iptables -F FORWARD
echo 1 > /proc/sys/net/ipv4/ip_forward
route add -net [...etc...]

No, this is not secure, but that's not what we're talking about here.
This way, your box will effectively be a router. No fancy filtering,
NAT-ing, whatever.

> Or will this require NAT statements from iptables (and no, this is
> NOT an opportunity to tell me about ipchains/ebtables/other-Linux-
> networking-specialty-program-kernel- interface-I-didn't-mention)?

No, it will NOT.

> Ok fine - if you can recommend a tool to make this easier - I'd be
> delighted to hear about it.  Right now my configuration tool is
> firehol.

Have a look at http://www.fwbuilder.org/.
I'm not using it, I'm not endorsing it, don't know anything of how it
builds it's ruleset, etc. It just looks nice if you're coming from MS
ISA and you might actually find it handy.


Grts,
Rob


