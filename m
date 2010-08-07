From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Re: firewall and squid running on the same box
Date: Sat, 7 Aug 2010 22:36:53 +0000
Message-ID: <AANLkTimwzV8V=ts7Ph+EL6sDs-MXFHOzEPedeLrAmjww@mail.gmail.com>
References: <AANLkTimOQQqE1jrNLGKZW3T-dCmAAJzYu8cUyRTR4bMY@mail.gmail.com>
	<20100802141014.240229f0@catus>
	<AANLkTimn488wJ4ih5HnMOwgsKwrjWYvPd_r3skpNi4R+@mail.gmail.com>
	<20100802201932.051e9963@catus>
	<AANLkTikb3e0F_y+um=4iozf71F=4GKjwgQ55erJrCT6M@mail.gmail.com>
	<20100805122252.62b09f34@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=tqDBY1MeJM6OIaXtXKGIjS5wI8WKRF/k+gcg3tA4wZw=;
        b=YuuTMC14EFKsj2ZGMwxSvRR77G8Ay0m1rZcveTGKj0Pr5xaW8UJetU1TxmahdSiNIy
         DocFnSqRu4HVlqfvOh/yA07/DhGhY2BYXtKWQhmleeIEa51/x0jfa+s3nzVa+CbD34jK
         aqTaT4/T4QzxmOHyeuP56d/lWqVKnNPmqveZY=
In-Reply-To: <20100805122252.62b09f34@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi,
i've found out the the dependency.
and i' think it run fine. but my content filtering doesn't work.
i'm using squidguard as content filtering program.
Does any one has already implement squid TPROXY and squidguard (or
else content filtering program)
And i've also read that there is bug with tproxy when using kernel 2.6.32.
I'm using kernel 2.6.32.11 does anyone know if this issue has been solved.
I need your help and advices.

regards.

2010/8/5 Marek Kierdelewicz <marek@piasta.pl>:
> Hi,
>
>>Hi to install tproxy i need libcap2 so i'm trying to install from
>>source libcap-2.19.
>>but i got this error when make:
>>/usr/bin/ld: cannot find -lattr
>>have you already got this kind of problem.
>>Not my kernel version is : 2.6.32.11
>
> I didn't experience such problems.
>
> It looks like you're missing some libcap dependency. Look for further
> information in README or INSTALL file in libcap source.
>
> Regards,
> Marek
>
