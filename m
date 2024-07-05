Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E973225A2
	for <netfilter@vger.kernel.org>; Fri,  5 Jul 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720196298; cv=none; b=qPGq+Hax7gE500s8yHxcEzJ+IGI2eUd8stF1CNPQ0Qfgr2VUcNQu712u16S+gTpvSmp+6moQPQZDqrkMmGe9xNQlx5ULYz/B9fkCtr2HSGQKbgOLzNuXuF4Jg2QLB0uwuSPeL9QLchB+R3ImGj2K3BBtbhzJwPk8W6DdfPIyWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720196298; c=relaxed/simple;
	bh=/q/iLS8Txo5KRO+DttYmoeKoTzBfGbwHsBuDsbrRV0o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=M4QFP6ZxuoPq15FsHOo2bUBPX03tutZ5qlry6CQ5qzTMtko7eBD4uayhkT8FHKsXOQMZY08tLnul/Fs40ohA2AUDS+SmvSvOeQseH9ECCZuoGDCq6CRlDYMMI18KOWccTwl3Iof+qpJNuBpgGADy1mRr4Yb/0qsr27VhF7HlyJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvAHpoDw; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvAHpoDw"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-75cda3719efso1043386a12.3
        for <netfilter@vger.kernel.org>; Fri, 05 Jul 2024 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720196296; x=1720801096; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/q/iLS8Txo5KRO+DttYmoeKoTzBfGbwHsBuDsbrRV0o=;
        b=KvAHpoDwoq0sTOJoowbWhjf81oB6kPdxKERHLgNHLvhsaltsGLbnQYtrfs5ABT1eiI
         HVgaYmg3kA1vYvdxtE2w+C3TIzj+xlTRMKDlymOgpJ5KFPX4d7YrSL5jfuKMkZYFgIHP
         2gbgfgg1YnkTLrk05jjVV2Bc6r7+k3jKzKI2x8ZceuBbqlTrgRRMFAmbb8+BIO2vTP3s
         pc3xO8we9Zna4b4gs5rsMva4Y3lRprAXN7qyN4uesbf6jzr0xclZ0RE5IGohBwWPAZ6B
         fqqXMwLzq3wFKY57BomgabvIfDN9Ie0k7eUG+2p5AEe27EboUPjUB5mjywnoFiJbEsrL
         Oq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720196296; x=1720801096;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q/iLS8Txo5KRO+DttYmoeKoTzBfGbwHsBuDsbrRV0o=;
        b=Ed2uzQYWpDpycX+EibBVseahTJmezJE/NIuAj0nuwH59KNnKq+r0ia95eegccsmPZB
         YbXeEdJf7iz/VXHFrQS1ZEXPLTJ0M/eUER0RYcfgPwGO40QTQ3F2zE31TljvqTL/z82v
         Qh/5ZUOpbAvKoPjZc5rGoRN3XDdXuo+Oicj4QUOVLJj/b5LeqraJOaB2BBoRRtjwz9Q1
         DVPkneNPcozVe7cpI3IOOCsoSt75zO19wYsj68R8ygJDqbQsAI8oa0drouUzY157QZhd
         Pe57w0HuHHMqcUNKuYTwnPKM+QvqVPsk+ZFtpOZMe+CyV8hyht0/JXuJTGeoHVepz99R
         s/aw==
X-Gm-Message-State: AOJu0YxBHE46nwY8hcndr+Vqq+Cc+DJh0wN5kaXPjp39n3VBwQ/hsg7T
	AV3VzfmSAlT7L3XuKQhsVKpngXMyFBipPc5L4PZaSR6/jMdTBd1KPZzqnomdMXMFgoxRt1G6o9u
	1r4WJcb8s+kzoZF02S7rjzfdIpqFRtSFG
X-Google-Smtp-Source: AGHT+IG6GtSwDy9Ynfm/mbj/slcYuTX/tNSAgjxuuRWCtatFRsiHKsz/10tAiwb2FWZJbphSPrfnGXm2VMVai+QBwWE=
X-Received: by 2002:a05:6a20:3c89:b0:1bd:2944:d28c with SMTP id
 adf61e73a8af0-1c0cc8c95c9mr6024416637.49.1720196296343; Fri, 05 Jul 2024
 09:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanislav Tretyakov <tsv1991@gmail.com>
Date: Fri, 5 Jul 2024 12:18:05 -0400
Message-ID: <CAOhF=5oKNEdVr3RCLq5444vX+tK6j_v8KaEj8q+pTJa0WWOnow@mail.gmail.com>
Subject: Does Nftables nft_fib check fib only in the main routing table?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I'm not sure if this is a bag or configuration issue.

We have VRF vrf1 and interfaces br100 and br999 as slaves of interface
vrf1. Interface br100 receives traffic. We want to make a notrack in
the PREROUTING hook for this traffic on condition that it will be
forwarded to interface br999. When we add rule "nft add rule inet
notracks PREROUTING fib daddr oif br999 counter notrack" we see that
nftables checks only main fib table. I think nftables should be able
to discover the VRF master interface for the incoming interface
(br100) and check the fib vrf1 routing table.
