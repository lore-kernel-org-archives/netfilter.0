Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938936EAA6
	for <netfilter@vger.kernel.org>; Tue, 24 Feb 2026 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930465; cv=pass; b=pwPaXtHwWDnzPIrGYQPhDAwdBdoNLbyh+TepIRAU4TY/NVkJqNIuIn/253ci6gaxDSz6qbgWEgDGfrbtkEcD4UiKJz75DMJpcRWVExI3xhU3MHcId63apHLVW01Cbcchs5yN841VO2lMm8Lqhn/o593n2HJQhjYXw7iSbDlnyOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930465; c=relaxed/simple;
	bh=SHsMC5+wtSrq7AhdH5MF69hrReaZkgSMx7hpDiPPtfo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=i5wdMhXxDL6C2Cxfki1s7Ka+EVmzhRlAWH8Jf5IDLFns+WWDvyw7wGfOJoigBARv1oQwj8byjOrOdK90pkrOpgS+YzYgnS29N5gTM+P0GonlyYzOF4WFe9NgyL76rYl1BpS0Vaj10CPJsoLMgVa7TVm74xHKDbOHbxZCv9Wczyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8E46mbK; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8E46mbK"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65807298140so7984351a12.2
        for <netfilter@vger.kernel.org>; Tue, 24 Feb 2026 02:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771930462; cv=none;
        d=google.com; s=arc-20240605;
        b=Ykm0IybqqY6VPykOgOv66pc05MXuzQ/TFaZlduYRScQim025JXxumCJvO2ImkFkPe6
         cC41db+vLZ1BGmOowpSXdmCRv8muPcxE8JclAx0o6ADJGW/wqbYHTYbM5vDcvgFBjPzZ
         A+zAvF1KawTeOCIM+cOpW4o+QKOUOprP+dh7pQnAB8gTdRWiibKhLh5cQ1UHCcXnEDtf
         7qDG+fIyxIHnOLxLqQ1rUW0QhGnGiTAFajy34bIiky9h3fDpL6mBbHrz3Bbo6BMkK6Is
         ZNsUBVvXRSOjBqdMTvaduWk5Bf0hh94jvsrHAN6GlHUadOnSnfZVsU+X6W9gmOXXzvvp
         5K9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SHsMC5+wtSrq7AhdH5MF69hrReaZkgSMx7hpDiPPtfo=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=fBrelxbhn0lmyxbLg5TjfhCFROq/z922v/Ia4ya1GtSM9QpmNBtNhaVNLrZV+JLf0i
         KNCI9BJXGhiAB+zn3d2sRhbPsmoNi6ONINMSIOo+4+fZ7G7MjWGen8vTu46VZNjFRQYE
         uLkGIlKPHpwNG8z6RgZNK9XWIJjyiQ5AYrpc9QWs8tFP+ErpOR+T5A94jwSrDZA+dhUn
         eNQzQ+7N1sD6gL32Aqqn8BL65WMrmtQgn8Nnbu5UX83IlANCEbp0NBmcTZJRiIojZlSh
         9hEwnSoYnP7N+6yK+AI1roucRuZXb3vD7BPPhcQldBBmm/y6jG6awCKOCU3sd2mLWiEY
         0pQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771930462; x=1772535262; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHsMC5+wtSrq7AhdH5MF69hrReaZkgSMx7hpDiPPtfo=;
        b=i8E46mbKBQl/EeiS3y6YJQCqowC7eWxZL3iSQJnam2HE3xYaP4r4l1HojPg95RP36+
         G4/fBRQeO1OBRQst118D3XVb/4G+sAlq4F0ugPIv3v+ixl96+6bH97IkD83m/ilggQH/
         vHcKTQWElwExcB4CORNv1io/rdbZDfAgR9+zzwoUarKaERTzJCXkpDTAhdTXB1iS8Fn7
         v53Zp+jXJi/QEBkRA5H/WQOPFT3ImNIc/QowKsdH8yhMKMzThl+nk3orHd+wenIGmb9C
         2685aTVOvKEEv830WGLUoGsBj8msB5MhIQmtjs+vwv4k4GqFrqyLy08iV/4TYNhJkTL7
         49Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930462; x=1772535262;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHsMC5+wtSrq7AhdH5MF69hrReaZkgSMx7hpDiPPtfo=;
        b=fvuBDLbJcVLLsfPOJ20LtkIkQLd4aRYHea0JKHyDmvXAxvGlYdcUERgOjqCkDTU+h9
         XD0UkneuPJeokwksrfoNOUOw9nPeVrXp7oZKaXTHs2LFFNIwKbMcCIyJ1kL7/BTom46L
         hfWiO4qtZUhu+EX5dVzXZ5x3jOCvhFxCH4fHl8An7ytiuODdPbOjo3ExEJJ2wd0e3bjE
         ritTFNmR22SPhEuvmDC5IkhWZxi0pKNsHscUHb0eTNFtNP0EQwbU3eYM14tlHnueSh1a
         PMsnq2BDYRSU/CPA9ioPIZ+gEbidl1v62XaR6+E9Vfvtbmp34wNaEq+zM4pqodJxYBAN
         2hFw==
X-Gm-Message-State: AOJu0YweFfMK5uh200yO8vGWmqMYdz4JVmDrSq4CkSxoMcuzsYL0A6wk
	s0uXbqbrzLHTt/pqpcxSH6Nk5j3vpnpQTNzB96OK/A2Fde3OXLGauTRWN/7nxAY9wW+4vt16glB
	lhh7dekUNlR+NTSqNVswemkNp4rnWkwKgsXs69FI=
X-Gm-Gg: ATEYQzyygl1nKGfgKJvAhM9IADufjUv+MbRhs1E4JA2hL3oz9uvROVINmLAp+ygECOy
	J1jwV4WUDSHehYSvqXe91mdnBXNJdf354+BIjhbPG5tXRQc1FpMyQhSqqTPcXfjGakmjOAaaP1Z
	bfVecJ4PObiReLts4eeAD14R0aMk9PROdhFNk8NXNH9OPZV+Jwp23Ek3mcTL1xBrkUJb7Atb7f5
	a0Fc5v9x7noUIl4oJ9eXQQlCu8c9xLyUEAlGSxMNSNwLapzffXpEVgwfkwcDm1SQ94dkGbhiSo2
	lzU7yKVo
X-Received: by 2002:a17:907:7fa3:b0:b86:edb9:c01b with SMTP id
 a640c23a62f3a-b90819713bamr598850466b.8.1771930461706; Tue, 24 Feb 2026
 02:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Subham Pal <subhampal789@gmail.com>
Date: Tue, 24 Feb 2026 16:24:10 +0530
X-Gm-Features: AaiRm50dXF2ZXjndIV4F_f2hFwm30SDLD1DE_BccA5mvEi0z0LhnvKLbchvPtDQ
Message-ID: <CAHeizqEqDQYVs6mBOC4GPhBT6h9ikfkhYD455jUDXvjfQQ-ZRA@mail.gmail.com>
Subject: Atomic ruleset update through libnftables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am writing a firewall program and intending to configure nftables
using libnftables userspace library. The plan is to use
nft_run_cmd_from_buffer function call, passing JSOn input to its
buffer.

If I provide a set of rule updates to this function, will they be
applied atomically? The manpage does not seem to elaborate on this.
