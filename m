From: Ajay Lele <ajay.lele@gmail.com>
Subject: Re: How to change source address of packets destined for the box?
Date: Thu, 25 Mar 2010 16:58:50 -0700
Message-ID: <bf5857901003251658m72557ae6tc75abdd541d2464c@mail.gmail.com>
References: <bf5857901003251607w7b1ab8bcjbe03326f8a54ef9c@mail.gmail.com>
	 <alpine.LSU.2.01.1003260013500.6000@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=ijTcYtPUxdS4GrTsJM7v+ayTM6WAlo/NRY0HOIXjkts=;
        b=q4jfv0FGIm3kRU5Ew03FCVkDtDhu/fCEyGfNEPcb9dDDR0KGyI87qRwZBLk1PZ5/Bq
         dfcrVYTUaKt48fAMmPF7FJ/S2OYGQaaGSPG6UX6fEeuocISLyFQcU6grJdND2qkJv8Af
         ERf17EXQmRtOv2tQNzwd/6xgLeFYA1Yn8rdWw=
In-Reply-To: <alpine.LSU.2.01.1003260013500.6000@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Thu, Mar 25, 2010 at 4:17 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Friday 2010-03-26 00:07, Ajay Lele wrote:
>>
>>For a peculiar VPN address management scenario, I want to change
>>source address of incoming packet destined for the box (inner IP
>>packet in the IPsec tunnel terminated on the box) to a certain value.
>>With iptables, SNAT can be configured only for POSTROUTING chain which
>>won't be hit in this case as the packet is destined for the box.
>
> Do the SNAT on the tunnel entry point, not the exit point.

Thanks, Jan. I see what you are saying - but unlike conventional SNAT,
I do want to change source IP of packet coming out of the tunnel i.e.
at the tunnel exit point, instead of tunnel entry point. This is to
make the box believe it is interacting with a local device rather than
one across the tunnel

>
>>Googling showed an old thread which discusses similar issue.. looks
>>like at that time there was no other way to achieve this. Does it
>>still hold good?
>>http://lists.netfilter.org/pipermail/netfilter-devel/2001-March/000717.html
>
> Citing Gung So from that post:
> | this will allow you to
> | later move the protocol state around _without_ breaking the connection
>
> A much more proper thing to do in Gung So's case is to use things
> like SHIM6.
>
