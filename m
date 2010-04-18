From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: tc/tcng default config
Date: Sun, 18 Apr 2010 23:47:08 +0200
Message-ID: <20100418234708.1474be7d@catlap>
References: <1271625400.29385.10549.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1271625400.29385.10549.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

> Hello List,

Hi Bob,

>If I implement something on a firewall using tc and the network goes
>for poop, how do I get it back to the default set up?

You probably start with adding qdisc:
tc qdisc add dev $IF root handle 1: htb default XX
... then you add classes and filters

You can undo all of this by deleting qdisc:
tc qdisc del dev $IF root

If you use ifb and ingress qdiscs, cleanup may get a bit more
complicated.

Regards,
Marek
