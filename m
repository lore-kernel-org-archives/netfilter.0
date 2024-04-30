Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600041BED74
	for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 22:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714515725; cv=none; b=uTlR9Eod2vzuaFO7QjziNvq8lreCbFuQY0FaAdR8J75HBhStAZAIdcFTN6InjvFQhOejdMUR1M4p2q6GDXxdwveyY4FjaNq8dM65/Dp3ORfK1g1UoRBCnJYp6zFoVpICHQB2mmwNmfQ5XBlrzfoxacQ62F/ThFTkMoTn2BbBbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714515725; c=relaxed/simple;
	bh=oLnatKC911WlLd6QdiNrEPIYBzicSikdY8AzFjduVEA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=R+ryx/sewXG7WrNrUoGi2sGWeKDtPvxLnMvWAZVW+8EKdgeJ3p2FV5UCZj8hI9ecxdJmjve/uidftgZm1W+TWgUJh9bQlILKo+O0svKqzqBeJJZDHvCODBjK5xhkPCNOSKwmTQmorPBj8V6SR1OX8vfNi9P+enice7Oh5lV4z9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMOkLs8l; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMOkLs8l"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c868e82bf8so1123319b6e.0
        for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714515723; x=1715120523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qo40fDJ/kAHcAkZNJ8QaQrQsN30A87gDIVLpqzHoHk=;
        b=RMOkLs8l3bhVFPrYN75voVs7rCoYIlgEMTut5k7PoXFOqVvJ8o2WOCOD/+f3zeCRSH
         ASOY8MgNlsXt61YBU9NC54nAFx/wJes53K1d4WgRjB8Ijqj6DrSpQ08pPcJDzAB4laVx
         o+Lk95lohuQxSd9YYJU4DHNQwtZ54vSgqfIthVXvtBL/GrEWNXxqNC9g2VSEloMdL53v
         QfppEDe3Rn8MbGlPZn+O5dxlVH6ZMIBHj9BW769uPWEATkWeOYv8IWtXc3FxEUNV5ry8
         bYlZwSWG7ZyYUmUoiZ+1WkHfbJZot/uaDgxXrF+1yvlpDUzfA6J9VtEJDJgX/4STXuor
         DAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714515723; x=1715120523;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qo40fDJ/kAHcAkZNJ8QaQrQsN30A87gDIVLpqzHoHk=;
        b=lkzgPXWTPVBYn9zfndQk+BtwghrfsdlvaiVCBchKG7j8AkmCEm/YHYIAbYCGlcKtqn
         GCIiCAXFWiiB3ZfVPLfY6hoxxunqIkJEsOS/Z+DiwLoKpWOAW0e4LQAU+Ep7AHXeTIiD
         m3ypuW2rkbl7UMUxgDz0IBhsCyP8qbs243CsLfPusbs5H3lnMMH7sUEuruKG0M5SjLPJ
         9lP2SyfAnsCgXvrcvPa6u3eleeCiVdCM2l3Auzb0SSygqKg9XpVgbTZWRyWALHNUexT+
         vwn31YaKuGNdnQUWM7IkSuGjqXccQ82TtE/sggXNRGDQP3PHdJ0k6iRBtS469fxy2rlT
         SuEQ==
X-Gm-Message-State: AOJu0YyVXkRV/iPfNswYjRX62o2DusGRY61rnROIuok+1WEh1+0hJVHK
	V4KWl99ESoS2MFHfpJFZQNX53+/BxKcRHuB5EubaV2SPRGdueeDvPJTXEA5G
X-Google-Smtp-Source: AGHT+IEkpWUHKGPtdtcRMBu3gy8fs9neR+fVeYlsv13j4y5O4X77SiwIvCja5CzYiHiVzYWuqw9T3A==
X-Received: by 2002:a05:6808:4c1:b0:3c5:fed9:ea36 with SMTP id a1-20020a05680804c100b003c5fed9ea36mr1009953oie.3.1714515723349;
        Tue, 30 Apr 2024 15:22:03 -0700 (PDT)
Received: from playground ([204.111.226.63])
        by smtp.gmail.com with ESMTPSA id s2-20020ae9f702000000b0078efd872d3csm11833546qkg.14.2024.04.30.15.22.03
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 15:22:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 18:22:00 -0400
From: <imnozi@gmail.com>
To: netfilter@vger.kernel.org
Subject: IPv4 NAT and lo, and iptables
Message-ID: <20240430182200.39ac9ea1@playground>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I just encountered a linux/netfilter oddity. Simplified, I have FW_A with iface PUB to internet, another to internal LAN_1 and a third to LAN_2. Firewall rules on FW_A are properly set to:
  - NAT traffic to/from PUB,
  - block LAN_2 traffic from LAN_1
  - allow LAN_1 traffic to LAN_2
  - forward internet traffic to port 80 to SRVA_2 on LAN_2

On FW_A, in mangle:PREROUTING, XMARKs are set for traffic coming from LAN_1 and LAN_2. Example:
  iptables -A portfwb -d 192.0.2.77/32 -i LAN_1 \
    -j MARK --set-xmark 0x1/0xffffffff
Internet hosts access port 80 on SRVA_2. Hosts on LAN_1 access port 80 on SRVA_2 via the public IP. Even SRVA_2 can access itself (port 80) via the public IP.

What *doesn't* work is FW_A accessing port 80 on SRVA_2. This traffic does not get NATted and appears on lo with the public address(es). And since nothing on FW_A listens to port 80, the connection is rejected. I *expected* locally-generate traffic to be NATted just like remote traffic.

Questions:
  - Is lo ignored in PREROUTING?
  - Is it possible to DNAT local traffic on FW_A (changing) the public IP to
    the private IP on LAN_2?
  - Would I specify '-i lo' in mangle:PREROUTING and nat:PREROUTING (as I do
    for the real NICs)?

The uber questions are:
  - Should I be able to DNAT and SNAT traffic on lo just as I can on other
    LANs, or do I need to take extra steps?
  - Is this a known oddity? or was it known back around Linux 3.16 and
    iptables 1.6? (Don't ask; sometimes we're stuck in a place we don't
    want to be.)

Thanks,
Neal
