Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300932C939
	for <netfilter@vger.kernel.org>; Tue,  6 Jan 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710837; cv=none; b=KDpEUWR/LFGoRTW52SucLtGhdMosL5xlEz14JWMtWh+sEa63mmVEiBx93eMzKjS6iobydFPvRkgrcs/rHgpjcvvutzeZZHaKkELTAnn8Xp8WohuEs7eqz/3LCVJz5uem0Hs1f6Z43wqh28WT9yn3RNa5dSICHhDCdNsCS8ZL2mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710837; c=relaxed/simple;
	bh=9/Pxor+eKvw4owyMMYq67ELUXxlY3LMWHGDIUJkjd+c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HP41ICYFj9zlBhPHyhiDmZFS42wfrZSatBc9ioypvFmmkysMYyadwqDC6yeF2kYmMmS8Go/k8jzn081TZH8RBvZAsJYuPKpHVT96H1SX5Kf6pFvkI2BMaYTTRItjAyguhTNt9IL6XsKdos+sWESLNoZ8xqbRp6bU0D8e/pd0BEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIFN1TSl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIFN1TSl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79af62d36bso192977366b.3
        for <netfilter@vger.kernel.org>; Tue, 06 Jan 2026 06:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767710833; x=1768315633; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Pxor+eKvw4owyMMYq67ELUXxlY3LMWHGDIUJkjd+c=;
        b=MIFN1TSl9e7VumUvJZGBLL59VgkLnGzAjmNWF1VEFCEhkrtQPp3YvL3BpqYh37rSQQ
         rGSgC1XtYCtdSkQBPPOqU3JOybbv+Vkf0Z7/OT7WlyK8idl1zzcMNxS5W9xLyt5TjoPi
         sKdvMdHmHtGeA0iN3t/R1agPAalLX/blF7mMwAx1PtUQ+fQ0PSf1USNWRTKgJ9byQeFK
         YsmG3plJYFsKeSuTv6VmWnrPwQVEZx0mqyQNKvWdrk0HhMZWVJk+OQCsv9DCejgOVJRP
         uXzXjF1NRpmWcnjoiXIQ0pg+YBZTssxN1Bg7hu4aLlPjpgQVr/cWB9eyC6GmwoNe0nyX
         sUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710833; x=1768315633;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/Pxor+eKvw4owyMMYq67ELUXxlY3LMWHGDIUJkjd+c=;
        b=jkio1pjb4Hm+14l0MjZzeIdhO4d1M/A7TDYU4mQk8KmEjCyHqq96e3sgrP7UFdJBGu
         VMGcbv1O2ZKE3T5DLTlmf1wDrG5HbZUJVRtEDGecnPqEj+3wW0LjICmy6w0v0qzrwdTV
         EUqNtJnQUlCVVkeW2dOUEeiXO+vWopld7+mGBiraHiiTRdu1Dd75VvGtjSvQai7zjoGM
         tNDzcPF/jOCKb5mFRUPUpuErkLzy3IfG90P34b9bNDyYK87PHdMYZGpy7fz3ddvRh9VL
         wez+/PpYJSu9OXR535dCXmSAl27PmxABmGUrrR8WLAP09WluSZbobwlU5aiDdgNdHWBP
         oqCw==
X-Gm-Message-State: AOJu0YzAu13jJpmpeVAQTqmOuXsw6yezF+OYSYEZcbLaQff1BJ5p2QUq
	xS+YgX5OHj9GWtCp7JmhHaMmOY5WOUgYeIR62Wf0lqlemAxQJvJplzSpXBqk/Z4GAu90qPlg3uG
	SBCF7X8PiSRUAEPcgW5qaEZ+9eHN6/xJFItU8dqk=
X-Gm-Gg: AY/fxX7Ggm79/X2I8v6SDOGSCGDkGRxyPKcy46nl4BRmIXOTaWY9QACIBrbceEh33G+
	QmJmq8Ct4jM0tFp2WXDhMXHnUN8X2mC/sPaFnEFiSurQY5wkXmi+0McdylEU39QrsW2THM/395i
	yJB0WEFXD4tYnEWGSe8BBFJ3tQjJyJiGesJ6I4BCfNn8sOpYwzr/qi3B4ERQcKvev5Nqozz9tSr
	3ltRdQKfAR/HufJnHVrrAJWC9yK+1fTzsMxN6IiSEy6t6dNFC/PFHKhRW5JQYfVau5aqJry
X-Google-Smtp-Source: AGHT+IHDzcuofrrjzd+Hqw6npLqL3mjVbOY/t5N0XC0fiL0rQzmorLXw2yIRwuXU37Wkke0vetHbX/w+AolJVxdyb+Q=
X-Received: by 2002:a17:907:9606:b0:b83:bb56:1cbb with SMTP id
 a640c23a62f3a-b8426bf17b3mr379005466b.48.1767710833066; Tue, 06 Jan 2026
 06:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Konishchev <konishchev@gmail.com>
Date: Tue, 6 Jan 2026 17:47:01 +0300
X-Gm-Features: AQt7F2rBzNbDYRqvbHeeLq5YC7qvK9JU-U9MFLRv0kSrBiCJLhxPYhWWxU4jbRI
Message-ID: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com>
Subject: Dangerous examples in nftables documentation
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi! Recently I've faced a problem: I have a rule that drops all new
TCP connections which start not with SYN packets:
ct state new tcp flags !=3D syn counter goto bad_tcp_new_packet

It is a very common recommendation which you may find in many blogs.
But my version has a bug: it assumes that SYN packets may not have any
TCP flags enabled except SYN (which is not true) and it turns out that
this rule drops all connections (!) with enabled TCP Explicit
Congestion Notification
(https://en.wikipedia.org/wiki/Explicit_Congestion_Notification).

So `tcp flags & (syn|ack|rst|fin) !=3D syn` should be used instead of
`tcp flags !=3D syn`.

I've faced such a problem in real life. The details can be found in my
blog post:
* Original post in Russian =E2=80=93 https://konishchev.ru/posts/nftables-t=
cp-ecn/
* Google Translated version in English =E2=80=93
https://konishchev-ru.translate.goog/posts/nftables-tcp-ecn/?_x_tr_sl=3Dru&=
_x_tr_tl=3Den&_x_tr_hl=3Den&_x_tr_pto=3Dwapp

The problem I see is that the official documentation suggest unsafe
matching in its examples without any warning:
* `nft add rule filter input tcp flags !=3D syn counter` in
https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers
* `nft add rule ip filter forward tcp flags syn tcp option maxseg size
set rt mtu` in https://wiki.nftables.org/wiki-nftables/index.php/Mangling_p=
acket_headers
* `tcp flags syn tcp option maxseg size set 1360` in
https://www.netfilter.org/projects/nftables/manpage.html
* `tcp flags cwr` in
https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_=
in_10_minutes
* `tcp dport 8888 tcp flags syn notrack` in
https://wiki.nftables.org/wiki-nftables/index.php/Synproxy

... which then leads to the errors I've faced. And I am not the only
one =E2=80=93 https://github.com/search?q=3D%22tcp+flags+%21%3D+syn%22&type=
=3Dcode

So I suggest to replace these examples in documentation with more safe vers=
ions.
