Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCEF8635F
	for <netfilter@vger.kernel.org>; Sat, 26 Apr 2025 21:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704589; cv=none; b=OC/JiDv3HrQHnqvdFFWJ6aJUlflEGroyDNp0yMshwig+b/y9uRvtwj8hXc/JCNarO/6xN+qCzf10JRTO94IK+nHR07xN7YnKC2egO9iNNXUJwe08KCtN9JWxOgvcy+yjDdhE6KGCX4w6L9BKbcYRz0/Olgg0KjPBnJ5sXu3ByOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704589; c=relaxed/simple;
	bh=x8HeijfTb3nXBaSeagsdIL1wEi6KZp5XezqXTDth1zM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cEbCRhBgZKk545kLFIMEJ4V6smO5UTCNLlLnjySMaJvsQ/guPgjFKvHVcmybiGhr2uL/xyxr8cd+9auptlF4GlMSsGQujDP2zxuITWBsdKb0C7MECsKUOUn+YvInrbmORI09QPJ1hEPj5Mnz/lVchhxCwhrdStubw3oW7B5M8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA/2D0Zq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA/2D0Zq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4965947a12.3
        for <netfilter@vger.kernel.org>; Sat, 26 Apr 2025 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745704586; x=1746309386; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x8HeijfTb3nXBaSeagsdIL1wEi6KZp5XezqXTDth1zM=;
        b=PA/2D0ZqT9aIQ89HB4mYc9Lb6EsiSaqfUNvjOUux8Zt1KWB+F0J+3CeCguuk43+yPx
         OAFbvPkaeIZeiIyABlje56GMwGOomE7s7/QDHFw8Osi2bQNEIDKVSneyVZTVFEnDu41/
         tWyWmzeSq5wzt0WXqkHamSGus058U4QA3FJMoVrIKRqJ8JnDZzn1w+W6YsKb4LX1rTry
         Hm7ubYQRBX6i44TYDQqGmWlN71SpA541olUIzyutpTvc1ILYa0Rhh0Ubl01FcsHlTYIr
         hmzIEnzKGFsPS2S+2qjCta3eCN9fGYOkvFnp1iCF+XMDYYGmxV4VERvKJ7R9U4Z3Hg6U
         e02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745704586; x=1746309386;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8HeijfTb3nXBaSeagsdIL1wEi6KZp5XezqXTDth1zM=;
        b=neru+ucCR02zTpkHd+eYH6TFAWqThB4AzYr3sg1pKEVjIzXP+Z5S42gOOv1oz23Pt1
         zJAZG8HH8p5VWQWpOJTvD1QZEzHnjHMShvOUbOBJsjn1V8+d8aQME/eCGmC85OExy5AR
         cye+a9GvEX2v+Q34bAo/itY9418zQ902WLWHkLguJcE/pv7UvTlJ32rFE4w42BZBUXHu
         8ZbwI4LWqK+0hp9MW13BhBGCte46xZVDv1cBnRkJlNsWJ5E835lyhkitI53XonX7XcJs
         FcgmXATt5cl+NSGujUNupysHX24TFX7NyngH2Q/mAyffJo6dzGlg75+CGdy4S0hJjaDG
         HT7g==
X-Gm-Message-State: AOJu0YwejvUSNflkd0lhTED68kyjN4sfQgyeMhezrnD22pcFvPi3ptWv
	VL9Ai91ahs9FFPtd8ZuPPZUskXLZVjPfQ/T3TY9L6wIxE6vAMhuMVpAZG/6NwbUanqAjZckuedY
	vbjZZz1PFcX+OucHgdxlENWSScfpHjIqn
X-Gm-Gg: ASbGncsCddJwyrslVvzZjoeT1jIaoVD0sOiJuvzHtkPtBPO0ePBlj+4F1jr+EpCFpdo
	wJTWEKp4IZgENEmjaeWlmDxGXaFbY+CT5UTt3HD2cr44SltR0wuivancI5vMlSSpoSqwmXov65I
	laNw2xPgf38tAIjqD5H2zG
X-Google-Smtp-Source: AGHT+IEeHaeor5U0FGElj0Pedymr3f//xZtoHNCrpNHXYOcq6rFaLaVsokwcGetXJZKRtW8MXSsD1oH2OR/wQgKHLCQ=
X-Received: by 2002:a17:907:9725:b0:ac2:49b1:166f with SMTP id
 a640c23a62f3a-ace84b4c0b9mr327905166b.52.1745704585501; Sat, 26 Apr 2025
 14:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?UGF2ZWwgUGXFiMOheg==?= <pavel.penaz@gmail.com>
Date: Sat, 26 Apr 2025 23:56:13 +0200
X-Gm-Features: ATxdqUGpP1X-YguK9pB3hh3M0aax0uItSlVDjdlWBsOwm3YhTjklqKP3tFzeLYM
Message-ID: <CANPmkQt-P-yW+oEA=m-dvJ_dP-7yBOzGNgMRO6ppUPLgMVdcgw@mail.gmail.com>
Subject: Vmap lookup transiently fails during atomic ruleset reload under
 load, leading to rule bypass
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear all,
I ran into a reproducible issue with nftables, and would like to get
your view, if it is a bug, or possibly a design limitation with atomic
ruleset reload and maps. Thanks in advance for any feedback.

When performing an atomic ruleset reload (nft -f <file>) under heavy
network traffic conditions, nftables vmap lookups appear to fail
transiently. This causes packets that should match the vmap rule to
incorrectly bypass it and hit subsequent rules in the chain. This
issue has been observed even when the atomic reload uses an identical
ruleset file to the currently loaded one, suggesting a race condition
or transient inconsistency during the reload process itself rather
than a logic difference between rule versions.

Environment:
Kernel: 6.12.20+rpt-rpi-2712 (uname -r)
nftables: v1.1.2 (Commodore Bullmoose #3) (nft --version)
Hardware: Raspberry Pi 5

Minimal reproducible ruleset:

#!/usr/sbin/nft -f flush ruleset
table inet main {
chain forward {
# Forward chain with accept policy
type filter hook forward priority filter; policy accept;
# Rule 1: Accept all packets with specific saddr via anonymous vmap
ip saddr vmap { 78.128.211.42 : accept }
# Rule 2: Log packets from the same source
# This rule should normally NOT be hit due to Rule 1
ip saddr 78.128.211.42 log prefix "VMAP_BYPASS: " level warning
}}

Steps to Reproduce:

Save the above ruleset to a file (e.g., rules.nft).
Load the ruleset: sudo nft -f rules.nft
Generate significant, sustained network traffic that passes through
the forward chain and originates from the IP address specified in the
vmap (e.g., 78.128.211.42).

(Context: This was successfully reproduced by initiating a
high-bandwidth download from the server 78.128.211.42
(speedtest.cesnet.cz) to a client machine (LAN_IP_ADDR in logs)
located behind the nftables host, forcing traffic through the forward
chain).

While the heavy traffic is flowing, execute an atomic ruleset reload
using the same rules file: sudo nft -f rules.nft
Timing/Load Sensitivity: This issue appears sensitive to timing and
load. It may be necessary to run the sudo nft -f rules.nft command
multiple times during the traffic flow to trigger the race condition.
Monitor kernel logs: dmesg

Observed Behavior:

Occasionally, coinciding with the execution of nft -f rules.nft during
heavy traffic, log messages matching Rule 2 appear in the kernel log,
indicating that Rule 1 was bypassed:

Apr 26 22:37:23 hostname kernel: VMAP_BYPASS: IN=wan_if OUT=lan_if
SRC=78.128.211.42 DST=LAN_IP_ADDR LEN=1492 TOS=0x00 PREC=0x00 TTL=58
ID=2432 DF PROTO=TCP SPT=443 DPT=58956 WINDOW=294 RES=0x00 ACK URGP=0

(Note: IN/OUT interface names and DST IP have been generalized to
wan_if, lan_if, and LAN_IP_ADDR. Hostname generalized to hostname.)

Thanks!
Pavel
