From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Bug report DNAT destination not work
Date: Thu, 2 Mar 2023 12:53:13 +0200
Message-ID: <6EBC0AF9-A76E-4CD1-BE97-ED0A97C562A7@gmail.com>
References: <CALidq=VJF36a6DWf8=PNahwHLJd5FKspXVJfmzK3NFCxb6zKbg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.14\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677754396;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0At0SBCwz53k/gUPABIwuv70VkdNp8AOj/Qveiu+YGY=;
        b=UIIq40uBd3BVFxq/BDBHGbjDPTUs2iP+vZId/ObVjQ3Qjcq2AShHuuB1a9QduMqIaM
         PCUOKdyhbhIKvSBoUEFjzpvVVoDs3PZ65acDYMgeJ0m29uRniy6mJg52V+dwhLug1hn1
         ixM7TXp0UDLRpKDLLbcnqRlU0cjX9e18sGjxMs3MM6alb8xfYSTu+EMErXdMK+C0GEVd
         I+70vJRhvAOcP9h64t1ueqCZc+2vlLNR8ktKYaNFZ5L/f9bQiJEE2BM/t3M2IwWhIcrA
         RAciQ3yJUkQq5Y0O1KpeYuOX2pSWfWzEzO28s4TuN9hYNUmEzhrwqdepNsdUEVc2qsPH
         hp7w==
In-Reply-To: <CALidq=VJF36a6DWf8=PNahwHLJd5FKspXVJfmzK3NFCxb6zKbg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hi Team
Little update

iptables 1.8.8 work=20
after rebuild and install 1.8.9=20
 iptables -t nat -A PREROUTING -d 100.91.1.238/32 -i bond0 -p tcp =
--dport 7878 -j DNAT --to-destination 78.142.32.70:7878

stop work with this error.

m.

> On 1 Mar 2023, at 17:05, Martin Zaharinov <micron10@gmail.com> wrote:
>=20
> Hi team
>=20
> i see one bug after kernel 6.1
>=20
>=20
> iptables -t nat -A PREROUTING -d 100.91.1.238/32 -i bond0 -p tcp =
--dport 7878 -j DNAT --to-destination 10.240.241.99:7878
> iptables v1.8.9 (legacy): unknown option "--to-destination"
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> try with kernel 6.1.11 6.1.12 6.1.13
> and 6.2.1
>=20
> Best regards,
> Martin
>=20

