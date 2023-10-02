From: Frank Carmickle <frank@carmickle.com>
Subject: Re: Display Masquerade mappings
Date: Mon, 2 Oct 2023 08:27:08 -0400
Message-ID: <C7388B34-19CF-453A-BFF2-5F72B5A9DD20@carmickle.com>
References: <CAF0mwo8XPN3O-3tp65bDcXMP1dLhv_Feb=sGSARk8LNEDSyB7A@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carmickle.com;
        s=2021081500; t=1696249629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=248JAqI4JQHWynKgYNoGdAONtpxfQ4RUIawGO3DhX0k=;
        b=JKEGq9DDrsJg15AL6iNtp8FsE/IOmjxOGGDgLkPJnj9E4OKV+s+tFxc/uZ/tu4v9Liq07E
        /s3mfsFZwmLXl6Ws2IvKAxtRNCEsYVIvwKXo2kr+7Pf5dK48/R6TKEfwDkJMcDhze5E4Sb
        iiJbjNyLjlAvO+SZKhLK+/za9xi1g/w=
In-Reply-To: <CAF0mwo8XPN3O-3tp65bDcXMP1dLhv_Feb=sGSARk8LNEDSyB7A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Crossley <p.t.crossley@gmail.com>
Cc: netfilter@vger.kernel.org


> On Oct 2, 2023, at 08:21, Paul Crossley <p.t.crossley@gmail.com> =
wrote:
>=20
> I can't help feeling that this question must be answered in the
> archive somewhere but I couldn't find it.
>=20
> I am successfully using MASQURADE.
> But the diagnostics only allow me to see my RULE when  I actually want
> to see the dynamically created mappings!
>=20
> Is there a command to do this?
> e.g. display something like:
>=20
> Inside.                          Outside (eth0)
> 192.168.1.5:4000 -> 203.0.113.5:4000
> 192.167.1.6:4000 -> 203.0.113.5:1024

The conntrack-tools are what you are after. In Debianish distros there's =
conntrack and conntrackd.

HTH,
--FC

