From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nft -f fails to merge some chains in same table but defined in
 separate blocks
Date: Sat, 1 Feb 2020 17:17:35 -0500
Message-ID: <a19e6bcd-8ddf-7f00-1cee-f7a2c6b70ea6@fhmtech.com>
References: <657e2684-db7d-0721-d23e-8da6d05054d7@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject; bh=RPe/rkQxwHvM+jQM8SllEYwd1VXAvICfoKRFS8vX7Bk=;
        b=d9tslxmVWJCTBVTkdcqFZEYD89nbEOVK4jxUIOpyzOMY16HimiO0Q/t2x9i88ox+6WlZCJaPwFPBSl0yL+I6DhC11CTUo+kiroBJs7itxvHXnQSpTz8BKrKBb5EDo57jf4I4/nfWI+UqoocksiIAvEaib8y3iIoYtA3cwjW1i38=;
In-Reply-To: <657e2684-db7d-0721-d23e-8da6d05054d7@fhmtech.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2020/01/31 21:57, Frank Myhr wrote:
> must every chain that contains 
> set-matching rules be defined in the same _block_ (not just the same 
> table) as the set being matched?

I guess this is no big deal if true. I've rearranged my ruleset's 
component files and now use a bash script to assemble them into a single 
input file for nft -f. This is a lot more flexible than trying to use 
multiple include statements in a manually-edited nft file, as I 
initially tried.

Thanks,
Frank
