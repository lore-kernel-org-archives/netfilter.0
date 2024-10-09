Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E454188929
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465611; cv=none; b=QikV2khGVWztUo0+ZaULa9P2ukQdQJnufjuq+JKeslDYVhEoh7gtECgRQMVaNYJbJHjzBcsSeJ59mwMmqlF/Z5sB3OdKC29LGXS6kolWUCEys5pQOV0lUl2SpSEEM0jKO/B2YsuXjy2pko/79Sf9JN4uoQD411G7cB1KLGMt6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465611; c=relaxed/simple;
	bh=oY222ZUrStO86I6U+TVD/3Mb10jyJrwMs1ysygjSmig=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqNM7w6jjFuyT5b1QVdr6ON9VDc1QLWvRh1H2PM9Dzpw7hOq1kG68Zo3DUg2IJkQVIwZfNkWkWhVbUiT+Q5hlN6GoOtsccHLd3112htU6fIdD0hMdSEAaPyjH1cSGzAn7ATBoOfrg7imIe0Ymu9aHoGLXDA2Q92BIuEpxA8a+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xecycle.info; spf=none smtp.mailfrom=xecycle.info; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xecycle.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xecycle.info
X-QQ-mid: bizesmtp81t1728465597tol49ghr
X-QQ-Originating-IP: o+znfJ6Q8d+CyZmcZss+VsbNr4Qpf97FNygnRU7l4DY=
Received: from xcws1 ( [116.234.71.230])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Wed, 09 Oct 2024 17:19:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7750924751900661617
Date: Wed, 9 Oct 2024 17:19:54 +0800
From: Carl Lei <me@xecycle.info>
Cc: netfilter@vger.kernel.org
Subject: Re: Problem with ipv6
Message-ID: <F0981F597924BF0A+20241009171954.65114fbb@xcws1>
In-Reply-To: <dca55817-4379-4efe-b1cb-be24d69dea83@tootai.net>
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
	<bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
	<504b1c67-8335-4839-83fa-ea4e39d745c6@tootai.net>
	<686AF66561802BD5+20241009161103.3330b146@xcws1>
	<dca55817-4379-4efe-b1cb-be24d69dea83@tootai.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:xecycle.info:qybglogicsvrgz:qybglogicsvrgz8a-0
X-QQ-XMAILINFO: N17Koc4oSm0pPE7qok2K1bD5u8K+vwgd1g7bbZ0yIDf6iD2CVAwJWxNw
	NyvwOqxkAkz4WlqL5YsX3SrV/vsFpil02WDEZM4gnHCcUcQabCCTFA0sb8WIbN9BlNsdimw
	elKozXIeFBGc8T0J/EOxQsDSwivlf4SUfrCrmZPtyozxCkFrKgRB/c7vryKyFmmDOMwW96C
	DIofIto8M5sAfjZXyHcd5Bj5LHGvB6EtjEi+gLXEcbG0TbG2zSkbx1NhtmUCxpCfTW2Ul6a
	7/1l4PAV4eKB2qesGEQTYF+N9ewnK3FK5S+LMT/hKq12uQOMtivPT0f+MY9Q8H52oOsAJjC
	nx/foiGpSH83XNEwZknSFkCyT8h0iGgHZ/Nk9K5HNRPcb224QG/oOmHGeR9BjxadEC1tz2X
	scKjCwRVUfHWggxdycU5zB1RoqVhEm58g/5FVTOOE76uOnaW4NAItZFaQtsQi9kB5/8zL1p
	RodZsVofaiB9VPn7NCvj1U7FoAUKqNIcaOAoaBVW7LFBiNvSrB2gfqzq9a3GFd8p/ZpgtHW
	EykS7Hc6M1rK6nKmL/M9tv5n6lA4WdbPcTnR8gqiAJllbXRucEBaPRsgqujxcdLHTnY/kYP
	bRkzAroe3cICTW1f2WyegFsE0AR2c0X+xAjUHbtY4aNf4MlK1f5rA2Hj8bCw41VlRxOvM/s
	lDw/8RgmgC7S4zXWXq6nkKFVqRhXrgld6kbf4HlrhEggEg7Z0JupQ3A6SXfEEoOQG+xS30d
	Zq5N4e4u4jnBmkAb+FzOcvxnxp1g3d/x7ocpvOPYWj9pzSZ3cOqW/WLJJt9FtaqrGMI10aV
	cEQ1wCx5HDkXAHW829avHCgnKaRkMUrqekwOqdGipJroTMYO/yhkqNpIa3otuf47xU7xyuD
	I5RHsXhEVqbrfdLO9woU+WbUrqW6gUoprAz72H+o6wOvs0RRlEW3Sw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Wed, 9 Oct 2024 10:46:34 +0200
Daniel <tech@tootai.net> wrote:

>=20
> Le 09/10/2024 =C3=A0 10:11, Carl Lei a =C3=A9crit=C2=A0:
> > On Wed, 9 Oct 2024 09:50:22 +0200
> > Daniel<tech@tootai.net>  wrote:
> >
> >> Le 08/10/2024 =C3=A0 22:28, Kevin P. Fleming a =C3=A9crit=C2=A0:
> >>> On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain output {
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook output priority filter;
> >>>> policy drop; ct state { established, related } accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip
> >>>> daddr 127.0.0.1 accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 icmpv6 type echo-request accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dport 53 accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 123 accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport { 25, 465, 587, 993, 995, 4190 }
> >>>> accept }
> >>> What happens if you change this policy to 'accept', and make no
> >>> other changes?
> >> Or simply add new in state
> >>
> >> ct state { established, related, new } accept
> > IIRC many NDP packets have ct state =3D untracked, so you are
> > proposing to accept all TCP+UDP connections and still having broken
> > IPv6.
> Well, from my understanding, policy accept does the same

Well, if you meant to keep policy=3Ddrop and to add ctstate=3Dnew ->
accept, it won't accept untracked NDP packets, so not going to work.

Also IIRC assigning NDP packets state=3Duntracked may be a recent kernel
change, so results may vary between kernel versions.

