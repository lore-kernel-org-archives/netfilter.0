From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Mon, 1 Jun 2020 14:41:24 +0200
Message-ID: <20200601124124.GA12580@salvia>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Dillinger <miked@softtalker.com>
Cc: netfilter@vger.kernel.org, sbrivio@redhat.com

Hi,

On Sun, May 31, 2020 at 10:18:29AM -0700, Mike Dillinger wrote:
> > *From:* Pablo Neira Ayuso [mailto:pablo@netfilter.org]
> > *To:* Mike Dillinger <miked@softtalker.com>
> > *Cc:* netfilter@vger.kernel.org
> > *Date:* Friday, May 8, 2020, 9:01 AM PDT
> > *Subject:* nftables: Strange Error When Adding Element to Named Set
> >=20
> > Please, make sure your Linux kernel version is >=3D 5.6.7 or manually
> > cherry-pick this fix which was included starting that version.
> > Versions from 5.6.0 to 5.6.6 include this problem you describe.
> >=20
> > See https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.6.7
> >=20
> > Author: Stefano Brivio <sbrivio@redhat.com>
> > Date:   Wed Apr 1 17:14:38 2020 +0200
> >=20
> >      netfilter: nft_set_rbtree: Drop spurious condition for overlap det=
ection on insertion
> >      commit 72239f2795fab9a58633bd0399698ff7581534a3 upstream.
>=20
> If I am reading the output of uname correctly, I am using 5.6.14 which sh=
ould qualify:
> $ uname -a
> Linux rockenfield 5.6.0-2-amd64 #1 SMP Debian 5.6.14-1 (2020-05-23) x86_6=
4 GNU/Linux

That kernel already contains that fix, so there might be another bug.

> ...yet, the problem still persists:
> $ nft add element ip filter blacklist4-ip-12h { a.b.c.d }
> Error: Could not process rule: File exists
> add element ip filter blacklist4-ip-12h { a.b.c.d }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> To confirm, everything works fine with 5.5.x kernels.=A0 Please advise
> next steps with respect to 5.6.7+ kernels.

Do you have a simple reproducer? That would help us.

This is a set with the interval flag set on, correct?
