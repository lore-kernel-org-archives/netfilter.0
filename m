From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 07:26:36 -0300
Message-ID: <CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=RRk/4WF7uEH2NsFiZul97S2WzRxm2PX+A4sRwbtoNbI=;
        b=zPbKfp/xvYh1ZB4WgR+poq8abVQBPLP9vPTSWwNd6dq81ubtsxA9VHiFjpwmWz2X8L
         XmGW9pMHZAFpdMV7hamq41AiwvOirz12IJ3GRoXGbk+m1s09L8G+oZ7ys27VHzRrsaYl
         NC2nAKRuCqbfs9obh7MnftROESBSH5Pkq4jivm1UWdnQOQ0GSXh5MgvA3+/lW6VjUG80
         sLi+LY+TJrOXh2pk1xoaII0CFYnqyuamskh00OW2iUqdwKgIvwzzDtpGOu6cfuAARERm
         iTwR6Cdq+A39AUBtfNHOWVOBUJDUdV1U1iaT6bGpVQQPvSeTtB/djyKSw/mmOJxNIZxC
         p/Rg==
In-Reply-To: <5278501B.4040406@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>, netfilter@vger.kernel.org

Hi,

The cache control for load balance can be done with:

1. scheduled flush (to remove old entries)
/proc/sys/net/ipv4/route/gc_interval

2. Lifetime of each learned route
/proc/sys/net/ipv4/route/gc_timeout

If you want a aggressive load balance
echo 1 > /proc/sys/net/ipv4/route/gc_interval
echo 1 > /proc/sys/net/ipv4/route/gc_timeout

But the ideal is not to change the gc_timeout.
You certainly have problems with https.

I tend to set gc_interval with 1 and  a higher value for gc_timeout.


2013/11/4 Eliezer Croitoru <eliezer@ngtech.co.il>:
> If it's not the right place please help out.
> I have seen that there was a commit in the linux kernel that removes or
> removes in a way the ipv4 route cache.
> I Had couple questions to make sure I understood how it all chances from
> with cache to without cache.
> and also is there any level of routing cache that is still in place and
> works??
>
> Thanks,
> Eliezer
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
