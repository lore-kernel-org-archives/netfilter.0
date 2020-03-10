From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Restoring rulesets containing dynamic sets with counters
Date: Tue, 10 Mar 2020 10:14:54 -0400
Message-ID: <11cd37e2-6340-a469-c564-d6970841b4cd@fhmtech.com>
References: <5e5cfaed-d2c6-02e1-8019-dd6ba2613034@fhmtech.com>
 <20200310133738.zi3axvy62xqihrod@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=t/iQaOuis7ULK6rO/HH7mRUfkMqRKi/flkEOXVr/XHI=;
        b=PcrIs7u9QdTT8htUL5tg0VlRigY+nNtEPQl1vZoaLqHUq3F5BfSrHJNwTLKGL2WS204iosLrDod42HJPdgFQ2PVoQWXTUUhDfCk0A7rBHPE0hHoJV662Rn6Pcpo9hcSsK/M2ma5gfTYTD/aoB1qlQcxW36R51S1IhCa9q3EafD4=;
In-Reply-To: <20200310133738.zi3axvy62xqihrod@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On 2020/03/10 09:37, Pablo Neira Ayuso wrote:
> On Mon, Mar 09, 2020 at 07:35:15PM -0400, Frank Myhr wrote:
>> I do want to keep the dynamically-added elements across reboot. Is there a
>> better way to do so?
> 
> This is the userspace patch to update the syntax. Still missing
> remaining bits, but it is doable.

Pablo,

Thank you very much for the userspace patch to load dynamic set element 
counters. Great to have that for applications that need it.

For now I'll stick with released & packaged (debian buster-backports) 
nft, and use sed 's/[ ]\+counter[^,\}]\+//g' on saved rulesets before 
restoring them.

Also found that set elements with limits are not currently supported -- 
and it appears that your patch doesn't add that ability. Not sure what 
other stateful objects people might add to set elements. For limits,
sed 's/[ ]\+limit[^,\}]\+//g' before restoring from saved ruleset works 
for me.

Thanks,
Frank
