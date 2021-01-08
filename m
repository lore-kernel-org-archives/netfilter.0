From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables Set Bug with interval & timeout Flags
Date: Thu, 7 Jan 2021 17:13:56 -0800
Message-ID: <73847a6b-26e2-1d68-7300-5a7614bb6c47@softtalker.com>
References: <5c90f2e3-76ac-1b00-1ca8-fab74bfd97cd@softtalker.com>
 <20210106140302.GA5857@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210106140302.GA5857@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Thanks so much!  I am not a huge fan of patches so I will hang tight for the next nftables release.  Do you happen to have a rough estimate of when that might be?

Thanks again!
-MikeD

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*From:* Pablo Neira Ayuso [mailto:pablo@netfilter.org]
*To:* Mike Dillinger <miked@softtalker.com>
*Cc:* netfilter@vger.kernel.org
*Date:* Wednesday, January 6, 2021, 6:03 AM PST
*Subject:* nftables Set Bug with interval & timeout Flags

This is the fix for the issue you're observing:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210106140119.10915-1-pablo@netfilter.org/

Thanks for reporting and for your patience.



