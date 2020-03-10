From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Restoring rulesets containing dynamic sets with counters
Date: Tue, 10 Mar 2020 10:45:32 -0400
Message-ID: <9bab2027-df96-7533-6d2a-4eaac7b5f277@fhmtech.com>
References: <5e5cfaed-d2c6-02e1-8019-dd6ba2613034@fhmtech.com>
 <20200310133738.zi3axvy62xqihrod@salvia>
 <11cd37e2-6340-a469-c564-d6970841b4cd@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject; bh=8bKoYOH0gYpRdbDEaAxo1P9CAj9kUFOMpPW8ErERvkg=;
        b=Nj8JUnMvvoS5oOpSGjULRGSDsEavHAup4ERjK/Ohau7LQpaef8ZcNRBC5MFbbpYftRfEtnNV+BOEwfy98nFBmMpRhDWJ0K5IaLuOueZMJvrUimvkBwhT3hiXO82UxFDovk50x+WR3t2xhetEQKrS19ddIFwIPEcK0YEfP2mqPjg=;
In-Reply-To: <11cd37e2-6340-a469-c564-d6970841b4cd@fhmtech.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On 2020/03/10 10:14, Frank Myhr wrote:
>> On Mon, Mar 09, 2020 at 07:35:15PM -0400, Frank Myhr wrote:
>>> I do want to keep the dynamically-added elements across reboot.
...
> For now I'll stick with released & packaged (debian buster-backports) 
> nft, and use sed 's/[ ]\+counter[^,\}]\+//g' on saved rulesets before 
> restoring them.
...
For limits,
> sed 's/[ ]\+limit[^,\}]\+//g' before restoring from saved ruleset works 
> for me.

Thought I'd better follow up that I'm running these sed commands on 
ruleset fragments that each include a single dynamic set _only_. I then 
cat these together with other files that contain nftables chains and 
rules, then load the combined file using nft -f.

Just want to be clear that nobody should run those sed commands on a 
complete ruleset file; they will wipe out any counter and limit 
statements that occur anywhere in the file, not just in sets. For a 
complete ruleset file you would need to use some additional logic to 
distinguish whether or not the set & limit statements occur inside of a set.

Best regards,
Frank
