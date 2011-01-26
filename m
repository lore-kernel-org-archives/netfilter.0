From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Egress filters
Date: Wed, 26 Jan 2011 13:35:31 +0100
Message-ID: <20110126133531.7e724bc9@catus>
References: <mj+md-20110126.102650.14602.nikam@ucw.cz>
	<20110126121811.467e72aa@catus>
	<mj+md-20110126.113943.977.nikam@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mj+md-20110126.113943.977.nikam@ucw.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Mares <mj@ucw.cz>
Cc: netfilter@vger.kernel.org

Hi,

>I know that, but I want to hook my rules _after_ the nat table
>postrouting chain. (I want to catch packets with private source address
>which are not NATed due to misconfiguration of my complex NAT setup.)

Some time ago you could simply add DROP at the end of nat postrouting
chain, but this option is off the table.

You can add rule connmarking traffic to 0x10 at the end of nat
postrouting chain and drop everything with that connmark in filter
forward chain. First packet of the filtered flows would get trough but
everything would be axed.

Best regards,
Marek Kierdelewicz
