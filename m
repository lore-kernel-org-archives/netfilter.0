From: "Sheepa" <sheepa@sheepa.org>
Subject: Re: Update delay when using nat table?
Date: Fri, 12 Mar 2010 04:55:56 +0100
Message-ID: <3B938449437E420BB7D86FD374AF6BF2@main>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org> <383286BAD7464B6296AB3157C21B3C99@main> <967e5777d730e5c39389a4e554144099@thom.fr.eu.org> <67C8429999B648F983EB141D7A928400@main> <4B9967A5.3070005@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

> On 11.03.2010 19:41, netfilter-owner@vger.kernel.org wrote:
>> ipset looks intresting but I've no experience of patching the kernel. I
>> did run an aptitude install ipset.
>>
>> ipset -H
>> I'm of protocol version 2.
>> Kernel module is not loaded in, cannot verify kernel version.
>> ipset v2.5.0
>> ...
>>
>> What needs to be done here? I've tried googling around but there's not
>> that much information available.
>>
>
> Please switch to bottom posting...
>
> If on debian, you may need to install netfilter-extensions-modules.
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

----- Original Message ----- 
From: "Mart Frauenlob" <mart.frauenlob@chello.at>
To: <netfilter@vger.kernel.org>
Sent: Thursday, March 11, 2010 10:59 PM
Subject: Re: Update delay when using nat table?

Ok, sorry.

The only package like that is:
netfilter-extensions-source                                            - 
source for netfilter kernel modules derived from patch-o-matic-ng

Source files only I guess.

---

However, i did get conntrack to work. Running this command after i've 
updated iptables does the trick:
conntrack -D -p udp --dport 777 --src x.x.x.x

This might seem like a noob question. But isn't UDP connectionless? Why/How 
does it keep track of those connections?

Thanks,
Sheepa 
