Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043791E520F
	for <netfilter@vger.kernel.org>; Sun, 24 Aug 2025 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756023568; cv=none; b=j9BVJvzVed+8Q7uGc8p9jDT9FQMv2jeeZOW0JpO+f/KTBPxFYCib/0Re9DEzbauH9ZMkeIhb6W/Ctq1ShshQUAqDPx2K2QeD1MRVbbWUnmCNnZNxJ5/DAUkN7RZ0OPHH2lMwgDJoqk43xk2ANP+mPisUbnUQXYOiRpGWb8tHl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756023568; c=relaxed/simple;
	bh=Ru2rJJAjdoJfBQG27EqEi2Cym4uTCwZY0wYQflifU0U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5mvxjysyGTD4jOEfoXr5B/2m4wzCu39hLn06cTATDI9J0Gh4ibHML6ZHUWq1cgtRkF/nlMXxtWMpfujGM/VKD1kRnleAkfaA1FuHJ3vIGjwQaPTeGjiJxEYEaHwpN5TO2JcOjOVp5USkwVLR49Tk82cnBH9rJcMIpomIdjebQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOu82UYY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOu82UYY"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea79219so4177367b3a.2
        for <netfilter@vger.kernel.org>; Sun, 24 Aug 2025 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756023566; x=1756628366; darn=vger.kernel.org;
        h=disposition-notification-to:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0KJWdgLt1oNy1H5nziA/oFCGLm3PgKArDAe2pWpkO0=;
        b=bOu82UYYXqAGLSotyCscwGbZhiZXkaC8ZHxQGUBHtWmzDcCaTMeVNlq3N5HspwpUVh
         xG6dyUy5dAcsFZgsoR3YvlvwtSEvMTPKneQHRlEZC0eHAnDPV0vqqpFt3gTnl7zyoArI
         j5panJkzHAPOj1fDwLIPvKPQDw1ZQzhS1bfPcryte4QUxEr31fG6/Kng0wwCF6DaqRqf
         ClBwuszi0kPz53k9vyi8W5ZZdBvS+xM5n53ybT7+YI337ulQmQnnu/y47OWmIv3QovOz
         u/1c0Xj5feM54ekmcSjzY00hFJr1am7eLWgmRuTNXOwqQDChKxOiGQMJJi5kAM2QmtlD
         ndYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756023566; x=1756628366;
        h=disposition-notification-to:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0KJWdgLt1oNy1H5nziA/oFCGLm3PgKArDAe2pWpkO0=;
        b=R0/L1Za2gBFEEHUn/ahAuQGFJ1KFKCDwS/ti/YcIhJPhkTvwlDgahi//zvVI+ZLecc
         +c+pWdiGrLlvdCP8I83FZe9te7XzmTPHKVUohUgKpIZFJtlmtY7aRjzsAKgHZjyZH3J1
         bwEZnQCNB0D1BR/s0ch2eNJBrKM6JCffk58lsFudPFbbZdmjmJTMO85jTrtAOpo6Ji0q
         TBBAg6GPZ9zdkfO7BGkjDC3hUZiPmAMMVME9e7M2hqcknMOc1nvdOD4EuId7R7kw9j22
         KQ107nMWfoNQNp97qY/eM+vO67uL7dXJUx0j1g2Y74sCVMWi51HyG4wYUXjZCdhy6Tqq
         ORTA==
X-Gm-Message-State: AOJu0Yxme0YEjCbnXEIgwUmC5jjc5fMbnz5LtV5ucZJ1bnkHlkUOO0Hu
	pmggIyZmcxjSyBmV7dkeSpYJX1QXo7yXuEoVHANjfoOTJjOB4+MXZHRRa+VAyBxi9Ik=
X-Gm-Gg: ASbGnct57ledbftgR2KJijnEXTe09IYPfex/gm3Sxt47ZOSLMzeEkaTpvI1DItU4seo
	EFth+zlnSY8HH1w1QxKs+T7bUGG1coLbmv2ce2dpjOtr2fDyw+lyWgaDDs7ZeDc8vVxo40cZAFx
	Too/+x9tsGzRPPvvdqPYSS3LsCkRtHzYFEL9CL5qqfZTzjA/SlrVo08+FWJndd3WqZ7/+CPaJTT
	dY2I2cJdrcM/aSYED2eN1WX2KQEfF4FaomehIXyty0knErNHcv0uXNBsNC3UHrfSEUfI6drh2zY
	/WSlLqPBY7viOdCMynYHYPZX9LXvUL7aKHODEL8XHUaLdxqw6XwMMFOo5PGucGq7B9zhxyWOu0n
	ki7aZT3ovhskEP3ZbUs4qK9ldd8k9s8t77jCjpp+LlPU=
X-Google-Smtp-Source: AGHT+IHFdNx0zeVmHDV9qDJLy79UlwEOj/t8OkykLhClR8EtOM8crwLoGqcRyrWIgcC+1mk7BguDsQ==
X-Received: by 2002:a05:6a00:bd92:b0:76b:f7af:c47d with SMTP id d2e1a72fcca58-7702f9df039mr10608465b3a.4.1756023565488;
        Sun, 24 Aug 2025 01:19:25 -0700 (PDT)
Received: from localhost ([2a0c:b641:69c:bff0:4d46:d5f4:d656:d1f2])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77040215981sm4340056b3a.87.2025.08.24.01.19.23
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 01:19:24 -0700 (PDT)
Date: Sun, 24 Aug 2025 16:18:50 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: netfilter@vger.kernel.org
Subject: nft error Could not process rule: No buffer space available
Message-ID: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: Mutt 2.2.14 (516568dc) (2025-02-20)

I'm switching from iptables+ipset to nftables, and as part of it, I need to
import a set containing ~2400 IPv6 networks. The file looks like this:

define elems = {
  2001:123::/31,
  ...
}

table ip6 mytable {
  set myset {
    type ipv6_addr
    flags dynamic,interval
    elements = $elems
  }
  chain output {
    type route hook output priority -150;
    ... ip6 daddr @myset reject
  }
}

And then "nft -f myfile.nft" fails with

netlink: Error: Could not process rule: No buffer space available

-- 
Best regards,
lilydjwg
