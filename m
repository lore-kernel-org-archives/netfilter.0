From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NETMAP of destination *after* routing
Date: Wed, 6 Aug 2008 19:13:49 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808061912150.6682@fbirervta.pbzchgretzou.qr>
References: <g7da9g$21r$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <g7da9g$21r$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Duffy <Charles_Duffy@messageone.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-08-06 18:57, Charles Duffy wrote:
>
> How do 'yall suggest resolving this? I've played around with
> xtables-addons somewhat, and am pondering building a target to do
> translation in the mangle table on a packet-by-packet basis (as my
> present understanding -- correct or otherwise -- is that

This is what RAWNAT (in the "RAWNAT" branch of xtables-addons) is
supposed to do, though I do not claim it being well-tested;
Manu ran into a few issues I still have not addressed :/

> translating the destination post-routing with existing
> conntrack-based NAT functionality simply isn't feasible)... but at
> present I don't know what roadblocks are likely to be hit in the
> process.
