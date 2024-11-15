Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE4155A2F
	for <netfilter@vger.kernel.org>; Fri, 15 Nov 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731643933; cv=none; b=bo+rbaPtITMpV7ZJAS91Liyvs8Q9I8HRAemdmZ/tooojvwHu14KbonPTsUXTUF/oGK27MER2crK4S5e5O29OxTflTzmgfv6flQiPmpo4lNZfUMcUQ5YxFovpL3IXT2OjNDZ2n3ssz2XP5TuiaL00queZx2LtBlk8Z6YQzE7+RrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731643933; c=relaxed/simple;
	bh=KE5drUw4SJXSDMzYhAF+kdT1e8dHRQwmr7vcxMVm12Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKEsxpYaROvsbq+DPfAJ8WhSDr2QehNYhKF1JVqTowRYrRSC0ctbQ/MPPI1Fwq071KoQYBx4KJ6lnALCcBdKHABJO3tLs+/BXtjXlUqA1lWFgBJDew8W1HuoZEPsa0olzy1ZxZIPeAwWm0hu2uKRhznQ9DmBGw8HPQzr+SUvnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB0hjHOl; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB0hjHOl"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so5125675ab.2
        for <netfilter@vger.kernel.org>; Thu, 14 Nov 2024 20:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731643931; x=1732248731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXoPuhp0+J030E3KYPcz2Wusrbd6658fsNKilX4PJF4=;
        b=dB0hjHOlAK8BoIiBljPojyOrSIynbJiuefNckUt/gutBf8mwpkX0N41Q5oOoY/STCr
         O2B9bD+YcyoMpK3YaZd0mrCcvuqoiPWAOihjBPKbQ1t7GbcuQPubauutcDaKM06ZihWI
         F6AuZLjlv1cLhkrYEe8kk+g+6bXAPQzpBLEbf1pVWExlkRqnfjFAs8TaMto5ox4IRJBB
         ahBQ45hJ9lskxshOILVyTkBKVVtpSgj/XTncGVA5olN+dlzEUxuHz1QzC/shRYmrw610
         w0X+ltS+0jXojNafIMo0/qgT1vAhyMHADgjhgOA/1vdhv8gaNr5lGTV0fm8EdMqgDKSD
         yMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731643931; x=1732248731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXoPuhp0+J030E3KYPcz2Wusrbd6658fsNKilX4PJF4=;
        b=EiPaNq3tYZ6mA6PCPl2ZW/zYO5na7DRvpCwubjkUwBll2CdSJ7X8uY64mUtOrwupAj
         o7gqkni6a7DzPHgCrqxjMxo6Wkou/iWNS5Vt4kXkXsKtAa5yfkkG8SqQzCNwVGwt34Kv
         MCMNNVO7dPk6S/moU1S1sVd3HaUtz24u75BI/zecIDAP3zXTYGohcG2y2gvTltlAkfVt
         +jajJzhV6VUYC0Ob0i8RohMqnfTJP3bk26iJvzYd6ZxexJZ7sit6lufdcVPjq78Va0P0
         lkmkmFbc2mlINjjRhw16iBggPYFXA2LuAoftqzIfngiHZgP08fGPGRV6EDswM/MH+F/T
         9ggA==
X-Forwarded-Encrypted: i=1; AJvYcCUJyyn+CxPDdKi7f7NMAUScJJnBvgZVl1R5FUHG6mQ73fP6DEP691p1qKZ0adpqKoqWHgMAJDIZ29w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISjiWkPFSG4T5iQL1ZD2HZIZeYVIahdQimAgtSI6KB2lxwN3j
	4qNPOUh4JRq0z3nKjcTfB1h7smTdLdle1c5OBJJs4cSqSP9NiAlKcRmZszEfFeq0+CpN7mGHnc8
	NArAp4vfLzJTC8ep4PjiFWIcBSIvuOx5C
X-Google-Smtp-Source: AGHT+IGw0hO4YCtR5tmXD4nMvmDJLTQ/jKOSH6VqB9ampy707xPLD+bxZUnSRT3w2OBjtZ9VKWYVDvYqC9u9qDaZDo8=
X-Received: by 2002:a05:6602:3f82:b0:83a:aa8e:5f72 with SMTP id
 ca18e2360f4ac-83e6c0d5dc1mr194047939f.4.1731643930699; Thu, 14 Nov 2024
 20:12:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017124632.GC12005@breakpoint.cc> <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula> <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula> <20241111125456.GA14363@breakpoint.cc>
 <ZzMc-e7NdC9-SL5W@calendula> <ZzMdzP6KP-kVAhd5@calendula> <CABhP=tZKpaJ4qB9WGxjsDrqgC4-CUkrh-Pm=KamtcGyXCvfgiA@mail.gmail.com>
 <20241112161855.GA24085@breakpoint.cc>
In-Reply-To: <20241112161855.GA24085@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Thu, 14 Nov 2024 21:11:34 -0700
Message-ID: <CABhP=taWMt8qhtr-xf2AEEjFjzWDRrFV0ZEQ_ziYoUKnVLnDxA@mail.gmail.com>
Subject: Re: Most optimal method to dump UDP conntrack entries
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 09:18, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > On Tue, 12 Nov 2024 at 02:20, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > >
> > > On Tue, Nov 12, 2024 at 10:16:45AM +0100, Pablo Neira Ayuso wrote:
> > > > I guess the concern is that assured flows cannot be expelled from the
> > > > conntrack table via early_drop, that is why an expedite cleanup is
> > > > important?
> > >
> > > Actually, the issue is that packets could end up in a backend which
> > > does not exist after re-configuration, therefore, removing the entry
> > > need to happen so ongoing flow have a chance to talk to another
> > > (different) backend.
> >
> > Please take a look to this kselftest attached that emulates the
> > problematic behavior in kubernetes,
> >
> > I think that in UDP the nat rule should take precedence over the
> > conntrack entry,on the contrary to TCP where it is important to
> > preserve the session if it has been established.
>
> Why? The peer is even alive in your test; from your initial description
> I thought this was about 'peer stops responding, but udp conntrack
> remains alive forever due to client-probes'.
>
> This is just silly, we can't make a change to auto-toss all mappings
> on a nat rule change.
>
> What do you do when someone uses random sampling and refreshes the
> mapping table?
>
> Kernel doesn't know what kind of upper layer protocol is used, what
> if its a stateful protocol that breaks when you packets get steered
> somewhere else mid-stream?
>
> Did you evaluate use of stateless NAT for your use case?  That would
> follow rules 1:1 and thus break depending on the protocol expectations,
> or not.
>
> For insanity like this I think we really can't do anything except offer
> an efficient conntrack table flush mechanism to avoid any loop in
> userspace.

I recognize that I put a very extreme case and without the kubernetes
context is confusing, because the availability of the backends in
Kubernetes is represented by other high level APIs, my apologies.

Let's forget about this use case please, and let me try to redo the
test to represent the one that the backend stops replying, that is
still very useful.
