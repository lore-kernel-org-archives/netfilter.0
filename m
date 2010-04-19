From: Bob Miller <bob@computerisms.ca>
Subject: Re: tc/tcng default config
Date: Sun, 18 Apr 2010 18:04:37 -0700
Message-ID: <1271639077.29385.11021.camel@laplaplian>
References: <1271625400.29385.10549.camel@laplaplian>
	 <20100418234708.1474be7d@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100418234708.1474be7d@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On Sun, 2010-04-18 at 23:47 +0200, Marek Kierdelewicz wrote:
> > Hello List,
> 
> Hi Bob,

Marek,
Thank you for the response.
> 
> >If I implement something on a firewall using tc and the network goes
> >for poop, how do I get it back to the default set up?
> 
> You probably start with adding qdisc:
> tc qdisc add dev $IF root handle 1: htb default XX
> ... then you add classes and filters
> 
> You can undo all of this by deleting qdisc:
> tc qdisc del dev $IF root

To say this back to make sure I understand; I do not need to wipe my
configuration and implement a configuration that matches the default
one, rather deleting the top-most parent will delete all the children
and roll back to the way it was originally before I ran any tc commands?
> 
> If you use ifb and ingress qdiscs, cleanup may get a bit more
> complicated.

And this would imply that it is not trivial to overwrite the current
config with a default one?

> 
> Regards,
> Marek
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Bob Miller
334-7117/633-3760
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

