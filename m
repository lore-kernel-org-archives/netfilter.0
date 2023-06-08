From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
Subject: Re: IPv4 Evil Bit
Date: Thu, 8 Jun 2023 09:58:39 +0200
Message-ID: <20230608095839.076d212d@parrot>
References: <20230607131743.309d5aff@parrot>
        <CAPJdpdCeuST=ac0K5oQQq=THOPZqnXESQivLqMK0yDRfq3ZeoA@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yjrpbz5OEJggrrl0oKjoTCW";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
        t=1686211023; bh=dl0E+q1whm42E79nevz0zt+CrIy8ex8ZcQXzyB3Cmwg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
        b=gSJ5wcPOcCE78CjJ401CZQNp8Yx76Ldft+KJzK9HrMUBWAeffV1QmPgiyaDBgZLNW
         4PQitFW4/ffrwtT1bKlCSsLe6sXtpLYbLvUF11pZjH8i9THHnc0Jz16ejSR7qY7Cw/
         6FP6ZymqZxlThbCqZkG50TSf/+HQknk9tO5OSOq+NTE9RtqJetLF+HVH+D5ssPOxOh
         MuQZPAmMrBOH6Xs+uJBg4AY+dL2iQ7tHdRcnnqWPG93FRX+3aHP691X96/+YM0731M
         LadWHCIIPFsba08UmhW2HBx3v29jSQPYTEKzKQI6A7JUd+TN0JDqsiR+M1pxKhiEt3
         IjLyjgrXwbbgw==
In-Reply-To: <CAPJdpdCeuST=ac0K5oQQq=THOPZqnXESQivLqMK0yDRfq3ZeoA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: netfilter@vger.kernel.org

--Sig_/yjrpbz5OEJggrrl0oKjoTCW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Jun 2023 10:38:23 -0400
Paul Robert Marino <prmarino1@gmail.com> wrote:

> Answering the first question i think you may be looking for sets
> https://wiki.nftables.org/wiki-nftables/index.php/Sets

Thanks for the answer. Is there a possibility to combine sets (i.e. to
perform a kind of merge)?
iifname @dnet_interfaces oifname {
@client_interfaces, @dnet_interfaces } goto dnet_forward;

>=20
> As for the second one RFC3514 implementing that is a bad idea for a
> number of reasons which is why as far as I know nothing implements it,
> it's too easy for a bad actor to take advantage of. In fact it was
> actually an april fools joke RFC. There are a lot of those and some
> people confuse them as being legitimate but they are not. if you see
> an RFC with a publish date of April 1st any year don't take it
> seriously.
> AGAIN I CAN NOT STRESS THIS POINT ENOUGH THAT RFC (RFC3514 ) WAS
> WRITTEN AS AN APRIL FOOLS JOKE!!!!!.

I know this RFC is intended as an April Fool's joke. However, I would
like to see how many requests I get with the Evil Bit. And how many
requests I forward for the dn42 with the Evil Bit.

How could a malicious actor have the advantage if I log this bit? Or do
you mean that I shouldn't rely on malicious requests having that bit?

"Inspired" me to this idea was
https://blog.benjojo.co.uk/post/evil-bit-RFC3514-real-world-usage.

>=20
> On Wed, Jun 7, 2023 at 8:12=E2=80=AFAM Marek K=C3=BCthe <m-k-mailling-lis=
t@mk16.de> wrote:
> >
> > Hello,
> >
> > I hope I am in the right place. I have two questions about nftables:
> >
> > 1) Is it possible to perform OR operations in nftables? For example
> > `ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
> > understand it, everything else is concatenated with AND.
> >
> > 2) I want to see how many IPv4 packets I can get with the Evil Bit
> > (RFC3514). Since there seems to be no native function for this in
> > nftables, I seem to have to use raw payload expression. So I have
> > set up the following:
> >
> > @th,6,1 & 0x80 =3D 0x80 \
> >     log prefix "[nftables] Evil bit: " counter reject;
> >
> > However, `Error: syntax error, unexpected '=3D'` appears. What is the
> > reason for this? How can I formulate this expression correctly?
> >
> > I would really appreciate your answers!
> >
> > Greetings
> > Marek K=C3=BCthe
> >
> > --
> > Marek K=C3=BCthe
> > m.k@mk16.de
> > er/ihm he/him =20


--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/yjrpbz5OEJggrrl0oKjoTCW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmSBii8ACgkQfoaRRmmR
CMdKmQ/+OSN7CSb8PGqxctKSQOx/l4fjFjxWS4EKp/3Ob4fKZinDvfF5uGdYGA+O
3b7vbgXO1DodHeuBNMAoQFYAUgiyGG8obUxe6McJt3CgQejDYVTU3DG96U0jYBSw
e6e4+DPHNCOJAe+OnplJBY39Cs1VN0O9jPmGzgFAA/lkEg9dr29UaltoIPPy9iR8
9UJ1YyZ73VgK513U/i876FwGbCzRGk1VZTStt1a2B3WX88m+98Xxglel2LnYcVO4
cLr9495v1RBWwvjHpfm6pJWkxukfSSlvirWNdrhkQYxJv0JeL3D5WwlPx2EK7OOX
Cu2+5f2MAd8KYASQc8hY6/36o68tR/DpJ7WEm3771c4b6feN3A+EaxTHSuXuZFXN
4L0cw7NLD+FEX9jLBA32Q1OJe+rTj3AULxC8CksubdIR/Q5n+aGj6EeBopvzjg5Z
wWLFz5G0D0uy7EjtrcqjwchHX51gA6ZbGR5fzklsYAKm3Ns7FQaYdGszMND4aLDT
IyJtclXmrpvv6ZXdOMlJXCF19pyiVwhlvdj8OFlVxix4ONE2Wz1vXGxjBof8m8xc
NBQ76v7CJ7xz4cp/7GZg1gbKW1dZo7Nx5UfxvOPtKpuM37gX2BPtYSQbI38mLL3K
KQSHvB999Y+dYTVKsywkS5eNeXZOE3K7/Km1GDGPMOQ6f95tNpg=
=txJf
-----END PGP SIGNATURE-----

--Sig_/yjrpbz5OEJggrrl0oKjoTCW--
