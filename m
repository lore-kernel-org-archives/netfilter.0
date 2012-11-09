From: Torsten Luettgert <ml-netfilter@enda.eu>
Subject: Re: Use iptables to force next hop
Date: Fri, 9 Nov 2012 08:44:41 +0100
Message-ID: <20121109084441.22bb21f1@goldlack.enda.eu>
References: <FABE6FFC-E757-421A-BB4B-F18975F31E9B@alex.org.uk>
	<509C2EA5.6050201@ziu.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <509C2EA5.6050201@ziu.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 08 Nov 2012 23:13:57 +0100
Michal Soltys <soltys@ziu.info> wrote:

> On 2012-11-08 22:08, Alex Bligh wrote:
> > Is it possible to use iptables to force the next hop in (e.g.) the
> > FORWARD table?
[...]
> You can do hybrid of sorts - that is set mark in iptables (with all
> the matching power of iptables), then use fwmark match in ip rule.
> 
> Not precisely what you're after, but gives you the same - unless of
> course you want to avoid ip rule at all cost. Once in the past there
> was ROUTE target, but it was dropped at some point (I think).
> Besides, ip rule fwmark provides essentially the same.

That's right, except you have to use up the mark (or, at least, a few
bits of it). I was also sad that the ROUTE target was dropped back then
and ported it a few versions up, but after 2.6.24 (iirc) it became
increasingly difficult so I switched to mark+ip rule.

One could probably look into TEE and rip out the appropriate parts, but
I lack the time.

For now, marking and using ip rule is the only option I know of.

Regards,
Torsten
