Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905350;
	b=Gf3IlrmuQWRCH6F8wG1lU3S5pyATQsRpveZW1OO56zQ5uTtxQMbDrgcjU0JY58+gqxoC
	 lq/HHOxpVdTXsisLsJBeCJflR1ik0qBY0o+SNtLPp315KykzD1M1DaMx+P3FRcONZSmfK
	 qa+Os9C8H5Y7R/2mmCfKuhg0Eai6pTvsuzRI9sk3akQu8BMOh85m/RehM9+PWez3D26z5
	 GlMAr1sj53McwKNrCeVdBPLUogzJiTl4PhcJdfJvHy2j7LHcJwmA6y2mpOLfSn6pnNmQd
	 Fe33uSQ8bEAbvuXVTeYg2gCm5/9A3fQqbeGlgNNqcewHNVGD3C1u8VQdYzgjNlFn1Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=BgOO5T6pHFDLo2wvigOCIms1+9n3OHWT0+hK6c+s+qs=;
	b=na1VuLv64WYNyNRg6dsTaCy533hcvvyNbhLNOvtsYw1DKw1KtytR+Padpi1QcDCLIeJ9
	 MZITczlnXBhBI9J/NK93kd4gpcjlQDymbWq69N4gBVDpWpwiYOOa16BDwk+c5sXAkBDIS
	 cpAeeM0RwN5tKYJlf9r++szA/76FpeuWTMDffry3+xA9ri8lLUueO93ll3RaTA6ExgpfI
	 SsWi7ejaq5MzUHektLGH16h4FKd09ba+2gaXW3sXd/mOjEWa7peqIC3fMBCCGY/JEYxVC
	 zelrsUnAu7KBt4AsV8bRwUoeQwLu30ZqGZ8lyatE3Q6+xzO+1o3UP+Tpo0tYa2AdCQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4XgmLxr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD67606A32C
	for <netfilter@vger.kernel.org>; Thu,  5 Nov 2026 19:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD67606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4XgmLxr
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so7410075ad.1
        for <netfilter@vger.kernel.org>; Thu, 05 Nov 2026 11:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793905349; cv=none;
        d=google.com; s=arc-20260327;
        b=YyJXZtiXJKMC+gauyL4yy9Q8UMLgqqFMyn+5x49k6TwWwjYOLg8lZ/W2Uh+pDoobhz
         vQNo9cWauWEH5lU3QQtbqrIyRZaDG/HjnF8Eb8mKzL7hzvlEgxeKGJP5bF6yQbQu+iuC
         yUoAURCRJonXGaRHyESnDYSt9QDL+8JLFZuxuABDOS1JPMmYFLbiJDl6K56LVcW92NmA
         GloL1UdXQlBH3FPwG4/VcSf4hm2oIfpA0ZRN1rOynODt7HoPJB5A0ilPXBx9GApsEF4P
         8Q9OOwRZ+De0clfC+FS5I031PsqRq+RA4Q52W+lCM/Bhfb39mXqck6uL3gJg3a0CBxfX
         M01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=BgOO5T6pHFDLo2wvigOCIms1+9n3OHWT0+hK6c+s+qs=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=VMuLCi0cCbppn+nWJvlyk5HDd6hFXUWh5KSwPVw/RtUpuBKiiG6cKvKgCRMvexaPGB
         uSV7RAGwdraEo1RWaZ8vfWZIxMfable6JLFRQq+71Ocdv50mI0xyLvX2gsiQ7psBVe0N
         C0X38DkNk2D8swQZuG3b+zOwIoNvc4ISwAImvvsGqjdSXTCJfXsBlSFQMe3MU2gz2S+7
         CQC/MPA87xXrWGgtGhbOwT6KjM9G3gypInKUCpVbjzNXwUHnJYH1y8C2fenjDTP135xq
         Iw8QP8Wcg1DKbNttKblvUgMMJfTHLLE966AcThnJQqexWJyQ8lh1LeTqVlfgzCjM2r6X
         CsbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793905349; x=1794510149; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BgOO5T6pHFDLo2wvigOCIms1+9n3OHWT0+hK6c+s+qs=;
        b=Y4XgmLxrMdS+uYVYp9qXky5sjp1BTNMbo4zl8hMLkDSadF1xagx9rWwRYb2lFlVTpo
         TgWwo9z2OLzxZIuPJ5S8MdlbEbJwJBZnY5NvPVoCuxqHCCwlFfIyUD2YSfSU2bIC/3TV
         AecAP6VF4zI3SnZfoaG56lQHbGTu3/gzwLoYNuSyzBwmudTH6IZXqYabnFXBNetSyS7u
         aGZWchyhNJlkdU6FH0rOg1bnmVcEkTTWK5IfhBL/i0KaSnX1i2w9caY7thplZH0DLUrM
         Umhm5rHw78gOcMrGLptuVX3URdsLv4pMP+fitlIoas8g8pGiOtF+ZcbfR3q3dQuC5TnN
         AzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905349; x=1794510149;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BgOO5T6pHFDLo2wvigOCIms1+9n3OHWT0+hK6c+s+qs=;
        b=VQubeui80w4c4bCvpPBMs+sA9W5qh0vEBMkAsKHHkOtul3taj78OwZED3CocFOcuAI
         xb1BG7prkLBZ17PI0pTndJ32M0VSNZejtNl5ULDBLd/nk78YCkq+fYHH660QZcVECk5f
         28twEAed9/NVZauVAHKGhW3DMi1XF/pFjsS6eprZbWu8A68hItCwgUWSb/qIQcqaN1o2
         +vkilRq17dZ27tk2DoWNq12Z1Z6QqPAquhx8RQSt6W3H39KGnXsQtJ/Lg+goaeCW+HgL
         /kS8iqMTmtuILqPZ0O2m3LQ2j9MLtfOz7WB3xl/m9BTAvd6aRIYsRAXRG6edXmKH4YIu
         PC1g==
X-Gm-Message-State: APuU4Z+EXluzU9duSJzKouIozCEDZkLxZ6LqQKNlBu47tGYH87a9oIbP
	XYcTK8kzZ1x4KpEp+h/82NBBvdve/WvrzBQgP8G5HV85UD++hp3h01MI6gIiNj2SkjUrEB8nnvx
	QKxdSShsB1IH2mBA+eHGrtVkhX9M+CZ1TI4m8h9c=
X-Gm-Gg: AYBFou0fPU0ggVBJ8c/XiAwjD7oQ+iADGtxtRAmmi7ZJUyTZfhf1kr107oF3n0mgNpm
	IqTGU7x6GvjjaAoEm9/YyphVPqw3Fe8LtkNgwdr5E7hUI6tXKztBmSNFg/enoij+zRkB5IFoqjk
	EwgZuFuX0u76zgETjEbo7NoPxqB/IdCfhYPp5XC+yYBQRjJfltjeabdd0R6Jh8yorJBIk2js+nK
	YNbfXTajbIKI4Vk37YJt3iEHyrZ3ykzj2cR6VoXIai6EdPiiHETxn+DC53LsReftVas4j4uuVhf
	UEJwdpuqNv1bLtn4ep18dRGNDScwbMKjIwWXNRmIjcnm6mMengaSludsyHmPDrQnJ63idU7GP8S
	0WxEgH9XWaBF4E5ScK3gYzDXLmBo0YCQ4sXybYhY=
X-Received: by 2002:a17:902:ce83:b0:2db:733c:fd1f with SMTP id
 d9443c01a7336-2ed405ee4d2mr5310005ad.8.1793905348738; Thu, 05 Nov 2026
 11:02:28 -0800 (PST)
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: allfoxwy@gmail.com
From: allfox wy <allfoxwy@gmail.com>
Date: Fri, 6 Nov 2026 03:02:15 +0800
X-Gm-Features: AclHuK9cJujSeQrJe9OEHaLA7FPAAorSAQE261-7Kz99lD1cksQdYdQc-AE9mnI
Message-ID: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
Subject: [regression] Completely editing packet should be allowed.
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Greetings netfilter people.

I have a homebrew cipher program using libnetfilter_queue, which would
intercept certain IP in IP packets via iptables' NFQUEUE target, edit
them ( completely ) then put them back to OS for further processing.

Received packets would be redirected via RAW table ( which would
happen before CONNTRACK ) , while sending packets would be redirected
via MANGLE table POSTROUTING chain ( they are leaving the host, no
longer need to be CONTRACKed ).

The edit is to transform the entire inner packet with a cipher. By
entire, I mean including the inner header hidden and the original
length would change.
The receiving host would decipher it back to normal IP in IP packet in
RAW table.

This would form a transparent tunnel and had worked for years.

However recently I tried to switch from Linux 6.18 LTS to 7.4-rc1 ( in
favour of tcp_roccet ), my homebrew stopped working.
There is no error message anywhere, all libnetfilter_queue functions
return success, I could see the packet, I could edit it, I could send
the verdict. Just after my edit, the packet would fade into void
somehow. Like the host never had it.

So I did a bisect, it comes to
112e447d17f78d08485b3076a8baa1dfb9794bd8 is the first bad commit:
- netfilter: validate L4 headers after userspace packet writes.

I don't really get the idea of the situation here:
- Freestyle packet via libnetfilter_queue is no longer supported?
- What is the rule of validation? What can be edited and what can't be touched?

I still feel making a cipher should be a valid use case for
libnetfilter_queue. ( Which would replace the entire inner packet of
IP in IP encapsulation, so any validation on the inner content would
fail )
The whole point of libnetfilter_queue is giving userspace a way to
inspect/edit the packet. When all function calls success and the
userspace say "verdict, allow" then the system silently dropping the
packet into void does not sound very logical to me.

So that
- I vote for reverting 112e447d . As in my view, it would kill a valid
use case of libnetfilter_queue and NFQUEUE target.
- If it would stay, please consider adding an obvious message into
https://git.netfilter.org/libnetfilter_queue/tree/examples/nf-queue.c
, which would early warning the user that implementing a cipher or any
attempt to completely editing the packet via this library is blocked
by kernel policy. Before someone actually try it.

Thank you for taking a look. Please let me know if any further details
would be helpful.

Yue Wu
