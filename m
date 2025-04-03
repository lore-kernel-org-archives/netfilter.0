Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652391A23BA
	for <netfilter@vger.kernel.org>; Thu,  3 Apr 2025 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701366; cv=none; b=R/GbI6YBxcxp2kKUcW1wMEq+KFkkcYYHLhaD4F5dqrm/4yNhCwnks/PH1FtK3rKYv4QqTem4iG5GOWxS+Ko5Xk6/sY75Cf0T4thEtD0odj3DFQgcTJdkg1Usf/uh8SFWiC89Xvc7irZOhax5jP5AYg0yBCCrvnMnLwzwaPSYRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701366; c=relaxed/simple;
	bh=wFus50woR3eefhYR0XUsr43qnPF1WpudgSirSdFW9l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuoVBxIk+R6ojDcWBOVC8xxc/XrxTklDOUjLBe9lO2MMXvhymoKWvYBfOWjAgxgq87qpUkC+wxTB177h1/nhSdUMPPHGJofWKw7yvkNNMHHK3o5ESeefz+uMxCds1GcbkQAAZe8OuhDKB5Dgq2L++SI48SC6AUC97HSlptU8xnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov; spf=pass smtp.mailfrom=kansasdeaf.gov; dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b=T53ayuK/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b="T53ayuK/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739525d4e12so1083054b3a.3
        for <netfilter@vger.kernel.org>; Thu, 03 Apr 2025 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kansasdeaf.gov; s=google; t=1743701363; x=1744306163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFus50woR3eefhYR0XUsr43qnPF1WpudgSirSdFW9l4=;
        b=T53ayuK/E/19uRKiJPIriRQKTXQNX5ZXEHb+GgMoaJWmpA50XdhBveMi3mWG8kFXzJ
         Bzz9WwBYgIeU6CDouZPbjPVPJXH3+2WIFwwi1ECuToce4q6MNwx3x+EbmNBxopZnNAG/
         vARUJh3J8todqVU/oLJ8dPIkiUSHl3FEYPBwjnkRhTPna/bnb7Cp5SSjvJBIVebg1ad5
         Ya1N08NW8RHtkCbX3zRK9UIeAolnR2ntCGrHkm6DaKyZJiT3C19WNixTJU57Sc1xZf5g
         CCUjtNcshqOMo1KVJwIBXyFl10FTlvGmjuKuatOHTJXduqRvmH/AaoegvXPFjBiEAKwd
         Ezmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743701363; x=1744306163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFus50woR3eefhYR0XUsr43qnPF1WpudgSirSdFW9l4=;
        b=wzd+qSo151rwp3A8l5zIFsLLYr0STLLsYqf/Mb73qI+6xR75fE3806hxgLIubty77L
         RsWICcyrmQuggRrdD7bK0vF8kJfm9VbBgAPLm7gMrTqwwz64BgtS8HP49KLk5u9eZgXA
         0MP/OecgoltJiY2jS4Fg8gH18/BLKvKdIIihUessoUU/68N2O/W49unvtxXPrHFygdY7
         wiDRtv4yFddA4sYgRZbN00D5elvvxs6V8j5TouwlbKb+LVkRxz+vR8Fwh59QyGqV84MI
         ajIup+5JzmSkjSLC+BaFR46TGp5TqDSGdq6wSSaHp98Gse05PU0Yc7lrYKJihj0K2sqT
         Af2g==
X-Gm-Message-State: AOJu0Yyzt0qcVMgjZbnJYhJsjqAqaemrmD/L1yhUTVTZFeFZegevl3Eu
	UhW5/RWJn5FL3WCP1kCPuRrD1WJeEe1PMqbjG9YTbJy19jfopvSdI0jOc6wdJ6SUbQzlup5BpIa
	4AQf4udWkOjHsd4wPdDAQHWpMI4IcuITiTaV1Ut7ZkTsWsfjOa65Dp1q84E0nS8Dpr6cAK/zOLd
	qxhMbnBwEAg9xdPffmgZvVB/i24w==
X-Gm-Gg: ASbGncsrmh0eVk47pKGcJsL0v1C99Vrz1GSgzxpKyKOyzS5vnH7t9PA2NyoU4x4aFg6
	lVu/xht/TE8S02Ynr8vsO/AdyscLGlBuZAnmnnNl409RwXY2RoWKLpTmRyDCutkx6XrqJasQOgT
	pGLrh5691qR8Zxog46H1XkAwSH3fQ=
X-Google-Smtp-Source: AGHT+IEUQDzMtDUH4frYV7ol5FA/j0a2m5j6i7HqEao0zvPmoEhCI6cyho0vB9Y7CFZl7sA+1obRsWmU2347oEpGl9M=
X-Received: by 2002:a05:6a00:3cc9:b0:736:39d4:ccf6 with SMTP id
 d2e1a72fcca58-739e492f489mr605558b3a.8.1743701363442; Thu, 03 Apr 2025
 10:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
In-Reply-To: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
From: Bradley Hook <bhook@kansasdeaf.gov>
Date: Thu, 3 Apr 2025 12:29:12 -0500
X-Gm-Features: AQ5f1JpsjlNoTWTlEyihbjM96k_-mDPst2VWlliRuEgq_YJY0a11Xv--J-Us22g
Message-ID: <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
Subject: Re: Nftables v6 address not matched properly in nftable set
To: sontu mazumdar <sontu21@gmail.com>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd first try using address ranges that are appropriate. It looks like
you are trying to adapt RFC1918 addresses (for IPv4) into IPv6
addresses. For RFC1918 equivalent addresses in IPv6, you probably want
RFC4193 addresses. You can use something like
https://unique-local-ipv6.com/ to generate your own prefix, that way
you are using address space that won't get unusual treatment by the IP
stack itself.

Second, when using intervals, I always specify an explicit mask. In
v6, that means a /128 mask for a single host. I tend to not use
intervals unless they fall on a CIDR boundary. That might not work for
your needs, but it makes the rules easier, and there's so much address
space available in IPv6 that you can usually use CIDR boundaries
without issue.

I don't know that either of these would change the behavior of your
examples, but they might make it easier to identify the problem.

Also, be careful about trying to apply IPv4 logic to IPv6 addresses.
One is in decimal, the other is in hex.

Respectfully,
~Bradley Hook, J.D.
Director, Information Systems
Google Certified Project Manager
Kansas State Schools for the Deaf and the Blind
bhook@kansasdeaf.gov
Mobile: 913-275-9982

--=20
*Kansas State Schools for the Deaf and the Blind Confidentiality Notice**:*=
=C2=A0
=C2=A0
The information contained in this e-mail transmission is confidential and=
=20
legally protected.=C2=A0 It is intended for the sole use of the individual(=
s)=20
entity named in the message header.=C2=A0 If you are not the intended recip=
ient,=20
you are hereby notified that any dissemination or copying of this=20
information is strictly prohibited.=C2=A0 If you received this message in e=
rror,=20
please notify the sender of the error and delete this message and any=20
attachments.
