From: Will Sewell <me@willsewell.com>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Fri, 6 Oct 2017 13:23:52 +0100
Message-ID: <CAKMCqEK6NN1HoA4A-5A=ku8RX8_VYEp=LtHWAkTkjqMdK=2qjw@mail.gmail.com>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org> <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org> <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
 <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org> <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
 <64d6734e-ca72-3788-42d4-afe495b3f372@plouf.fr.eu.org> <CAKMCqEJ4urXwNcwcQQ6y6_ogyhU7GDX_pQM=tusZOpHNvHoETQ@mail.gmail.com>
 <5e618aa9-262a-b3b1-43e6-28fdcdfd1731@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ghJ1ZU6TwUfpHVkMMbVJxXdUQycqzu7Mtrssds09RG8=;
        b=SJl6XuiUlNelMeFa0rMuABNoufp2iOHsk4lstb0URYENBXaMIk8sL+QCPmb/5ghm4v
         SIdImsEMTmBiYJeS2CFPSR0IxXAIx5xuR7IJ5qvCn6rxj38jS2u3aqlJ47+YWX0SQc4S
         ucTgdiBPFk4as1ynMyovGXskn3YPxA6wjmlYTCL82rjmXQXv8AQJs+QZJ+yYCJjtbm+r
         Lc6rVRCijaiMBWHsdOUWNzTM42bzV+kYxU0F1GsCx02csFPDSmHhW011TWEnY1Va0bn2
         4sBoCG//N5PN5ZQasIcPGbxZZShLUQQ8ia1298o8fkmjPT4d5zqq5ekDILZ4PVK6C1xI
         ee0w==
In-Reply-To: <5e618aa9-262a-b3b1-43e6-28fdcdfd1731@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> There are variations for handling of "special" protocols such as ICMP which
> use header fields other than source/destination ports to identify
> connections.

Makes sense. Thanks again for your help!
