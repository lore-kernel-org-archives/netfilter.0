From: Bhumika Goyal <bhumirks@gmail.com>
Subject: Re: [PATCH] extensions: libxt_CONNMARK.c: Add translation to nft
Date: Wed, 9 Mar 2016 22:50:34 +0530
Message-ID: <CAOH+1jHn109-5yosf+PvEW8UEwnO3hSgOiq3ka13jaaYRcfdpg@mail.gmail.com>
References: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
	<56E0574F.9070007@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=GALGcmD7I0F7iOh90D99Suf/akMIfUuMUPSDH7O2CSo=;
        b=dWd3saBsUd7aj43Tk2Rcf1Aw3obUnmNop2iZI8lsMRAmuuUi8HxTqy/ilUJmhBJUw8
         nbGt5PPuZ0WCZin0xZDgjxUu/lUqLHr+VPjywf1vq9E2M70YZS6HnRnC206ZV9TR9l9S
         qHKg7EZjCoMWxay04sp9eRIu8Q25FXhDNkuHnpyQVU4xid8TKc9DbsrknFtqQrTQzJdi
         Rc+qh29uz+LUbwvAM6Oi1E6JhRL5pKzpGBJnv0n3mI2ViOAdjtMxnNNyXuSnPeVMaDEI
         P35yZwJcFfSXAxE3Lqi1P31hh6+Wt4vyAT2Qym1A76SHqndBGeYqJ/5yNtGXBJgu5mxp
         zn8A==
In-Reply-To: <56E0574F.9070007@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Piyush Pangtey <gokuvsvegita@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 9, 2016 at 10:33 PM, Piyush Pangtey <gokuvsvegita@gmail.com> wrote:
> Hello Bhumika,
>
> On Wednesday 09 March 2016 09:28 PM, Bhumika Goyal wrote:
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
>                                                                   ^^^^^^^^^^^^^^
>                                                                   this does not work

Thanks for the feedback.
Does the other two translations for --save-mark and --restore-mark look ok?
Please suggest me the improvement for the --set-mark translation.

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
>                                 ^
>                                 missing space here
>
>> +                          info->nfmask, info->ctmask);
>> +             break;
>> +     case XT_CONNMARK_RESTORE:
>> +             xt_xlate_add(xl,"mark restore nfmask 0x%x ctmask 0x%x",
>                                 ^
>                                 missing space here
>
>> +                          info->nfmask, info->ctmask);
>> +             break;
>> +     default:
>> +             /* Should not happen */
>                 ^^^^^^^^^^^^^^^^^^^^^^^
>                 this comment is not meaningfull
>

Ok I will remove the comment.

Thanks,
Bhumika
>> +             break;
>> +     }
>> +
>> +     return 1;
>> +}
>> +
>>  static struct xtables_target connmark_tg_reg[] = {
>>       {
>>               .family        = NFPROTO_UNSPEC,
>> @@ -362,6 +388,7 @@ static struct xtables_target connmark_tg_reg[] = {
>>               .x6_parse      = CONNMARK_parse,
>>               .x6_fcheck     = connmark_tg_check,
>>               .x6_options    = CONNMARK_opts,
>> +             .xlate         = connmark_tg_xlate,
>>       },
>>       {
>>               .version       = XTABLES_VERSION,
>> @@ -377,6 +404,7 @@ static struct xtables_target connmark_tg_reg[] = {
>>               .x6_parse      = connmark_tg_parse,
>>               .x6_fcheck     = connmark_tg_check,
>>               .x6_options    = connmark_tg_opts,
>> +             .xlate         = connmark_tg_xlate,
>>       },
>>  };
>>
>>
>
>
>
