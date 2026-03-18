Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CE24A07C
	for <netfilter@vger.kernel.org>; Wed, 18 Mar 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824952; cv=none; b=rujjFAZKCepDDaSLVeCKgc9k8x+dA+Uaz4Rtb3qXlJ2bNCafrRiyYtPC6fFVKcCMyae7OT6G7++sKvhDoCXsQCJ8WHC+j1feGmolU5GBsL8P6jrMMYz/vI11OhRFzqsowExfhn/SSZpODQHHzZktJ0C16WjqWfO4XXUmj8faRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824952; c=relaxed/simple;
	bh=Fg4YimoEPPICUnSyRdjsD68OclpuwQq6ZQxXVL0BR/8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=Bk4tShC0trAzzEpYxc+23tLL0ZOg9+4wySwAzONRPQ/XbdUmEqOYT7/yX4JJNHnjNE2gleq0pZ2sq1hnkdp/YIN0/kvA956GUBlN4z1K2CJet24WYGnbZxHZQfQWSYlLJhsf3p2HImssEwapqqKvTZlRxvmgUemO292IbyCrB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwZuAx/l; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwZuAx/l"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c741bd1ad11so466712a12.1
        for <netfilter@vger.kernel.org>; Wed, 18 Mar 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824949; x=1774429749; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LGBkkDO+wQdHolJLJsB7E0rNbbfwUq3E1WIq5iRrJD8=;
        b=SwZuAx/lIYMl+2eYyD/5TBcPgJSJSrwmXTxC2NanttrD4+TJmglVS7b8ZYEbwFRr63
         ylveV2+3Hta5KR82ncmRETDUxrs9DPI2CvFdDx9fpQsHznND19WRzyno+NL9C4OJaH0n
         Nsi71U588CoM8GBMc/O0pzJTT1vu4+Q1MdKH4/pDhQLXLv6OazFPD1EG9nNl1fimCEUs
         KlXEttlvazTt3LaiLmIYpYCFpVCjW/mVWt1bCNqn/TiMAXGLMo7y+3KX0XvZCBYA+Zh5
         HmlxMG8qpOfTUTyr4BVI4OMJYpW+Qyi8ZdMSXhA22qGxMoQfXNPUztkc9ZQWLIFB2FCm
         0ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824949; x=1774429749;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LGBkkDO+wQdHolJLJsB7E0rNbbfwUq3E1WIq5iRrJD8=;
        b=TWA+nazBiW02Fc4aPwVxDiYygpqagDw6o91FLITm4/phJ2fmkF1cGf0e4Lh79zLn7h
         p7WA1B5iCOH2V/MicUT+sU5TovXynvARi+hYjb5QyoD8aLSGQVwfjd2p6L50Uji5jXff
         sA96No08lHtUUYNrBHhmNKWOvVNyL3NVq6SWg7awS6VzoWWwSTTmgU/uE+0ilWFP/g8m
         CZHNuiepA6jX096s5NUC/epDOsQR0eONzmetoOi6vqfhAQ0IyfJep1HGZGl+qwc8jKc4
         QQZ9mqzxh8NjjRdvVC3RJmq2My9iS5Zc/zgqrePV1hGbZPVlUafbAXUJLQWf4HURuDX1
         l1ow==
X-Gm-Message-State: AOJu0Yxl3j9s+FkD/BXsvnVuyLMoqzcb/frJobPS3V/ZRHZ2tI0gakfd
	L82hw63m3M4YSagOFy9mraJOTxiXebLIrsINd6j9DewqR/bqxkNlqXSWkMLifA==
X-Gm-Gg: ATEYQzxm6aG77dqQ0uO3Q8Y7JBdJywrt76P1fonX/JmCj8IMHarmo4D/5DnlMq8WcRa
	8oLcoZm/VtYYf3Nk6PI+YgVixvu8RG8J4/ksaZ5qY7IM2j+IgoDAMQKtKVJjzBfr3d/7+GgtX74
	TKvW8BNTU3/qokOdtSLRKhkMcM+YAwtqcqHhv2cuGn9m0OxibZ2ngkrG9KZzu74e/0c/qd+vDuh
	hgVG7U/Gv8OvMWYwCwpL9HiZBKzUrT1OOgXzAdPE/RCMcbQe1fZNdu/Ak7sJoSS5KrHnxBrg5MI
	QW818kd0TwahPPEZ/kYdP+TFDCjDvP4ZFQt8HUokIgXpkIgaVNXkWREprBXIH8e9Mp5h8OlOYpz
	Z6NrLgyzleFkLgWOMBz8t/EgdeyHuYm4JbpfHphn8AmVzR2FcPk8guR1qEp2MvGyar7tSZoizAJ
	aukHr0jwiihJR6ddjO907dUEX0BAzQtxc+rG71PNC/qm8/V1F6ElWcmaLsLwJq
X-Received: by 2002:a05:6a21:6f88:b0:398:8002:8033 with SMTP id adf61e73a8af0-39b9a0744e6mr2570204637.49.1773824949467;
        Wed, 18 Mar 2026 02:09:09 -0700 (PDT)
Received: from [192.168.88.2] ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0d456dsm1919547a12.8.2026.03.18.02.09.08
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:09 -0700 (PDT)
Message-ID: <29715e77e45df71655a029669d54710bf23b1c76.camel@gmail.com>
Subject: Replicating BSD authpf(8) semantics via nftables verdict maps
From: avinash.duduskar@gmail.com
To: netfilter@vger.kernel.org
Date: Wed, 18 Mar 2026 14:39:07 +0530
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

I=E2=80=99m attempting to replicate OpenBSD=E2=80=99s authpf(8) behaviour o=
n Arch
linux. My current approach feels slightly "bolted on," and I=E2=80=99d
appreciate a sanity check on the architecture before I commit.

The Objective: SSH triggered, per-session firewalling without a shell.
Login should atomically provision network access, logout must tear it
down.

I=E2=80=99m using a verdict map to dispatch traffic to dynamic, session-
specific chains based on packet marks.

table inet authnft {
    map session_dispatch {
        type mark : verdict
    }

    chain input {
        type filter hook input priority 0; policy drop;
        meta mark vmap @session_dispatch
    }

    chain ssh_session_ID {
        # Session-specific rules here
    }
}

On login (via small userspace helper):
- Allocate a per-session mark
- Create a dynamic chain, and batch insert the mark -> jump entry into
the map
Logout (via same helper):
- Delete the map entry and the associated chain (systemd calls our
binary, provides the slice details).

Some of things I am not clear about:

1. Does an nft batch guarantee I won=E2=80=99t hit a "missing chain" during=
 a
concurrent map update?
2. Is meta mark the right tool here, or should I be looking at meta
cgroup to tie this more tightly to the systemd scope?
3. Any pitfalls to be aware of when managing ~1000 dynamic chains / map
entries?
4. Is this a sensible use of nftables, or is this firmly in the "just
use eBPF" category?

If the answer is =E2=80=9Cthis is cursed, do X instead=E2=80=9D, I=E2=80=99=
d appreciate the
correction.


Cheers,
Avi
