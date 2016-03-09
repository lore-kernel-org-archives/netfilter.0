From: Bhumika Goyal <bhumirks@gmail.com>
Subject: Re: [PATCH] extensions: libxt_CONNMARK.c: Add translation to nft
Date: Wed, 9 Mar 2016 22:42:13 +0530
Message-ID: <CAOH+1jFQ=yk2oNmAPuT80CmSaq6-5p9b01WQJrn=x66_c7OggA@mail.gmail.com>
References: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
	<20160309165258.GA1040@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=LRwNw+MzZcTO+m6oRSpMhAj//t4gYEus9oSzk6EXIF8=;
        b=FLp0db61A5S4FxY1jT74bKwao7h/4vxwPohG5Fpb3OZNSAqKXqQ7FvfkL79uN0t9BC
         l9iP3pgzQsBgFRjztIVvDJ3cC5Z3rfPyUlz1oDVdG0j5vgmshO/LCAM2vN2wz/GDcbWJ
         eRTt0PU1TLOspe7rFiSEQ+dVkJrYldrqFYewzxokiA2Zc1UknQtYOvPfp/M2CKa1r+O3
         3G8yTI9elHm70L/wdm2VnZNDy9RaknQUs8O+hso4PrlVo5jaxe36VgXQmqS4se9OD57d
         MDoFGOQ9u5ffmU1esBoFlDZRKPqVcGyHXnJ7EkZmhlL+UTzXSqy3PKRJDrqfBmD2rfir
         wNnA==
In-Reply-To: <20160309165258.GA1040@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, outreachy-kernel@googlegroups.com
Cc: Shivani Bhardwaj <shivanib134@gmail.com>, netfilter@vger.kernel.org

On Wed, Mar 9, 2016 at 10:22 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Wed, Mar 09, 2016 at 09:28:53PM +0530, Bhumika Goyal wrote:
>> Add translation for target CONNMARK to nftables.
>>
>> Examples:
>>
>> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp  --dport 80 -j CONNMARK --save-mark
>> nft add rule ip mangle PREROUTING tcp dport 80 counter mark save nfmask 0xffffffff ctmask 0xffffffff
>>
>> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 80 -j CONNMARK --restore-mark --mask 12
>> nft add rule ip mangle PREROUTING tcp dport 80 counter mark restore nfmask 0xc ctmask 0xc
>>
>> $ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 22 -j CONNMARK --set-mark 2
>> nft add rule ip mangle PREROUTING tcp dport 22 counter mark set 0x2/0xffffffff
>>
>> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
>> ---
>>  extensions/libxt_CONNMARK.c | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/extensions/libxt_CONNMARK.c b/extensions/libxt_CONNMARK.c
>> index 42cf207..e2dbf8d 100644
>> --- a/extensions/libxt_CONNMARK.c
>> +++ b/extensions/libxt_CONNMARK.c
>> @@ -347,6 +347,32 @@ connmark_tg_save(const void *ip, const struct xt_entry_target *target)
>>       }
>>  }
>>
>> +static int
>> +connmark_tg_xlate(const struct xt_entry_target *target,
>> +               struct xt_xlate *xl, int numeric)
>> +{
>> +     const struct xt_connmark_tginfo1 *info = (const void *)target->data;
>> +
>> +     switch (info->mode) {
>> +     case XT_CONNMARK_SET:
>> +             xt_xlate_add(xl, "mark set 0x%x/0x%x", info->ctmark, info->ctmask);
>> +             break;
>> +     case XT_CONNMARK_SAVE:
>> +             xt_xlate_add(xl,"mark save nfmask 0x%x ctmask 0x%x",
>> +                          info->nfmask, info->ctmask);
>> +             break;
>> +     case XT_CONNMARK_RESTORE:
>> +             xt_xlate_add(xl,"mark restore nfmask 0x%x ctmask 0x%x",
>> +                          info->nfmask, info->ctmask);
>
> This translation is not correct.
>

Thanks for the feedback. Could you please tell me the mistake as I am
not able to figure out my mistake?

Thanks,
Bhumika
