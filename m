Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212E22541C
	for <netfilter@vger.kernel.org>; Wed, 15 Apr 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249060; cv=pass; b=h1JR5DDxKloHp6564C+kMfpE4ACZJeAali3r428NJT0chXH1ClxYRIRxjz7v63u8MPhrq2FMNgxZcoC7KGou494tToXneE/SgRlZHx8GbVqHmB12lGLTc2TtVtcMSjyAj0Xr/jrMfCUSztywtADS2TEIeXrFXABb1rur08HIoJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249060; c=relaxed/simple;
	bh=cI/WBYrX3NJd2HEsGt3MkDSXmmWNJOsMQsP1LL1x0MM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=obSH+MluBnXIPp2lOUMskDmxs07WrbUrCgmMBTYJ8Hqtaop+e0cuNBGsC3Va6ygIwfYfa8A9tTEQLrnTnghcEMe1xc4+/iX26YNAud0KqC4VKeLXXmkOiLetVFVn6eEG/S4RYEH6W3ddE5Csik/Ebhc//s+YQs2o4OjSPyFmG00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muWfr33t; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muWfr33t"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6714f678bdaso5679563a12.3
        for <netfilter@vger.kernel.org>; Wed, 15 Apr 2026 03:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776249056; cv=none;
        d=google.com; s=arc-20240605;
        b=Ld7ikI7xO9Gv44e7YVGomxXYUGyx1VMsACVxJrNmEPBKp7DJRZMKu831z9eJaUfG/Y
         zlZwi2XbJoefbrQANu04qWEV2ioTp12oqKggeKYFg4GMV/I/34kxXbIKRfAHrUucQFIK
         y/Ux2O3Mk3He8XC2rSh4KQt0BHf7JRcpHlkRZkxsT709QTvIIqB7gt1fP/DPFSEiilbu
         h8sp7SjU8OvqWmQC5iJbLLGmfPiMCI5xHkVWxSQwdhJiJGMSnWr5WrokyMijy6yUNteO
         C/xIg/mgp3Aq3Bxc2XnIxip6svOSZDElvycOu0dmxYXYMpft4xE57Z2Pc61x/Keni4vl
         CLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cI/WBYrX3NJd2HEsGt3MkDSXmmWNJOsMQsP1LL1x0MM=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=ASe7/BYsOuhz/ePyjlTQmvzuC2RsOQdN7Zx3LIsiVa1CMtrplEXfLkI2r8H21/iCld
         ZLs561dBo3H3GKDUjhGMpZxyK88o8D8zOrxv71Krj+biL01PWzWT/EKIlNhxNhYjtpSw
         mALq+f4LwJrOilmwmq01VS5BdRnI4Et89UYSg6017ohMKHqBYPnCuIMl6+nOUMSCFI6T
         13LsxaRemDAm23a905tfUrGmAnp/jlLv2zY6eqq7BmhiLr0Py/kH/ZlZP1H/v20N637w
         407YpBW9IDWR54lQlD7zMf7lqpoxa3b62sF6IUrt6VYr9r4nSmjXB6KJeCvNsNkm2zom
         7LVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776249056; x=1776853856; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cI/WBYrX3NJd2HEsGt3MkDSXmmWNJOsMQsP1LL1x0MM=;
        b=muWfr33tTHw+F7XpmWrO6rh6/81z245YZMN7ny8ujNGzk9OE0HJixlhxnhTY2o0xGX
         kYtZtTeXnIRLpYlkAMV7cv2IdwVbTVhkAPhyW7o4PB1xuHBuiEHfrT0Rbg7oNT+V2S3V
         UYa2e9TRyjJGNBiq4dAwbDYttfyctwLvBCO/GJmm/PWLlbQNIey3AgTb5X9Pon9TkL06
         oRYVQTBvVnsymfZOKKPgZ48RddIigEyo3VIfiJZAMy6lf2fWTstdtctmylrKbAECx9/Z
         lA0b1xxJClnDiac8w5Oqq3xkdGq+9QWfsppPOwtNxz19gV2OG2v3tf7/M8T3TfxpKpsq
         7I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776249056; x=1776853856;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cI/WBYrX3NJd2HEsGt3MkDSXmmWNJOsMQsP1LL1x0MM=;
        b=WDN7NhgUqYBAE4WXHeEu05jBPUWuv3+k0IYxx7Mh4Jpo3caujMYLXu8yXnjJ4aXfB+
         KLjnkp0Xq5zEsfors1VRATHPyFrdd+qym1k6FHd4ZovYSjWi+drK4BMdQtAOkhjmkibG
         6hlpzskBU9eR4CbY56CgNSFRmJYdnv/VQ3s2guPYAHooCh7ab7qXMw4TJGHICM2/DXu9
         dycgBaqore2XNQubmKBPuUJ9xdWKV5v1rBZZgf9qgo9I+4jAgYikghI/nP3NovTKGvYC
         /DQCsOpvjpYtJGa6m2qBnnLnBvk/rypBtwE61lkeqSnt21DUvxfaZjhno/SW6VgAVQYU
         zhBA==
X-Gm-Message-State: AOJu0YyftQ9IC8CdPVHQlICFe91dQ2fe75bB2cMwVaedYn7hycdOSOu/
	/f4NmmZ67MHeapUdqBerM6ccfSsfR8br7OZS0GqEQA9M1JEVa4Ctd4zsyweVK6lal+/9HuxV1PR
	v9kXcwpo33meupeZIOdZKJCrNjJBr42Ggpw==
X-Gm-Gg: AeBDiesy0wZU29WajzqdBLv3/SVlsbsa15oxfNyeWkdMS4a/9MBF1BPWYF0CwnNpK71
	495pMo1ntJ4rEY40yus1sRLIqReKtT6L/gBiUJIF3BIzzzEtZ9vpsl2zlVBVukZzB8cQXvt93pE
	g/3hG/xdvccMdVAvKq6hqrP8MJJy3ucMdoYKIFz+AOraNGjeFcWkvyBhWE4hk/mOfNhYA/cvK5k
	ofZnqS5uHhjhDINX47Y9vrt6xkl8Z1Jwv9vZoGe7fLuUGXSxgxvDvlIrG3ONH8vG6ZHfr6V2Zfy
	ganAMUEKzDYSHWYBU/o=
X-Received: by 2002:a17:907:d06:b0:b87:965:9079 with SMTP id
 a640c23a62f3a-b9d7243e6f5mr1072958866b.3.1776249056097; Wed, 15 Apr 2026
 03:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Subham Pal <subhampal789@gmail.com>
Date: Wed, 15 Apr 2026 16:00:43 +0530
X-Gm-Features: AQROBzCJ2Rh8ArcQ4fO5xZub1ncNHmUivtg4zHZix5gVnvWIFabqhS_VKbSwJsw
Message-ID: <CAHeizqEmito55KBs=J0Mymi6nd12D-9aVw7+1+UY-LDYWEMqQA@mail.gmail.com>
Subject: Renaming nft sets & maps
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

IPset gives an option of renaming sets. Is there any similar facility
to do that in nft with sets and maps?

I couldn't manage to find any.
