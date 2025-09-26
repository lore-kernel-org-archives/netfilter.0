Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D872605
	for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897710; cv=none; b=A/pU4KZ2A2DXBvRJFkdMX1BPjb73nLrqGy3fzaK85Swapxiw00ipQcrb9U8m5SOYRIaP+t+ZWB/Yd50HEZ3CvQv/xAmZGzHImO4yZPV7iQk3jxH7fHxZSSHQYBcp90V7z7MiduX8zQ9rpkjZGV1sVVudYfS52uKSlqxruFBSCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897710; c=relaxed/simple;
	bh=bX2WN925zAaWbFnoG36Br0Mt30woX2tVGdXp+rTrVzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXj8WRPKwjikqYG6iiBM5F/o6q1kkc+zcr1uH984FCwpxZhsHqrQkOtor9kBIb3t15sUOhVPnUOAoq36YMs1n80PAyCwqINtPL7OG0XjU9kF9uOeJ70x59q31bpPuTpMWwrQThF8xyaxY33qW6T9uWj3HAJjviffawr8dKati1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgS8Z9DK; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgS8Z9DK"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-42571642aa7so11817005ab.0
        for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758897707; x=1759502507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulqYzvio+JQZMQc0sycZIvS//bV21qZTa6zExSyRX3A=;
        b=BgS8Z9DKIF7fupu25Y+PBmolFVL2YLS5FowEg1MAbe4Vh24qDeX1hEJwh+8Hv6EeIY
         QweVtpyN8dY4/b37yJuvCdQfw+LMNGXfTkgP6vxJ9Bu509rewfA1MAGZwH4O7k09/bo5
         hGK04YQQrWyu6+XqxN+KJlTKZoRzaaQoluHQydTbi4Ksr9gFm3J1srI0mnRAXdUhrZ0O
         3AeMwc61Uf7X10deB8Ogi/7vDZ61nP2xp4lCj/ooFpp/I5EGhfRbg6uCT9FfSryZw826
         n5BGDu1z+5tHApRFqaQe0AwJeqHSm9UqM41TDgoh6XgNi5WwmBwikx3q+BwGWBDMdGGm
         XXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897707; x=1759502507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulqYzvio+JQZMQc0sycZIvS//bV21qZTa6zExSyRX3A=;
        b=OVlDzwe3zvH44iTo4+Y0QQpvviYYy9K40Ge3TLNUXaWjXKXmtjS3ei1GaTQWqfPz0u
         3oRi7h1xDvPkg6nb7kjsQA/nvcaVMDdUmHsO+xVZ04uGExXfDygVeqxsZ6eujL0Acjwd
         wzjjqNTm7dr4CO3siwdWLF1nG4vRTMIILZBS3dZlBvJgXkGgI3Kfe1WZRJ8++BWKNOnD
         H+Y2+HrmpcI3jYwLhh3xvkj0ye7sbpSJrAdn7BPGk+CTW7BuB5bNZx69duLi4Kl1lXCX
         LJ240glYfxmbhafxjrVLqQyYc6A2vqd20bSV9fbMjAzd7ObjqoVbSSWrtwNmu+UTTWm6
         /MIQ==
X-Gm-Message-State: AOJu0Ywe020X+MvbvRz8hYM2ZEJTP05oNHqJxhmOD5o8MsmUQMXULB2f
	pNxGFQFtmbzPp2qUp6vqj6aZC/kKnSGO/RyQAQFZKQwM2IyMj9dgYdJMDF6S3NOGgYHIZVIrnTO
	eThb+XpysrOGqrRhKMDklEPH406dBaPW7jG1zYE0=
X-Gm-Gg: ASbGnctuPXMTLUSGm+rsIECN662TxjJUcj878UxUvKIbvSKkEqDKTKFRR8NZDMt+NW3
	Vyd1XJt0gCrAiEeBtGq3Df7dI5duHiCLXkj3ctTOP0K//gT31sDd4JwYvmQP6fsXipgNfMggd0R
	HsUIKJ5E8G+wyQw9t7dlVJhpvjV8Y+UPDszKRKDDcXfvnAY5SEu9mHswL802s7CPJj12h2Kehaw
	KSFIw==
X-Google-Smtp-Source: AGHT+IHBdX241/KSPagxHIUKpWxSbXOYp/gfcuMtpw6wdxJx71Q0qR+XxtUq54c6AG40UDl2z4CickuRwR02+ZaTKRE=
X-Received: by 2002:a92:c262:0:b0:427:14d:8a0e with SMTP id
 e9e14a558f8ab-427014d8a52mr54408505ab.25.1758897707178; Fri, 26 Sep 2025
 07:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
 <aNLTtcdGNJT8FuYk@strlen.de> <CABhP=ta4Rxf-TUa9YU2dAM5zgpkL7sqNHaTSAiHDR_5cXh1hTA@mail.gmail.com>
 <aNadJ2EiPn6pMQ1E@strlen.de>
In-Reply-To: <aNadJ2EiPn6pMQ1E@strlen.de>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 26 Sep 2025 16:41:10 +0200
X-Gm-Features: AS18NWAtpTBiDFpxRhL51R8xEpeD6WN0nHA7Xw4LB_6AzIdDXWnqQYVwi8a9tNY
Message-ID: <CABhP=tY2LnPsYk9uiF4xp4SthASYAaQ6mBWDjqy1OmOom4PK9A@mail.gmail.com>
Subject: Re: Confirming conntrack behavior on environments with multiple
 network namespaces
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 16:03, Florian Westphal <fw@strlen.de> wrote:

> Not sure we should add one, it will result in some overhead for no good
> reason.  Maybe /proc/slabinfo is enough for your use case?
>
> nf_conntrack has its own (global) memory pool, it should provide a
> reasonably good estimate across all netns.

interesting, just to confirm, can I approximate the load factor using
active_objects / buckets, with

active_objects=$(sudo awk '$1 == "nf_conntrack" {print $2}' /proc/slabinfo)
buckets=$(cat /proc/sys/net/netfilter/nf_conntrack_buckets)

that sounds really good
