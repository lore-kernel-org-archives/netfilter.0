From: Eric Leblond <eric@regit.org>
Subject: Re: nftables jump <chain> target invalid argument
Date: Fri, 15 Nov 2013 14:06:50 +0100
Message-ID: <1384520810.5425.2.camel@tiger2>
References: <DUB109-W87FE1E5161E5C42ED6593AE1F80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DUB109-W87FE1E5161E5C42ED6593AE1F80@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Chapman <ajchapman88@hotmail.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

On Thu, 2013-11-14 at 16:53 +0000, Alex Chapman wrote:
> Hi,
> 
> When attempting to use the jump target to forward traffic to a newly created chain I get the following error:
> 
> [root@home nftables]# nft add rule filter forward ip daddr 9.9.9.9 jump new
> <cmdline>:1:1-49: Error: Could not process rule in batch: Invalid argument
> add rule filter forward ip daddr 9.9.9.9 jump new
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Looks like an issue. I'm investigating into it.

BR,
-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

