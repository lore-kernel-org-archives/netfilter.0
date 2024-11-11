Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27670156C70
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731306842; cv=none; b=r9l0/+8pQqBqhXJDwVZNXFFKjbUiToe70o3QZamnvB+WejhNNaT1H113Q/F6BcIOWWqWPs4jAgx6AYeBPSJY+2ojkpRtHnM6qNZVoVrlZXAt6RuG5z7FygJkEOuTwPc4VID+uLe3ehfamyjk3lqdmetRjIVqCNMJJJAbeM/rmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731306842; c=relaxed/simple;
	bh=vr30lOKkugib0IwDmil0NI49nqLRebBEqg9/sxth3lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Evh0fho/hXRmXIWFqJ2UaMSq0kQf6Q6K5yTKewht+mL9BStZQ682QqrDHIdhjJ/0k/kRStOL9IgnbG8GpRkDhsQpl36iixZGDjrX+lTe9qEcD59UJyLHuHwIxGgLzHujIAMwGduFJ2ZSWXQkki+mxrhURhar0Q4mL20IisJxYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFLm7fN8; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFLm7fN8"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a6ababaaa9so15733175ab.1
        for <netfilter@vger.kernel.org>; Sun, 10 Nov 2024 22:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731306840; x=1731911640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XBgK8D2tPRgdHUz2cqgpQSaYQVfKGQG8uNSIxHBLmo=;
        b=PFLm7fN8iOv8okR0b7auhGlK97NvF8QgvJQ4eIz3x1k8/NNE9FZDnuA2B52dJmCHd1
         u5SBjrX4dUWr4oCj8kMjazBoGZO485cxfqCpTY7nlJesVHGRQxsgSAE+3NUQEtPZ0zX2
         ZH1gNny+O65wGVtYki5sCJ+baGPnbFoOMLIgd2JzyLIv9KODsYuOWb/B3r40vyEKYy7u
         5yulJ926rO8jgOSPekj2x0ukX96dhvpPmJ9Quu2hi3HGkA8P3Zz7l+SiRkBuuUS9PIUg
         SYQeWJBCUWQlWA1x1/0K3sEv7uO/67H+osEolcXWPFl0x5MnkFljPNoX53HVayhIq4wX
         ljPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731306840; x=1731911640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XBgK8D2tPRgdHUz2cqgpQSaYQVfKGQG8uNSIxHBLmo=;
        b=GC0nhmLTp45In449FzQXVKT6TEc6fiZNIusWrk7UYNqRD+eze3f+BKCjjS9q+kvC8F
         fEK0f1Ibn6Ca+QBfyxy+553BgBiUkIQx3ir1UZK8ROGtJVSgxOAF/LhzIdzu61s15vVu
         szZMy5m8wnB4wytHoq3okVH4GBCAgbWTnnnTeR6q41lVWnuemEEKSO+T9FYJiFY6+Brz
         vfE2IRpOXocz2HZ4p4IHhgiFFxS2wksFlzrqapajScQX8otNc+r5SY05NgVmZqszTkgS
         uA++xbf+/zJSX6vyWYjqsesPC7eDyud4Xzlx7lmmeHX/LjhLeT4JaHDS5hp0w99ULEst
         dZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWKA45QCcUwWK7KDzKubY/+TP/aSTDCq8h+PmVYDumERJ3LGoH/66ZZ3Rt+26LTfTTruFgQHAsCEHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaVpe+z2QjmlKhuhMrHCu1sgQ9ufqQ/yE0ZSxqeNy1QxP4eqV
	Fzu6UCXDnIgN0vSjV8Rf+2Zt6xRdPaas7t3zRB1ifl8+GpTLDIxbS3zc9rhKmbTNlMliwh55Evd
	HJdvDXQO1zT24sHSLMccE44Gat1RLjaq/ulI=
X-Google-Smtp-Source: AGHT+IEqup4mkJmEj86aVeeUQbi/2Be4dwABHV+IYvXo67sEwKEW6OVmFRrEE+7xsrUX9C6m/eA1aSQWMroBuu2o+N4=
X-Received: by 2002:a05:6e02:170c:b0:3a6:cac0:1299 with SMTP id
 e9e14a558f8ab-3a6f19d1253mr126413655ab.14.1731306840015; Sun, 10 Nov 2024
 22:34:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <20241017233031.GA3675@breakpoint.cc> <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
 <20241018113318.GA28324@breakpoint.cc> <CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
 <20241021135342.GB15761@breakpoint.cc> <20241110215001.GB25943@breakpoint.cc>
In-Reply-To: <20241110215001.GB25943@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Sun, 10 Nov 2024 23:33:23 -0700
Message-ID: <CABhP=tZxTVNOD4mw0Sgax4NJHKoabnHUNKCJKSa9mck1a+vgig@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Nov 2024 at 14:50, Florian Westphal <fw@strlen.de> wrote:
>
> Florian Westphal <fw@strlen.de> wrote:
> > Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > > On Fri, 18 Oct 2024 at 13:33, Florian Westphal <fw@strlen.de> wrote:
> > > > Same as what happens now, 2nd packet follows NAT mapping of first one.
> > >
> > > This looks like the way to go ... if you can send me a patch I can do
> > > some testing next week and report back
> >
> > Here is a better patch, renew only when responses are seen.
> > This means that once either initiator or responder ceases to send
> > packets entry will time out.
> >
> > Subject: netfilter: nf_conntrack_proto_udp: renew timeout only for bidirectional traffic
>
> Ping.  Did you have a chance to test this?

Sorry, I'm out all this week on Kubecon and previous weeks there was a
lot of work with the kubernetes release.

I will try to do it the week of 25t of Nov
