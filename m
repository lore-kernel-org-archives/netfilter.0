From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 23:39:44 +1000
Message-ID: <49F1C120.8090802@standarduniversal.com.au>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C0B4.8010809@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F1C0B4.8010809@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tino Keitel <tkeitel@innominate.com>
Cc: netfilter@vger.kernel.org

that should be 2 separate lines.. stupid email

iptables -A INPUT -m mark --mark 1

iptables -A INPUT -m connmark --mark 2



Brian Austin - Standard Universal wrote:
> to do this would be faster than patching and etc..
>
> iptables -A INPUT -m mark --mark 1 iptables -A INPUT -m connmark --mark 2
>
> regards
>
> Brian
>
>
> Tino Keitel wrote:
>> Hi folks,
>>
>> when I try to use the mark and connmark extensions in one rule, I get
>> an error:
>>
>> $ iptables -A INPUT -m mark --mark 1 -m connmark --mark 2
>> iptables v1.4.2: mark: "--mark" option may only be specified once
>>
>> Is this intended? If not, is there a way to make this work with a stock
>> iptables, or do I have to patch the source and rename one of the
>> options?
>>
>> Regards,
>>
>>   
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
