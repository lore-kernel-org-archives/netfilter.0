From: Eric <evil.function@proton.me>
Subject: Re: nft -f fails with netlink: Error: Could not process rule: Message too long
Date: Fri, 13 Jan 2023 16:14:43 +0000
Message-ID: <tt2Tlxai4PFQZf_0YGPLhnfRHPPVdzet2L6s78yVMXQhNWh8tkfOLgZs848UMAA8R_uG8RW9CAwG201ENy6DZmS2zCBliW2ti7CCfHCYDHk=@proton.me>
References: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1673626492; x=1673885692;
        bh=8rPGGG13OpyClMFSCiajDH6sUATdoEEVWU/Fn0n8vs0=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=EStk4yFc0+1gkcCwXLyPQIpI0Osrj228ypVgEfI/cybJWxaNuYRXce0Zea0h78V4s
         kTRpTyVtwitsNnBxFg6dBYtk3KdAYGqwtV2XV57iTGpisplWApsNAX9EqYNkrbsY3s
         NLshiiMRYAtiqDtSfJLQDqfCxB6nJX5E4i70snJMkRHPbSuumnXbFx7Pj5+Sseidhc
         z6GbcWJBhVi1sUHCd1G6BhcEYcnmlP/0iu0DAJ7WDc24gzPB55Atue54gLxaAF2DJL
         XwVVXPZqRnEKGuEuMiWtJrloeRmymsJVWeRLfbSHlHE8fdpOKg2uGTBNvrQd1EGLei
         v5md5BzFpCfFA==
In-Reply-To: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

Off the top of my head,  --echo  and  --debug all  will increase the quanti=
ty of output (the latter quite a lot).

Eric


------- Original Message -------
On Thursday, January 12th, 2023 at 23:05, Gio <gioflux@gmail.com> wrote:


> Hi,
> I have a relatively small config.nft file with ~220 lines that I am
> trying to load onto my system. When I do this I get the below error
> message.
>=20
> The ruleset is very small, so I don't expect this to be a buffer
> issue. Are there any recommended troubleshooting steps or perhaps a
> way to load the file in a more verbose way to see in which line of the
> config.nft file this error is triggered?
>=20
> Thanks.
>=20
> root@nf:~/nftables-geoip# nft -f noverbose.nft
> netlink: Error: Could not process rule: Message too long
> root@nf:~/nftables-geoip# wc -l noverbose.nft
> 221 noverbose.nft
