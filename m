From: Martin Mares <mj@ucw.cz>
Subject: Re: Egress filters
Date: Wed, 26 Jan 2011 12:43:26 +0100
Message-ID: <mj+md-20110126.113943.977.nikam@ucw.cz>
References: <mj+md-20110126.102650.14602.nikam@ucw.cz> <20110126121811.467e72aa@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110126121811.467e72aa@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi!

> Mangle table postrouting chain is an appropriate place. Filtering would
> take place before nat table postrouting chain (nat table is consulted
> only for the first packet of the flow).

I know that, but I want to hook my rules _after_ the nat table postrouting
chain. (I want to catch packets with private source address which are not
NATed due to misconfiguration of my complex NAT setup.)

				Have a nice fortnight
-- 
Martin `MJ' Mares                          <mj@ucw.cz>   http://mj.ucw.cz/
Faculty of Math and Physics, Charles University, Prague, Czech Rep., Earth
"Oh no, not again!"  -- The bowl of petunias
