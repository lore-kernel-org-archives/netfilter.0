From: Amish <anon.amish@gmail.com>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Mon, 6 Dec 2021 19:00:47 +0530
Message-ID: <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Zi+kMfsGwSEK5p6iDM3vBgmHKZM/MRh+Yset0IE0IY0=;
        b=ClhiYA2igQiDWkQzVzuyBMt3Ky/F80IspH7yYCQyMu0b/wfgNkTAxbENKl+YjaSVeG
         01w3DxznL/+5bA10xiBzdNTS1wVzZDwze0Cwggas8Hb4FP8MYWnv/3igk2CL06zS+shd
         NTI9QqCbf/gvbKvOULX2iOKLb/BGOsakDCLbRZdamo4BURWDpWSD71wS5TA7lmNye+Bp
         A1dGpY0RuuEUGlO7BTc8mdHJ5x0HvB6TRBrT3qt5szknW1XQfbBk/PSQgodNjOnshIXr
         S7pVHBywzevfWhRQV88lTRDH+nVEwsPgjGRQuWBEkyDOJsg2u+dJ0Qkj5e+uisaL7aWI
         QvTQ==
Content-Language: en-US
In-Reply-To: <Ya4L/rS/mCwzqt25@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 06/12/21 18:41, Pablo Neira Ayuso wrote:
> On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
>> Hello,
>>
>> nftables wiki [1] mentions this:
>>
>>> Note: There are plans to support rule deletion by passing:
>>> % nft delete rule filter output ip saddr 192.168.1.1 counter
>> Any idea when will this happen? Because I thought it was very important
>> feature. (unless I missed an alternate way to do it)
>>
>> I want to migrate from iptables to nftables (from many years) but deleting a
>> rule via script is not as easy as in case of iptables.
>>
>> Obtaining the handle first and then deleting it is difficult
>> programmatically.
> You can use --echo and --handle options to fetch the rule handle.
>
>   # nft -e -a  add rule x y counter
>   add rule ip x y counter packets 0 bytes 0 # handle 3
>   # new generation 5 by process 91190 (nft)

Well then I need to keep recording each rule addition somewhere so that 
I can delete by handle in future.

Some rules are added manually, some added by scripts. Scripts may want 
to remove manually added rule.

So its not as easy like in iptables.

I guess nftables will never get that feature then :(

Regards,

Amish

