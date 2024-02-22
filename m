Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FFC482D4
	for <netfilter@vger.kernel.org>; Thu, 22 Feb 2024 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708616094; cv=none; b=jPlMfVOKCvfdmV/30eq0RtXsIUyRsqNX5Svo6RqBtdVEz1VM9ngp/JxSGCVRyz0Huxw1BaRPaYojJtDjF87asDx6LVfpbtwVz2naS0SfZheP6791F6+F0oL2dXMeL9seLSuJgW025w1avVrEYH5CnpXC8MaDE4HFgbEl0ruE25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708616094; c=relaxed/simple;
	bh=HVkp9qWN+PvWrm/Pr54JoUycyGAeS8g/O16MmR90QnA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DCpeE/NqnbH1onYx5URvtwz0ZO24lA1fAH5ao1hZn+WBSl96y4ugYBEcy56218f8myPrIm1qSu7gVfe8T4vC5guwgcpBBVoSOK/OBOKWVhgMBzo6VB4tf/EkDiAojyEHLeiGl2/NnkuhrW4u/fw6rjdzM4WQwIuvLYw8ztgGStg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE/3G6vx; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE/3G6vx"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-364f791a428so27396435ab.3
        for <netfilter@vger.kernel.org>; Thu, 22 Feb 2024 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708616092; x=1709220892; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3pCZokD3mF+/Ija34ibS9GmtJDwsoDnexirteuzjJEA=;
        b=eE/3G6vxevOQ1yQ7cm5peSzPocozB2BC9JCKPaa5FQAoo5q0hXnW5NVQBgFRTgzFHI
         t469V4FOu8swi3TgzBkAUmmiwTAohVFuzgkoaRwGJDYoDdv9gOzipEBaAU8tkmJTLjAn
         jRxJ+xr1wavRTBvbG7mHM2WWDdCXqFVeig5WwXNx/qtDeE3XD7JnSuc3ilRaV9+SGqMs
         GbtRi492+oN5YZhLXadZj61cu6f+lF8xMKR7A1nMOdlCf396CS9dWdPVpoj430fImwlE
         aZWyU6DnMkjTwXUECznrLsUHQYBcDoKGNAb4Vk7PSEs9NGMXo0Wll0Ss8KFLY/wqNdJW
         eNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708616092; x=1709220892;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pCZokD3mF+/Ija34ibS9GmtJDwsoDnexirteuzjJEA=;
        b=kCD+HNKti4sUke8aRav5L/9oiJCcjcYGJXzJaAv6ecHl4GWcyIHGapx6nJNhcVZAUR
         RXxNvUwaUEASMT2jJuzdZRaVTRDYvTxeIJ7s97Yeel7yHL/cMhTO68/qR6E7T5/z/gCp
         7FomWL0PW40R56Jgybq2izfu+AljOM0wXGWjUvwEQIYKoQFoM2lfO/QNLUWgRfXKk/m7
         5YV42t0umlMyJTW1QHqkNCoOu/DYYa9ej3CxxojWKMWIk85NZs1p4C8g4lL9oFAxTrCU
         hIm5xLp559oYbxJcXZn3X0e5kbDqlI+9O/rx3DYrgyvB+hOzWsPxWexDt/zphViQvP5/
         S/Mg==
X-Gm-Message-State: AOJu0YwLLYTcbE9/ISEw5FTnweBS5SmeWC1F7HrWazC+ABvJrPSiFgcK
	RzYos8jcXj4DiOJWd/FFnzj3jWXN+8Mq/K4QrYA3Isk+AbSxriEGXwd8ieYLp7v976CvxVCSFO1
	c/YDna3Alm7ztM+3afoL7NDtoJV1o8UMEiRoguw==
X-Google-Smtp-Source: AGHT+IEWvRrgezv3bQRSNElHpIx7kNKhUYP9pfPPUGxWHQmLdtDKjuRQZp6rcANDvgAh7SvgTSgTV/Q4/Q2TPdVDmqQ=
X-Received: by 2002:a05:6e02:216b:b0:365:245c:6c9b with SMTP id
 s11-20020a056e02216b00b00365245c6c9bmr18827965ilv.13.1708616092332; Thu, 22
 Feb 2024 07:34:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Miko=C5=82aj_Pisula?= <mik.pisula@gmail.com>
Date: Thu, 22 Feb 2024 16:34:41 +0100
Message-ID: <CADnfWnwPjtxx3pynh7DnozHA2hwFTvFmPvD_4kOKfopPGqTR-A@mail.gmail.com>
Subject: Nftables conntrack state matching JSON syntax
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I have these two rules in my firewall:

ct state invalid drop
ct state { established, related } accept

When I use this command to get their JSON representations, i get the
following result:

# nft -j list ruleset | jq '.nftables[] | select(.rule.expr[]? and
.rule.expr[].match.left.ct?) | .rule.expr[0].match'
{
 "op": "in",
 "left": {
   "ct": {
     "key": "state"
   }
 },
 "right": "invalid"
}
{
 "op": "==",
 "left": {
   "ct": {
     "key": "state"
   }
 },
 "right": {
   "set": [
     "established",
     "related"
   ]
 }
}

Matching the "state" key with "invalid" uses the "in" operator, while
matching that same key with a set of "{ established, related }" uses
the "==" operator. Why is this the case? According to
libnftables-json(5) the "in" operator is used to "Perform a lookup,
i.e. test if bits on RHS are contained in LHS value." Is this the
case? If so, could I ask what the bitmasks for these states are?

Thank you for your time.
