From: Gao feng <gaofeng@cn.fujitsu.com>
Subject: Re: v3.10-rc7 oops soon after boot
Date: Tue, 25 Jun 2013 09:36:39 +0800
Message-ID: <51C8F427.4010601@cn.fujitsu.com>
References: <20130624221708.15489.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20130624221708.15489.qmail@science.horizon.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: George Spelvin <linux@horizon.com>
Cc: bp@alien8.de, pablo@netfilter.org, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On 06/25/2013 06:17 AM, George Spelvin wrote:
>>> Reported-by: Borislav Petkov <bp@alien8.de>
> 
>> This should be:
>>
>> Reported-by: George Spelvin <linux@horizon.com>
>>
>> I only connected the dots...
> 
> Well, you did a whole lot more than me!  I just lobbed a "d'oh, it
> crashes" into the seething ocean of lkml.  (Admittedly, I had reason
> to act fast: we're very close to release.)
> 
> You figured out what subsystem was at fault and got the right people
> involved.  Definitely a valuable contribution.
> 
> Me, personally, I don't give a flying f*** about such credit; I had
> an itch and was trolling for someone to scratch it.
> 
> So feel free to take Reported-by (you are the one who reported it *to
> someone who could fix it*), Triaged-by, or whatever.

It's my mistake, the reported-by should be you.
of course we should thank Borislav, I didn't notice this bug report
mail until he forwarded it.

Thanks all you guys! Sorry for my mistake..

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

