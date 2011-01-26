From: Martin Mares <mj@ucw.cz>
Subject: Re: Egress filters
Date: Wed, 26 Jan 2011 13:38:02 +0100
Message-ID: <mj+md-20110126.123623.15306.nikam@ucw.cz>
References: <mj+md-20110126.102650.14602.nikam@ucw.cz> <20110126121811.467e72aa@catus> <mj+md-20110126.113943.977.nikam@ucw.cz> <20110126133531.7e724bc9@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110126133531.7e724bc9@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi!

> You can add rule connmarking traffic to 0x10 at the end of nat
> postrouting chain and drop everything with that connmark in filter
> forward chain. First packet of the filtered flows would get trough but
> everything would be axed.

That's a neat trick, but still I believe there should be a simple way
how to do egress filtering.

Would a patch adding a POSTROUTING chain to the raw table, positioned
after all other chains, be welcome?

				Have a nice fortnight
-- 
Martin `MJ' Mares                          <mj@ucw.cz>   http://mj.ucw.cz/
Faculty of Math and Physics, Charles University, Prague, Czech Rep., Earth
"Please try to fit your code to 80 columns. That's decimal 80." -- A. Morton
