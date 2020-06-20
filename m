From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: ipsec matching in postrouting nat
Date: Sat, 20 Jun 2020 22:33:49 +0200
Message-ID: <CAChjPdR5sZrJKhAgL1BK1wH3Gk64Fx4F1o+KYkJUJ-OcrMjGvg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=p6vJnbv6hNiG3KxHOCXzFlz2UDtwh1gFBN4jz+wZ2JE=;
        b=ECmYdGPlv+J7goLzSUMnYWLd7nUECwjhV4jooTeW92DevWWF/ozijHDBsWY6WmS02V
         GTlYdqWXjo7RnEy8eZ6f6LPYrrAI8qeu6tad0km5Qp22/5qBlehiP2w+K7TauA2a4msC
         ophDY53xYIxhEBpMbWN49yDWhBUb6FUQ1JFTHyqKjxTdGSngI5eIXPrImPGHUAPEz4oT
         bJu1siJjrsU4whvOTwg257EEYiRsCfWlfHJFbyPnIwTdrFq2vgmlb1xzNPETvarp7UYk
         DPaOke2hW4UYuGdbP5+fD9xiS0jftaNSZbqqEhcDDl8bS5sYoufy40x1wfBY7hFK+Kob
         wKJw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I would like to write rule similar to:

iptables -t nat -A POSTROUTING -o ppp0 -m policy --dir out --pol ipsec -j RETURN

in nftables. But I am not successful.

I tried:

                oifname "ppp0" meta secpath exists return

with no luck.

Is there some equvalent of the iptables command?

Thanks

Marek
