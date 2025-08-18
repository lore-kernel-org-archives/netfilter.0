Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF830F520
	for <netfilter@vger.kernel.org>; Mon, 18 Aug 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518761; cv=none; b=W+hzYnf/F0/20SD3AUv3ZQqEe3YN/BnlaGjr56hXlgZ8/W1ilX6XW9PeKyp21lADxrsb6rtbuDqZ8BIeKnXd6liAA/VCPw6kgZ0s0p6N+34R4kHvsvfJf1WiIXzuHAvdM6VMk+PMSPt2riug6VG7hsYe7hCPyn9BD9KLIWA1YHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518761; c=relaxed/simple;
	bh=Im0eESeA5q2a9MohUJDheeSoTBtOJnxhrikZD/y/ecM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WBiQNyp13rzWjP96O2IA48vOFF8GEPR0fHVFSQz+oxdq4L+k0qFlxex41QKcOQYl+v6uxHkDRxUmM/tUae+jPJLl/3NaE/quYo37dRWL8IjAnsxORiOIiAyj94GVoXrppXgMix6BS1wCRuPqjfitZJOAZQwtoAPvtTusDfhcPU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVYTex3k; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVYTex3k"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-619ff42ad8eso2247122a12.3
        for <netfilter@vger.kernel.org>; Mon, 18 Aug 2025 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755518757; x=1756123557; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qozK2/dIp+SUufC0rNy5QzaMxWxGzkdv9d4QXQUXM7w=;
        b=mVYTex3kmVVIjgkIlz7Gj5LEIgnNg1cq0mhL2MXPJ6e5vksw86DKKfJtfyQl0aIU8C
         n/w8rZVa0iVIV1TScECWEoi5U5ze15j+3KP3xmP4/BE+s3e4W1PYbKVG8nWEA1xSA26g
         zd1vWl81eQn6It83ZVVruJPwOWJYCfYIHQ4BdCw0vs8Tx5ztEXdeLFgd1MXjSbOy1Fi8
         SXSES98+Nd/BmHgx2kx9j7CvwcDou8YqJFlbBcudput57z9PIKVF6/FfsVu6NNg/SDc/
         QoH0m9hr15zTRQfP/bRFHXeTfxfxe+uIL4cMArRHcRbwYi9TSrck6TJv3E/yq4vZ6nay
         WU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518757; x=1756123557;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qozK2/dIp+SUufC0rNy5QzaMxWxGzkdv9d4QXQUXM7w=;
        b=jLnu1wBTBZpJam3OXLeBSZXVLKHA/SsBcoYhYeZOzm7I3vrVsh2JL+CHDbf05ixKAW
         OUSv+LQd9PZNW+0zFF2kmtPUIKW5MV94nrXKnb4bAQp9UpW0E+VXwNjlvLQVwz8mlE7D
         /Vsk5HvhNXxKcwFPrqPdWgsDDaVe++jEHngefXsOhjz8rjGVRDCHEhQj2KX1GdLbnJft
         KX7FV+weUkMj/BJhX66s0jUO2A/uhzb2b55eDFfsopZ9F7bIxqsW2xSw8B1D2o9gIg7P
         Ji5EhSGOBVujAtvY7Sr8nwYfoBp6rnlJ9nXGxiVg247kiLYLj36rx8ZPdUGf97huE02V
         EUDA==
X-Gm-Message-State: AOJu0Yzx2xOQNsaYTQW1rOUcIN6qgpnXb1xn8W+8P03BxjJItiefB7ic
	EPGZkyY5RnVKCxBktTdVNCHMA3NAT/z1feDGoKNvNbydYZQklaCm7tTRIT4WhNbsprOvTVeibtV
	LJbk8oWyj1qP2EY2KQGeoipgcU+yYp+Ncx2sG
X-Gm-Gg: ASbGncswmBy6ZryGGzMwllUqIYt7GVdHcCFtlFkkDcwKPZp4wCT2GwFGYqfFvGgTTDJ
	pOlDJJ/afyCDV1sJtQOg9KApAt3EfIdXF9arkhzHI+Pp2CW6TvIXcy/v5QqJpN73XOyoUWzKg+J
	WycL5O+HphCcwLg68qf/m7Bfwx3twRET85MyStl9UDTWBTOCWBBi7EVT9ProIgjyfb6sKFIX9t+
	QceAdP/
X-Google-Smtp-Source: AGHT+IHrM384nKUo3n1rBT4E2NQICDgvwhVRtQrKJGIYuCCqCvl7sox52g5AXMQ/9uqc/9mp2adhJm4diCVJOuWCWS0=
X-Received: by 2002:a17:907:3fa4:b0:ae3:74be:49ab with SMTP id
 a640c23a62f3a-afceacad5damr871715466b.10.1755518757359; Mon, 18 Aug 2025
 05:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Date: Mon, 18 Aug 2025 17:35:49 +0530
X-Gm-Features: Ac12FXycZA6wfzeedaMH-_2oblkBu-6WD23ai-uomlX6xN_5999JL2vvOAO5lxw
Message-ID: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
Subject: nft for bridge.
To: Netfilter mailing list <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

hi,

inet offload is working fine for me.
++++++++++++++++++++++++
/etc/nftables/inet.nft

table inet x {

     flowtable f {
        hook ingress priority 0
        devices = { eth0, sdp1-0 }
        flags offload;
     }

    chain forward {
        type filter hook forward priority 0; policy accept;
        ct state { established, related } flow add @f
    }
}
++++++++++++++++++
But bridge nft fails. Could you help with correct configuration?  i
have already enabled below config
CONFIG_NF_TABLES_BRIDGE=y
CONFIG_NF_CONNTRACK_BRIDGE=y


/etc/nftables/ibridge-raw.nft
--------------
table bridge x {

     flowtable f {
        hook ingress priority 0
        devices = { br0  }
        flags offload;
     }

    chain forward {
        type filter hook forward priority 0; policy accept;
        ct state { established, related } flow add @f
    }
}
~# nft -f /etc/nftables/ipv4-raw.nft
/etc/nftables/ipv4-raw.nft:7:16-16: Error: Could not process rule: No
such file or directory
     flowtable f {
               ^
/etc/nftables/ipv4-raw.nft:15:43-53: Error: Could not process rule: No
such file or directory
        ct state { established, related } flow add @f
                                          ^^^^^^^^^^^
