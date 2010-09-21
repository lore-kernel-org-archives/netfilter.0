From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 23:51:19 +0100
Message-ID: <4C9936E7.5010404@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=XI6ZEd7u6VcuiK67bTB08zpOvsjO918VDu7xsggZAL4=;
        b=AGmIUsunndYNGEL2v1vIc8CTWuYKkMwvuXw6irQ7WhH4xvV8owND72JjWLmunkeOIO
         e9EpP9Kj4UOEWpI6XfNLwXXazrIllF3U2WOb/p81jGZqlytobU9u7YsTwVqvil19jFo3
         9lys9mDlgIhAN4nAIpT9B2L0rgNooFKxrqjwY=
In-Reply-To: <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org


>> cat /proc/net/nfs_conntrack
>>
>> ipv4     2 udp      17 8 src=10.11.231.82 dst=10.11.255.156
>> sport=34095 dport=53 src=10.11.255.156 dst=10.11.231.82 sport=53
>> dport=34095 mark=0 secmark=system_u:object_r:unlabeled_t:s0 use=2
>>     
>
> I think that rather than bloating ancient procfs files with more info,
> the respective userspace tool should be augmented by secmark name
> resolution instead. Then we would also not need change anything inside
> the kernel, or its interfaces to userspace.
>   
The point Eric made (and is a very good one) is that this number should 
not be there - at all!

Who would make sense of that number?

This number is only (remotely) useful if somebody is parsing secmark=xxx 
for simple <>0 checks - i.e. to find out whether there is a context 
defined for that connection. I agree that there should be userspace 
function for converting sids to text, but nfs_conntrack, in my view, 
should contain the full context (so, in other words - we should have both).
