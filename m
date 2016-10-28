From: Leon Merten Lohse <leon@green-side.de>
Subject: Re: nftables: named set for ipv4 networks
Date: Fri, 28 Oct 2016 16:23:53 +0200
Message-ID: <20161028162353.7da8573c@doomgiver>
References: <20161023213822.16337e5c@doomgiver>
        <20161027192338.GA1570@salvia>
        <20161027234152.2c94a832@doomgiver>
        <20161028080419.GB1553@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161028080419.GB1553@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Fri, 28 Oct 2016 10:04:19 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> Could you please grab a nftables git.netfilter.org clone and confirm
> this works for you?

It seems to work with the latest git version -- no segmentation fault.
Thank you!

However, I stumbled onto the next problem: 
When I load this ruleset twice, it complains that "interval overlaps
with an existing one" even though I explicitly do a "flush ruleset" at
the beginning of the file.
This problem does not occur if I "nft flush ruleset" first and then
load the ruleset.
Do I have to explicitly flush the sets, somehow?

Best
Leon
