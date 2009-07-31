From: Andrew Clayton <andrew@digital-domain.net>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 21:52:35 +0100
Message-ID: <20090731215235.06a83d26@digital-domain.net>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
	<1249056381.27177.12.camel@enterprise.ims-firmen.de>
	<20090731172419.669eb256@zeus.int.pccl>
	<1249062563.27177.25.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1249062563.27177.25.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org, Robby Workman <rw@rlworkman.net>

On Fri, 31 Jul 2009 19:49:23 +0200, Thomas Jacob wrote:

> Ah yes, the ssh  server is on a DNATed internal machine, sorry about.
> 
> In that case you need to SNAT your request to the local machine as
> well, and also keep the original DNAT rule:
> 
> So:
> 
> $IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
> $HOST_E --dport 22 -j DNAT --to-destination $HOST_I
> 
> +
> 
> $IPTABLES -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/16 -p tcp -d
> $HOST_I --dport 22 -j SNAT --to-destination <Internal-Router-IP>
> 
> 
> should get you there.
> 
> Just tried that on a similar setup and it worked well for me, I can
> ssh to myself via the NAT router by contacting the NAT routers public
> IP ;)

Thanks again, but after trying this and numerous variations I still
can't make this work, and I've read plenty of other stuff that says to
do what you say, but no cigar :(

It's annoying and I'd like to get it working at the firewall. But for
now I think I'm going to take Robby's advice and have a look at split
views with Bind. This also does seem to be the recommended way to do it.

Still, I must have learnt something from all this! ;)

Cheers,
Andrew
