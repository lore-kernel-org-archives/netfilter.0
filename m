From: Gio <gioflux@gmail.com>
Subject: Re: nft -f fails with netlink: Error: Could not process rule: Message
 too long
Date: Sat, 14 Jan 2023 00:05:46 -0500
Message-ID: <CADhidkr=O14uJzvxEa_O=4ubNTY2FkijH5N5XeeE_UGxXMt1Tw@mail.gmail.com>
References: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com>
 <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=074xj3YMAdwk5DBL09NHOxHOl3sTPJa1XG+GfEdVX4Q=;
        b=ZiBLLH5glhdKCjGtehDedQqkaRXXhgZs7Fe++4C3YBjeuIrYidPsps7XfIO82YCwnf
         u9D9er8Fp8TLkr0KwfroKpLnVct/0Nd4rI3MUGBx4aMS0I1X1OGzmlT52+2KcGeRlpOP
         FU7iBarNKLZNlDGn0gbFHsydldQPrcTp5ccX6iFbRMCJuvz61KWuOzAam+LJv664m8xy
         mTgQHHPMgC5s8l+ly1CajUePE9QVBacrZBFxU9ZMZMsTedB6MX+ZbUALnbx2E5IoI/am
         bKCEsyZ9cjTn7GprDpBjYgabEQYSK/5QokwrYmcqf+dr5AuIaA48nGVcAziiiaxAdY0T
         bbMw==
In-Reply-To: <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric <evil.function@proton.me>
Cc: netfilter@vger.kernel.org

thank you! this got me going into the right direction.

It appears that I had too many IPv6 addresses inside an anonymous Set
- I wasn't aware there was a limit of how many elements could be
within a set (inside curly brackets)?

There is no mention of a limit of how many in
https://wiki.nftables.org/wiki-nftables/index.php/Sets - unless I
missed something.

On Fri, Jan 13, 2023 at 11:14 AM Eric <evil.function@proton.me> wrote:
>
> Off the top of my head,  --echo  and  --debug all  will increase the quantity of output (the latter quite a lot).
>
> Eric
>
>
> ------- Original Message -------
> On Thursday, January 12th, 2023 at 23:05, Gio <gioflux@gmail.com> wrote:
>
>
> > Hi,
> > I have a relatively small config.nft file with ~220 lines that I am
> > trying to load onto my system. When I do this I get the below error
> > message.
> >
> > The ruleset is very small, so I don't expect this to be a buffer
> > issue. Are there any recommended troubleshooting steps or perhaps a
> > way to load the file in a more verbose way to see in which line of the
> > config.nft file this error is triggered?
> >
> > Thanks.
> >
> > root@nf:~/nftables-geoip# nft -f noverbose.nft
> > netlink: Error: Could not process rule: Message too long
> > root@nf:~/nftables-geoip# wc -l noverbose.nft
> > 221 noverbose.nft
