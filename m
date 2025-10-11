Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E941C5D7D
	for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760177380; cv=none; b=JdGaMh/v2vxIyLRuCwdsA9BwMHDyz+0mxJoVgqDieXh0lqiyrodgbDD7QsVqKjFJDZMS3TK5Fn++nXL7e5GsIzukfnLg1bZsDDFnqqovVY9EWAxy8jGogy63arNYxzkbvSowy4p9kXPtIuHb9OXe5rTXA1o6HQyJf1LGUCbmR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760177380; c=relaxed/simple;
	bh=k//kyIXExDnlqRFw0nMAOwW+TouL3Ntwk9Ys8MOMUpI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iUXyZ9FZMQD624k9cHXNV52KiUQuwyz9YsGuwJiqrJiL0XS9O81kSJgPBu9qFPVhe/If5qY9tiSrLc3Vmi5ptMNobtIu4cESnBdb2cSpPpZ5Eyjb1TnI1BcY9h5aTNGpT9HlT3BhNUUd0e2f6wbG1ncKRbhKgPxqQcUSjtiynnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI0NSE22; arc=none smtp.client-ip=209.85.167.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI0NSE22"
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-43f9cc65f66so1528090b6e.2
        for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760177374; x=1760782174; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k//kyIXExDnlqRFw0nMAOwW+TouL3Ntwk9Ys8MOMUpI=;
        b=KI0NSE22/KHt54fiwCS0ptPfpEPSuFPNXCXBUQT1aXaGeCOATpnExC5bd9nBCCm4zg
         g9O638faOpNp4rOkcscp5nDN0t9cWXk1T2hf2hxEbr2dFxMaudKYMLK8TvRgPAdzNZ1A
         FMgSCwCx1EgyKMTg99B2NjGvba6NyYj+zpWVCnRagnNM/ULKfQoGqSWcz6jW+Tf104lK
         BuRvoumAeR62JKzo+D858VKLGxFrH8eyG8Ms+GTRiAINEjfCpEGqiivy86T0cDANvmdN
         +h9l37/LhugddpIRN9qlIzoBI7FQIwLl/wDOEW9MzCkOB61FCTgWPT3GdW9vRn0L6M+j
         h6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760177374; x=1760782174;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k//kyIXExDnlqRFw0nMAOwW+TouL3Ntwk9Ys8MOMUpI=;
        b=hwzXjdBbGMRgX0xUVENyN/CJA/zxOoVqe7AeUA7GLOy8EBE+rqUshR5wVSWsg1eMEt
         yUxVn+HwkMiELPa1T4IWHtIvtNHGPd+DBkx9SNNOm2+EaNUynpW6ZMIAHFSXZO9pI/zc
         jPsxln2ydimqwxIR8aPcld8hdMdLjkhVfuzDjCp4QfJuZkhdZnPAypLZtuVyz0XIftsh
         kZ2f7BvF1zZnMkd0rK2EDcF8GUdipvi2l9jCD5x1S9tCMByGwanrACazOdvaG95J2kBv
         9xCFoaA5iKksaRAEYTCxIwJpFRDhr5UWVEiv9q7kPLQxYQUBay/w8hBJd9Caxaa3T8+f
         nlmA==
X-Gm-Message-State: AOJu0YwgZ4BaNs7I7MRTfOLcy+g8PK7SujFHFY3uT4cXj65Q0soO9jj0
	KS4PA3x1AlyY/f1LeRXgHMA6Yi4CNvad0zlLsPOvpE7K3pI0oNiXeBa5D2DTZysPaJiMfYQjBlC
	jyF52O7zHiBkb1Soxx/1wCGqXSbVlYiW3TpWFoS0/wq+u
X-Gm-Gg: ASbGncun15yDZSXI4RODPGdsEpNIvH2Am85Yroq1iOuDNGkhD3NpUgbkHvxil1ithtN
	0G3pgCFcL0Dyz7xnOIa7FfRsijJTkTwjdGKw363VSPymF3Mgkxhiv5DDxV/9dYXfhC/FBhf/pGG
	peMp0Ue+r3JUSSA6z5CwGczkYWHQoYybRt2ok6cA7bQzx5K1Evaz6MEACqUDH3gfT63980DgGH+
	5ZQTFQYOb23o2QRQaoISNmBD9zbI31KzuOPtQQ=
X-Google-Smtp-Source: AGHT+IEHsXBZnmnovdeIMgykbpsR/MF117sR7BxvKg21Br+5ohSkqBm2MtSRGuyeF05mYDzWOdu0Gdwj/k69bAeVllc=
X-Received: by 2002:a05:6808:3c47:b0:441:8f74:f1c with SMTP id
 5614622812f47-4418f741d6dmr4000859b6e.54.1760177374121; Sat, 11 Oct 2025
 03:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Cyrus <cyrusrereza@gmail.com>
Date: Sat, 11 Oct 2025 12:09:22 +0200
X-Gm-Features: AS18NWBtO1bLRBE6fDvkWNuci6XMxqszRls_VVOPvCa8aLHpzh7kye3zeA5_mNI
Message-ID: <CAEcyiz83o-NK263Efj5xfGPuVMUqur7TT-RofZ-WkJirMzB9oA@mail.gmail.com>
Subject: Is there a way to extend the timeout of elements in an nftables set?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With ipsets, the timeout of an element in a set gets extended each
time you `ipset add` it. However, that doesn't happen with nftables
(v1.1.1) sets - when you `nft add` an element, the timeout is set
initially but never subsequently updated. Is there another way to do
this that I'm missing?

Regardless, I think it's worth noting that the existing behavior makes
the `nftset` functionality of dnsmasq (where it automatically adds
select resolved IPs to nftables sets) unusable for me compared to its
equivalent `ipset` functionality.

Thanks,
Cyrus
