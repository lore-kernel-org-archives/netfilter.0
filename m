From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: [ANNOUNCE] ipset 6.15 released
Date: Mon, 19 Nov 2012 15:53:50 -0200
Message-ID: <CADuigkXWY2mkzWRTDvi9wv5VTXt4phEHH69GArut9HY20iouOg@mail.gmail.com>
References: <alpine.DEB.2.00.1211191356240.21756@blackhole.kfki.hu>
	<CADuigkX_Mr_7ur=mta0DKhB7vmdXeAytBaDvP_zKHug5sO8zbg@mail.gmail.com>
	<alpine.DEB.2.00.1211191847190.23128@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=S7KCjFsR6uK2ydl5CERYO8dqZ8uOQXWx/6sk17skV5w=;
        b=MiJQ2E1ZNlzB0b+0OEg2OqiFhpfSYDUdj5Q8vAyH1OwTZ5DivpbYqWpY8jTvRj8MKq
         ewYSkgpT+jDqZSc36lexaNyxQS9em1U5x3DKATDNeW/CAKtaH+pGVvBgo19muWaGq+iK
         FfQUi50cB2tQEE/BIAaYV8JqDGz1WA1vMCGmKfFaLDfdqfss/bhwRigi2O3bCHncjgwi
         2ktAw/0S8B2jW/hDrrZpkb8BXAotBsqJQ0R50dn1qbLviq7FZrx/pkPWQ1Eqju0d9dYG
         /5t8Q9Ktwjj8+wRi9b2dRwWL7P5ft/CUPTqD/iFjy/BiAKgw5cOVwkbtDFkwLo7L0agU
         ELLA==
In-Reply-To: <alpine.DEB.2.00.1211191847190.23128@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Jozsef,

I have deleted "configure" and run autogen again... I think the
problem was created by my first test, because I tried to run autogen
without having autogen, pkg-tool etc.. on this box...
Now it has built succefull....
--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Mon, Nov 19, 2012 at 3:50 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 19 Nov 2012, Ricardo Klein wrote:
>
>> It fails on ./configure on CentOS 6.3 x84_64 with the message:./configure: line
>> 14702: syntax error near unexpected token `libmnl,'
>> ./configure: line 14702: `PKG_CHECK_MODULES(libmnl, libmnl >= 1)'
>
> It's funny, because that part was not touched at all. Can you successfully
> run "./configure" in ipset 6.14??
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
