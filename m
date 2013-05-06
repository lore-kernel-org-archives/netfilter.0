From: Vishesh kumar <linuxtovishesh@gmail.com>
Subject: Re: syn flood load test
Date: Mon, 6 May 2013 16:09:09 +0530
Message-ID: <CAKpaJ1zZVywuQ-CppwHZ7sjzr2yKGxd9OX=+qnuFYkXf0gH1jA@mail.gmail.com>
References: <51869EE6.5090506@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=DpQXBx3Ky566eeGHl5xC7Kn6dNdGUJkCZ/HtoX5eRCo=;
        b=InSiytucTMEpF0+1lfNlJTHbOTAp/NJgPhT3uYK62Ar+nahMMGCtCxCvqyd70PgoxQ
         UFPITMcUlVj/ehndhegwHS9wSif88mUEn4y8SCRDRwulKnwUb4g5L/FbrldMf8JltPRz
         wJF81WporKbFkYGnMdAybtG2BXtk4rN6PRiUkBEjP9br8Ed3vnE4V+DwQ0DT4wOPuhUr
         CYtriQW2108nkNH81ZR0MT+yPf0UE7mH8I567uYERutx+pCkyd/E4ErCLvXw8hrjLH9K
         OpVPQ0911rlofFW381p74NBRgkxfEi0AaNvBr2xWPNOWl3uMjmX2utXwIgThK5YEbSh6
         xWQw==
In-Reply-To: <51869EE6.5090506@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Flex <aflexzor@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

For me scapy does this. You can also try scapy for this purpose. Scapy
written in python is very rich but may be a bit of python scripting.

Thanks
Vishesh Kumar
http://linuxmantra.com

On Sun, May 5, 2013 at 11:33 PM, Alex Flex <aflexzor@gmail.com> wrote:
> Hello all!
>
> Not exactly an iptables question, but iam looking to stress load such
> config.
>
> I tried using:
>
> hping3 -p 80 --flood --rand-source -S my-ip-here
>
> However  i wasnt able to get more then 10k pps, i even tried running two
> instances of hping so i ca use two cores of CPU and it doesnt make a
> difference.
>
> Anybody have a suggestion? Iam looking forward to generate 300k pps flood
>
> Alex
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
http://linuxmantra.com
