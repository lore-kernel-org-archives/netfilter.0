From: Donghua Liu <liudonghua123@gmail.com>
Subject: Re: how to discard a netfilter rule
Date: Fri, 1 Mar 2013 11:19:57 +0800
Message-ID: <CAJhv45gSuVfEC357retUoWGePP4vjuunmH0bmbAyzjLBJ-tCRg@mail.gmail.com>
References: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
	<512F6BC3.3000307@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type;
        bh=+a2+EJZCvaexObOgFhRrewf4tJOwhZWRUARimoMdwZA=;
        b=XliB1W/HXiJlFohHvTJefELsbrEamyENI8ISKrbSDKFPaYAQm4ME+8xuOOsaPmMQNm
         X89IaCurUIjPsFbqNvITVuQyu8s7I4X3CaIp4I1C6EvUqyijpI0VXEYTcuAK9Vu7ognL
         r/XpZjY+UwsbUrlHqJZ78INZ6kkOaQSiTONzQlvsPO5JyCy5BBbhQmMdHcr5kM5B65w0
         NeRU+U8HPAeOpNASEyO79Np+yJx5RpF1kysa/Gqtu7L5cE88qv5ZBGtsPhmwu9iCdfQf
         /s/94IpPtXWtAyqXmv8MiWew3/GdUxYTknS08oRBRoU40UXPeWFm566GMn5R8vCvldcb
         hWGw==
In-Reply-To: <512F6BC3.3000307@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2013/2/28 Rob Sterenborg (lists) <lists@sterenborg.info>
>
> On 02/28/2013 07:26 AM, Donghua Liu wrote:
>>
>> Hi,
>>
>> Say if I set a netfilter rule by "iptables -t nat -A custom_chain -p
>> tcp -dport 80 -j DNAT --to-destination 127.0.0.1:1234" for some
>> requirement.
>>
>> I also have a LKM which will check the availablity of service
>> "127.0.0.1:1234" and how can I cancel the rule's operation(Do NOT
>> delete this rule), let the packet go as usual ignore the nat.
>
>
> man iptables says there is a -R command to replace rules:
>
> ----
>        -R, --replace chain rulenum rule-specification
>               Replace a rule in the selected chain.  If the source and/or
> destination names resolve to multiple addresses, the command will fail.
> Rules are numbered starting at 1.
> ----
>
> Assuming you know which rulenum must be changed, you can do this:
>
> iptables -t nat -R custom_chain 1 -p tcp -dport 80
>
> IOW, lose the -j parameter from the rule, keeping the others. The result
> is that the rule will still be there, but effectively won't do anything
> except for matching and updating packet/byte counting.
>
>
> --
> Rob
>

Replace rules maybe solve my problem, but I must do it in kernelspace.
Now I have some ideas
Maybe I should extend the netfilter/xtables like
    iptables -t nat -A custom_chain -p tcp -dport 80 -m
process_available --process_name some_process_name -j DNAT
--to-destination 127.0.0.1:1234
    or
    iptables -t nat -A custom_chain -p tcp -dport 80 -j SAFE_DNAT
--to-destination 127.0.0.1:1234
But how can I implement these.
Can anyone provide me some tutorial or write a small example to explain this.
Thanks in advance!
