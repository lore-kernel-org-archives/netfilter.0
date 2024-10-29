Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA118DF86
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215040; cv=none; b=eSx4xQGPd63M3GoK4FzR2mpukjmb48kh1gypkuo9weDZZUkz+NkhR1g6Oet2KGLq1Gd8SSxKarSKsoIHNnidd6d1wKqGRv//HWZOTDCAg/ULnQ6h7SgmHu2aAo/QyxV0PGEejsyEL9G6znII3BURhbUdeU46OTcQ+Ah/AoJuxeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215040; c=relaxed/simple;
	bh=vKTq+KTuLMTe0J+givWxu48wSy/6TGfy+UgcI53ZiOY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UC10I6/PZgzcSVQv4HCBmJdscA3Etaj/iz+dULBUODyk1gj/10lU7ksbSmq4oZMBjvGSxW6sc53vTkhufQuttTMdNZmw6Yn9J6ohaDwBhU/wWLUt1gtix++i5EZP4t67P8Mc6ZJbk2kzWRzB0xErvqmbEeqMXxwwd+ZJo2vRDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=b4GJPDRJ; arc=none smtp.client-ip=134.84.196.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="b4GJPDRJ"
Received: from localhost (unknown [127.0.0.1])
	by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4XdDHl6hx5z9vn4J
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 15:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7omIk10iirB for <netfilter@vger.kernel.org>;
 Tue, 29 Oct 2024 10:11:47 -0500 (CDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4XdDHl3thZz9vn4K
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 10:11:47 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4XdDHl3thZz9vn4K
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4XdDHl3thZz9vn4K
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99fc6b0f19so59344366b.1
        for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1730214706; x=1730819506; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JWS5y5ZxR9PvmjKhpAwQZwu82XaFwSuoP/4MYwfjkvg=;
        b=b4GJPDRJjIrv9qcHb0c3nx6xw5RK+Te94wSUTI/bi0Z2e12ZZq7cV+R9ZOvBDpewYR
         1AGNI76zoBodbPGuWnC9zGUWSnCezmqeGqZc8VZ8y9IPs2tKm6uh9Kb9+tDgji0otzf8
         YsOBiZRucby5PSqRvQT/jeFau/kTWniFRcWxpPHPFBlD7s1/nPpjS+R/BXLSYGBSQJCd
         1kWfd/b1DnRc++e78bJKQP1oY6+x0LXq/xG7wuolWY87WHhmhDWgsHg/lRe5Zs2/3vVJ
         /kY+c0eiyOzc4ddzOCd2GHvEN34d0M2wFTIkn04xloDzzjOEFobRCV+Yb/rb2pfKt3uT
         e1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730214706; x=1730819506;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWS5y5ZxR9PvmjKhpAwQZwu82XaFwSuoP/4MYwfjkvg=;
        b=CzjOy9oWj7QzzwT5EDRHep5wKwOR0PNVg4+NQHj9iPEqiC7g0aHftyiPfhncwNjxh5
         o280uB2NHoQ3LeiXsRhLpC6Ybbr5FA1rLe7CbBKqklm9Y57SJdeMhsRKVF/ry7gCPQ4h
         qscqc10EsseAxHuBVS8UBowry/G33n0byS/5NUWxHdTyGj7AnRrK6de3dkATFPPbd+sH
         bU1RcT6TnThDJo+VhHZ1mM0Vzd5G+N5772US7CDniGBexTjm0DcznB9GocYvV3roKxyJ
         V3WheQa07WnT2RAFKXEIWL0sCjZJilTQPsqnKPjq6QU9CsVqCBD6Oj/ayPKz5znZtKVi
         vEDw==
X-Gm-Message-State: AOJu0Yz28AiogwVHEad+K5Y99VZlU1zbyS/LMffbiTbmeQTVfTGoCsv4
	ale+lpZRWqeOSFUQtmxS2QKTC6A7+9TF8UKEHzmQpJ977aZyZuwr3cNAyxShcFyRDAMhQErHHyF
	2Sbvqz0qWaERoosu7AoeTfBYdncbeoB/kiV0kaIraLqU6jU4RYrU5B0fnIjoQHtfkr8k1P21l0J
	ZYZ3RmjT6XTmFhdf496TIqNwYpRTKxTpryag30HlxqKYqQcb65
X-Received: by 2002:a17:906:794a:b0:a99:63d8:a1d7 with SMTP id a640c23a62f3a-a9de5cea4camr530566766b.3.1730214705915;
        Tue, 29 Oct 2024 08:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjBKnJVS2Wwli9OweHJiFnu0BkM7jcoG5PiJ6jejNxsnwOgndqPtgM6zaokTGvSoEOksRyfSwZOW42PLb+tv0=
X-Received: by 2002:a17:906:794a:b0:a99:63d8:a1d7 with SMTP id
 a640c23a62f3a-a9de5cea4camr530565366b.3.1730214705460; Tue, 29 Oct 2024
 08:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Tue, 29 Oct 2024 10:11:34 -0500
Message-ID: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
Subject: connection tracking and kernel dropping packets
To: netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

The kernel of my DNS server is dropping packets:

kernel: [48074703.302657] nf_conntrack: table full, dropping packet.

I've followed this knowledge base article:

https://kb.isc.org/docs/aa-01183

for configuring iptables to not track the connections of DNS packets.

...but it is still dropping packets due to the CT.

I know I could bump the conntrack memory, but I'd still like to know
why my iptables rules aren't sufficient for not dropping DNS packets.

I'm running Linux 3.2.0-4-amd64

Here are my iptables rules:

# iptables -vnL -t raw
Chain PREROUTING (policy ACCEPT 24M packets, 2112M bytes)
 pkts bytes target     prot opt in     out     source               destination
  16M 1153M CT         udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:53 CT notrack
3723K  701M CT         udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp spt:53 CT notrack

Chain OUTPUT (policy ACCEPT 24M packets, 5436M bytes)
 pkts bytes target     prot opt in     out     source               destination
3760K  327M CT         udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:53 CT notrack
  16M 4680M CT         udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp spt:53 CT notrack

# iptables -vnL
Chain INPUT (policy DROP 45173 packets, 2842K bytes)
 pkts bytes target     prot opt in     out     source               destination
  23M 2065M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            ctstate RELATED,ESTABLISHED,UNTRACKED
   11   804 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    4   284 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:53
 709K   37M ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:53

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 24M packets, 5439M bytes)
 pkts bytes target     prot opt in     out     source               destination

Any ideas what I'm missing?

Thanks for the help!

-m
