Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C601F7099
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422672; cv=none; b=FbcWnDDpL7HA/ctT7ILPiPqjzC4D5QJ/OFsGzew0M+1uIwqWVJbbxq1rRxhpMSbwBu1+33AIInvSwfEzgVMqPaaXlEkKKIGp+CRakWx2Ekaj7OmCTdlKUtNAkGqvSN539DwWByhs/tuiD7uCrMOWCSA0lg5qfCynd8IPrg2qhbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422672; c=relaxed/simple;
	bh=N5vYANwTcU0LP8sNKvRLBbxKzICyYSRQxlXve38zC1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcxaZnkb6M/QwPzJedJ1qnzT+WhzqEM9lTGPgi1l956Rt0wZGargQEfBQfqPvrIWgwG2YBHMkgqkOk2EyV8/iApu5Ar1Td0U2SbiI6VGkQpzFlsJ/rSAn4+lDmJQ6Ilp9biltKn0baCJ0XGfkLF1woS6sN7nJ9Uca8GB05Fxkqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WosJP9q6; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WosJP9q6"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a6c1cfcb91so24078045ab.0
        for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 06:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731422670; x=1732027470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o13TEXt/14w+TWNDcZCDmonKMMWNiQoibynzDjUUuUQ=;
        b=WosJP9q6eSScGu10wrp9AtyZ7N7N9gZhPe5SGkK4YH3gYZoZ8WAgIMXYn7V7PKM3w/
         iyQibJKJoRi9pUqy1Lsm408eb7pt4lczeZXAO6iZyB1TZYq9HVcUs4FfHKYwf/6nCFsv
         VeSum5Cxv0QFmsgfUYHXLGVRJKasSb564kyKJZSq8mXyghrYW4nkJBBHVNlx5GavGpHA
         L936XbDyjR34yQhvqJN0t6TGFJjPOrZUC3X0Qt7VoygBXq59cDHkbkPhkFNZOSVR2XKi
         ndG7Xuj0AcRFwtQZQNqmSdyIPgVrbuJxFXCytr7FTC5QaHLQTu5qXkrzpIL0RimlLEya
         Rm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731422670; x=1732027470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o13TEXt/14w+TWNDcZCDmonKMMWNiQoibynzDjUUuUQ=;
        b=ZcrP7yUtpy5hWggGtMPvWiqL09+13jPPoO+nrWy7Y24Ibbk2yirEn87t3AvCRY6r9n
         /2S7DqObWzT8GzZRAzwXcnrHGxZY6WeFR10CJfdzL0Pu4IK/N+VNPxwcY/n5ir1rE85w
         MoA6Gw1c51u+OtgcI8F6uyxpvlkMBB1tNC0JJqFzmQRwia/8uJUxGpHWYilFTgNLqIQX
         lCwMec9c8F5BNg5dkkPl6kXEdB5c6UjoFIz7LNrgIVgVVGYa470eYz7nVSr552oFX1hr
         A+6knSBGd+eMof6RovQKd2RSfMJJTVYwlfu7hXyLRO1/3K3x/2bjQHn7G5GdoK5aQXCv
         g75Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEm4XRYNcOmngSnNsbYcfDNJulMV2kgF85GiSEJ8zmz7JSECrAHilHKqESmB224WACSrFqCbpSpb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCO1WV/X9dt8l1Y3Pp7PI6EwJ4z+PprQuQxZzE7Kfz72v5xNpX
	QM4APOqIXBwG9/uWX8WWGmxwcYKLquVMQ5WDYBzQfBe9qjc7WJ7VLOp/Nza5sU7XvQlXFl5cmzV
	AGTDXBvDzJUM8fbACnN86FpzI4ak=
X-Google-Smtp-Source: AGHT+IFF+k2L1gSQJzAg09ppNduss8bXah+nmx0gKUnXuGeKnch7XUy4+WOMU5PwYPYql/287K3gYpaSEU1RBwvJkxw=
X-Received: by 2002:a05:6e02:1c48:b0:3a6:ac17:13e0 with SMTP id
 e9e14a558f8ab-3a70c829068mr31261655ab.14.1731422668395; Tue, 12 Nov 2024
 06:44:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula> <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula> <20241111125456.GA14363@breakpoint.cc>
 <ZzMc-e7NdC9-SL5W@calendula> <ZzMdzP6KP-kVAhd5@calendula> <CABhP=tZKpaJ4qB9WGxjsDrqgC4-CUkrh-Pm=KamtcGyXCvfgiA@mail.gmail.com>
In-Reply-To: <CABhP=tZKpaJ4qB9WGxjsDrqgC4-CUkrh-Pm=KamtcGyXCvfgiA@mail.gmail.com>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Tue, 12 Nov 2024 07:43:52 -0700
Message-ID: <CABhP=tb=qGUNFi3GBeOAi3cVRZX7cWtHeM+g7ErP4P-oJPuBBA@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 07:41, Antonio Ojea
<antonio.ojea.garcia@gmail.com> wrote:
>
> On Tue, 12 Nov 2024 at 02:20, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Tue, Nov 12, 2024 at 10:16:45AM +0100, Pablo Neira Ayuso wrote:
> > > I guess the concern is that assured flows cannot be expelled from the
> > > conntrack table via early_drop, that is why an expedite cleanup is
> > > important?
> >
> > Actually, the issue is that packets could end up in a backend which
> > does not exist after re-configuration, therefore, removing the entry
> > need to happen so ongoing flow have a chance to talk to another
> > (different) backend.
>
> Please take a look to this kselftest attached that emulates the
> problematic behavior in kubernetes,
>
> I think that in UDP the nat rule should take precedence over the
> conntrack entry,on the contrary to TCP where it is important to
> preserve the session if it has been established.
>
> I  did only a quick test and seems to fail also with Florian patch

please disregard the
a/tools/testing/selftests/net/netfilter/conntrack_vrf.sh file in the
patch, is a leftover of some local tests
