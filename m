Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48649254B07
	for <netfilter@vger.kernel.org>; Fri, 21 Feb 2025 23:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740182011; cv=none; b=HdZL4BnSvw2ONm/mBjsq33Fg4UAFa6Zv2oXW7g6ahVWmSL6upqIxWIOGVBdrTdqyQ2n5UhmLDkfi/32bKkEwkDd4krg5veuvOdHwYUpVMgfF0SpSnMnBkSj+LXsBSUsi9Y7aPyBZ8RAly0YVXobMO3zYqgVs16pswmT2IdwlvLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740182011; c=relaxed/simple;
	bh=SrFGpojhn+0RqHyf5uJgyVEzwrUc2oj4ONmSIAD5wUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zex7RDWu2B5LB5F+EpUemqYB3khuw9Ht9nLLBup+Jd2Ref1/h0lTdPPqDwD1DDL+6Nq+3gbcTKvVj0mav54W6g3FD/dLdds9q8xbcPZHJZ6Yanc1j0gHE8sW4F69uQZ8HnDgpN9ve90yv1TIoago1QsSmXb1/A54j0aCZmpC3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjLsFP4p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjLsFP4p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21c2f1b610dso76674435ad.0
        for <netfilter@vger.kernel.org>; Fri, 21 Feb 2025 15:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740182009; x=1740786809; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJZGx4PmTNcZAc/dKIeaNYScBVrOKA7gHdHsYe1GGk4=;
        b=IjLsFP4p6VzytKubiJ2abf6G4D3rkfIZr+vX92jHnu6TnKEufqQrfTaIxwZfR3xI7t
         h6ehoXjIzmTJ+4syh22Fd22BeshjTT74zOQtMe+zGtbjzVwgIZA5JXHyTTr1e6r7Mk8U
         9AnpgY0AqV97vuraNecrAZtYLGbtuyJ/dpXC2mkJiMqpBGkBK1dqa5UrhGsICe+kSdzG
         7PD5FJ3YzKtOHvLw8p/JkpYOMpd3kM6FCMIHxvWWybmaiyuPTvdqt4v3XCzon4BhC2Mr
         WIZA/f98/c3YWkEjbjDiGRg5l2TZYobymMMo/7kTw8Qxoqfvz6xVCPjd+2jn9Y4NyfYi
         iYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740182009; x=1740786809;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJZGx4PmTNcZAc/dKIeaNYScBVrOKA7gHdHsYe1GGk4=;
        b=P9Ffb/441n+HC/vgf9fPjEUM2z1RQj8MlzCWPoSkoDmylSqecvUvlJGEaDZqJYY9cJ
         eVv83HksQdLVOtty11R+j1V/w/We5GOUmf1LrG/fRib95MyFVmqos+hzJJvhJIzS1ATB
         b/dMAOjMx15+UgizkkMC9H0NO++8xFi/6vptN/FYM08/1gU0ZwKs1ejWVGr6hNDgQKXL
         YaG6/27uNBdx5q37gaZhyLIgp/ELs7cH5Z3FlR/j2NWoUnKdV1+x1WdHjNWpxAPIJXmM
         DabuwO8b+1n/yEwN0W3auo+ZIw3i3AKg8uqMj+qI8BDTPpJLnXM1rkp3vaSNEk8bgp/h
         03tQ==
X-Gm-Message-State: AOJu0YzPjG4GDifNqYO8Wl9F7AiSE9Yplq1/sE0PaQ4xOu/MTVYBH8CB
	/AEWuKDr1yagoft4gmfFi0Vbh7IhOWaYBGi8TXKRoX8NSxiC8D0fTSjB4+s=
X-Gm-Gg: ASbGncvBPvazAVNEpGUY2q8emeoWwDWIFqc8N8P6zhuJI6kjFRDpbbUrQNc00HdTQF/
	6vO0Mw4+IjpmkR+uNJYWZLIDBt9ZksdEgHeIT50GA1OX8SU7B3pEbF4qLBkI6AaSRXVA5u/o2RM
	8rvVMRelsb7zTdGrJNf3k4YvGD9nuH6YmzDxSQ0KqcTm700g2aA8Nx+dQ55VmbKn3blgTbM4hpu
	lK/3O5HhsxDkC8DhX3mY3yIQa6k4BnY1ac8Uhfp66Sic4aFl9RI2oszUhcsxYWp6mCE79AD1nXi
	lip8wtplsXkSIDP3C+AqA5x28/Ek1KncNrF09XRB/MWh38OedXpC9nGuMzOBNaVdaYpR2g==
X-Google-Smtp-Source: AGHT+IFnps5MXAQCgfsHDk5ImO35cUdVtq7ApvDECllanwGRP+RaLgikqpDrOX97OgI7NIgAN1uquA==
X-Received: by 2002:a17:903:32c1:b0:21f:564:80a4 with SMTP id d9443c01a7336-2219ffb68b1mr82325945ad.33.1740182009360;
        Fri, 21 Feb 2025 15:53:29 -0800 (PST)
Received: from stodi.digitalkingdom.org (MAIL.DIGITALKINGDOM.ORG. [50.250.232.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349634sm140873995ad.31.2025.02.21.15.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 15:53:28 -0800 (PST)
Date: Fri, 21 Feb 2025 15:53:27 -0800
From: Robin Powell <robinleepowell@gmail.com>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: What is *supposed* to happen with automated nftables accept
 rules?
Message-ID: <Z7kR9wi6TQ5ZwSb6@stodi.digitalkingdom.org>
References: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
 <03148B08-C3E7-493C-AC87-8A011BF5D5BF@slavino.sk>
 <CAPR8QA+LdZOQB+-i6Uf68S-jwBYBswyWDX33=D+o8vSYW47OLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPR8QA+LdZOQB+-i6Uf68S-jwBYBswyWDX33=D+o8vSYW47OLA@mail.gmail.com>

libvirt doesn't have that currently, but that's the sort of better
solution I had in mind; I'll talk to them about it.  Thanks!

On Fri, Feb 21, 2025 at 03:50:37PM -0800, Robin Powell wrote:
> libvirt doesn't have that currently, but that's the sort of better solution
> I had in mind; I'll talk to them about it.
> 
> On Fri, Feb 21, 2025 at 9:18 AM Slavko <linux@slavino.sk> wrote:
> 
> > Hi,
> >
> > On 21. februára 2025 15:40:51 UTC, robinleepowell@gmail.com wrote:
> >
> > >So my question is, what *should* happen here?  As far as I can tell,
> > >there is absolutely nothing the libvirt tooling can do to override
> > >my reject.  I can't jump between tables so I can't do like "jump
> > >libvert_inp" in my chain.  What's the right move?  Options I've
> > >thought of; I'm hoping there's something better:
> >
> > Basicaly, you can "overide" reject in two steps:
> >
> > 1. mark packets accepted by libvirt (or generaly in any other rule)
> > 2. exlude these marks from your reject
> >
> > You must check in libvirt docs, If it is able to set some mark...
> >
> > regards
> >
> >
> > --
> > Slavko
> > https://www.slavino.sk/
> >
> >
