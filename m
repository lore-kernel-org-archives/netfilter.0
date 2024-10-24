Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBA1F9EDA
	for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793674; cv=none; b=gpv8ZjhjGm5m6r5/cfxLleCaAs09BY5Ri2cPTjVEL02xYWGcYjRfXb/X9fs4enuVjNN3lW2dQK5hOsWhQG4819q7kgOZopZsJpiEcocftiz+oRx0eq3Iqm2QzCCRZ8V/ZcsqKSSelfgkLWSfAGTiU5stBF6AD+FRASi5PNUe1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793674; c=relaxed/simple;
	bh=q8epx2Sziyodo8Q9YhzGDXy/MbbVow28PuaoABp5db0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mePcGDvjTfShqiZZMWraZG+UFDaVEBV0PWAkrBTunmcINTpyjmuwlGY0cHpBLCWj1QO5bnufiHhcaMGXlFgiDuzF2vz3K+QMrbf5ayTCrwIzBQqh5FvezGjMT2cBvb0NjHVeJinu3OY/nw+qg2eZaSBZId3SBRbuhkedXsd6m2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=K+nMjnxv; arc=none smtp.client-ip=134.84.196.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="K+nMjnxv"
Received: from localhost (unknown [127.0.0.1])
	by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4XZDZt391yz9vc5D
	for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfFmZruR9syT for <netfilter@vger.kernel.org>;
 Thu, 24 Oct 2024 13:14:30 -0500 (CDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4XZDZt0GVqz9vc58
	for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 13:14:29 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4XZDZt0GVqz9vc58
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4XZDZt0GVqz9vc58
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43160522db5so1921635e9.3
        for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 11:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1729793668; x=1730398468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa15+NBitdMr3VjovOnvnhvbaAsRFWSuZxC1SV1uvLI=;
        b=K+nMjnxvprq9x06FDsdX3xSJZbjTnIuT14L7fV6+hXozt45/GBhne9pNgqCXlobFSb
         Pnx9fm9pJE3JRAH2CyPpSf5tjxEJ+S8IdAcylfCP18sPEbUhBNzC339X88Pre0XuMwjC
         iJiTFvCLk61SYxOGFDXazWoJEo41f7zuVu7l2jEik7IjqBGxlwOOy1FqG6VUDv2MBKNx
         5jYm6pmmMS9LH57gSLNXuenHaKArAuVnCQgQPvKtuKA73010NvMfcltXOo47r1KC+btB
         cPq+B32M0MRxO7e5Zmz2oFDC/pMjfAPPF9vr/SY20ffGcF4SuZ+aCtOtLlyk/uCCWrtJ
         Nc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793668; x=1730398468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa15+NBitdMr3VjovOnvnhvbaAsRFWSuZxC1SV1uvLI=;
        b=MHywRrMEqynOa2uVRMVSLdpi/ILP3HjSyJxhg+2mHc2oYYSPbnrWJ4R6kn0ZdGT2/f
         w/1gGwHLjRKqh1oLuRZdN9YHwquklAvTc2z8UagnhDoY7jozEQmOeG9SgF6ezkFvGEKr
         fSEVg0Z9TaZHjGNBBG/XOkCK4POlXNhpr17pGycNewTCQ/R3tUhK7o+xv+U/rRNJcMIO
         GIYpab9yc/u9tKH/ssicZZPtg0kQ6ckvDxuzNAh3TFmabOsFfbCZHna9QHrEOrX8DRRu
         ZtfkORAl9eyznMhca6NJvyIxpXmYrjCj626gvDb32YQ5C31IAV8M+MoN41OlVqoiS1te
         eygA==
X-Gm-Message-State: AOJu0YxU/SyhLUDfcJgvEhgPYpQUuYhno8dFa//wIwkuw0e4+jTK8JmH
	3HJAkCD8O/3ayGpoBL/QN6vq+4RT5VQFipOF2XbyCMYfoYifMYEbujAMBU0iphHaHOKEHDCidVn
	GuSzaTtukBYXaTAhH0wZUPHngPCnX2cs35YOkpAx2Ju3T9KTlCkTFBfXmRHzpWgUnws/yzngrbF
	qh++AA9wRrIt0S5k1l5/bMH8WI5kKInGUCSLHUtZIGaSThJQ==
X-Received: by 2002:a5d:6d04:0:b0:37c:d49c:3aad with SMTP id ffacd0b85a97d-37efcf79e0dmr2672636f8f.11.1729793668512;
        Thu, 24 Oct 2024 11:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRkrFBlXZ/Xr6Lm/qp79L1JCNbjCUjbzlYRV27o6wmUwpFPKW6mN2jsyj+w0nkghL8Zu+Iq1Hdc5fwNueKHqQ=
X-Received: by 2002:a5d:6d04:0:b0:37c:d49c:3aad with SMTP id
 ffacd0b85a97d-37efcf79e0dmr2672631f8f.11.1729793668099; Thu, 24 Oct 2024
 11:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
 <d3b6500e-0d6f-45f5-9363-9fbad985b880@app.fastmail.com>
In-Reply-To: <d3b6500e-0d6f-45f5-9363-9fbad985b880@app.fastmail.com>
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Thu, 24 Oct 2024 13:14:16 -0500
Message-ID: <CAOLfK3W04gSD+bM3xpD9w764Hne0AkszB3thjVLYA2Wnb6ye7A@mail.gmail.com>
Subject: Re: location of conntrack rules
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kerin,

Thanks for the informative response! I appreciate the thoroughness and
explanations.

Cheers,

-m

On Wed, Oct 23, 2024 at 6:42=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Wed, 23 Oct 2024, at 11:10 PM, Matt Zagrabelny wrote:
> > Greetings,
> >
> > I have, what could be, a simple question.
> >
> > Do folks put their connection tracking rules near the top (earlier
> > rule) of their ruleset, or near the bottom (later rule)?
> >
> > I used to believe that it "made sense" to have the conntrack rules
> > earlier in the rule set, because the packets would be
> > related/established and wouldn't need to hit the other rules
> > unnecessarily.
> >
> > However, the conntrack requires more kernel memory to track the
> > packets. Therefore if every connection is tracked, then that would
> > drive up the memory required for having the conntrack track every
> > connection/packet - thus possibly exhausting the memory and not
> > allowing other packets through.
>
> You may be under the impression that rules of this sort electively subjec=
t the matching packets to the machinations of the conntrack subsystem at la=
rge but that's not quite how it works. Once the conntrack subsystem has bee=
n activated, all packets are within its purview past a certain threshold. T=
he latest revision of the nft(8) manual briefly touches on this.
>
> "With nat type chains, there=E2=80=99s a lower excluding limit of -200 fo=
r priority values, because conntrack hooks at this priority and NAT require=
s it."
>
> Therefore, if you want for a given packet not to be able to produce a new=
 entry in the conntrack table, you must go out of your way to make it so. C=
onsider the following nftables ruleset, which employs "notrack" to that eff=
ect.
>
> table inet filter {
>         chain INPUT {
>                 type filter hook input priority filter; policy accept;
>                 # The mere presence of this rule will be enough to
>                 # activate conntrack at large. For many distributions,
>                 # such entails loading the relevant kernel modules on
>                 # demand.
>                 ct state established,related accept
>
>                 # There is no chance of otherwise matching packets
>                 # traversing lo based on ct state (see below).
>                 iifname "lo" accept
>         }
> }
>
> table inet raw {
>         chain OUTPUT {
>                 # raw evaluates as -300 n.b. lower than -200
>                 type filter hook output priority raw; policy accept;
>
>                 # Don't bother tracking packets traversing the loopback
>                 # interface. In many cases, this can be an acceptable
>                 # means of conserving resources.
>                 oifname "lo" notrack
>         }
> }
>
> The same is true of iptables, only the syntax is different. There, one mi=
ght use the built-in raw table and the CT xtables extension.
>
> -t raw -A OUTPUT -o lo -j CT --notrack
>
> >
> > So, now I am wondering if the conntrack rules should (always?) go at
> > the end of my ruleset.
>
> Rules that match _exclusively_ on ct state should not be situated at the =
end of a chain. The consequence of doing so will be that the probability of=
 inadvertently composing a faulty ruleset is markedly increased.
>
> >
> > Or do folks put the conntrack rules at the top/middle/bottom of the
> > ruleset on a case-by-case basis?
>
> Generally speaking, they do not. Keep in mind that if a ruleset defines u=
p front a suitable verdict for all four of the states, "established", "rela=
ted", "invalid" and "untracked" then, by definition, any packet that contin=
ues being processed must be in the "new" state. Such is convenient because =
it obviates the utility of explicitly matching on the "new" state.
>
> tcp dport 22 accept              # convenient
> tcp dport 22 ct state new accept # less convenient
>
> -A INPUT -p tcp --dport 22 -j ACCEPT                            # conveni=
ent
> -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -j ACCEPT # tiresom=
e
>
> However, many rulesets never have to contend with untracked packets at al=
l. That is why it is common to see examples of stateful rulesets that only =
ever explicitly match against the "established", "related" and "invalid" st=
ates.
>
> --
> Kerin Millar
