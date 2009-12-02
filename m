From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] tcp: Fix a connect() race with timewait sockets
Date: Wed, 02 Dec 2009 11:33:55 +0100
Message-ID: <4B164293.7070804@gmail.com>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com>	<4B152F97.1090409@gmail.com> <20091202.005937.177088443.davem@davemloft.net> <4B163226.50801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4B163226.50801@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Miller <davem@davemloft.net>
Cc: kdakhane@gmail.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, zbr@ioremap.net

Eric Dumazet a =E9crit :
>=20
> But even if sysctl_tw_reuse is cleared, we might trigger the bug if
> local port is bound to a value.

Oh well, that's more subtle than that.

__inet_check_established() is called not only with bh disabled,
but also with a lock on bind list if twp !=3D NULL.

However, if twp is NULL, lock is not held by caller.

[ Thats the final
  ret =3D check_established(death_row, sk, snum, NULL);
  in __inet_hash_connect()]

So triggering this bug with tw_reuse clear is tricky :

You need several threads, using sockets with REUSEADDR set,
and bind() to same address/port before connect() to same target.

We need another patch to correct this.

I wonder if always hold lock before calling check_established()
would be cleaner.

