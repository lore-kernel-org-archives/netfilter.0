From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: tc/tcng default config
Date: Mon, 19 Apr 2010 09:02:57 +0200
Message-ID: <20100419090257.6d7c8aa5@catlap>
References: <1271625400.29385.10549.camel@laplaplian>
	<20100418234708.1474be7d@catlap>
	<1271639077.29385.11021.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1271639077.29385.11021.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

Hi,

>To say this back to make sure I understand; I do not need to wipe my
>configuration and implement a configuration that matches the default
>one, rather deleting the top-most parent will delete all the children
>and roll back to the way it was originally before I ran any tc
>commands?

Yes.

>> If you use ifb and ingress qdiscs, cleanup may get a bit more
>> complicated.
>And this would imply that it is not trivial to overwrite the current
>config with a default one?

If you use ingress qdisc on $IF and redirect incoming traffic to $IFB
and shape traffic on in, then you need to do following for cleanup:

tc qdisc del dev $IF ingress
tc qdisc del dev $IFB root

One piece of advice. There were some problems with kernel stability on
SMP systems doing shaping:
http://lkml.indiana.edu/hypermail/linux/kernel/0711.0/2183.html

From my profesional experience kernels >=2.6.28.10 are not affected.

Regards,
Marek
