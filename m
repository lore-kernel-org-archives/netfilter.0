Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52A24A049
	for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892283; cv=none; b=WRX0PnDkl772q0ZpgdT7MahF1Yykgnn+rNLbRroUhF4H/4re/kjLwWvb4usaJquojRC5Mx5fQ4Kmw5TouSL1EckFnhIgZzbhPg/MtadpTYY05c3fmqtbkKAw4Ugfw2R+Yj1G2DQFqyI4ag63+hOCqWBq4gEiTjJ/Xxrvgkj/PZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892283; c=relaxed/simple;
	bh=DYFB7RCxEY+58ZE6MZl8Me9RWP08uOvpRib5wMViAbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r39s5AMi2lFBNG1ad8Cry6P84yCd37MmLzBPfWA+3EouecpGy928XXZdNj1egmRM3LBvMeKcew5Zv6OukTWI/n6Uia4TdYnzyr9Bj25DFtOjLdS6eudjsDqFckLlydBPgHWQaG7CJDhpaS2CAu4K6lqKO/ij28J9OwIgfHNlKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAtafHKl; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAtafHKl"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42592472031so4283545ab.3
        for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758892278; x=1759497078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DYFB7RCxEY+58ZE6MZl8Me9RWP08uOvpRib5wMViAbE=;
        b=WAtafHKlwt5WSnUoUWknl8eOLkn5V8eV0/lwiOe2J/QnE9LoCZoCLt27cw6dNdJ9ol
         PAXrBgdWl8Dc0Y4swjui7sfx2TkC2P6NSRfwT6DAACIlMVE8xa3PSp45bkjawro4JhJz
         0L7KocRLyDr4FghNnJd8JgGGgLk1vNf/dzEu/5JAji1KGBTO0ZepUckflDCU8Gnb0mLX
         MlnnDvSmLiwr+RWvDhxOKacwvGlg95d2MfzQ3T2cSHYtmkPmXYODVxT94TPK8zhR8Qb2
         Yz/c5WFtwIR0Zn2dpyQ7rQyr3qRt1f15O4VltDe/O9SxTXz2VsEZIfqLkhQWpBal7qsa
         dOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892278; x=1759497078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYFB7RCxEY+58ZE6MZl8Me9RWP08uOvpRib5wMViAbE=;
        b=VMrOcvkD1cGf/2iyofLxgSfFy/vjFEyHeBOFr65XAqgrepX1BI27f4PgVAFPe3qe7j
         AyYTakhgPXlG8nTFckEpqCnXNwYoe2kGd97em8B5dOwi5VPPpABGxywEq8AI5w81/0hZ
         21sdtSXp9j+Wyf71cgFW5WcluF/fX5uLr1zdLPLKxAIMaSSCCCQFJvj4j7lxxGnLfEEE
         Ll8NPRsa4rVDH3tA3m7BUb/BfjxI8rqH2dW9k6VkEXKl4yy9mqjAUPXWM+4a061C1QkO
         X0yHZkt2eLJhtyZDx449j+HV0gbG9/hM1vBksi/f3MTA70u4tlN3NN7lJGD1ciO3134Z
         UgSQ==
X-Gm-Message-State: AOJu0YxhDl8Lm54HcOuT7iHRmMuUw0SZtr3aOkLvfff2O10xgiOasi2H
	M7okcPa/8X3h/3n8vEGNfE1gj7utQX9vbHfrmN4V23XzaUpE3tMEMkohU4fh5CGgzRcbpI8+yAD
	hbd97HUXy6ebbrOp3KI62R85pKhWqi2V8vrb5q14=
X-Gm-Gg: ASbGncvU9yX7ul7CnYlNIMWRN6fYXW0lOV3378+CdLCMIydnbXDRvpZ7r4GfUxtY+y1
	tWc876iBTyrlvAeOEU9wNHO8bGD14ZQTpRhP+yV1vIj3YClEmedrx7C4tehAO+GGrHUSBAUttn3
	uSZaEDcrf1yxh1SlL7T6G88B8plmNbPoJHTNyQ+IEk2zOJg8ATVuFT4q2FBrisY+cErV78aEPkO
	TwMag==
X-Google-Smtp-Source: AGHT+IHVG3r4Uu+zuIR03u49Iwxl/0eTqaxDgn3CGTQ4oe35TMVMonBapgBCZ6Q1fMZsjtVdFZeWmVaQQzEI/tN2yHo=
X-Received: by 2002:a05:6e02:184e:b0:425:e850:b2e3 with SMTP id
 e9e14a558f8ab-425e850b550mr90867905ab.32.1758892278381; Fri, 26 Sep 2025
 06:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
 <aNLTtcdGNJT8FuYk@strlen.de>
In-Reply-To: <aNLTtcdGNJT8FuYk@strlen.de>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 26 Sep 2025 15:10:42 +0200
X-Gm-Features: AS18NWA1FFFAlxO8IuotHHNvf40VDghzt0cpeBtQW_6ohV5KUpVB-mITYyIYGs4
Message-ID: <CABhP=ta4Rxf-TUa9YU2dAM5zgpkL7sqNHaTSAiHDR_5cXh1hTA@mail.gmail.com>
Subject: Re: Confirming conntrack behavior on environments with multiple
 network namespaces
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 19:07, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:

>
> > I was surprised to find that reading
> > /proc/sys/net/netfilter/nf_conntrack_count from the root namespace
> > (init_net) returns the global sum of all entries. Reading the same
> > file from inside a pod's namespace returns the per-namespace count.
>
> No, its always per namespace, even in init_net.

heh, my bad, I had a bug in the script I used for testing and this
makes more sense, thanks for clarifying

> Try not enabling conntrack in init_net.

> Or add 'notrack' rules in init_net for the netns originating traffic.
> Or create a netns, enable conntrack and then only create connections
> to addresses reachable via loopback. In all these cases init_net won't
> be affected by the net namespace.

It will be hard to disable conntrack in init_net, a lot of
functionality relies on NAT in kubernetes and is not owned by the same
component

>
> That will only monitor that namespace, I'm not aware of a global counter.
>

Can this be a feature request? having a global counter can easily
monitor the load factor of the system, but I'm not familiar with
kernel conventions and having some global counter may be discouraged
