Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DC1DA10A
	for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729160811; cv=none; b=AjkO9kSvqJA1Sgp1UwkV8Cy1TZZ7ClGXNom9cldnP7x3VRrG9psH2Prbo5EBdChMrfpWGOY1l3naVe8gIJQryJXryomitHdVLbr21bKcxcO9ADROuhhSTRND6/LuCfZE869pjeq0rhl8KNYaed66dUatnxjWKuu2lTdK+E4wKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729160811; c=relaxed/simple;
	bh=dZBOLSpu0rRrjFnA/OSWNAvavg5hLWUl/j9RL4k9Tcw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oDzSZYVSYyJnTG8BDFgyK+5iChL3LsrDL+tk5wPzlQRVgNL+VLLDtIS9QFgbxy55IqSg/4gzA74f7CcMDCn1sHeG4CgUlGRnKNQDDZli60gZdjk4QKQLnxT+ZgTL7sLedhGOGJ9NMxpxAraldm66zGZWxRyD5k4P4o/t53Kx7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gV/FOQVd; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV/FOQVd"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3b8964134so2947765ab.1
        for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729160809; x=1729765609; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BWQpI6jv7XKT2460ht7abw10SB1cY4pEGw+TfpaZXFg=;
        b=gV/FOQVd9+5RBfU9zTFnK65+XscfYxAFRe2PF11pwqtskY3DTqKwC7THmFxhXQhHhq
         ccC//UDGsM/qsfw7mPxMq1+5dWDOfbJ8VFn3UUIspS6ivwNf1LEo4mmNuQNjt54Ef3C5
         5dNvGtg+uG0JjEJ4YMd+wdbuQx9PJ5DfpfBbeKkMIxvRmkIOwBIgT2X6d1lmfiKlKpH7
         3u7VQQv9EdKgMUOWEAtC2OliFDHYUTQeA3WGMX84d1aMAatUjCN2oYlDgGxcGS/Fg/fx
         tnyjx5rhO3VozqHmm2DSFNhufApJIJv9qnYm1kKTaPAnld9P570Lv3xHV/7zfoGyYHun
         s9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729160809; x=1729765609;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWQpI6jv7XKT2460ht7abw10SB1cY4pEGw+TfpaZXFg=;
        b=m5LSUW1NWWPFbjeRopV9f1UHFBFBpwlw6/vEEpItwY7mPW3BMPtw5oixg+R3eglCh/
         yxjaK2foA1FleBS2K1CrHykUGGwNgJUrgYHBgQKj2IQA5TtG9sfqO22AJHWBbMUfz3UO
         CfcXZ3+VacRTfcOqShjS+wIqztx40iz4RtmZkgbqg6fEBXmIvJ5h3QA5/uUQdanuK747
         rn+JldAxvz8+jqkunUJBpfIL35mLc3brnELq7RAhnemSXN4CohF1+6T4BK1/aEEYMpxc
         ZsvfcsBVm2vFsXbG5vy7f4FZvXibBzDEh8LF20z4kJT2egChCMinY5SF6IUddkWYznD4
         EyVQ==
X-Gm-Message-State: AOJu0YxCA9HvjEiWFr5HFRKmW36llNNVhSk3jnz9SuETda20urnFvlaU
	gKBk3bIXkE7ZOpna9669zVScT4WIthjRGRTWGrtlnaOqw3zElgBZ9hb+o6ZNpHeIvALQ2iCsHVF
	fEa90r5NxlDKGV5VlHTtpNz88vnjdXzmjhtc=
X-Google-Smtp-Source: AGHT+IEFJqrM4Mqi/9NaPdosCWCV9BwWcJXLpCWT5R9xGxBvfFQFIcPBZTQ2L961z4+99gykUJk4fEIQdArKTgsP+CU=
X-Received: by 2002:a92:c267:0:b0:3a3:b45b:fb92 with SMTP id
 e9e14a558f8ab-3a3bce029c1mr150383785ab.23.1729160808754; Thu, 17 Oct 2024
 03:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Thu, 17 Oct 2024 12:26:12 +0200
Message-ID: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
Subject: Most optimal method to dump UDP conntrack entries
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

In the context of Kubernetes, when DNATing entries for UDP Services,
we need to deal with some edge cases where some UDP entries are left
orphaned but blackhole the traffic to the new endpoints.

At high level, the scenario is:
- Client IP_A sends UDP traffic to VirtualIP IP_B --> Kubernetes
Translates this to Endpoint IP_C
- Endpoint IP_C is replaced by Endpoint IP_D, but since Client IP_A
does not stop sending traffic, the conntrack entry IP_A IP_B --> IP_C
takes precedence and is being renewed, so traffic is not sent to the
new Endpoint IP_D and is lost.

To solve this problem, we have some heuristics to detect those
scenarios when the endpoints change and flush the conntrack entries,
however, since this is event based, if we lost the event that
triggered the problem or something happens that fails to clean up the
entry,  the user need to manually flush the entries.

We are implementing a new approach to solve this, we list all the UDP
conntrack entries using netlink, compare against the existing
programmed nftables/iptables rules, and flush the ones we know are
stale.

During the implementation review, the question [1] this raises is, how
impactful is it to dump all the conntrack entries each time we program
the iptables/nftables rules (this can be every 1s on nodes with a lot
of entries)?
Is this approach completely safe?
Should we try to read from procfs instead?
Any other suggestions?

Thanks,
A.Ojea


[1]: https://github.com/kubernetes/kubernetes/pull/127318#discussion_r1756967553
