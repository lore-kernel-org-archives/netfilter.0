From: Donghua Liu <liudonghua123@gmail.com>
Subject: Re: how to discard a netfilter rule
Date: Thu, 28 Feb 2013 18:55:41 +0800
Message-ID: <CAJhv45gFUJCHgW-FYChv8zLnN8Y0pNoX4omgfxD6rEJY5KFP7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=vhrkvwth4mWno32dE3Vaf4+VCRvOBv7o2CqmPSMBQSY=;
        b=SiNHZ1SN1qd7aOfsRNBywD4yKUvuqKtjTZb/mdcH7kRA9z5R3NT6BSFX6dquLY99A9
         2ENQsiWkyT7G9FRomVha4vfxbt6xesWOy2cnZEI0K4f1u9wMF5VnCn+30NubqERl5wlV
         01banBQPQbIOJH/OHaCkF+61JoNuiTZn71FrREabk5l5BGV8p9jqnNFCWq5xlcB6Wt+N
         19XeHbJTZvstKD6c5NMArs/NaEo41XbZRqVwHwwqAuINHGmXaSQWRERlElE4hJTsGoY0
         ZWbNb89jZy2ym1e/GliT1qd6f6xbACaYJdfWYceROwO4KASrs3BfPgdces5ILh5stAxb
         RQYQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>On Thursday, February 28, 2013 01:26:52 AM Donghua Liu wrote:
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
>Assuimg '-j RETURN' is valid, put the rule in chain 'custchainNAT' by itself
>and add a jump to that chain from custom_chain. To disable the nat, insert
>(via -I 1) a '-j RETURN' rule in 'custchainNAT' before the NAT rule. To re-
>enable it, delete the RETURN rule.

I couldn't get the reply so I have to write a new email(I do not know
why, that's really strange)
Thanks for your reply, Neal Murphy.
But what I want to do is how to implement in the kernel module not command line.
