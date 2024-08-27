Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99782877
	for <netfilter@vger.kernel.org>; Tue, 27 Aug 2024 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724789740; cv=none; b=nzvgrpV0t68rQA6hdu0gC5d4jq/JmHUcDpsQAk8XrdBwLw06usFGdzL3jafc2LnRBFtNEdNAjRrBlF1PTDf3uwGuZlVHsvtC/5tWoeQKDZ0PV5ndnDKRT2ZEynjpPaZlUYA2eqW/bBOFINHVETEVBEHphlb1EB8yNcAcv3RiaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724789740; c=relaxed/simple;
	bh=PTAL4zY8Qjv80FiRpUN6IlKKVqe8gegQIhXz6ogcuc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eplM1xog34KNhoYgPudJ9lSrkvBB87SKNnTyqTWQ0JE7zuihMqXRdtP96yR4evTA8JgRtwsUV8iYWvGZ84382JPrZzPaFbAZ57xkNK2nkhOM3pSji+Kkjc7X2N2TXj+1TNQudtuYgJg9lHvaOKmsHTYPTSSjhgJCuYPs5zw9/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lethedata.com; spf=pass smtp.mailfrom=lethedata.com; dkim=pass (2048-bit key) header.d=lethedata-com.20230601.gappssmtp.com header.i=@lethedata-com.20230601.gappssmtp.com header.b=excCfv1R; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lethedata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lethedata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lethedata-com.20230601.gappssmtp.com header.i=@lethedata-com.20230601.gappssmtp.com header.b="excCfv1R"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-84305a83b06so1804238241.2
        for <netfilter@vger.kernel.org>; Tue, 27 Aug 2024 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lethedata-com.20230601.gappssmtp.com; s=20230601; t=1724789737; x=1725394537; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ey7SGr0y/q1/fa7+kn469PbQtV+AfnHXHx0r/oZS71g=;
        b=excCfv1RE0lW/mW0CNFBI9br6jt8OXngH/MlytMubXZ8iB1Q8uzinfTqmpYVdVnK+Y
         LnnbhUwVb7qJmRb9EXFE7DdpiKGF1RM88EBCm+LgVAbUdQf/tTCsg4O/WBd2jx4GsYlj
         T5eXdJALQSAJwWa4EZshKFdFnBMmatJSKSIbKOfYb8aSm7VHTNgKfGbivwu/11QUUZlR
         pAc+vz7mTrw/hbo27ASmm0OA5wJM6s5+XwXy7U2SG/X2gBaG3jMDcZOfxzSUBsQ12znU
         Mv9+DdoLBmTUzHd2yx2sg13cN5u+F0k7KgsU3R+wTakNNm7GxoALIo44P+PhnmoOdWgf
         07vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724789737; x=1725394537;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ey7SGr0y/q1/fa7+kn469PbQtV+AfnHXHx0r/oZS71g=;
        b=Qbct38yXEy4T6YIwXZEFdzHcNCXTyy9Qe2uCN0PMVh06U/XtvIOquDPMdS2fbhmRLM
         sAaZ+6Afhche1waDH1rAcpkSo5E4yj3MuIeEzC8Y587aOJkXKofHVJxeEakf6v+i/tYp
         oRQLtVdRho6jfH2Eka8SwKdd+RxB7e9YMuOg068jGh6HgPIZbbkV7de4R6/Zl7euS3CO
         35E0NP0gluci80KvqugHG0CU0Mdd/nrFjOojqzBRVS0Wh/pG9+yAKfmp/X4pAjJmCY6i
         3EFdwky8PqTmRBmkE2/DaHUMLLL4PoOqImRjIXzPl3vXq/sIkXO2Lv2MPBoMlqxFL4zN
         3BwQ==
X-Gm-Message-State: AOJu0YxugoIC68RCNjKEJYV+cXI5masasDu39/s/ziZ2TJT73odXUEDb
	h4Nn9FY3uh7RLlNdHsuuli89V+z5h/diSG0zBrLIassfl45qGi5yNYNBZaZiGRvmwISNriRf1lC
	gwbwGxygVwisgnjN6j3qQAINLRZfnni76R9pByOrAwz29dMQO8WQ=
X-Google-Smtp-Source: AGHT+IF4N4sOf2SbJtzYwETeAsEGZu+3N7+azZV40CRYWNVwwkgwacsiAeyCqskyvw2NPYrTfM11eyQHJZdFvkerp4g=
X-Received: by 2002:a05:6102:3f4e:b0:497:6a9b:36bd with SMTP id
 ada2fe7eead31-498f473232amr18216533137.29.1724789737412; Tue, 27 Aug 2024
 13:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Echo Nar <echo@lethedata.com>
Date: Tue, 27 Aug 2024 15:15:00 -0500
Message-ID: <CANsOo6on+x7OrWQN5w6Ls5RwcLHKx4Kmrp80-fPxte2LQfcuOQ@mail.gmail.com>
Subject: Stateless NAT ICMP Payload Mismatch
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Is there a way to set up a stateless NAT that updates ICMP payloads
i.e. destination-unreachable (type 3)?

With the current rules I have (shown below) I am able to receive ICMP
destination-unreachable packets but the payload is wrong causing them
to be dropped by clients. This pretty much breaks traceroute on both
sides.

Internal to external:
IPv4 Header - Src: 192.0.2.2, Dst: 100.64.1.105
ICMP Type 3 Payload - Src: 203.0.113.100, Dst: 192.0.2.2

External to internal:
   IPv4 Header - Src: 203.0.113.100, Dst: 203.0.113.200
   ICMP Type 3 Payload - Src: 203.0.113.200, Dst: 100.64.1.105

table ip NAT {
   chain prerouting {
      type filter hook prerouting priority raw; policy accept;
         iif "eth0" ip daddr 203.0.113.100 ip daddr set 100.64.1.105
notrack return
   }

   chain postrouting {
      type filter hook postrouting priority raw; policy accept;
         oif "eth0" ip saddr 100.64.1.105 ip saddr set 203.0.113.100
notrack return
   }
}

As a side note, tc performs ICMP modifications (but doesn't meet my
needs) which is why I'm thinking nftables should be able to do it as
well.
--
Thanks,
Echo Nar
