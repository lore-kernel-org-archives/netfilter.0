Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7E39FCF
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706739235; cv=none; b=A1Rl1iHGujV2/JjQSgrNXXnrVtPXMnF02Z75XXvbMNJ6UkoaGe//u+QEDRYBlVkKK5oG93LQE4Tc37MEdDHtNJRzDeWix+5S1JfiR7OSmniI/kRRirxUsdwbGeQPO9R479jdAuR462PTdrfqPVrjprh43UUd6aB+tAJUJPhfDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706739235; c=relaxed/simple;
	bh=NX5LBqniZK7exf1Rrctlgk6VoJQEM788es9Ge0xddZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMH08jHJYm//9EmkoUjxglLsvtl93JaxNuEQfC8YZBaFyepVK5EklaSt/I/ZZ9nZYcvMISl/sRc1iqhDxIVqE7xh4JzLZt257EcKjdNIdodQbM1iKhVpF3oOeFGvm1P8WmG29+37SHxuL5UG8ZLD1VxcNps5mJRieNGNen9fUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0qEui7e; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0qEui7e"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60406dba03cso3535627b3.0
        for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 14:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706739233; x=1707344033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHWYVquzc5AuySfO2Mnw9yO8QbhSkuXcq4zdjHRCWjA=;
        b=h0qEui7esDkNpd8EiLUVB1B18nNIgHoRyUeSTC1APnwVVY4/RSRWjVC/K18EiroUJC
         SrfNTxSpXTTXdvxMuManDdtRBiCajlhhz+7YVmMFAm8rp0os7cLlA7k1wE7GBdofwvN5
         TCCvs9MJ6Tqe16k3AgCTGC+FzukJsW7B75Zv6NSDJDDuSA2Nh+aX2sdIb4kVur04vfXJ
         um9sEgTnoXCHt9pzQi6DkgCdo70a47mgYSw3MeHoO/vLRpKxOuunrTA8fPYvaYbfpYK0
         cehgTVg/88Y7znmtqHWYlNpvMxYglDpOebCyIdX6glkQsztlpx0k3TSA89zpCvw6PEB6
         7lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706739233; x=1707344033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHWYVquzc5AuySfO2Mnw9yO8QbhSkuXcq4zdjHRCWjA=;
        b=qGkj3F5DYVgbk3GSGCSjhpREKaFgG0hqGwD4IEmTNkZy8RPQTVqWLGlBW2pIym/UGB
         7KOEBjmP7Uc9088PyQovVTPi6GYQL1Sr9KA1ee3YAdbAPgpfdk699N+GfozGlDfmcIay
         eLuVNg8/qc6CSap9juFZkVIPSWp8zRI+C2UdxKcO7FPavlX7Nt4ScbPhGd6Y6CsO4miZ
         /ybII2idTjnbc3m7vSwEsMAJCfa3vEKISNkHbwzdin3maCJUyi8sOqVXheMt/CXQpUO/
         seWoVXyirSFmQwXpxlpVPJYe4xD1fB2CfwTK5QK7z+iTDyHii/H67JetsDi10EsqLlJ3
         cSPA==
X-Gm-Message-State: AOJu0Yyig991JThzIYW/oUwJC3PrtZr9PAFh00aTipzARwRDwihahDwS
	U0Ux9803K7YwRecQX6XXu2Pytf3yLG5N1O5wf175uuB6nzFvogTdq3jTLR98cOBBe/HNX/CPWqz
	fN7p1ADpUkkpFZtAt/GZsn8lN3DEbjyxf
X-Google-Smtp-Source: AGHT+IGLyHIfRbXnisupMl56XT2Jbk3F0qS+jN4eiyS08VLAmORzmsTuSjA115PrQESsPABWEhnC09d1KfIOo74kpDw=
X-Received: by 2002:a81:8350:0:b0:5ff:63ae:4f56 with SMTP id
 t77-20020a818350000000b005ff63ae4f56mr481224ywf.17.1706739232805; Wed, 31 Jan
 2024 14:13:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
 <3cfd95bb-93ca-4f40-9e1e-bb2526789161@app.fastmail.com>
In-Reply-To: <3cfd95bb-93ca-4f40-9e1e-bb2526789161@app.fastmail.com>
From: Anton <anton.khazan@gmail.com>
Date: Thu, 1 Feb 2024 00:13:37 +0200
Message-ID: <CAJE3=wmhLSHY7Gqg7vHX_SAAYKx-PMQFC_i2iEek4mBnghyAbg@mail.gmail.com>
Subject: Re: Is there an efficient way to delete multiple elements from a set?
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While this is better in theory, in practice no performance improvement
is observed. This sort of detail is worth paying attention to in a
loop. In a single operation, the 0.01s saved is insignificant.

On Wed, Jan 31, 2024 at 2:20=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Wed, 31 Jan 2024, at 8:14 AM, Anton wrote:
> > Hello, I've been experimenting with nftables sets for the purpose of
> > geoip blocking. Let's say I'd like to add ip blocks for multiple
> > countries to a blacklist or to a whitelist. Perhaps the most efficient
> > way to do that would be by combining all required ip blocks in one set
> > (for each family). However since country ip blocks are a moving
> > target, I would need to regularly refresh parts of that set. My idea
> > was to delete all ip addresses corresponding to an ip block from the
> > set and then add the updated ip block. The problem is, this is very
> > slow. While adding an ip block takes (in my VM) 0.09s, deleting all
> > ip's from that same block takes 14.5s.
> >
> > This is how I'm doing the deletion and the time measurement:
> > printf '%s\n' "delete element inet test testset { $(cat test.set) };"
> > | /usr/bin/time -f %es nft -f -
> >
> > (the test.set file stores a comma-separated list of subnets)
> >
> > Is there a more efficient way to do this? I could of course flush the
> > set and rebuild it every time I need to update some part of it, but I
> > thought I'd ask before deciding to implement that.
>
> Indeed there is. Your method isn't optimal because the command substituti=
on causes the shell to needlessly assign memory for the sole purpose of con=
taining the entirety of the output of cat(1). Further, cat(1) will have to =
complete before the printf builtin can even be executed, which defeats the =
asynchronicity of the pipeline. You should feed nft(8) with a command list =
instead.
>
> {
>         printf 'delete element inet test testset { '
>         cat test.set
>         printf ' }'
> } | nft -f -
>
> If you would prefer to express it as a one-liner then you may, in which c=
ase you must also terminate each of the three commands in the { command lis=
t } with a semicolon.
>
> --
> Kerin Millar
