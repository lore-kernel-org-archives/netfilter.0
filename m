Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BF1F3FE3
	for <netfilter@vger.kernel.org>; Thu, 13 Mar 2025 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908258; cv=none; b=jciBOgO+b7ETGflU7HiZQ4EfSf+zod5Difv4FLL+lwlrmqr3v+tP52g9+/LYDWOLLGikZP7/O3/ZWDU1WoaQk6Xvq7oa1SrarQ3g2UlD8QCeBBYZInJnyhfgsk3B1iSfY4jfHK1jZmAqrS6XwYyPP7k+wTlolE6z1MMHcxML5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908258; c=relaxed/simple;
	bh=r8mWz79eZNE3VNFVIZ4FTYfBXsMPqe5vEDm9mL4/1Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApFV4ubM3sXOmeULJaPQqX4XvLqyDLWjc2ExxO4qZ3fQfSzI0v04ubfiTvnAvQRLluJD5EQq52Agt8TMShSw9R+8oJxnKUUVj7XqQ6lgzfwHjH+HlUX6SlFx30ciIacUEcnbPDiLIi6pdjzYD4o+JgZQuNQ7kevyEs5+IK+xT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUQNlk3k; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUQNlk3k"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d45875d440so6967745ab.0
        for <netfilter@vger.kernel.org>; Thu, 13 Mar 2025 16:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741908254; x=1742513054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r8mWz79eZNE3VNFVIZ4FTYfBXsMPqe5vEDm9mL4/1Us=;
        b=aUQNlk3kz8ayqpyrAY1oEDsPWngEsJL/bRpFniJqOE00AyiS8nit2WGECB76lks9ux
         j93scXOEbNEEEHu1Vk5uPMThW3wFOx6sSupAtCaMjmvXbSecb+pQIsd6fEn/zSox7YQQ
         ZDFBCADmxtFTl7MekumSAGOsY0VoYdxYBxsjC4Jc1iFHifMjfSaoUAkIpiPp9s/i9c6p
         yGb8FEMqdh9mVota3gW97JkqBTo04HtRo2DrypsP38CZW8pUQAVzqSLLN2X0AKLfD1MC
         K4eBwji0l59fxSPznHgATfA7dSuYtQ2rEpgwWvELZHGNTYOk9uflwUWgD09JZ2Qn5duA
         UaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908254; x=1742513054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8mWz79eZNE3VNFVIZ4FTYfBXsMPqe5vEDm9mL4/1Us=;
        b=T6/flO+cfHeMu//X9F2vZ0nN+5uLeXQ6gwjRL/swGRLHSdcL74ephpxnEHcdsqGoM7
         ehDWsFtePeya3xcgNNIuIYwtlQDqCpUOdx4rHhvRgWymm0dZKxlz+SJ0woZmMjpZCtBp
         BQyE2trL6fROLQNnL1cbF3qApQzVLsYutBQWDWvXQFM0mokzgx/i/42X27roUgxAyaLT
         JAAzjvHpQN/xY5zz+TJRIuncxrTVLqV3n4/O10xkF/lCr1xryNJNzi8kzXA1oNjJxPl0
         V/dGjpOKmtLgJIync232YGa0MmNgLrTh9wNKXlj37QPP1gL0zDln5MWEdqh5JDhAYFX9
         46Pw==
X-Gm-Message-State: AOJu0YxECiF5YO6YOij7Wo9jGIBbXV+8InCI7xDo/ICOs7E60I7IYFOi
	UoUHj06oYSZjyoaNwR/S2rxdhL8PMq5/uVU7yThGxlQ53wJdeYBfItUgpkW8s3N94qq7ciPcv/l
	oIVfaopSFlpnn+idcBSrcZuMRuMacMjI/IMI=
X-Gm-Gg: ASbGncsxouzv2NjRcgW/TTxdwVXccKG2tdIFtfZGW5MAthStdcUkwXqKbu2gWPl0793
	SgYx3kyGbcdPA8pvXdpJ5twNJKbhG0HTVHv79C2HPfse+V6QHNBMzguyUmsemx0y8j3T0dwiKBR
	UlhPYnsGz6yHdsIRyVE80i3SKx
X-Google-Smtp-Source: AGHT+IE4KnP/PrhKRnnVdZR6C95iiDyNidrJ9LU46RMkcVlr8Fsx2ndCYirlKiB02PS1uloCp1yQLedcjcvn6iMumGw=
X-Received: by 2002:a05:6e02:746:b0:3d4:6ff4:261e with SMTP id
 e9e14a558f8ab-3d48397f84amr3339575ab.0.1741908254410; Thu, 13 Mar 2025
 16:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312161324.GB28069@breakpoint.cc> <CABhP=ta1mct0M37VvT5_HA-oQdJ5s8LCRL4AF=Mb=TzZS=0F0Q@mail.gmail.com>
 <20250312182021.GA3007@breakpoint.cc> <CABhP=tbbS3S=yCViCq82RcG3bYt6=C4i9i7pn-w6nZCzjpyKuA@mail.gmail.com>
In-Reply-To: <CABhP=tbbS3S=yCViCq82RcG3bYt6=C4i9i7pn-w6nZCzjpyKuA@mail.gmail.com>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 14 Mar 2025 00:23:37 +0100
X-Gm-Features: AQ5f1JodQziQaqTSkCixBvf_yoxYvp-azbEmkL49o3wzN3aOpwp7juhshIgSExc
Message-ID: <CABhP=tYqdXgQrAMUJu8KYvh3krsTtyR-foxY201wtRojjMOaqg@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I tcpdumped to verify the behavior, but let me work on it and use a
> different approach that is not so racy and random, I just wanted to
> validate my assumption on the expected behavior

There were also other bugs in this patch so please disregard it.
I submitted a new one in
https://lore.kernel.org/netfilter-devel/20250313231341.3040002-1-aojea@google.com/T/#u

I also realized that I need to use "reject with tcp reset" to close
the established connection, rejecting ICMP messages does not seem to
have any effect over established connections.
