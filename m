From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Tue, 2 Jun 2020 18:38:19 +0200
Message-ID: <20200602183819.50b4bd84@redhat.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
        <20200508160132.GA2278@salvia>
        <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
        <20200601124124.GA12580@salvia>
        <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
        <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
        <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
        <20200602162536.55948b65@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591115942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ugZnEr8gKUHnPhgKKQCpkPwvU9tII/tVD5IO4WPR9ro=;
        b=Ba8xzU5QfUl27GFdep2k03lCU6tG6AfOFfb5rfjo/3F+9HgRhtHngDt5xTCvzK1dW0VfIQ
        y8Qoz+Gb+hGE/BV1fOZinRoIDKFLT7284kfgR/gDY6iT6G530x9MVYgeV6Y9tG8y1Va+GM
        7PmAEPA3+E6F6uhqn6/AUIt5HgybE/E=
In-Reply-To: <20200602162536.55948b65@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Mike Dillinger <miked@softtalker.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

On Tue, 2 Jun 2020 16:25:36 +0200
Stefano Brivio <sbrivio@redhat.com> wrote:

> On Tue, 2 Jun 2020 06:28:31 -0700
> Mike Dillinger <miked@softtalker.com> wrote:
>
> > I wanted to check and see if anyone was able to reproduce the issue.=C3=
=82
> > If not, I'd like to figure out what's unique about my setup so I can
> > resolve the issue on my end. =20
>=20
> I haven't tried yet. I plan to check later today, I'll let you know. I
> don't think there's anything unique about your setup.

Mike, yes, I'm seeing a number of issues with your reproducer,
debugging that now.

The only kind of unique thing about your setup is that you declare a
set with intervals but (I guess) you never add intervals to it. That
should work in any case, but as quick workaround, you could omit the
'interval' flag in the set declaration -- assuming you're always
inserting single elements.

--=20
Stefano

