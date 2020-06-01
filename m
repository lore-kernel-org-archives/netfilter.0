From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Mon, 1 Jun 2020 17:48:14 +0200
Message-ID: <20200601174814.17bacbd4@elisabeth>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
        <20200508160132.GA2278@salvia>
        <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
        <20200601124124.GA12580@salvia>
        <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591026507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ONvyM7FOwxNpEpn7UlKw3r+p9FjeUO1xPNKqZiu64dM=;
        b=CJu9eYEdPZ1aLvZBjnZhRuwNHAHzPQ2yTQ5il3/PmR0Pw058fHMnrWrT5iHvDcXt59n/Ru
        pHZkVXTWeJyVpfJiUBf2z+cfPktDhCjtDdyvwGdsOpXgFIGVCs06yaXEF4IQsqiMieOQBF
        alAD3b4wxODlW66GxJh7x0K+dMyzg+o=
In-Reply-To: <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Dillinger <miked@softtalker.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Mike,

On Mon, 1 Jun 2020 07:58:49 -0700
Mike Dillinger <miked@softtalker.com> wrote:

> > *From:* Pablo Neira Ayuso [mailto:pablo@netfilter.org]
> > *To:* Mike Dillinger <miked@softtalker.com>
> > *Cc:* netfilter@vger.kernel.org, sbrivio@redhat.com
> > *Date:* Monday, June 1, 2020, 5:41 AM PDT
> > *Subject:* nftables: Strange Error When Adding Element to Named Set
> > Do you have a simple reproducer? That would help us.
> >
> > This is a set with the interval flag set on, correct? =20
>=20
> Hi Pablo,
>=20
> Yes, that is correct (interval flag is used/enabled).=C3=82=C2=A0 Here is=
 my
> set definition: =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0 set blacklist4-ip-12=
h {
>  =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=
=C3=82=C2=A0 type ipv4_addr
>  =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=
=C3=82=C2=A0 flags interval,timeout
>  =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=
=C3=82=C2=A0 timeout 12h
>  =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0=
=C3=82=C2=A0 gc-interval 1m
>  =C3=82=C2=A0=C3=82=C2=A0=C3=82=C2=A0 }
>=20
> As for a reproducer, it is simple but it takes about 12 hours of
> uptime for the issue to surface.=C3=82=C2=A0 My script parses syslog for
> questionable IP activity and puts IP's into this set if they meet
> certain criteria, and on average I'd say one or two per hour get
> added to the set.=C3=82=C2=A0 Let me do some experiments and get back to =
you. I
> will roll the kernel forward to the problematic version and report
> back later or tomorrow.=C3=82=C2=A0 In the meantime, please let me know i=
f you
> have any suggestions on how to accelerate the issue.
>=20
> Hmmm... actually now that I think about this some more, the set
> expires entries at the 12 hour interval.=C3=82=C2=A0 Could this possibly =
be
> related to the first few IP expiration(s)?=C3=82=C2=A0 I will go with that
> theory and try to reproduce with a set timeout of 1m or 5m, and
> report back.

Yes, that might help. By the way, your kernel (based on 5.6.8 upstream,
not 5.6.14 -- that's the Debian package version) also contains:

commit 340eaff651160234bdbce07ef34b92a8e45cd540
Author: Phil Sutter <phil@nwl.cc>
Date:   Mon May 11 15:31:41 2020 +0200

    netfilter: nft_set_rbtree: Add missing expired checks

so any issue in that sense should be fixed. See the changelog at:
	https://metadata.ftp-master.debian.org/changelogs//main/l/linux/linux_5.6.=
14-1_changelog

Anyway, my further question is whether at the moment of the insertion
there's an overlapping address already in the set, or the inserted
address is included in an interval also already present in the set.
What is "a.b.c.d" in your earlier report? Is it a single address or an
interval?

Once the failure is detected, would it be possible to automatically dump
the ruleset (nft list ruleset)?

--=20
Stefano

