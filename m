Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F764286889
	for <netfilter@vger.kernel.org>; Mon, 22 Sep 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533977; cv=none; b=DnnR/eHmw1/4stuqW2039FVZw0RspkqcDuHbxTb916PxFjAEbu2LvtDws42XJe6Xh2/hZKCVewSfjnl5T1Xv2zqvTzzgDXEQ2ujxdopNrr0rycpdxLJfFNkrpE5nX+TumdlBl7qs/EnXsUwRcLqCmMZs4MmGO2PVzhZI8k5BUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533977; c=relaxed/simple;
	bh=BAwy9a3oezL6by0mC4EO+RPCmJZjT4JuW6i3DSj7FgE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DRrBx6Wa+IXAoUSX9sZueXXGrxL4L3TgHdxsXXG+73GfNu/IQIVXJbHzyg3GmZQq74+M3dFFcoH4DD4iN8LzRb2Vy7peF2sjy8pPIM5NhDACA4MrKKXuK8sZHD9GEsWd8OnEzAj2LJrxsySmKR9rHqhdQtR5Lc+6IDquMt1h5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnI+PX5l; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnI+PX5l"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-4257f2b59ffso186675ab.1
        for <netfilter@vger.kernel.org>; Mon, 22 Sep 2025 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758533974; x=1759138774; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BAwy9a3oezL6by0mC4EO+RPCmJZjT4JuW6i3DSj7FgE=;
        b=YnI+PX5lzAgWE15tAAJvI5wUAbVp6mHv3rqCBAfDDGQ5Nwhdif4pxkSpIGVYYzK0iK
         +TarAp4FoDuLEcaGMI1YpTz3nT7MzixJ4qPfHSdwjgKcY0m+y7gcV3ChqxqPJgjdKVfV
         FVIRFCP+2DL71eY9Y4Fz4ob+kmknMo9bXFXJ08raXhm/+GMK2mykP0+1ZV3hteKVSgm4
         1yqYvozt/no6ppsF2seeGNtyyVH8ZuIvvyidRUHLtncSTlknJJofy31HPOAxjnZ1eZSr
         cwr5/d2xN1wYdn+09POndyZiadbviYR33sjYdgXSWE3LXYFh8hKlCn+QWVLtKQW5qr7Q
         tIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533974; x=1759138774;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BAwy9a3oezL6by0mC4EO+RPCmJZjT4JuW6i3DSj7FgE=;
        b=UWH3MteSunTtAbRG7y3guIjRaOBa5s7XeERsHfkIy5nWg0LwXIzoLbKk0jU7hy53GV
         fHaPoZ9/QxDPBU1mJyF+V0BDx7eyPF+dfstiX+sRYLpe/VMyv0irT8TYebxFj2Wdw1RX
         uiKM3iV7vME/bkhT97wZAfKwa+/P4bgLHN2vGDkpqzIjxg4o56wXLwRI6DDk70F3QcKo
         A3Cdsrmp48QfX/2MK8fUO/lYVJ617g9eFC61hZTaCYYN0AblhoyPHvUzZ5AwfDvbDvKo
         s3RXD683EqahkSMNpHpSlhJaCJ7MWYIQJ3OzuoHyKd0vgmJS6LFTIcIPR3HvEh88PHoz
         liEQ==
X-Gm-Message-State: AOJu0Yz43lV5/tPZYe8/plL0T6y5Xlgf4gJVPcOyB2V16Gd0D8K5KEI0
	0ZsMXXqTx3eAa1tK5N+i2f9/foamKGjls9p8LZBZeV3rzaUz6nzGxsvgPLVEBqtTaeRoaB7Q1QI
	v634yd1g2oBSPMalBYJFtmU0nUIwfaPYpM5WSncA=
X-Gm-Gg: ASbGnct7miIJ1wrASynzqy9nGot9GYg8xZVcwTSBbR9tnOraPJ+qL6hgM+VIbHH7ml1
	WxJTvuAzYC/FhoyEY2WMHCJHzSdD+CyCY+iVJ4L2mvpJQDcse8AaSdvrG0K0UTy8qUVgQDtbmd8
	YhuJnwDwS8ZKhha2rWXiggJBtx9l107trWgkqICJHUNVXwkg/cBh9X17oCuCniRLfRmRGoi2UFR
	sd9uw==
X-Google-Smtp-Source: AGHT+IFiV7d6NNrZYyR10/0KmMiOcSqsxPHd7U3/TKgIJkmEQZ38YcUPPZIv5IgPLIvoCfTSsJUbmM7R+/hJPztKY+I=
X-Received: by 2002:a05:6e02:3c83:b0:425:70ad:799e with SMTP id
 e9e14a558f8ab-42570ad830fmr95075165ab.10.1758533973994; Mon, 22 Sep 2025
 02:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Mon, 22 Sep 2025 11:38:57 +0200
X-Gm-Features: AS18NWDLaRS_JE0U_MbWjmg5K95c6hAkH1av3Dj6Bh02YOk-FmdAnj9JABxpEQ8
Message-ID: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
Subject: Confirming conntrack behavior on environments with multiple network namespaces
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Netfilter developers,

I've been debugging conntrack performance issues in Kubernetes
recently and it will be great to confirm my understanding from my
observations, testing and public information I could read.

My assumptions are:

Global hash table: There is a single global hash table for the entire
system. Its size is governed by nf_conntrack_buckets, and since commit
3183ab89 ("netfilter: conntrack: allow increasing bucket size via
sysctl too"), it is possible to resize this table at runtime. The hash
key correctly includes the network namespace ID to differentiate per
namespace entries.

Per-namespace limit: net.netfilter.nf_conntrack_max is a per-namespace
value (inherited from the init_net default) that limits the number of
entries that a single namespace is allowed to create.

Kubernetes "double-accounting": In Kubernetes, if a pod/container
enables conntrack internally (e.g., a service mesh sidecar or network
function), a single application connection will create two conntrack
entries in the global table: one for the pod's namespace and one for
the root namespace (for node-level routing/NAT).

Monitoring the load factor: To monitor the system state (as suggested
by commit c77737b's focus on chain length), a key metric is the Load
Factor: global_count / nf_conntrack_buckets.

I was surprised to find that reading
/proc/sys/net/netfilter/nf_conntrack_count from the root namespace
(init_net) returns the global sum of all entries. Reading the same
file from inside a pod's namespace returns the per-namespace count.

Is this behavior correct? It seems to be the simplest and most
accurate way to monitor the global Load Factor is doing something like

watch -n 2 "awk 'NR==1{count=\$1} NR==2{buckets=\$1; printf
\"Connections: %-10d | Buckets: %-10d | Load Factor: %.2f\n\", count,
buckets, count/buckets}' /proc/sys/net/netfilter/nf_conntrack_count
/proc/sys/net/netfilter/nf_conntrack_buckets"


Causes of bloat: One of the common causes of high connection counts
seems to be the very long default timeout for established connections
(nf_conntrack_tcp_timeout_established = 5 days). However, it seems
most distros override the default and set it to a lower number by
default, like one hour.

I'm also looking at nf_conntrack_tcp_timeout_time_wait (120s) vs. the
kernel's 60s TIME_WAIT, though I'm less clear on the implications of
tuning this.

Per-namespace statistics: Finally, is there a recommended,
programmatic way to get a breakdown of conntrack statistics per
namespace? I'm especially interested in the total number of entries
for each namespace. We know we can nsenter each network namespace and
read its local sysctl, but this is very inefficient. Is there a better
way to get this breakdown from the root namespace, perhaps via
netlink, procfs, or eBPF with something like bpftrace?

Does this analysis seem correct to you? Any confirmation, advice or
correction would be incredibly helpful.

Thank you,
Antonio Ojea
