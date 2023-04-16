From: Jacob Middag <jacob@gaddim.nl>
Subject: Re: Change in nft set element add syntax?
Date: Sun, 16 Apr 2023 20:40:38 +0200
Message-ID: <CAHm0O6N_c65MfDbb_QXCX8EFF+yskQ6Du1NhoUkpwf8miRoS+g@mail.gmail.com>
References: <Yyv1RIjX0pGSbAMP@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaddim.nl; s=google; t=1681670475; x=1684262475;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwbHisH+luwhXp41boLoacS0cvmS5b6arNhRZTaad74=;
        b=cwgCvhkdk5XOv4SfT8soXZ/0muCenFLp3vhwl2mLvAW4pVSZ341VfnZnHOo9sz8AVi
         AOemb9iitJ85PvTDbYcCSJsRlVlPGJuvzZtHIler/rimLUnEtJlxtIVyDn9c/i4mITp3
         3ikfA3Jt2ih2eJASFSx+u21VvEtRN3M/mIIPj7JSNbRuSzpTQnixpJPlJOCVq2/3502q
         buADlN2Y/J84WJ5tbpSdpeoi0QW0dcx2/WyI2YWdnjPZ5Ys/DyVnzYZSkyeVODncB3wF
         5qRWqEAcVvn/xLtsolFb/Wb/p6zSn1xFU45P48+8EFuMyGAciblQlTDSot+olgwxtnGg
         krPg==
In-Reply-To: <Yyv1RIjX0pGSbAMP@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

On Thu, Sep 22, 2022 at 7:40=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> No syntax updates have been done, see below.
>
> On Thu, Sep 22, 2022 at 12:12:38PM +1000, Austin Lund wrote:
> > Hi,
> >
> > I upgraded from nft 1.0.1 to 1.0.5 and found some of the rules I have
> > gave some errors.  I narrowed it down to adding to sets.  It's all
> > pretty simple; the error is
> >
> > > # /usr/bin/nft -c -f /etc/nftables.conf
> > > /etc/nftables.conf:44:3-37: Error: Could not process rule: Operation =
not supported
> > >     ip saddr @badconns goto update_drop
> > >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > /etc/nftables.conf:64:3-28: Error: Could not process rule: Invalid ar=
gument
> > >     add @badconns { ip saddr }
> > >     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
>
> This loads fine here.
>
> # cat test.nft
> table inet filter {
>          set badconns { typeof ip saddr; timeout 1h; }
>          set badconns6 { typeof ip6 saddr; timeout 1h; }
>
>          chain input {
>                  ip saddr @badconns goto update_drop
>                  ip6 saddr @badconns6 goto update_drop
>          }
>
>          chain update_drop {
>                  update @badconns { ip saddr }
>                  update @badconns6 { ip6 saddr }
>                  drop
>          }
> }

Hi,

I had the exact same problem and couldn't find anything except this post.
I could actually track it down to a specific commit by git bisect:
https://git.netfilter.org/nftables/commit/?id=3D8d443adfcc8c19effd6be9a9c90=
3ee96e374f2e8

So it looks like setting the NFT_SET_EVAL gives the "Invalid argument" erro=
r.
If I got it correctly, this flag is equivalent to adding the dynamic
flag in the named set.
When setting it explicitly in the example with "flags dynamic",
it also breaks with the earlier commits, including version 1.0.1.

This led me to believe it is actually a problem in the kernel module,
and I found out I was using a very old kernel (4.9) without this patch:
https://lore.kernel.org/lkml/20191010083512.320042206@linuxfoundation.org/

Updating the Linux kernel to 5.15 fixed the problem for me.

Jacob
