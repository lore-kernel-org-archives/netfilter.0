From: Imran Geriskovan <imran.geriskovan@gmail.com>
Subject: Re: IPtables and HTTP/2-Push?
Date: Thu, 14 Sep 2017 12:58:38 +0200
Message-ID: <CAK5rZE5RhzuHT+f+jpUGpzS7WnorSoUK8xtbOQLMSFjweTvmEg@mail.gmail.com>
References: <ba7e09d692a6bdb55ad32d7e106e33c7.1505378527@squirrel.mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nTU1CmTyxmGanpTxurOrofctqI5+R64R2EykVZwpW+Y=;
        b=EErpjGcNuUJFoJlvE4xccqVLZrkzJVnxRjcaY2IrGyAkglPLdIbsaEN7fVFSnEQLWg
         h5peW+ZeqJUmnUciu6a2dchhuDM0NYCX0nrbROELLRkoR5rKLkCKK/qZYbLzgQMZ5WZR
         7kSp0WPUChdHPfU/NGjrvLSKcnFsDkfdSdY7SNnwrVGKL8ZpGDssyb8vOhDYfgKgm3NC
         UNw/64gdfhdxDMpv3m6Ol0nJ1nFlqTTuiIqRHHCu80vVIDTXfZmmShCz03CBeke9olsT
         SSPc6dJ7BJoydNaMwGImZwoEFpseaqdpxGRyGeaOZ1xJPpTOCcsSGjr7U2KQ15/9OHaE
         YF+A==
In-Reply-To: <ba7e09d692a6bdb55ad32d7e106e33c7.1505378527@squirrel.mail>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Walter H." <walter.h@mathemainzel.info>
Cc: netfilter@vger.kernel.org

On 9/14/17, Walter H. <walter.h@mathemainzel.info> wrote:
> Hello,
> when I have these two rules on client side (Browser)
> or on firewalls/routers
> what happens to to packets that the Server pushes without request?
> I ask this because I see in the logs regularly a few entries like this
> as I filtered away INVALID, I can imagine, that these blocked packets come
> from HTTP/2-Push ...
> Am i right?

As far as I know http2 pushes content over already open tcp
connections. So I guess that invalid packets are probably unrelated
to http2.
