From: Eric <evil.function@proton.me>
Subject: Re: wiki documentation error
Date: Sun, 25 Jun 2023 21:50:44 +0000
Message-ID: <om-be6P8E-nyvhRJhp7MDC0HyKHBqwlh1Ln3q4CJCTnJSXPdwyfOlF9LjVEq42Dl6jNSX7Otwlu329rv1cudQcWn4AOUWXTF2RjMkRf9eto=@proton.me>
References: <ZJfigQmqgt3X5pnW@deegan.id.au> <20230625220427.2d024d2c37d2b5a266f9ceb6@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1687729857; x=1687989057;
        bh=6BrWZHkw+g5uXfzTqh9wg/2rfBZpFLh/fDkBIVG+T9Y=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=i7cz2k5VaEKtY4Yn79wDoWJlSUP+Vpiwqm6vqIxQ+nv2ge8ccRMTqEAjvXHKhSKJU
         XhbmDEKaASek5BwvJJ0hwDpB8cokVCs8m9CA9IaN2OzaCDUVH63Oq8uR7mauGPNYSJ
         yaU7xwPs4EsR3ug04XGc1S0H0y9BJN3SCBeQE5qNgGTWRsvcjtjPl+GMpPtvrHJA+E
         SQJ7xmeKbMMOrVUIEP57uw4WAVUZbdw0yRkHHXQMTRDLPQ/oeG5tXsvSgyJrDYsGmI
         vC0oAs/ch47wYOka4Glkw3aZX5/ZautV9fN4WR81hniHAsyR3jL4UMg5JONjwzsw8z
         UOn1Ig8DeWuIA==
In-Reply-To: <20230625220427.2d024d2c37d2b5a266f9ceb6@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: Michael Deegan <michael@deegan.id.au>, netfilter@vger.kernel.org

On Sunday, June 25th, 2023 at 14:04, Kerin Millar <kfm@plushkava.net> wrote=
:


> On Sun, 25 Jun 2023 14:45:21 +0800
> Michael Deegan michael@deegan.id.au wrote:
>=20
> > Hello,
> >=20
> > (please CC me on replies, I'm not subscribed)
> >=20
> > It looks like I'm the first to attempt cutting and pasting the ruleset =
from
> > https://wiki.nftables.org/wiki-nftables/index.php?title=3DSimple_rulese=
t_for_a_home_router,
> > as it...doesn't work. :P
> >=20
> > The main problem is this line:
> >=20
> > ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : accept, tcp=
 . 53 : accept, udp . 67 : accept}
>=20
>=20
> The syntax of the ruleset is valid. Please ensure that you have not inadv=
ertently introduced a linefeed character anywhere within a given set elemen=
t (immediately before or after a comma is fine). Also, please convey the er=
ror message that you are encountering.

Yup, like Kerin says, works for me (I picked the 'input' chain just because=
 it's easy).

$ nft --version
nftables v1.0.7 (Old Doc Yak)

~$ nft -e add rule inet fw4 input 'ip protocol . th dport vmap { tcp . 22 :=
 accept, udp . 53 : accept, tcp . 53 : accept, udp . 67 : accept}'
add rule inet fw4 input ip protocol . th dport vmap { tcp . 22 : accept, ud=
p . 53 : accept, tcp . 53 : accept, udp . 67 : accept }
# new generation 83 by process 6770 (nft)

$ nft list chain inet fw4 input
table inet fw4 {
        chain input {
                type filter hook input priority filter; policy drop;
... trimmed the noise ...
                ip protocol . th dport vmap { tcp . 22 : accept, tcp . 53 :=
 accept, udp . 53 : accept, udp . 67 : accept }
        }
}

To decipher the parts of the match expression, this might help (scan for "t=
ransport header").

https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers

The rule is basically saying, "if the packet is IPv4, then concatenate the =
protocol and port from the transport header, use that as a key into the ver=
dict map."


