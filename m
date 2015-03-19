From: dE <de.techno@gmail.com>
Subject: Re: DROP policy, serious vulnerability?
Date: Thu, 19 Mar 2015 12:51:13 +0530
Message-ID: <550A78E9.8040708@gmail.com>
References: <550A63F0.2030400@gmail.com> <201503190243.44018.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=6d68GIrKS4Rv5bfIHk4eYuKpDgYRLNG1xabSLW4mn2Q=;
        b=B/hiwaIyS8z8Ir1qdkbDKA02dzgLNhLJMfeltb1iz3ePODW6im7OtSzYX5I8DCJMu9
         orf6dHkEpKc4FBt+HH4qUFduNDJrlAQS0SRKtENv8FFCUrKT1r2yHYrapDCQybtrSdKa
         E3X67c3wOXQzmD/0fLzKOhSZ9kR/tI+Zast54873qoAwO08mJ4EZLdntcf/plmlT/whp
         md0I5s/uurCRzkJsoBm98olKck+WmAIB8pn/rNZYDPg8Cp+AgsDngCiEvaxkZxb+wTwS
         ys5Wqr9mVQg/Q9JJVkVjMU4wPvjRBvR7X7HDCH3VTmaMbDD/CbeiSbgyllEI8VM8r/Nr
         wbgA==
In-Reply-To: <201503190243.44018.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/19/15 12:13, Neal Murphy wrote:
> On Thursday, March 19, 2015 01:51:44 AM dE wrote:
>> Hi!
>>
>> I'm using the drop policy for iptables using the following --
>>
>> iptables -P INPUT DROP
>> iptables -P OUTPUT DROP
>> iptables -P FORWARD DROP
>> iptables -A INPUT -p tcp -j ACCEPT
>> iptables -A INPUT -p udp -j ACCEPT
>> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:79,81:65535 -m
>> state --state NEW -j DROP
>>
>> Unfortunately, in this configuration, none of the ports get blocks.
>>
>> This implies that after an ACCEPT, further rules are not matched. Is
>> this a bug or intended by design?
>>
>> If this is by design, how am I supposed to use modules like connlimit
>> with DROP policy.
> By design. Once a packet is accepted, no more rules are processed. To do
> otherwise would be akin to continuing to execute a program after an exit()
> statement.
>
> In a mathmetical sense, netfilter rules are not commutative. Nor are they
> sorted into a most-specific to most-general order.
>
> Rules are processed in the order in which they are added. Because you added a
> rule that ACCEPTS all TCP packets before the rule that REJECTs certain TCP
> packets, the prior rule always fires on TCP packets and the latter rule never
> fires.
>
> If you want to affect specific packets, you must add such rules before you add
> the broader-reaching rules. Or you must insert such rules ahead of the broader
> rules.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Ok, thanks everyone for the quick response!

Hope this help others too.
