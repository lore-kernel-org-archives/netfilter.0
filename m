Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A4330B28
	for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587594; cv=pass; b=H3L2Avj+P7+uo/mY6F0YSAki+Qsa8ajh3AfMGks5f6hXYHYYmNtgH9rpio+gAajDzejOZXz/9lSwef69jBHTqNGtNbLUmyO/ADFxuH8eXotyRRWKQ61uS7SwJBzCmcCX4rG4j+7qEN3I7xdXy/Uz2anmUtkjTs7kxvKIRwhLZEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587594; c=relaxed/simple;
	bh=S6/v2FoKKPDFaBYywWsuxgukLcDCoRxZK6iqDI+Bfto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKWb9BB2psPis+y5CxYeYqP3TPlOXFoTwaVs7HO9xBvBz6hnOIDTSLRFcYJWbc6NQzDqS2E4mMDP7zKB8Xm5c84LsWS8WlNEwwgdkqTgb1ENcHar2DxEsT5nu64i0y8DCI8kxc4hjeczNeifwTu/IUyw3adsxYTcZyTmtn684jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3Fz0oPR; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3Fz0oPR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so325939166b.1
        for <netfilter@vger.kernel.org>; Fri, 20 Feb 2026 03:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771587591; cv=none;
        d=google.com; s=arc-20240605;
        b=PnOTZ8KnPXLKXaBIwUgfOGuT0BcWDK2cbwiRD2J1a+MD4U8IgNAikbBd6xm2GcO5dh
         kmoH9AMK3oh7jfKAHP40LqVyEb0UkysOcnA4kr0vSaMbjIMh0OOeY+Sy9/fFFaKYntmp
         zvgGpe1mRgjIUq/Kki/iiRGiB5lKR9Doi6/XuJW53imbuOl+opAfCq8EL4ozY1ZQAcsi
         iPbX46ci2bkAyidrMxYusXi0A5TgryUvhhMt+mAVVOKlsG5v2Zx2Xuh+Y7drtZDykowR
         bw7vIQpP5QdR6hMYBy84U7BdxBxyJG20PA1smmPvSVicXt6IfMvmQi+69xf87SCy6I2X
         R7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6/v2FoKKPDFaBYywWsuxgukLcDCoRxZK6iqDI+Bfto=;
        fh=dQL/icvlRnEEU32fCG/BceaqwZ1e8totpmh8mBT8gSg=;
        b=g2PU/vayA1sbOCw9rg3m1L57RUlACQt75tPvij4g7A233HYdjHgzxtK3hTF30gLecr
         xABsw/ml7OzU0tCcXkTveFmB1VaeBZ4UIFUKvuP6K2031KXaXgxRtUASwpJ9mWqDm6os
         7EM5Qj9f49JTY7OwJ6TM6Om/RrNnKYR3uxWn+O68vuJfoNekPBUlu7K2idRuRQ5LeXhk
         rK80eSP/aK5XCDHhUBVGAO7t8jCIm86C2ZNyH2YvgRhuw1VfBlr3zwhTj25qjln7z7rM
         onspnpNfMUxO4CqHpWUZVhQqxBEwrUmgNhNBnjcaaQTBVpMTMKUq/+dFHt8BWn7yetKL
         FPaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771587591; x=1772192391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6/v2FoKKPDFaBYywWsuxgukLcDCoRxZK6iqDI+Bfto=;
        b=H3Fz0oPRDoVY5pcmmyJ7EXgJgMJyNK7kWCD+fqh8DGi7hFpk0sT8thQ/Okp4wFfOec
         b85UtjEtVu5wXSC7jvs/61U6epbXEaA2S65Bm+gwzsdc7JOded4Lx4wAwM1GF4iA1y+z
         n8TBrd2Lgm0Hm/RXR8fB0ANPA1YMbCPzvx9PoUniNWtbBo5MgLuNT0hrIuyQuGLq1a9y
         J7UKswCyeCrumAQVX0QmYaXrVv4gtzGMhnNt2kTfk9Jujqb4ANZYzsXCvVw8dp1wZrR2
         RwVePLSvRycGv5nfhCXcx7yTwfJi2CrnhuxNIAR+F5SGcJGVTqYmBbqI7Uu497DFlWMb
         fPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587591; x=1772192391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S6/v2FoKKPDFaBYywWsuxgukLcDCoRxZK6iqDI+Bfto=;
        b=IHgj7iV5oyXJ6dlNU3IDPEvMAEjwBw3DNjuqFDYHMwcaj3hj0sEmtdp+KhlgnZNwAO
         IJiXY+VipP99U7Hd/vS56XVNMLORTzBrNOQuxbCHuAgTxJNLxMmgHR3UNc2AdlJyVdbk
         UgYeGYb0+FzBfvw2fkKidQd9SrN+bJGEoPnwgs9GlI3N7ayw8Z6y1rrM9CmNMZf639RI
         bqL5wWcVjUbFfCRM4SsOw20bJx92tEVpKBe8y3zYVahe3mc8bYjD9PVD1PXSQiQEXdTG
         C1nf/cIgeswu160FlNU1EK8Fz5CgWdNudUWCU2/jWNuglArEOlQH/A+8ezZOyUizMbol
         bcDQ==
X-Gm-Message-State: AOJu0YwXyzL3gLKS6QpPjet7BigAoVinF/hNkCldJex/V8yOFWIZJdhd
	UtFD3T2V6YwJzXYtj1U3TTxBuvIcJcEfqcMphV+BjwnyGzSVGTEDV9+m5YF0dxfMiAq/2YBouKZ
	ZeEo29Zvh8o4UrXCxzKdIozAIc1+ds68y7QDM
X-Gm-Gg: AZuq6aIukf8tBlEuyVwV5MyRrb1/CB9+QQYC7IKdvtqLrPx7oXt0CFkaR2hvoGTxTG6
	fD2utUt5lmekFHcfEVCEtpz7RxY2TRq/pBkM4In83n5OyeHcHjpmR6TGgdPU4CF05F6Bhr58/s2
	2ADT7IE448PVs6PihmlR8U4xnnxXJCaSgdWlxQUeGVZqSgpvwFGbvOglQTUrXnvdsRwrbXtBAVy
	/xd9CyQF+zJ7I9A+yYhdmblx3bXgrTKEQwdm+YoiXJcvoyP/MzGyorG9RTvs3wDkqkZsbdzApqP
	sBGBOdMF9VSv0Q1GAROBAwq4jlOM9w8SAROCQVd53g==
X-Received: by 2002:a17:907:728c:b0:b8e:8874:8384 with SMTP id
 a640c23a62f3a-b9072e1eb1cmr93611466b.4.1771587590736; Fri, 20 Feb 2026
 03:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <37d6e23b-a14f-470d-b97b-2466849fc4ce@localities.work>
In-Reply-To: <37d6e23b-a14f-470d-b97b-2466849fc4ce@localities.work>
From: Paul Robert Marino <prmarino1@gmail.com>
Date: Fri, 20 Feb 2026 06:39:15 -0500
X-Gm-Features: AaiRm52T6JUWuzeFCsUnhtuGEPrfPvToAdOg-ZMHd60-7GZJugm2KNxzr0yY4rs
Message-ID: <CAPJdpdBYt-VTdjeZ-X8BeLNTuxSmKssacgZEin9jFjypEqkEUA@mail.gmail.com>
Subject: Re: dummy net iface?
To: listy <listy@localities.work>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did you enable ip_forward in sysctl ?

On Fri, Feb 20, 2026 at 6:09=E2=80=AFAM listy <listy@localities.work> wrote=
:
>
> Hi guys.
>
> 'dummy' network interface - I get that those are meant to be
> kind of a sing/black-hole but... should such iface not
> port-forward on itself? (as oppose to other ifaces, which it
> does not I think)
> So, I cannot get "normal" port-forward - firewalld with
> nftables as per default in Fedora, which I try to do it with
> - because it needs more tweaking for "dummy" ifaces _do_
> port-forwarding or.. they do _not_ - do you know?
>
> many thanks, L.
>
