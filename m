Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159B9130E4F
	for <netfilter@vger.kernel.org>; Tue,  6 Feb 2024 12:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221748; cv=none; b=TPJPzs8qiyY04RsBy6U5pq3BMMQ60TDF/q5s1DOG1oP3f03zUorhZZHn1AJ18RpSvpGTjOS9qnqAxnmoxsTU/lPwzN9HXoTjaWbW0YAQ/8KMwoJe9/kEelnlr6+oD2RuS02HtF4Hzn0ZbiaNQuJ6W0pRnGACpZOWiqiJvHv5Ytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221748; c=relaxed/simple;
	bh=hzivAmzv3LOrhySaW50h4B5anZMnjXKXqSjgvk1Vaz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoHnxUYKyDK40FrIqVFd6wng1PmMTOU9ElXEBDgFgK4fqcyHF4zUf+mWuhRiY3rnc0CG6eGIinaBX5umn3sDoNGQcLbyPLELZcdlPNDwP/9Pgy0GDTbk3XYHkVogsfz6f2sujc0NFYcrow5vCcy4CDUdnjDNIYfw7wSwcIWjVlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cjul7thT; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjul7thT"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60427d9c5dbso4155597b3.1
        for <netfilter@vger.kernel.org>; Tue, 06 Feb 2024 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707221746; x=1707826546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzivAmzv3LOrhySaW50h4B5anZMnjXKXqSjgvk1Vaz0=;
        b=Cjul7thTTsAMWW+3P8GBpA1sabt23b4ow6lKQPBzN1BoUpgmGfy8lQ8iXVe8F7axjs
         FkhJBfZqhb6ikcY2YVoWxQSaXGTxErf78XTVOjoqWgsrcQvFBDbC2OrLrozRMo/7/rrW
         ZwxfJM6wzOhoscE5jFEupbteqLo+8AMD05f+e1n8q54LLliQNiUM6CLMTOE1vKlObqGc
         lCtA2NQQtKJ0t4PhNBKInyo/KMBklDhRPaCXpqDxmyNxuM3/YsSxFOpilba93Y9UeVsP
         ahnerJGfMfbi4me9AVVl3D1lCMgtHqrtlqsShpQqdv+OIXZTl8t+KOsmHg5QdCntr/Rd
         7rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221746; x=1707826546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzivAmzv3LOrhySaW50h4B5anZMnjXKXqSjgvk1Vaz0=;
        b=rwgH0Rg1Nzfiq1FL6xUexsMpafGBseyRwylJB1VJ/0pRbRB4JUpnk6lX/on7wQgdeP
         uoS1G+oCmoci7IQi4pO0WdDR+GGJBIJKg+6UkQXjZOUaF7INL4rlzrJMSZksPrNAAWZd
         HfyTUJ9lWeTTqNpcmzGfN02pldJzqvVAYvHsDsJA4ufdWO4JkjNsBsJIgYCLX4y0LOcR
         Lc3mIk16lMlZF7uq6OUBUOicu5lEwrYl8pHeqAIMIeSGQoLmTEHRYbrvsrLbvBRZOkXA
         tP3na0HMYVqUXkXI3nFQqzAUUqtBLeh3Xdd1Ge8Ibi8a1n5sXUfi2KAv8vmmWzO3e4sE
         yHiw==
X-Gm-Message-State: AOJu0Yzn08WbVN/kC9PgidLw8/kddexR4sUSLzN1wg2+hSw7pjsTagpe
	CVX6QCxW2A4AtUO/FPDvZtS0d/BS0wJg+ADHApSaxeaH1pXnOrBwT+zgZqy5tGvEKgLc7wDRMQh
	8BEnd05gjABveb6aZqAVWupcBXrg=
X-Google-Smtp-Source: AGHT+IFT0PgHFnQTVnJP8O0F4ap5rjWOnIlIZzN323X7skOiAzh18Mqt8BB0X7vyRxS4LGEQbYyj1TMIQc5zzw6wYJU=
X-Received: by 2002:a05:6902:240f:b0:dc6:ca3a:31da with SMTP id
 dr15-20020a056902240f00b00dc6ca3a31damr1115215ybb.16.1707221746018; Tue, 06
 Feb 2024 04:15:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
 <20240206111257.GE17626@breakpoint.cc> <CAJE3=w=rxa7DC7zP=uw0TFkp4kiSknSt6ALbnmDHx4_7JV7R9w@mail.gmail.com>
In-Reply-To: <CAJE3=w=rxa7DC7zP=uw0TFkp4kiSknSt6ALbnmDHx4_7JV7R9w@mail.gmail.com>
From: Anton <anton.khazan@gmail.com>
Date: Tue, 6 Feb 2024 14:15:32 +0200
Message-ID: <CAJE3=w=RDEGmT9Vd=y+BFEu5pKkYP4tPpH25+rWbpeDgWFpnWw@mail.gmail.com>
Subject: Re: What happens if the machine runs out of memory while adding new
 nftables sets atomically?
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(and new sets as well...)

On Tue, Feb 6, 2024 at 2:15=E2=80=AFPM Anton <anton.khazan@gmail.com> wrote=
:
>
> Thank you. And a followup question: is new config guaranteed to be
> removed if the operation runs into OOM?
>
> On Tue, Feb 6, 2024 at 1:12=E2=80=AFPM Florian Westphal <fw@strlen.de> wr=
ote:
> > Old config is removed after new transaction went through, not before.
