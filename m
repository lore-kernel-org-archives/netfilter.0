Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A24E12B98
	for <netfilter@vger.kernel.org>; Wed, 17 Jan 2024 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705477773; cv=none; b=YlWKBq4RSATSKRkTle7kwQPXExaKR39M0Joh2dDQu7DLKTGNx6tVEJfWSW/ADJM93XNAxhHFbJWhb9oQ9DH6JM0jmYaKLI8qGgUhCOu94fFwlxBpTc5XHirbG1flcHZHcOD19gJFJybeSr2Rk/fDn3fXGWjK2smIZbDS3IaZQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705477773; c=relaxed/simple;
	bh=dQDro45ci1ThPO3X02HA5SbfxW2jQZX8WoGdxU87l04=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 From:Date:Message-ID:Subject:To:Content-Type; b=hjeZtUF2Mv9hdaLcwdSt11IQTnTj3HtXRDp8nfEiwaTlK6E646zR3Wsn1i70caTc7ogwaUILWKCau9gKCrbNvdLO7CpJ8E13t71kEaI0IF4gDkpj9gZsUUs+P2VkaiTkrGTgF1b/nIz70L4Z71VMvJutLzKW7Eac1IuGsdAFoEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0HbW1Wj; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0HbW1Wj"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5edfcba97e3so113781777b3.2
        for <netfilter@vger.kernel.org>; Tue, 16 Jan 2024 23:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705477771; x=1706082571; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1FbtJp2EtvF2yxEy6G2Vz14XXUOqZ+tORJW1eEgzTBo=;
        b=k0HbW1WjMlI28LCs2RQKp4v+37WkH+UcQvCh6bQeSmq/V67egzRf/XUQIGnpz4yGJw
         DLFCgGPew75ACMte1h2d6XHA7KiCRmg+cATdVwD8WcB1zr0d5MIk+mrXnR7XnH0jJCSc
         jCW/7hGjq2YgMEK4acwAb5T9n5xB6hCrnQLt87d9NQ3En7dfkVEWumGt9JXwuR2qc0tx
         uGU4Jf1u4Eks57amvS50W8FoxJku389/hjYKL5wKUPKGk5AdeREriTLITr7g+vysH7Ga
         xRMafRRpBfxAf59ZJHriMy8/p962WxC7Mp9saWjEnAivK/dutq/NOxVgtgB5knGY8xUE
         jgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705477771; x=1706082571;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FbtJp2EtvF2yxEy6G2Vz14XXUOqZ+tORJW1eEgzTBo=;
        b=IcJLMYNAnxCRf+oPpwhDWZgIuXgFCHBTQPk7AXVxFLWoEKYUi+8xJyXmolC04LN43K
         gCXuNrirkBV5muCn5yBQKV7Fh9/eMrSFJFpfsfxSipYcflZYxjZXITklIBJZBFauVPmf
         5N1Wl00CINrxmhQoh+KX7aOxvAMrHpFji7PR3CY3Ml3vpyoY7Niu2ska34DdCb4xkieI
         4blmj42Se3w9EV8xRafTgRuq4PHddN2JLjy6rPV60+7riOalZhiEXsYU08NMC8Rcl5pm
         9Gvf/vVojwkcYWXfi+7jYH5cBweErY0iTmSrD5nY1mEOmN6n42QGZjgnP+jisPi71M0x
         em2w==
X-Gm-Message-State: AOJu0YyBRU+u4hZMan+Mx+mX/SNNfK97srsUXAVzXh42cX3qAET+uE4A
	5oCIm9mB3wRD1TCu1ZyrSau+NA/ZuQXwtkInJRdHFUvlcMk=
X-Google-Smtp-Source: AGHT+IGFnJGwH1+9t3UW2edJryQZ/iTQnqPAWxw1+FsC7BvQlxDGd/fatfB0TG4zzvIypAbCMshzWOFpfnJRsfrJ+fs=
X-Received: by 2002:a81:9b12:0:b0:5f5:97c6:3f73 with SMTP id
 s18-20020a819b12000000b005f597c63f73mr6134669ywg.53.1705477771017; Tue, 16
 Jan 2024 23:49:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: jadhav vishwanath <jvishwanath66@gmail.com>
Date: Wed, 17 Jan 2024 13:19:19 +0530
Message-ID: <CABP7cfEEnu_Fo+A04rA24=cbXogizArRigsgd+KbVyEPj9nFPw@mail.gmail.com>
Subject: About adding a nft rule to limit opensearch connections
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi I am trying to apply the nft rule to limit the connections on
opernsearch port 9200.
I successfully limit the number of connections for SSH port. used
following rule to limit the same
Following rules are applied on server side machines(opensearch and sshd)

~] cat rule.nft
{
flush ruleset
table ip filter {
        set test-22-count-meter {
                type ipv4_addr
                size 65535
                flags dynamic
        }
        chain INPUT {
                type filter hook input priority filter - 5; policy drop;
                ct state new tcp dport 22 update @test-22-count-meter
{ ip saddr & 255.255.255.0 ct count over 5  } counter packets 0 bytes
0 reject
                iifname "eth0" tcp dport 22 counter packets 0 bytes 0 accept
        }
  ----
  ----
  }
}

Same thing, I am trying to limit the connections for port 9200, but it
seems the rule is not behaving properly, it is blocking connection
(zero connection accepted).

~] cat rule.nft
{
flush ruleset
table ip filter {
        set test-9200-count-meter {
                type ipv4_addr
                size 65535
                flags dynamic
        }
        chain INPUT {
                type filter hook input priority filter - 5; policy drop;
                ct state new tcp dport 9200 update
@test-9200-count-meter { ip saddr & 255.255.255.0 ct count over 5  }
counter packets 0 bytes 0 reject
                iifname "eth0" tcp dport 9200 counter packets 0 bytes 0 accept
        }
  ----
  ----
  }
}


Am I missing any kernel modules which should be enabled, or following
some wrong format?
Also, when ESTABLISH it holds the connections though clients are disconnected.

-- 
--Regards
Vishwanath
