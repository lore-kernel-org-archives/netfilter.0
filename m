From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: rate limits
Date: Wed, 22 Jan 2014 12:00:58 +1000
Message-ID: <CAMD-=V+wkwPTUm=Ngq53NYcrqeOYGimXL=AnxhQ5XL10=Pq2+Q@mail.gmail.com>
References: <CAMD-=VLUemcvn4GG6cP9SEyMP4O605s=ZK2-OGDUN=hYd2g9vQ@mail.gmail.com>
	<20140119040111.GA22074@home>
	<201401191549.17016.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Gplrpu+i7I7eoYIcf88jZGopt4k8x5+9mGjrAME8UYo=;
        b=H5rDklA4wr56AsdocgYfQ3v/AkV3cjtXNL3odrMO+hXGh+TTsdW3+uw7x5MMvQXqBq
         SCegJ1y0ikrC2wNYBoUKdJQaUcWGZu/xh/WoXXpp5CdltVWKgkdcQ9xQuV9GYv1LIPTE
         CPaVWhdGcO5R5tcskifef2/GHx3DD3HepoRMKZcw+Ps9ppZcAZH9aQnju0OhuKWsYw5J
         TvM19ogCU78+mDjpVgWCwBTriykZuv5spzfpOcsRENGZDZARDYza/joMHWxresCu6O0n
         +KTayfI5cgoPvnTPVgI6C05A7vHs+SRAPD5Dh/Zu+0f7DcQ0M+5y3NfOc6wh+XwOqqzP
         vC+Q==
In-Reply-To: <201401191549.17016.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

Thanks, opted for -A  seems to work now, no idea why it didn't originally

On 1/20/14, Neal Murphy <neal.p.murphy@alum.wpi.edu> wrote:
> On Saturday, January 18, 2014 11:01:11 PM Phil Oester wrote:
>> Yes, don't use -I to insert the limit rules at the very top of the INPUT
>> chain.  But if you insist upon doing so, exempt your LAN from the rules
>> by adding "-s ! 199.x.x.x/22" to the two recent rules.
>
> Or "! -s 199.x.x.x/22" since 'infix' notation has been removed from recent
> versions of iptables.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
