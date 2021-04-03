From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nft show counter
Date: Sat, 3 Apr 2021 13:04:18 -0400
Message-ID: <71f75809-0fc4-2ddb-9b32-a16e580cce83@fhmtech.com>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
 <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06>
 <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box>
 <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
 <3A06821B-F0D1-4925-9E89-25C279EDA979@public-files.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=f2Am2kceFY9g+1OWu+938HEnde0K9srWmLpJNOLdew0=;
        b=MmukmPqhDk+0gubnfZZ40tU4m+QD4hfzh0WL2S6hh6Q4X5nf3AIPAHjywl4q6AMApcBJMUT8pj9ncttF2E6gK1d9QdeuPue7G6vdSjfxEYDQwfJIZExEBaq0iMj3i+r2j7RUHswoghVNgghJoZodZKaP+6SPGMPa2O473Poq+4M=;
In-Reply-To: <3A06821B-F0D1-4925-9E89-25C279EDA979@public-files.de>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: frank-w@public-files.de, netfilter@vger.kernel.org
Cc: rieger@jikken.de

On 2021/04/02 13:42, Frank Wunderlich wrote:
>> Anton & Frank W., is it OK with you if I include your examples in the
>> nftables wiki?
> 
> My part is ok to include in wiki...i have posted to share :) maybe in combination with the rules (old version commented out and with map) to have full example

On 2021/04/02 18:22, Anton Rieger wrote:
> Sure 

Thanks, guys! I posted your example:
https://wiki.nftables.org/wiki-nftables/index.php/Counters#Reading_named_counters_from_Python

Please let me know if you find mistakes.

Thanks,
Frank M.
