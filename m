From: Gio <gioflux@gmail.com>
Subject: Re: nft -f fails with netlink: Error: Could not process rule: Message
 too long
Date: Sun, 15 Jan 2023 02:09:30 -0500
Message-ID: <CADhidkpbk8ZzUKe7yEisVasYxOuL9Ai7CuH_3e_xK9fMds3Ang@mail.gmail.com>
References: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com>
 <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me>
 <CADhidkr=O14uJzvxEa_O=4ubNTY2FkijH5N5XeeE_UGxXMt1Tw@mail.gmail.com> <0XPN5x_Lvw9aH38vS71DvG7iNI9ym8JClcemPZUAsbJX0Hp57eO841r_EqStnX923hNbDFGYyqMA86pAjVzxiultSkx31u2yjFgG1Ve5oUo=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoqJt0lp3/IPN5A/u7lUZql37LTP2vnnzDVjEZ8NFR0=;
        b=cHGDHctPMWG3loRyM+l0AkX2lkoIwrFkU3fXPWwbwRojZPbX7QWqw5yv22oQqhGFFM
         9bs5Ik3RP1L/hLbn+alkGUTeFRRrM6f3QweQk3sz/YiILr/Q/SEXodXuFgDV2NPGtsed
         SeMkejSbExjtMyTXQMCKtd69H6jKRDBUwywsxx4LYJY3sFYTKCt7hl0VcYBdGR9Vt7hM
         BghENiL/EMjFm3EfAwEtEYvzfTu9D6afnBFmueu8dDdkqyTuwBu2cLEHv30pkUnJynJJ
         dL7oIfBmFgfRAZfY2XFij6JDbu8v3wCSB0BSdPfujQJEhbLmquQO1tlMc4prRw1ZGwG1
         YmNQ==
In-Reply-To: <0XPN5x_Lvw9aH38vS71DvG7iNI9ym8JClcemPZUAsbJX0Hp57eO841r_EqStnX923hNbDFGYyqMA86pAjVzxiultSkx31u2yjFgG1Ve5oUo=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <evil.function@proton.me>
Cc: netfilter@vger.kernel.org

309 IPv6 elements inside the anonymous set. The rule looked like:

ip6 saddr { ---list of 309 /64 IPv6 ranges separated by commas } ct
state new accept

Rule was formatted inside a chain; then referenced in the base chain
using "jump". Only after I replaced all 309 IPv6 items with a single
IPv6 term for testing did the rule load without an error using "nft -f
rule.nft" command.

I could share the rule.nft file privately over email if someone would
like to try to reproduce the error on their end.

On Sat, Jan 14, 2023 at 11:37 AM Eric <evil.function@proton.me> wrote:
>
> Gio,
>
> Just out of curiosity, how many elements did you have?  I just dug throug=
h the code, I think this is the right spot: https://git.netfilter.org/nftab=
les/tree/src/evaluate.c#n2356   and it looks like only a lower bound (no em=
pty sets) is enforced on anonymous sets.
>
> I then created a rule with ~540 IPv4 elements and another with 375 IPv6 e=
lements (strange numbers because I already had a script with a bunch of IPs=
 in it), and it created the rules just fine.
>
> Eric
>
> ------- Original Message -------
> On Friday, January 13th, 2023 at 21:05, Gio <gioflux@gmail.com> wrote:
>
>
> > thank you! this got me going into the right direction.
> >
> > It appears that I had too many IPv6 addresses inside an anonymous Set
> > - I wasn't aware there was a limit of how many elements could be
> > within a set (inside curly brackets)?
> >
> > There is no mention of a limit of how many in
> > https://wiki.nftables.org/wiki-nftables/index.php/Sets - unless I
> > missed something.
> >
> > On Fri, Jan 13, 2023 at 11:14 AM Eric evil.function@proton.me wrote:
> >
> > > Off the top of my head, --echo and --debug all will increase the quan=
tity of output (the latter quite a lot).
> > >
> > > Eric
> > >
> > > ------- Original Message -------
> > > On Thursday, January 12th, 2023 at 23:05, Gio gioflux@gmail.com wrote=
:
> > >
> > > > Hi,
> > > > I have a relatively small config.nft file with ~220 lines that I am
> > > > trying to load onto my system. When I do this I get the below error
> > > > message.
> > > >
> > > > The ruleset is very small, so I don't expect this to be a buffer
> > > > issue. Are there any recommended troubleshooting steps or perhaps a
> > > > way to load the file in a more verbose way to see in which line of =
the
> > > > config.nft file this error is triggered?
> > > >
> > > > Thanks.
> > > >
> > > > root@nf:~/nftables-geoip# nft -f noverbose.nft
> > > > netlink: Error: Could not process rule: Message too long
> > > > root@nf:~/nftables-geoip# wc -l noverbose.nft
> > > > 221 noverbose.nft
