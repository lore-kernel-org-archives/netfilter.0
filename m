From: Borislav Petkov <bp@alien8.de>
Subject: Re: v3.8-rc3: uninitialized warnings in net/netfilter/xt_CT.c
Date: Thu, 10 Jan 2013 13:01:21 +0100
Message-ID: <20130110120121.GD23008@liondog.tnic>
References: <20130110111821.GA23008@liondog.tnic>
 <20130110114742.GA17883@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1357819282; bh=l6GhIa0tF8wVeMuIzaauU816GaF+XD8CAsBpNBleuKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=MvrBsVmZOsEu
	PFZ7uVz6KKwhKAr0WCEGOs/cGH4Ii/7z18baffbpbu/K9WXLDbxHncPxtdBKm3j/a/B
	T0L6t1WcWL/uDIGyUWs639u92hK+zD5wJ3g9RleeViT6y7i2Qt7UkiQKcyxMbtCQYRH
	fHGrB9U770oHEOKGHQhWgSRQc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1357819281; bh=l6GhIa0tF8wVeMuIzaauU816GaF+XD8CAsBpNBleuKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:In-Reply-To; b=YUYkoc0PtK7h
	544VwbG+QT/TR/r3KqMQMr1hKl7bgGy/AXbnTO22to32IeZWzT3Wk6LTLZ1CoBcPLuy
	5KhWZS1Pwjh9z7eFzXtFGmWwFbzxq9rsFmF8w66lVGRBxfi/96BxQVvW3BxC3FwePky
	6T/H2FSI5Au8ut2N64uQiFt6c=
Content-Disposition: inline
In-Reply-To: <20130110114742.GA17883@1984>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, lkml <linux-kernel@vger.kernel.org>

On Thu, Jan 10, 2013 at 12:47:42PM +0100, Pablo Neira Ayuso wrote:
> Patch attached to address this issue.

> From 3ceaa3b1baa660aaeef63b86ea9771dcab6d0acd Mon Sep 17 00:00:00 200=
1
> From: Pablo Neira Ayuso <pablo@netfilter.org>
> Date: Thu, 10 Jan 2013 12:42:15 +0100
> Subject: [PATCH] netfilter: xt_CT: fix unset return value if conntrac=
k zone
>  are disabled
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> net/netfilter/xt_CT.c: In function =E2=80=98xt_ct_tg_check_v1=E2=80=99=
:
> net/netfilter/xt_CT.c:250:6: warning: =E2=80=98ret=E2=80=99 may be us=
ed uninitialized in this function [-Wmaybe-uninitialized]
> net/netfilter/xt_CT.c: In function =E2=80=98xt_ct_tg_check_v0=E2=80=99=
:
> net/netfilter/xt_CT.c:112:6: warning: =E2=80=98ret=E2=80=99 may be us=
ed uninitialized in this function [-Wmaybe-uninitialized]
>=20
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>

Yep, that's exactly what I meant, thanks Pablo.

Acked-by: Borislav Petkov <bp@alien8.de>

--=20
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
