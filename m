From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nft show counter
Date: Wed, 31 Mar 2021 19:08:36 -0400
Message-ID: <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=wPZxfGdA5EaD5yev8Stc4dunh3/4M/zFaf0l/+BLufg=;
        b=N/pYzkJ3Rt/D75WHE4Aj3mV79aoCja0Z2FEeOsCBBZYA5nnJ06ote4SCsgfiF2PvRYAn90fwgPpPrCXCOte/1xMcHDy7pIeUOqkRjDIGXdmauiM/5G12gLGYgIejDz5GXzz5ubC/C9vctIQwK/pddoS4FWZT+YrFJiIg1Qyoa4Q=;
In-Reply-To: <20210331214053.GB13699@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>, Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On 2021/03/31 17:40, Florian Westphal wrote:
> You could use a named counter and then fetch it via 'nft list counter
> inet tablenam countername'.

This is the straightforward solution!

Florian, is it correct that *all* counters are stateful objects, they're 
just anonymous stateful objects if used in a rule without first 
declaring them with a name? The wiki reads as if they're 2 separate 
things (I'm happy to fix but want to check with you first):

https://wiki.nftables.org/wiki-nftables/index.php/Counters

Thanks,
Frank M.
