From: George Shuklin <george.shuklin@gmail.com>
Subject: Re: Best practices on iif usage at persistent ruleset
Date: Mon, 3 Jul 2023 17:04:30 +0300
Message-ID: <0c3b1dbe-e416-633c-465f-771355b9fdba@gmail.com>
References: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688393072; x=1690985072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfQ7fO4piZO2+RaePpA2ng5xFogUpqH1AESaHphVFus=;
        b=mBTAmgPb2ByreKhIHLY72zLmKvzKTTrY+bDch47MQ/CqwoS83g8dL9saRuVFHY5TE1
         1tDswYGGJ+Zz55Bl2qwSCdYzYoaOZPkjbhqX5udACSHAEhJg/9sWNK8jZ84EC6A6xiC/
         MsSZTmHcQ4Kd9/2jOT9H+MTbN4fNB62bbf6A5WevpfGF+At5Nr44AteO8HmRB/yzKPOK
         1DLfCLFrFjKmgIi0TJGFJE9bkaNifbQIa9e/uOPr5Z4evQH00Ntb9kFRuEaf2ZiT/Jzy
         p9kUZfOXdnmtR+f3iEjqRxAYVxDSOkN7l6QbOw6rCIlDjvm42HYKjvMPjRkL+l1ZOxZp
         hRRA==
Content-Language: en-US
In-Reply-To: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

I think, dependencies is the proper way. iif is just an integer (index), 
so kernel can't work with it when it's not present (and you usually 
can't predict the index of the given interface).
iffname does lookup, but it's slow.

On 03/07/2023 10:40, Serg wrote:
> Hello netfilter community,
>
> How do you deal with iif used at persistent ruleset? Personally, my 
> issue is that VLAN device is not created at the moment when 
> nftables.service is started on boot, thus the following error happens:
>
>> Error: Interface does not exist
>
> To solve this issue I use this systemd service override configuration:
>
>> # /etc/systemd/system/nftables.service.d/override.conf
>> # Configuring the nftables to start after the network has been started
>> [Unit]
>> Before=
>> After=network-online.target
>
> But are there any alternatives approaches to this issue?
>
> I know that there is iifname as a safe alternative, but as far as I 
> know it has huge performance drawback and thus its' usage is 
> discouraged in my case.


