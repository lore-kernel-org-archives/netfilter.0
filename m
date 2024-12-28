Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06779F2
	for <netfilter@vger.kernel.org>; Sat, 28 Dec 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735377687; cv=none; b=UwT/sZTxTwNiiBHItyj3HJNjH8PMn0H2qqVD+nMgbp7+6jN1OiBUU+K/BpOK/g+573dOjroeqayneKnGmQqn4tYbdrwTUKifm7eJgEUUmofPyGtZ7CdkeIj+kV2BZ4eNscHnmNY7kEmpO1cxvThHP7sKJijwJc0Sq2HH5yl+hTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735377687; c=relaxed/simple;
	bh=fGEasHI6ynLJj17FlcR6NvSqa8kk2nSRuOYl374227c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjnhaDphyJqQjZ8DGUtU1pgy6sy5uGh04/kGfP1oi7a1+0CkRI3BrDdCXKj3WyDstaRtfhWNFtUY1h2O5SJkbWrsJ6smMq3StM4Br9wIO4xOGbWJs/vq8PSwu/G8D7qftcxFxKqJtqCct84ejvjVL8IVTfQ8OeRmoQwz68CC5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT9Rw5K6; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT9Rw5K6"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ab2f414695so28261155ab.0
        for <netfilter@vger.kernel.org>; Sat, 28 Dec 2024 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735377685; x=1735982485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7e0Zl2ENyQxlue5K5R/9/GC4TTXbxNKEhea+VNON+Rk=;
        b=YT9Rw5K6Ct1p0aCGPQClRrhoWCVtgHkKO9Eljdz8QsrqJnhC+trz/th9sFFl041mZY
         ztGZ1Sy62B+xyCgip7LxjhCQwGuHRZVtRXqmCbxKDAPBsMh+jj+VskjBZL5AcCkejGX/
         M1a0yNDlxBHsGoVgCz4GREy3LUxnB0eE04TMXa01VjoEufoCZpiMHfgfV0l7owR/Ybet
         71pd6pdQCKiGzpOjibLjGqJ8X5Cyw9q0kncOq0PY9Y3yOdVfXAKTAmlifFAQ/uoNEzFu
         mtamGUYRpgxwXI3slWxDY6OA9yFcotm2or2ohVNXLLmmcfvAsiCZr+aSyleYk+/oJkjN
         rSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735377685; x=1735982485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e0Zl2ENyQxlue5K5R/9/GC4TTXbxNKEhea+VNON+Rk=;
        b=nPxQthW4+zssbxY/5FQFkCVXTPggB7PxqVvSDMdVnixC/dIuCbw4ZgFsMTQvC/0RZt
         5LVfyAGn5C8Zub8k8l4Y6+FnoF+bOkCt1DIDWrvO7ObIHcs+Zj+NLb83DEqq5J32+Kd3
         Av6BmbJve/2uOE2mrn0rXeeVPq60q1o4gt4rXmr8JUuLFuimK/d5OTN6o8hurbvs7Vc8
         Wzp6tfmNyBmCAiIg0eDDdd/96ftbW6knq+fwlARozsZIhNdHihP/l37Nej/BLgrM4hFs
         Yhzq2wzWT63vmj0Fe+mEXMTKOEEekyY9EEfjWnMESWDMjK6F0h1O4X15ZjIPEnBKs4HJ
         EPUg==
X-Gm-Message-State: AOJu0YwGDsrQniFzni385hvc1Q1edKHRs4NQNDV8Q7lRSo5af099P/QR
	6g2l7O6IwhQZyAhvI6fuqJM9l0BjW3OaSpL7/ipoB6uFcb4xblIEJXq7cAPTB5Zi2wQ7pWtVVLC
	Pu7eGJwUlJUy7KPzJ64DhviPqPucwa0ETi7Q=
X-Gm-Gg: ASbGncsmkw+8NszP5UQoPt0O/A3jJYmVdZeVN8DrdFAItCej66gs6eSyzLXEuJgDTbU
	Rme1Kyxq4kELz/2+h43OpCvMRUks4eDGa+zp/
X-Google-Smtp-Source: AGHT+IFgEwZnxEyXcn5oCwrpD75yWkxM/T5W8JgLfLTN+Sb83r3V3kP5siPaDT+l4gKrGMmH4SozzQVqHMAcSVjjaSU=
X-Received: by 2002:a92:b745:0:b0:3a7:dee4:c423 with SMTP id
 e9e14a558f8ab-3c2d1f7505amr177603355ab.9.1735377684717; Sat, 28 Dec 2024
 01:21:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
 <20241223125151.GA7005@breakpoint.cc> <CABhP=tbjB4H1NXxC+_xJFM0pGby3YX_V9PP-XqLVMr3xZUpQwg@mail.gmail.com>
 <CABhP=tbWy7tQh1XKGAsQqQ5LzaUbrwz7iGvFaK_iEpP9LMH0kQ@mail.gmail.com> <20241223161505.GA12569@breakpoint.cc>
In-Reply-To: <20241223161505.GA12569@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Sat, 28 Dec 2024 10:20:48 +0100
Message-ID: <CABhP=tZ36BjQfyQigNMddOrMT8htjgq_7j4LBF-n1SCFXBJQqw@mail.gmail.com>
Subject: Re: nftables portmap map
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Dec 2024 at 17:15, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > l4proto . th dport map @hostport-map-v6
> > Error: transport protocol mapping is only valid after transport protocol match
> > add rule inet cni-kindnet prerouting dnat ip6 to ip6 daddr . meta
> > l4proto . th dport map @hostport-map-v6
> >                                      ~~~~
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Looks like a bug, fixed in nft 1.1.1

Perfect, in the meantime and for reference I solved it using a map per protocol

        map hostport-map-v6-tcp {
                type ipv6_addr . inet_service : ipv6_addr . inet_service
                flags interval
        }

        chain prerouting {
                type nat hook prerouting priority dstnat; policy accept;
                dnat ip6 to ip6 daddr . tcp dport map @hostport-map-v6-tcp
        }

Thanks for the help
