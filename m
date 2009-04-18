From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Learning iptables
Date: Sat, 18 Apr 2009 14:59:17 +0200
Message-ID: <20090418125916.GA14236@internet24.de>
References: <49E9C87A.1030509@veltrac.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49E9C87A.1030509@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Apr 18, 2009 at 09:32:58AM -0300, Leonardo Carneiro wrote:
> Is there any good reason why someone would set an ACCEPT policy for all  
> chains first to withdraw some later? What the benefit of doing this?

If I'd have to guess at the ruleset authors intentions, I'd say
s/he wanted to prevent service disruptions when reloading the
firewall scripts.

Loading a lot of rules without iptables-restore can take quite some time,
and if you have a DROP policy during the rule loading time,
some packets that your final ruleset would pass thru will be dropped.
Also, if your scripts terminate prematurely, you might not be able
to remote access your machine anymore.

But then again, you should load your ruleset before you bring up
your network, so the first reason should be irrelevant. And the
second shouldn't really matter after the initial testing phase.
