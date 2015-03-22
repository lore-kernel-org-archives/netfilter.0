From: Laurent Bercot <ska-devel@skarnet.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Sun, 22 Mar 2015 20:00:37 +0100
Message-ID: <550F1155.5000501@skarnet.org>
References: <550B3069.7080209@skarnet.org> <20150322183106.GA4150@salvia> <550F0DBE.7000905@skarnet.org> <20150322190033.GA7145@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150322190033.GA7145@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 22/03/2015 20:00, Pablo Neira Ayuso wrote:
> The constructor seems to be ignored with static links, libnftnl needs
> a fix.

  OK, I'll try linking dynamically until it's fixed then.
  Thank you!

-- 
  Laurent

