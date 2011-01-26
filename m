From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Egress filters
Date: Wed, 26 Jan 2011 12:18:11 +0100
Message-ID: <20110126121811.467e72aa@catus>
References: <mj+md-20110126.102650.14602.nikam@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mj+md-20110126.102650.14602.nikam@ucw.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Mares <mj@ucw.cz>
Cc: netfilter@vger.kernel.org

>Hello, world!\n

Hi,

>I would like to set up an egress filter, which would process all
>outgoing packets just before they hit the network interface (especially
>after all NATing takes place).
>Is there any table/chain for that?

Look here:
http://jengelh.medozas.de/images/nf-packet-flow.png

Mangle table postrouting chain is an appropriate place. Filtering would
take place before nat table postrouting chain (nat table is consulted
only for the first packet of the flow).

best regards,
Marek Kierdelewicz
