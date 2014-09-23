From: Pavel Volkov <sailor@lists.xtsubasa.org>
Subject: Re: Error configuring NAT with nftables
Date: Wed, 24 Sep 2014 00:22:12 +0400
Message-ID: <9466b51e-bcdd-4262-b7e9-4c7a4e40f236@lists.xtsubasa.org>
References: <86bab9a1-ef10-4d20-aaac-22889659815f@lists.xtsubasa.org>
 <20140923183131.GA18253@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140923183131.GA18253@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Tuesday, September 23, 2014 10:31:31 PM MSK, Pablo Neira Ayuso wrote:
> Does your .config contain:
>
> CONFIG_NFT_CHAIN_NAT_IPV4=m
>
> # lsmod | grep nft_chain_nat_ipv4
> nft_chain_nat_ipv4     12684  2

You're right, this is what I missed. Thank you.
I hope the error messages will look more meaningful in the future :)
