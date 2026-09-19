Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6828690
	for <netfilter@vger.kernel.org>; Sat, 19 Sep 2026 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821767; cv=pass; b=dU/Zdr4II8pF5C0pkEtHylf3ObhK8Dw2riG4ErJlf/wEMKjOB3keirJ2bywyrHW3EKuJ05vwdIm7uUJAP5wUymYexqLIs3nXNS6Q8hq3uyjF+QMrAYWv5ecKC2X06QJKh1sbF52mxK9WjxlbxWqHRLZsBVhN1qmre93KPCwI3rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821767; c=relaxed/simple;
	bh=6vzwxT0JWAn5Y03jxzMrUE3WHiuTp5utBF3U79hE5D8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=u3aJaPN3+fTpW1IG+M9BTnAG/ubwfZXj8z4RSzi2CUnblHeANmNnRBPgTT4MRs4xB4/D3vqLzO/sO7VNZ9cFub4Dz7jcgfeJXzVyJWyRlQePYDJEEx2KsImEcqkQYbOsoyZnkXt76gn0XOajDH3AAOdvjqp+9Bna7n7JtUDUt7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrFVIc0q; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrFVIc0q"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe20aso19767596d6.2
        for <netfilter@vger.kernel.org>; Sat, 19 Sep 2026 05:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789821765; cv=none;
        d=google.com; s=arc-20260327;
        b=kBqzpQjIDvl7IQxGZ40PNGwb6sYDLjFTp3n8pegBMDm7EwqSuPwKU5f6UP9c1P1IE+
         2E+P/4kq0UXeP2FEtCLoTlnwR+O+O0yMS2YH0IMiDFQGF0w77LgeSd7uOdG5bsFcNHo1
         8fVIWVIBwGyjlI6J2f8JWCdUFtke4XFoDC5Zp9ymvWRU/bG2a5JjY+u/6/jmLoX6hjjz
         fCj2RriAq+2dFgVr+5Vjvzzdzs6+kE5WQY5OnvlY7deMimFKowvKWdTkUNtbNUoNYJde
         r0e46+/JBFWfkcUyzNjr/OXFZ7EBKQfMAIjf+/6EQuLmi5wAaguSM/9F5Pquqq/HJD3B
         O/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=l0i2fdM0Xjmpmf3RfWNPCeG6LMCA/HgSUi5iL0yo5WI=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=Meqau4Q+6KZ0e7xrBUQG7LLsivrNaF4N7PQksQkfGZ76ne8JGmHK+XIFcriVWhi8p3
         MEO4Cn6z/JRM91aD8AB//NOfWCESLQWCpxzTfpQ/+FJmk16sbVAQli6ZQbMLQ+DxJDrQ
         +mr1dXdJ2RvAcaMsTGoxD6Cg49GYJ5IA6FEvQFLbGuP7Z8SUtMvcDFEkJq2O3YjP8v0J
         cZhoZrwG0GkMx0vJqLuSBmJuzqVj8bymnPKLzPfi/MhVHtNENQGw2CoE5MspR7wziH2V
         +l5RDX6a7HopklW2qnQ8g31iuHLB6m1ne7L+3JO5qwsqd4GnpVBSRqXCq1WpVebJwH4s
         MzFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821765; x=1790426565; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l0i2fdM0Xjmpmf3RfWNPCeG6LMCA/HgSUi5iL0yo5WI=;
        b=RrFVIc0q4gruyCQL7cW0XYn/D3P6YIsVAzrP7zbvXKNr1noUEWSBuXbFmv9XJLYf/6
         je6pvk6uqevpwb5ewnrsNbHHRMwPkyB+qGhPEtRErLDlzRW9dxBoh3i0ZxFWXBGP6AQ4
         a6GZdCsYv+Kd0lSm/lv5hjrqQX7diTY8ju3QYP5/mJAdw1SBvhfravSJjS+3zVtCoT7A
         eyldh8wvddOeKa/Ur/SSxuHlwEnaExLADUChmTOw2sxkUnZtd1BRjwZxW/o4QjgdqXaT
         urocP4zc+je+HitF9Z7CulOI4vZdMlx1sMKJT6hIA/TlcL1+3iU1zYSbrk1vgP8HkBXp
         jMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821765; x=1790426565;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0i2fdM0Xjmpmf3RfWNPCeG6LMCA/HgSUi5iL0yo5WI=;
        b=bmto/1y31ckwX8qbyJjGojBu0SDs1RYDmvOnJr7TjuTgaug4/1Gv6/WG6kMiETrSX1
         zwrGE9tXcuW7dkGxYV4JNaEQaBB9SotfJBqOmX9FSnmjHh19/y4xY/oSDP7GRFgf5siy
         RCmFkih8CMJu4V5lcmQJDHtSJRofU/2o8BZHeyhYdDnfYSB1T8wR0t4ptkUCGy58f12e
         1v/azi6HUk3ya6dAG0Zq9KowPfyZwLP6vWlJTxOxXPLF2xeHPSEYZc2s1c38cxh1kwUS
         WXUk4KNgorrtIKITFqPt23xRX/Lk0QkhUEuImtiqwe6URAzgoxyF3OR1D511dT7/TFKa
         UDoQ==
X-Gm-Message-State: AFuF++ml4vtJmo3zQW44HQ82gYE+fPU3eGC5JogxC2RcPTJdI5HjqeIj
	v8EUhnPdAa9xoMYEKLDgiXx7wSVcg2EmSAwjNWrD1Avl+EEpIiw3lgoZRvcAg6dJBwV4k0gsHm0
	4xhSZpKlgADepfzZ1rv9dRjY+8TUQub37YvlqThE=
X-Gm-Gg: AYBFou13jdSjqoauVlRhMtDGSb+13gVJ0/J1XyD0C9iL7pyCJao4O6DIPm0mZPWqxHK
	051dh5iOIyKT2NfwWXGtb+s+L8REsc37FFYEAOU2aQA35DFpVx+/22F2Agh0nhhuXAK4vHlKdBb
	zKynlxguF03TWNggD1V5fPRgX3hkh8cK6eM4pedebskmT/OO+3XzIu8ooSoaBBfXFEjOOAMyw9X
	tT1KTYUmJz2FLZwEKt9PrzprA7c30AYkaf2gRhptMA/kZVyZDP7EPahMk6mbcNjQTpR+7Ly3SD0
	npBJs++M1mFtzOWy6NrILX/2TN6+jpmeVrVU/N31Cscqz3g3VlIMddFUDdqRDoIoyqrxm6IpAl/
	z1/NCS+GI/Q==
X-Received: by 2002:a05:6214:1d24:b0:912:5e6d:cfee with SMTP id
 6a1803df08f44-912a803ac59mr14315446d6.52.1789821765182; Sat, 19 Sep 2026
 05:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: js yu <junsang.yu3@gmail.com>
Date: Sat, 19 Sep 2026 21:42:34 +0900
X-Gm-Features: AcwNN1XWFOHgPNonJgA8SvlchBNXkxZeV_oknlQ-wTUIayEGCjUG8bWRuODQx-0
Message-ID: <CAGh5W5g+7LiEyR+bJ_aq=8mtRkgQuebkDMT1zq7TJ4j0xxY8DA@mail.gmail.com>
Subject: Question about security table priority in iptables-nft
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a question about the priority used for the security table
by the iptables-nft backend.

In iptables/nft.c (v1.8.13), the built-in security chains use:

.prio = 150, /* NF_IP_PRI_SECURITY */

However, NF_IP_PRI_SECURITY is defined as 50 in the kernel,
and iptables-legacy uses that value for its security table.

As far as I understand, this results in the following relative
ordering within the INPUT hook:

iptables-legacy:
    filter (0)
    security (50)
    nat INPUT (100)

iptables-nft:
    filter (0)
    nat INPUT (100)
    security (150)

Is my understanding correct?

If so, could someone explain why iptables-nft uses priority 150
for the security table instead of 50? Is there a historical or
implementation reason for this difference, or am I missing
something about how these priorities are applied?

Source:
https://git.netfilter.org/iptables/tree/iptables/nft.c?h=v1.8.13

Thanks.
