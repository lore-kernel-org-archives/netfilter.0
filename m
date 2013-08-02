From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: Re: PROBLEM: Netfilter time matching matches all packets when time
 start and time stop is the same
Date: Thu, 1 Aug 2013 18:35:22 -0700
Message-ID: <CAHo-Ooz+Wz23kMBL-LgWw6HxpzQr7hJYJZNWkinOyCB1w+41zw@mail.gmail.com>
References: <CAK+MRYuFUCvkker9sq7LFa42t=vQ7FhWwzz37Mtw3sLMZTJ+EQ@mail.gmail.com>
	<20130801112444.GE21352@unicorn.suse.cz>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=2M81Goa5r7AvNOFr+OmlWeIfKuLzSA++200eesHRrF8=;
        b=SAvU4XrA4W60E932jQgP4JEzgqjxGtxAolbvoK2+NcXrKJk4LGltJ7OI1yLRyoTX1j
         7ywB8ynXzy0VrILPhJffh/co0OqmJC3+Aag3BrLqXp1cdKRsSABZhJxTjKrwcA1GkaaG
         1LdC3SlfGneFSk8XVMPTFF8jjE76gOKukuy6XKVEgBgqbrAShiu7UKYVWtudoDApn4V/
         LFOkfVijJ9L/XK329mT7MyzN1lbNr4gJGH2XHPNDgVPZn3C4S9jHlYI4Wzq10z4HdVZ7
         k6lP5cGfDuqwBquGkDskQD8TS2XsgVn+1A1PSYx8Dbo0McDpoAzgjExd00rJ8/h1FRQy
         rFeg==
In-Reply-To: <20130801112444.GE21352@unicorn.suse.cz>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Henry Lee <henryronlee@gmail.com>, pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

Does having timestart == timestop make any sense?
Why would you want to do that?

Perhaps make iptables reject such input?

On Thu, Aug 1, 2013 at 4:24 AM, Michal Kubecek <mkubecek@suse.cz> wrote:
> On Wed, Jul 31, 2013 at 04:42:15PM +0800, Henry Lee wrote:
>> diff --git a/net/netfilter/xt_time.c b/net/netfilter/xt_time.c
>> index 0ae55a3..753573c 100644
>> --- a/net/netfilter/xt_time.c
>> +++ b/net/netfilter/xt_time.c
>> @@ -192,7 +192,7 @@ time_mt(const struct sk_buff *skb, struct
>> xt_action_param *par)
>>
>>      packet_time = localtime_1(&current_time, stamp);
>>
>> -   if (info->daytime_start < info->daytime_stop) {
>> +   if (info->daytime_start <= info->daytime_stop) {
>>          if (packet_time < info->daytime_start ||
>>              packet_time > info->daytime_stop)
>>              return false;
>>
>
> As far as I can see, this would cause only packets arriving at midnight
> to match by default (i.e. without both --timestart and --timestop).
>
>                                                          Michal Kubecek
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
