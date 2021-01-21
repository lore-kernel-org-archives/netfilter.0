From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: Migrate ipsets to nftables
Date: Thu, 21 Jan 2021 20:18:02 +1000
Message-ID: <e75a9fa70660560f33b43ce654395f94e899d380.camel@lusan.id.au>
References: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
         <87122b3e-c40c-1df5-360c-4298cdff509d@plushkava.net>
Reply-To: nikolai@lusan.id.au
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611224288;
        bh=MW3L2s9/YVeJSTbsvBqzKdwr0NazQY8u+jCV5rP5bgw=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=UrhmqfzWadCipUqhullx12u5hsZYq2L7EIijhBFuH9OzS9Y8e+xsBq1Eltm9PD8s3
         yAa5xlx2FO9H6TT7l9bXKjNYi7Bbm9y4Mfg40yIJx/5fDNMmTfB0CGU1iczs5VKMsB
         atgPZzpRz8B08bW0ol1PBa5qoAtDNgG703ME2eFw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611224284;
        bh=MW3L2s9/YVeJSTbsvBqzKdwr0NazQY8u+jCV5rP5bgw=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=SL6DlvrdDOGiwBlHsQfKeLBg4DheL+6mfjz87EDUXpaOuen8iITJFwjWUyE1/3xFY
         oEKzs63GSYoxc9pcbQXwDLMQRWTpnscexhEgPFUhorsjW3ZXTCCqKw+RbGoUncjq80
         REK3Hp4+9sdGfbUgo8iVwD3xDqcJuLZtHnoiNP3E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1611224284;
        bh=MW3L2s9/YVeJSTbsvBqzKdwr0NazQY8u+jCV5rP5bgw=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=SL6DlvrdDOGiwBlHsQfKeLBg4DheL+6mfjz87EDUXpaOuen8iITJFwjWUyE1/3xFY
         oEKzs63GSYoxc9pcbQXwDLMQRWTpnscexhEgPFUhorsjW3ZXTCCqKw+RbGoUncjq80
         REK3Hp4+9sdGfbUgo8iVwD3xDqcJuLZtHnoiNP3E=
In-Reply-To: <87122b3e-c40c-1df5-360c-4298cdff509d@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

On Wed, 2021-01-20 at 21:26 +0000, kfm@plushkava.net wrote:
> On 20/01/2021 10:41, Nikolai Lusan wrote:
> > Hi all,
> >=20
> > I am in the process of migrating from iptables+ipsets to nftables.
> > Is
> > there an easy way to migrate exisiting ipsets to nftables sets.
> >=20
> =C2=A0>
>=20
> Assuming that you are alluding to the prospect of having a utility that=20
> can act as a stand-in for ipset(8) then, to the best of my knowledge,=20
> the answer is no. At least, not yet.
>=20
> That said, if you were to go into more detail regarding the aspects of=20
> migration that you are having difficulty with in the absence of tooling, =

> it should be possible to provide some guidance.

Basically I have a handfull of custom sets, the small ones are easy
enough to transition in nft - and they remain fairly static - the
larger ones (some contain networks, some IPv4/6 hashes) are cumbersome
at best to re-create ... currently I have been using ipset-save to put
all the sets into a file which is used to rebuild the sets when needed,
or on reboot. Some of the larger sets have thousands of IP addresses in
them, so sticking them in the standard nftables.conf file is unsightly
and unreadable at best.


Thanks

- --=20
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAmAJVNoACgkQ4ZaDRV2V
L6TdLQ/+JGk3aJPF05g9EruLg8zvdod2Y15r26JnU4PR/irx03AL0Fm/dxrmQX33
NAYlbBAXmeUAoy72KI2whkCLjLb95coET26dMiLKV2Oal+XpCzl3OMtI08Bx+bxm
LNOm1CcnxJ0LqNr2Uhw1ilfTbkLwD7i2s3r2wnXKYy1TTqB5In7eQZ7XKGKACpQV
qj8lHe6eNEX93SxEYvagAUzELePT7eRCWT7GigCJW3CdkztVVm7+b4cSI5BELvau
ZervzYjcHhJKRR6zZS6lkVjOrj/ImKRhZxpg4BBJHDVBmkoEV1b4ezc5ZL21KjkG
bguYeECc0EgwQkbgS3FCVinLiFZfdVqlIg3/7RcBXmqCTDqLpbVMdKs/kJV+vBJE
D5k8urMcWBDKGU9hdxtQNbKDXYDiIZhXBaV2Dh0nXie1C9cGwrz89z+OIHd3xhWU
NUUs7Z0H/+NefdoYVNvv2vwdnDnRhIrISB8FyL7WEL1lyVogttKCWf+nPcDy8XxS
i7zF77Z845zBYx4O4JrnGDrZJCeRpiV6XwsEoJGwlk6RNsFtOtS1hgBrfMwADd/k
WQ/J4Nh1D9BdxmWksPTY7YgMgZfWNgAebB8PxnYJFSlKc08v6Smj7xYp14sJb1Pp
P+3L8aSfDS6v7RHCZTt8YLRSI9nzSNV7UySHQ24KASmG0pphXlA=3D
=3DL6+H
-----END PGP SIGNATURE-----

