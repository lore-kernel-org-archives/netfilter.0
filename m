Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF78130E3E
	for <netfilter@vger.kernel.org>; Tue,  6 Feb 2024 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221729; cv=none; b=iEXilIUWAA3iePkRhAy5FVkR45ayXGGAAxi51GY9nC8JOmAIRrhRUvZTbkInPyLJIdfrMLtSiZmddM/5Xl2b8w7FnCMVXcc8eO7A8pFYdv/PJC6OV1VcH48h5TEpYu5e5+zAuDa6lU6gPuGQErpHKoPZYHIiuOt9MhZ/wNRk5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221729; c=relaxed/simple;
	bh=r3TCddwjq7jvXFjdsVseu2+JmfiYo51jmcnju8sBdoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTTGzi1I8UQNDXvPKKhOrIX6G8UqPjNOoUFLd8r4m55zZ2vQ0pIlU4KgrlL0bAiTfyFNT3YW89p3a1YhiradbWLNUOQ1//D1xcqBL6ki+TdpB9QK0zvXJckFMDdoCk5PKPXKnqLE6kJSmPHjY3K+wErnHdOBxR3GRsfysYsivsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnZo/1Af; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnZo/1Af"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6047f18e2abso4299537b3.0
        for <netfilter@vger.kernel.org>; Tue, 06 Feb 2024 04:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707221716; x=1707826516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3TCddwjq7jvXFjdsVseu2+JmfiYo51jmcnju8sBdoY=;
        b=NnZo/1AfwmFYCRhnBCXy0zSTmFNI1KJPlmUE+pirFkvac8BDGtI+pSR5+cUpyBoMBA
         E0hQMbbAdENcap0bzE89l1mHhXl4vpQUU3O0PKyVGkx6aNNsZ9N+bSp2UcOK+xevpftU
         0ix1f3FX8F6umv5CpBMmmtrLmFkE3RbGhUH//x0Cke2xi5Uo4g8fBnmXhTCcFlPjsqLS
         0Ert0+I0w15XLUk+/s0WjLrp9td0QdLB+EAv9AJSNLH0+hJlmqrockXxdUEGRXjWzbEr
         zomcviikzTJJ0lZys2zrVAGtgQ8WBkmpZgqCAtnhn7lcPXdcg4++yxF5S/pjbpa735rJ
         NqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221716; x=1707826516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3TCddwjq7jvXFjdsVseu2+JmfiYo51jmcnju8sBdoY=;
        b=m7+/kZO3lFP5JlK4vGtE4qe3BRUJ+lFgYbibzGe1K8ecEeOE6c7ETa5UVeLA0TuURF
         dn99GMWPekOisGIC7Hs3jfiZvOXNLPnkSjVsI8b59gzmNwVTJTWIdccgZmnaDlAs/irB
         T9B7pZ8zdO+VFOA7Nck1lpkJnAE2NAwouC5XWyoxwT4mMmh0oIRriaQsPtcoi36TYTun
         UrLfZ2Up80mfIhG3FFNrumF2i5WlTd6S3LjHjMe1KqGYehJDKjttVY1bkYORyV9aNe+S
         qd6NUg5LGnRoDX7jKI7jxZrDeJUoIQx8qNB+UC0Y3gdjg33H2xVFf7rjK8Q74edWd5Tf
         qStA==
X-Gm-Message-State: AOJu0YwjsDsJMF9x/7Rzbl0PtW0oZEN6e/hks7DLC4Qsyi0SeEwJ0SCi
	YZtXVBG56Pa0K45whBm/upYWUwHPF2cAayK4qSNgyHyr8m+88UwVgF9OZpCk1DNO5KWhMpcaIVd
	GWib/NXZomwa1wZnNckB8HSkJvsV5DWl6
X-Google-Smtp-Source: AGHT+IFdmD27ajGf8EI2+d3rcIA2qjVvYdHTMBwtgjHSxkLtq3J/D1byCgGqmebuc+XJrQGwdPngAw5PMPbaUO1ZUyc=
X-Received: by 2002:a81:5c83:0:b0:604:4400:8fc1 with SMTP id
 q125-20020a815c83000000b0060444008fc1mr1437297ywb.39.1707221715731; Tue, 06
 Feb 2024 04:15:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmUcJ0E8nobG=T084XkiEK9UUgR4kyfLHk2enZOunH_1A@mail.gmail.com>
 <20240206111257.GE17626@breakpoint.cc>
In-Reply-To: <20240206111257.GE17626@breakpoint.cc>
From: Anton <anton.khazan@gmail.com>
Date: Tue, 6 Feb 2024 14:15:02 +0200
Message-ID: <CAJE3=w=rxa7DC7zP=uw0TFkp4kiSknSt6ALbnmDHx4_7JV7R9w@mail.gmail.com>
Subject: Re: What happens if the machine runs out of memory while adding new
 nftables sets atomically?
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. And a followup question: is new config guaranteed to be
removed if the operation runs into OOM?

On Tue, Feb 6, 2024 at 1:12=E2=80=AFPM Florian Westphal <fw@strlen.de> wrot=
e:
> Old config is removed after new transaction went through, not before.
