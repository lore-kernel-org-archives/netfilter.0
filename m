Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4E2D73AE
	for <netfilter@vger.kernel.org>; Tue,  7 Oct 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828514; cv=none; b=gLSTuoHGx8gS0CGJBkrkv+r3bi6ac3aXaLRIRAh83S3k5ixW/cgry07wY17ET7Rgsf+tzHylQrdI0ooCmooeFCXl0fmN4tZv3EPCMAvcOjuN8Dw/MnDasttBQ2GcakB6JRrzobJ4k11mdFyueBOxqNHzr1uq8X6sr51YmffTZpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828514; c=relaxed/simple;
	bh=p3yXkK2IepNBE6OqxaCumpI2fpCyynSC/Zv47BVf7qI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=SK2VUtuXLlgA1hSmUhM+J3eub1bWJbCAbHgLkKkZXnNfIFi9+ndhdLjdh/Gp0leST8ktBam7nApqmEaaJYQXzyvjp35HZ5rD4naEbq/RjEoK4IZloXA3uYIL1JqGNrTOkod9Zy0nIQSdqJ/KD23zjKWAczvGTf3e9H3s/WDL0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuPCdh9c; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuPCdh9c"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-85e76e886a0so505938485a.1
        for <netfilter@vger.kernel.org>; Tue, 07 Oct 2025 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828512; x=1760433312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3yXkK2IepNBE6OqxaCumpI2fpCyynSC/Zv47BVf7qI=;
        b=QuPCdh9cuwD663FJXrJC2xhMurHIWoS7bIJcDZPAao39SFc92J9jsGdbC2xkywyouK
         0G2vNXwVOObo3dnyHxlHs/SlFCkYVQHq3Q+QmoMU4CCYwsgvVuYVbZfopbPPe7S/bhgQ
         qYa4hHb74m/wqr9WrejTfT6ybXMyPT4vkGRkKWHu9XP24eRLLibOH3BmM7myrnqlFDvV
         EWA9StHBxAANsFfLXhvvOujwVVnSnr1qiEnGQ9w2mxpNn/74KIczwNBm8BY9IPndRbmT
         igwDIkLv/DYxVHBOEf/RoScSOY5rPoF+GMUBrHxWsiidzgTAq3fhrB4x6nUhEQ7s9ZzF
         IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828512; x=1760433312;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3yXkK2IepNBE6OqxaCumpI2fpCyynSC/Zv47BVf7qI=;
        b=AXb2blR7xZRUlH/DXvaUIvp0dD93r+cUBHZwCNgTOnYmQqGA2S0lHfjrt5X9bWz/bT
         nt8Qg+WmSNdxvCUPQpJYTdipYiFAUahc0QMYhNE17q66CjbwvlFq35gBEwGSyx4tHOb6
         qepaxMFRzUh2/RFBhmJC8mPVS4oqXmLnz/H8bIrzonE5nzMUmSNy/ngSHUoOZKe7OxwT
         Xchei5XL7qbTER75qnUQyHhf4WzVX0x8rtGOECYU9bGB9JAVRqfcSibMzzQ3hRtfAbqX
         EB2EnLCrSTsByBKAq8NjxfFHOZOxtHKQSLv13xsS4y3wGkkhyi7KGK/51RnqZBb57PZO
         0tKw==
X-Gm-Message-State: AOJu0Yyk8ciZT7MDKrPXreFTsouB4W7R6W009ZN5sYEOD+zjbBl/267L
	B/fUQx7Z12+NjDa5DAkzZobDq59pIZmiwSEzcAatZSWJ7cl1FEKAkv5Z1ixijQ==
X-Gm-Gg: ASbGnctOn1tLEIbkeJN8PdOpeG8fP3xNS0y1gKlUJVSY2fmkMXxUPGoUD3i/ER8q6+o
	XLlOreXbggMyXEZISOVMypR/VhWpi9+r6a6dC8I1+09GoAFXoTYs21uOWPrmIpqbf5HU3RoesVy
	CWCAiOnPqMKbyrKJplc7NCqFFnWHfuhe4TgCDH8ZbLnw69zxFiOmnUlPdkdbjLd2IX1DjDjWaRV
	QFJ9oDeCW5GdQupSHLtBqxZ61Kldo6iTSaksvsQjpZ1YMOaV3g9DcRTY9PArnAFhIZPuVd9oUAt
	VXOGmTqS++3iK1I4HIRaCxa4Up+uiXizqEoLXTYeOg0ei+uzAn+RMEf2DqeEXg4tazR1/2JmCd2
	DzA9p9wpM6VuCC+6YU3f6wxJ3lE7nAPVB+cGlseid
X-Google-Smtp-Source: AGHT+IGaNrR2sKv8OcIHlBP2zcX7chZMARzE/Ry9fvPucGgkrxh8pju2pg4CqNdpqf7tba7w977lNQ==
X-Received: by 2002:a05:620a:1920:b0:866:b575:e424 with SMTP id af79cd13be357-87a38b35118mr2001081085a.70.1759828511392;
        Tue, 07 Oct 2025 02:15:11 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87779799145sm1436784785a.56.2025.10.07.02.15.10
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:15:11 -0700 (PDT)
Date: Tue, 7 Oct 2025 05:15:08 -0400
From: <imnozi@gmail.com>
To: netfilter@vger.kernel.org
Subject: nf-ct-list and nf-exp-delete
Message-ID: <20251007051508.049e8821@playground>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

[iptables v1.8.7; old, but it's what I have.]

Why does 'nf-exp-delete -i [id]' *not* remove remove some conntrack entries even after being told to remove them multiple times? It deletes most entries for my purposes (if condition is met, delete conntrack entry and block the IP using ipset). Blocked IPs are DROPped on internet side, and RESET and REJECTed on the internal side. But from time to time, I see ESTABLISHED conns that don't get (can't be) deleted.

Thanks,
Neal
