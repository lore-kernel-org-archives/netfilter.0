From: "ron lai" <ronlai@cs.stanford.edu>
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 2.6.22.6
Date: Wed, 7 Nov 2007 07:17:17 -0800
Message-ID: <005b01c82151$4acac750$6500a8c0@ronPc>
References: <001601c81ccc$682bb4a0$bb0b10ac@FireEye.com> <47303E9D.2050909@trash.net> <001e01c82077$b4d67610$6500a8c0@ronPc> <47306B0E.7050401@trash.net> <001801c8207c$00307b70$6500a8c0@ronPc> <47307498.70104@trash.net> <005301c820fc$35c63a10$6400a8c0@ronPc> <47318A3C.5070701@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, Bart De Schuymer <bdschuym@pandora.be>

I am using a single bridge with one device.

Ron
----- Original Message ----- 
From: "Patrick McHardy" <kaber@trash.net>
To: "ron lai" <ronlai@cs.stanford.edu>
Cc: <netfilter@vger.kernel.org>; <netfilter-devel@vger.kernel.org>; "Bart De 
Schuymer" <bdschuym@pandora.be>
Sent: Wednesday, November 07, 2007 1:49 AM
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 
2.6.22.6


> ron lai wrote:
>> I've verified that the module works fine if no bridge is used. 
>> Unfortunately the patch doesn't fix the 2-calls-of-the-helper-function 
>> problem if a bridge is applied to the system.
>
>
> Strange, I can't reproduce this. To clarify - you're using only a
> single bridge with one device, or two bridges with one device each?
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter-devel" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

