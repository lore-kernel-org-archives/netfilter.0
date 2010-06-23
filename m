From: Florian Effenberger <floeff@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 18:46:08 +0200
Message-ID: <B385EF4A-68AA-42B8-8BA7-0C010DA7F171@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21D503.9040505@chello.at>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:mime-version
         :subject:from:in-reply-to:date:content-transfer-encoding:message-id
         :references:to:x-mailer;
        bh=f3/Nx6AgKnN5myRwgZzDVRrm0ep+ep0sU/pth/SHkPs=;
        b=D+UTg4mTihtvRZcBISBXxdoegLHJmDHnTd5JmlH0nk+BB8bg29qmo8u/i7nz6Lup3z
         Al1Aru9G6atAFYA+Q1yr05XNsDR0ewGdwLAkTTEPvTN6HqXd1bwZaUXgQUZOvym1dkat
         T/i4RHfxNVrrUaKigL3pFUQF6arb4mVaTsNJ0=
In-Reply-To: <4C21D503.9040505@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Mart,

Am 23.06.2010 um 11:33 schrieb Mart Frauenlob:

> ipset
> http://ipset.netfilter.org/
> 
> is the answer to that problem, if you insist on doing it with iptables.

Are there any other solutions, except some sort of proxy?

> all your cron job would have to do is to (pseudo code):
> 
> ipset --list gmailset
> 
> diff newlist oldlist
> 
> ipset --add new_entries
> ipset --del dead_IPs
> 
> 
> you might have to tinker with your kernel before.

Thanks a lot! I wasn't aware of ipset before, but will definitely look into it!

Florian