From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Mon, 23 Mar 2015 12:45:15 +0100
Message-ID: <20150323114515.GA5552@salvia>
References: <550B3069.7080209@skarnet.org>
 <20150322183106.GA4150@salvia>
 <550F0DBE.7000905@skarnet.org>
 <20150322190033.GA7145@salvia>
 <550F1155.5000501@skarnet.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <550F1155.5000501@skarnet.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Bercot <ska-devel@skarnet.org>
Cc: netfilter@vger.kernel.org

On Sun, Mar 22, 2015 at 08:00:37PM +0100, Laurent Bercot wrote:
> On 22/03/2015 20:00, Pablo Neira Ayuso wrote:
> >The constructor seems to be ignored with static links, libnftnl needs
> >a fix.
> 
>  OK, I'll try linking dynamically until it's fixed then.

Please, manually apply this:

http://patchwork.ozlabs.org/patch/453392/

And provide feedback. Thank you.
