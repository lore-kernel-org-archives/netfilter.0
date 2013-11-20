From: Eric Leblond <eric@regit.org>
Subject: Re: nftables libnetfilter_queue support
Date: Wed, 20 Nov 2013 17:17:49 +0100
Message-ID: <1384964269.21819.10.camel@tiger2>
References: <DUB109-W13312CC67FC1B784FB12761E1F20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DUB109-W13312CC67FC1B784FB12761E1F20@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Chapman <ajchapman88@hotmail.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

On Fri, 2013-11-08 at 14:34 +0000, Alex Chapman wrote:
> Hi,
> 
> Has support for the NFQUEUE target been built into Nftables yet? or another command to pass to libnetfilter_queue?

For now, you can only use the queue target. This will send packet to
queue 0.

I'm currently working on bringing the nfqueue support in nft to the
level of previous code.

BR,
-- 
Eric Leblond <eric@regit.org>
Blog: https://home.regit.org/

