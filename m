Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAABF1A716
	for <netfilter@vger.kernel.org>; Wed, 27 Mar 2024 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528593; cv=none; b=We4E/EatHlqw0wsptCTcg6o+pl6aOUIo6xcYtp4VFl12OgIOEiLxjS5CmDNx85TmfMG63aC/q4rrh7BAur+IkASUolKp/ZQotwg+jyUhGk7e6nJOq1+hks8dUE19S/HwdVjK0LOO0u1Qki2PjXYziYyjtV6YaRaFuCQmHajGr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528593; c=relaxed/simple;
	bh=xXZ9VgjC4K7a56Xsbc1tSrLH0fqKbw1V5Fh4EczgzKo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m1yJUX24PBLWzGMiHJl8Kg7cW1WmcIKzMtZf0aHAEPV+ivEyX2+xOj6Nm7tvW+p2qwR6WWK05PrXykTngMjw7F5hrdwUwvGCBzQUAnBZ+y31NRSssUmGvZImBywvaN/yfAT4G2Tk5XSqcRmfJIBIn+yG6cf9j51NhbNhVUXKrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsisyk.com; spf=none smtp.mailfrom=tsisyk.com; dkim=pass (2048-bit key) header.d=tsisyk.com header.i=@tsisyk.com header.b=Zk0suq2/; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsisyk.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tsisyk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tsisyk.com header.i=@tsisyk.com header.b="Zk0suq2/"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7e05b1ef941so2319977241.3
        for <netfilter@vger.kernel.org>; Wed, 27 Mar 2024 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tsisyk.com; s=google; t=1711528590; x=1712133390; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcjF2gCSI1jgfRmraqXJm9ps30LR7s/XflPRnFhE/WQ=;
        b=Zk0suq2/6ZlLb8iQhaLPbNTZte7e6IKZeoUuYTpmSXWpQdTiDQNKFOEgDiUodLsX03
         bgn8JNYjPkcpGhy4MBbhqATKBP4FfFEFkw5vMrqCSyPNuVGPnhN8XtdsBfK+ukTSb3ok
         zvrUCvepazjYO0Yg1wqLnPqr0B6c3W5rhVXSjoZRXa0xMsp7Nk9jy6lJA05y0NcWoQ5v
         jt9yqkbusACFfJFvtmfmfFEpbcvvcf3ANbyQ5FNzG0xsyQsIOVzcHi7vmLe0FWyq3y1R
         zYB8n8GFtTCRNwpMPo0o1vKXnq/04IyTH2IY5AQg9SCWXn3qz/OjN5D0V+w7dsu15sBd
         eOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528590; x=1712133390;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcjF2gCSI1jgfRmraqXJm9ps30LR7s/XflPRnFhE/WQ=;
        b=O6swGbD4BA4JDGAmFEmVfY35y7y+M1KbDCo27qItNEmrnNiOgtDxtCKhSG8tmyyZ43
         TX9p1ywlag3qY26mAAI/BBGupHzbGe6FoTNFRdXt2EOEURHpFyK8QWdW+adC8Pqp1PXU
         xCdnFuAzXY6Ms2Rmrk6NBmlHxbeTKCoiLklBUA5z1AF3eceu/iJEIv/xeItqhIjBv8rJ
         oe9r4aSRJH4eWHDB9NuSYxj33c/Gm2078wFxSiXgtZqZcOsrRO7lmtL2hqb9AIusRSnz
         tGazMveGFTW9XmV7VBY2J7z2RZiNw4/C3yUa2fPXDtA+j3n7OgUvRGQy6xeodCFAPo3p
         CGXw==
X-Gm-Message-State: AOJu0YzqZGH5ofxUPSLZt7vFD32anJu5EK5xm6K//tGELXOvnDInAcfp
	K3ecNvdr6znvBaaZcKbXAdLpN3jFQ0uyoeQJNpb51qgbO6eEQ1xJpsL3cPUx/SnyiQP/2EruSm4
	9MJbMEj88hZlnxiHXX0jZpv+0qShAKsd21uIdDMgcJ6tD7vgT8rC0/Q==
X-Google-Smtp-Source: AGHT+IGwkKLQ1EnaTKOn/cEkvmnyQdt/hzXxEZE/90eeVnmBucIRy8/yV9CY8BzXWFaXQZ3FNCvHKxK43gMAjCSoMic=
X-Received: by 2002:a05:6122:d0f:b0:4ca:615e:1b61 with SMTP id
 az15-20020a0561220d0f00b004ca615e1b61mr410136vkb.10.1711528590414; Wed, 27
 Mar 2024 01:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vlad Tsisyk <vlad@tsisyk.com>
Date: Wed, 27 Mar 2024 15:36:19 +0700
Message-ID: <CAOzR2PfY6hY8dqkfWzN2RGG2yU7RR1t-G4d=dqa+7iUy9mjFyw@mail.gmail.com>
Subject: Mask as part of element in set
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a set of pairs of MAC address and mask:

aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:ff
aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:00
...

I want to apply a mask to source MAC from the packet, and then compare
the result with the MAC from the pair. I can do it like so:

nft add table t
nft add chain t c
nft --debug=netlink add rule ip t c ether saddr and aa:bb:cc:dd:ee:ff
00:ff:ff:ff:ff:00

ip t c
  [ meta load iiftype => reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 6b @ link header + 6 => reg 1 ]
  [ bitwise reg 1 = (reg=1 & 0xddccbbaa 0x0000ffee ) ^ 0x00000000
0x00000000 ]
  [ cmp eq reg 1 0xffffff00 0x000000ff ]
...

But I have to create a new rule for each pair. Is there any
workarounds to use sets?
