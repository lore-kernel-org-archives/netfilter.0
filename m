From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Re: firewall and squid running on the same box
Date: Tue, 3 Aug 2010 23:51:26 +0000
Message-ID: <AANLkTikb3e0F_y+um=4iozf71F=4GKjwgQ55erJrCT6M@mail.gmail.com>
References: <AANLkTimOQQqE1jrNLGKZW3T-dCmAAJzYu8cUyRTR4bMY@mail.gmail.com>
	<20100802141014.240229f0@catus>
	<AANLkTimn488wJ4ih5HnMOwgsKwrjWYvPd_r3skpNi4R+@mail.gmail.com>
	<20100802201932.051e9963@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=gNOy5ynqhDPjtVPcVuAudPJiiX6vJRSRCx5rLYG+NXM=;
        b=d9CYGxSWFZfVRkpfayLlYn6LfPp4FEoDj03Bbsb8VBR7jjBgMr/S89x6i829IA4UJi
         0vQibc7dfX0jNpQUbS2G/LmYXc6P5i1p1HvR7oY/WM3XGqgn99N4EGDQ3/RQVpaF99Ti
         MxW/xfBqwmNlW6j0rgCAzRzJFfNBh7x5EQ6E4=
In-Reply-To: <20100802201932.051e9963@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi to install tproxy i need libcap2 so i'm trying to install from
source libcap-2.19.
but i got this error when make:
/usr/bin/ld: cannot find -lattr
have you already got this kind of problem.
Not my kernel version is : 2.6.32.11
regards.

2010/8/2 Marek Kierdelewicz <marek@piasta.pl>:
>>Hi
>
> Hi,
>
>> thank you very much.
>
> Glad to be of help :-).
>
>>my box is in bridge mode so the is no NAT.
>
> Great :-).
>
> Regards,
> Maarek
>
