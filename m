From: Eric <evil.function@proton.me>
Subject: Re: nft -f fails with netlink: Error: Could not process rule: Message too long
Date: Sat, 14 Jan 2023 16:37:42 +0000
Message-ID: <0XPN5x_Lvw9aH38vS71DvG7iNI9ym8JClcemPZUAsbJX0Hp57eO841r_EqStnX923hNbDFGYyqMA86pAjVzxiultSkx31u2yjFgG1Ve5oUo=@proton.me>
References: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com> <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me> <CADhidkr=O14uJzvxEa_O=4ubNTY2FkijH5N5XeeE_UGxXMt1Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1673714268; x=1673973468;
        bh=SQeNpNFX/op3xJGu8e+uZPQpr44JO5qaYRmLU7jd2uI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Q7tNXyhvOP3R/W8eVlTyaMRkwMlqbcX1ScaJj3wjVa05QRNiZSpX/He+pPlSN09G4
         lrcghu8fY1KMBdElFjK0kxgBotBP0xAfVcyhzKzXXOSk16xbYwIFMxI2JEoBMqcvEx
         8hCs1qmSCfMFZErTVhYnTgM8fqPwZeI3XkE1/zWrq2HlFolbBNj6VvXo6Et3M+wt5K
         noPOYFyay8hOjgoSnQuGC+BPvM0v0KWC/q+GY74afrmIuqVrd7KqgrWYZOgiZldxLL
         hS4KGt3mgiM+ZGxFHqa0G5MeZhQu79Puby1LClfWtLKhQBbGc+72jLtwaVvAVQ6ABO
         fk0xHgQIFI9nw==
In-Reply-To: <CADhidkr=O14uJzvxEa_O=4ubNTY2FkijH5N5XeeE_UGxXMt1Tw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

Gio,

Just out of curiosity, how many elements did you have?  I just dug through =
the code, I think this is the right spot: https://git.netfilter.org/nftable=
s/tree/src/evaluate.c#n2356   and it looks like only a lower bound (no empt=
y sets) is enforced on anonymous sets.

I then created a rule with ~540 IPv4 elements and another with 375 IPv6 ele=
ments (strange numbers because I already had a script with a bunch of IPs i=
n it), and it created the rules just fine.

Eric

------- Original Message -------
On Friday, January 13th, 2023 at 21:05, Gio <gioflux@gmail.com> wrote:


> thank you! this got me going into the right direction.
>=20
> It appears that I had too many IPv6 addresses inside an anonymous Set
> - I wasn't aware there was a limit of how many elements could be
> within a set (inside curly brackets)?
>=20
> There is no mention of a limit of how many in
> https://wiki.nftables.org/wiki-nftables/index.php/Sets - unless I
> missed something.
>=20
> On Fri, Jan 13, 2023 at 11:14 AM Eric evil.function@proton.me wrote:
>=20
> > Off the top of my head, --echo and --debug all will increase the quanti=
ty of output (the latter quite a lot).
> >=20
> > Eric
> >=20
> > ------- Original Message -------
> > On Thursday, January 12th, 2023 at 23:05, Gio gioflux@gmail.com wrote:
> >=20
> > > Hi,
> > > I have a relatively small config.nft file with ~220 lines that I am
> > > trying to load onto my system. When I do this I get the below error
> > > message.
> > >=20
> > > The ruleset is very small, so I don't expect this to be a buffer
> > > issue. Are there any recommended troubleshooting steps or perhaps a
> > > way to load the file in a more verbose way to see in which line of th=
e
> > > config.nft file this error is triggered?
> > >=20
> > > Thanks.
> > >=20
> > > root@nf:~/nftables-geoip# nft -f noverbose.nft
> > > netlink: Error: Could not process rule: Message too long
> > > root@nf:~/nftables-geoip# wc -l noverbose.nft
> > > 221 noverbose.nft
