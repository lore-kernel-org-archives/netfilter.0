Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490CB198E8C
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741789072; cv=none; b=n90ydA1wQiofcOOk5bFldCFq0zB6570rRiAb2FkOBr41ggH2JvncP93zznuetocyoxj6ZpmheKvRPGJOHznHIpFs9YgxPwXkDAKo4FjUAcpgtGs+jOeS9V+TtW3D0Gdn6nuLb8AGpwfVLrT3acnYn5Wrn1A992+Qz7oNWZKMuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741789072; c=relaxed/simple;
	bh=9LbotE4x5H7WYxYNErktD6vvqGzf40a6ckeULt8iV0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5pWiKNMDDanSzk/Nc0FY3DiJY98IcYKsakJib9R610TrhaqcQr/ErQl8/7yKRBVARMiomazp5/9PflL0B5h/H4fFDSlRms2mYIYpLLCs9YdEjpUyk38C+adAKV+/66MpOaZuLWpYX0sBevjPHP3klCGk1sLpfW7rbAxQXvkCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDDd1xnc; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDDd1xnc"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d4502ca096so9119345ab.0
        for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741789070; x=1742393870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LbotE4x5H7WYxYNErktD6vvqGzf40a6ckeULt8iV0w=;
        b=YDDd1xncEhNAyCPRoyEiAAoEHoomcNTrNq1RP1Sz67rSRRSEgjkXfZ2ZZLC5Mthrkx
         Le6Ipg5PsUHOHAoD4+fwTf99eb+5wNKtUJ/7KaL6M8rjPkrugFZ48YBuuEou8zX93Hbq
         OB6CyBkBtpa3PKyu3xQWVfC1exB/6ISY16RmLCBijlZj0cgKLRKibv2E6ilYoQLIquME
         uAQEDs3VmSz7/Af9LfhwuaPzthiX9noblHfQ8nOCZw6xAApeyG/6zVbKrpp/1OpevI8P
         wZSqJsh/FknOigfA5vTf0udzsDEHiaKuMR5seW1LTRnojUDI9E5QduvCkjnDoJhxuifg
         LpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789070; x=1742393870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LbotE4x5H7WYxYNErktD6vvqGzf40a6ckeULt8iV0w=;
        b=gUtXBVIgP9IfVjQlALPiRbvCa5Q5R9CDR1o3bXNIf/p2IwD+nVU8neqbbYtVKnqIuY
         fiHclHeXyAMyAcax8JLjeBsenvuzTrMceCSwDvZYAtVSOqnu/wGQ57I6G+3bFW5oce6W
         HEWuU4CDZeM2mkeLI6YXoraXw/4VQEonhQQI7PE0X4hSI2OcxAynI0b2JIALrGTwQxqi
         EO6xUTsJIZ8xZwtVvetMfeHexVahcNI5yUrcNuUfSNqy6rNMS12YU4ZejI4sR1dYrUNO
         ejsI/nFZHc6FLis6TzmqmrD5dYAmTkfDwATPgyKKI6CXPr0grL5QuSU+aBMBOL78JK6h
         8Pdg==
X-Gm-Message-State: AOJu0Yyw0IdeufRiqyQQEiJvMosq7bGC25NMuIVwHlfYOiz6GjmBAkOl
	fP66Gw+tq0ZOZGbMytX2vClhhDgownAFVM06JeUsAMfoO9qR+98ZsQBRLHCUJQdUQk91a0+Y0bz
	PZPvs6pZvoiTY3xPMHllEN0MNozI=
X-Gm-Gg: ASbGnctSzXKqg+/AzjJpof+tm3hoF9+Cy4x2TdqyPeuomeuGlhqhYM02SvWkc8FMS91
	xYgCsPmeTnEpTnekF7GuH7y82LQixnQGoOx5fAoSJpJDqJDciXJ9cZXSNzOBJERAQesa0eoAxTl
	h4+eezxW5k2ITx+NgR7ailB8c=
X-Google-Smtp-Source: AGHT+IFiQSELYlgXHklXuc0DCx7ziG+FromxVgSWAAQZfnQ6NHiHyJ+4GJG1SPvx5PEM1UZilxdrSPTy0BoN/Ahlcr8=
X-Received: by 2002:a92:cd8e:0:b0:3d0:4e2b:9bbb with SMTP id
 e9e14a558f8ab-3d441a1e474mr299673265ab.21.1741789070073; Wed, 12 Mar 2025
 07:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312071148.GA11288@breakpoint.cc> <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
 <20250312125142.GA23038@breakpoint.cc> <CABhP=tYr-QOwsxiKnJwNP_7JsybxhK-2_y1c6CEfP8nGMhgD6Q@mail.gmail.com>
In-Reply-To: <CABhP=tYr-QOwsxiKnJwNP_7JsybxhK-2_y1c6CEfP8nGMhgD6Q@mail.gmail.com>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Wed, 12 Mar 2025 15:17:13 +0100
X-Gm-Features: AQ5f1JoPKZ4OY3pmesNZch6arh7g4GF65B9kxfJmP_3H0TpgDcfaPFm8_4G34v4
Message-ID: <CABhP=tbpTM70dWVxxaoJWCJ+QEjcnasD-sC0tCtFtOFrcf1rKg@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 14:04, Antonio Ojea
<antonio.ojea.garcia@gmail.com> wrote:
>
> On Wed, 12 Mar 2025 at 13:51, Florian Westphal <fw@strlen.de> wrote:
> >
> > Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > > Is there some kind of optimization that just directly copies the data
> > > without going through netfilter hooks or am I doing something wrong?
> >
> > Looks lke whatever environment you are using has bpf progs in place
> > that change packet flow, or some other proprietrary modules.
>
>
> hmm, I'm building a vanilla kernel and running it with virtme-ng (but
> it is indeed a controlled host)
>
> vng -v -r arch/x86/boot/bzImage --user=root
>
> let me try to run in a different and more clean environment and report back

Ok,this is working in a ewn Debian VM:
Linux instance-20250312-132718 6.1.0-31-cloud-amd64 #1 SMP
PREEMPT_DYNAMIC Debian 6.1.128-1 (2025-02-07) x86_64 GNU/Linux

At least I know I should not use my first environment for these
things, sorry about that.

Florian, do you mind if I submit the selftest patch?
I really want to get confidence this behavior does not regress, since
we are probably building a feature based on it
