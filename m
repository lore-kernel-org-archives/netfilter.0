Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D653A892
	for <netfilter@vger.kernel.org>; Thu, 10 Sep 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060058; cv=none; b=J+IRp3tjOmXF4tWmFI+0HhwVvEGQBKuFaLvwF1XcpM1HcWvbgC+7d2m550wo7TQxn8BPliWAzQvX6zS1zT7Db81KCaXTPv1GZs4nLiLzdflExbcw68ouLqzCyvtgXTcnAV8MoS+6Vx+SDqJZCxi6M3uswaFfDQ9UrChbdOmoAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060058; c=relaxed/simple;
	bh=a9rHouGq/eDXLFMLajJbKiN8RbO9x3WDTn/butxOeGI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ADMw6uQoxtg/Vgc0g55ta42DU+isKIvaCi7aiPPeGJt3Gc3avais2DhfAOrO+lJjNjqknOlqF/pgUjZhSK1WZrSnQl2ue6CZW4p1CWs0e6ym2kJCHdMKZOHuTpIejZ09iQdDEW99KT1hABFB7n8lAif3Rl8YtfGuf9FBQv9Y98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pi89wNOt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pi89wNOt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b76679c0f2so20635e87.1
        for <netfilter@vger.kernel.org>; Thu, 10 Sep 2026 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060041; x=1789664841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lkQUaFsXvTm7dXPu8NfGrytzOjremWbqyvr0VCOpAYs=;
        b=pi89wNOteK/KC6yoOfzBg4V6cVM0bqSlz+ZgwLH4ZD055HkHhAmuAZR0Nds9detAGU
         4V+cHt2Xs7SY5jO+paLt+J5i/ZhDzzYlXxRAt8zHoeTg2+pBZUMxC+igvW4ewYleP0GM
         pV2WnO8kUDdPBkFwgbnaWxj34EHWOiogtKZZra677RfccLotkSQnBWRQuG5RWfhokY8M
         cQX7ByC13o0V6NezLajdwkz5WaslyuNuOaz2GrA5nVMH/KsdOxSpMpBuzSfYV2eZG95N
         FcsC5B+DypuPU+mqX3HJAIbhp0beCd/D9WlLJkWuk0aFe7nN2OfhmipjP80rzhbUg/7j
         CV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060041; x=1789664841;
        h=content-transfer-encoding:content-type:mime-version:organization
         :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lkQUaFsXvTm7dXPu8NfGrytzOjremWbqyvr0VCOpAYs=;
        b=PRl1mjyPvhZImMDZ8Shv0zpAZcYfxAsQu9heJTlfhFurOACTXL8m5b3BmMO44SLplz
         iQ9MhfkzLHVazXfbg1ijybKP7gYNxwSydcfWATJbvNEp0+cpqXr0v0eINkcrw851VPJA
         tjsyEpKwsnMhonWWxXN+JsHtC4mtnSv45szcDjD9NdP3mS47c4JBG0qDQQk2BxuXHmgq
         hbTu4sS7dVy8NXf0vdW0piAi2OBUZ/j0EOyQIJvpPeysltgMAtAfk5MFvQPdPUUhiWBj
         ZuEbCqTRXOFer8u3pZTD3Y0BpU4irbg2eheTEBHNjTj1UkhsfyPuHn0jjiCd0DiP3+wp
         14CQ==
X-Gm-Message-State: AFuF++mxcyN/8Tq6PuqY1RxYoGu1pi1fcoPhgL/XHg3qrOClFDsRPdDC
	5j0MUTFMSqXX7p024FtPJF32y0OJpe8qKnVtv9nt/hESEmDsh04XXBw7Gl8HoQ==
X-Gm-Gg: AYBFou3TtPaaH8IOZhBrFV3amkQskrePZOP6bEvdElSmF/1O++DFZvSTBK84+PUbBWL
	KkRirbDwvsIKgNo+mVmjVbxkC0b/taVbtaLIIYxwMlzT6g6fb57oM03cG/tog2xJvfWqhUE7ehr
	ErN32E41EprfFHRDsr+YdgpOFwzsbEN7jPSoEPlN/6hehUPPPGKvccLPyKI71E1j8j/wSxkrYSS
	lwNxteU3W7AE/5Ms/xjKYR2ottTWkMhsBjco6qCDD9HiRPd5O/5gNTxYTXfMS3LUZ0mtnGHvy8E
	X35uQpykU9LETacwp2o9OIAVg4mcHnO1/RSg7l51paYTOJerjb+w6X3WBQOpsIqE2vwYWwk0Uy8
	9mhIQGoeLBCWdy4dlp+xVFtb9OxX/PUfmOFq+jHXZyiVNKFB8xcyVHUT2YuCBWsInyh/N7B7N/a
	6mDjtdrqzqB0BvF1Zhy/SKGmT57n4LFWcdu9RcTuKvxgQhD6ZxZvDGqnzJGQs9nH1u3Rs945ix6
	qJAI2/RlZbavbUrkvjs4LSUSdLwBBlQ5+ZcrlcEGwdBYl/DmqjJ
X-Received: by 2002:a05:6512:4009:b0:5ae:b88f:311e with SMTP id 2adb3069b0e04-5b8a029e7ebmr94592e87.15.1789060040709;
        Thu, 10 Sep 2026 10:07:20 -0700 (PDT)
Received: from devtravel.lan (84-40-219-117.cgnat.inetia.pl. [84.40.219.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33822e8sm819821fa.41.2026.09.10.10.07.20
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:07:20 -0700 (PDT)
Date: Thu, 10 Sep 2026 19:03:51 +0200
From: "Kamil Kwiek (irritum)" <kamil.kwiek@gmail.com>
To: netfilter@vger.kernel.org
Subject: [POSSIBLE BUG] nft: src/rule.c:579: scope_release: Assertion
 `sym->refcnt == 1' failed.
Message-ID: <20260910190351.38f2aafd@devtravel.lan>
Organization: None
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I was working on some firewall rules and needed to reuse couple of definitions (more precisely group them into other definitions).
I tried using an include statement pointing to a common file containing definitions such as 'B' in the example attached to this email.
When I included this file in different table, I started getting errors like the following:

...
nft: src/rule.c:559: scope_release: Assertion `sym->refcnt == 1' failed.
...


01. Anyway, the minimalistic example which is failing for me (content of test.nft file):

flush ruleset

define A = 111

table inet test {
    define B = { $A }
    #define B = { 111 }

    #chain c {
    #    meta iifgroup $B counter
    #}
}

As you can see - there is only unused definition.
I would expect it will work/compile.


A) However:

$ nft -c -f test.nft
Doesn't throw any error.

$ nft -f test.nft
nft: src/rule.c:579: scope_release: Assertion `sym->refcnt == 1' failed.
Aborted                    (core dumped) nft -f test.nft


B) When first 'define B' is commented out and the second one is uncommented, then:

$ nft -c -f test.nft
Doesn't throw any error.

$ nft -f test.nft
Doesn't throw any error. Rules are in place.


C) Finally, when the first 'define B' is yet again uncommented, second commented out too and the chain related code is uncommented:

$ nft -c -f test.nft
Doesn't throw any error.

$ nft -f test.nft
Doesn't throw any error. Rules are in place.


02. And here is a minimalistic example of maybe my misuse of 'include' or/and 'definitions', like:

A)

define admin_iface_group = 111

table inet mangle {
    #include "/etc/nftables.d/common/defines.nft"

    # Normally below code is part of above file.
    define iface_group = { $admin_iface_group }

    chain PREROUTING {
        iifgroup $iface_group ip6 dscp set cs0
    }
}

And this seems to work.
But when I get rid of 'iface_group' definition and uncomment include then it starts to fail.

B) Another approach:

define admin_iface_group = 111

table inet mangle {
    #include "/etc/nftables.d/common/defines.nft"

    # Normally below code is part of above file.
    define iface_group = $admin_iface_group

    chain PREROUTING {
        iifgroup { $iface_group } ip6 dscp set cs0
    }
}

As you can see 'iface_group' definition is no more wrapped with {}, on the other hand rule containing 'iface_group'
was now wrapped with {}. And it is failing.

C) Next:

define admin_iface_group = 111

table inet mangle {
    #include "/etc/nftables.d/common/defines.nft"

    # Normally below code is part of above file.
    define iface_group = { $admin_iface_group }

    chain PREROUTING {
        iifgroup { $iface_group } ip6 dscp set cs0
    }
}

Just get back {} in 'iface_group' definition but at the same time leave {} in rule of PREROUTING chain (so {} are used in both cases).
Now it works.

D) Finally last remaining possibility:

define admin_iface_group = 111

table inet mangle {
    include "/etc/nftables.d/common/defines.nft"

    # Normally below code is part of above file (other defines are there too).
    #define iface_group = { $admin_iface_group }

    chain PREROUTING {
        iifgroup { $iface_group } ip6 dscp set cs0
    }
}

The include was uncommented (at the same time comment out 'iface_group' definition), and {} were left in rule of PREROUTING chain.
Now it's failing.


Additional details of environment where it was tested:
a) gentoo: nftables 1.1.6 and libnftnl-1.3.1, gcc compiler was 15.2.1.
b) gentoo: nftables 1.1.7 and libnftnl-1.3.2, gcc compiler is 16.1.0.
c) archlinux: nftables 1.1.6, libnftnl-1.3.1-1, that's original binary upstream package.


Maybe there is still some problem with [1] or I'm doing something really wrong (all fails are this 'scope_release' kind).
Any insight?

[1] https://lore.kernel.org/netfilter-devel/20240115132718.24150-1-fw@strlen.de/

-- 
Pozdrawiam/Regards,
Kamil Kwiek
