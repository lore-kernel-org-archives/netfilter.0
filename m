Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D01531C8
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869577; cv=none; b=krCZVWgobishjrG66TIAQ+jV8wuLwJr55AyjFA1k3+OOQm2pwu5AUmOlr0ADV7rnoOl8ghcDUSTrdjBLVLNNYFWlCaqst+7vwpdsrFxHKxGnXl9UspcCvRgpY/3vWXV80JVlUujaBjKFMWAAK/0nutS9/YVke/mUzIjWgAOla7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869577; c=relaxed/simple;
	bh=SjgWOobKfCIJoeql8xg2jECQN83xUAXpj1QssRud7oQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qjxTh8Jcw4GJB/3qsUvRVcfPDGaVrqkpboBPndXxcbO0y78PTrISPqAuyRDSN8g+aqRHHskFsgZW1cctnWIjb1oJJeXi6r0jmqI723UDgwBq1iM6vO0ni/bGGZ0ksBFC2aj6iBfFlWO2C+DI3tp28tXSmXwldA03Qhst0FGMlKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAngV0sJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAngV0sJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d447de11dso1496228f8f.1
        for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729869574; x=1730474374; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SjgWOobKfCIJoeql8xg2jECQN83xUAXpj1QssRud7oQ=;
        b=dAngV0sJRGY4umUiVNn86lHCKVwChaH/YWVwmE/TTOmVUQHKOncgTsPimpPcvXRUHL
         LFnnObBpPwIwCI6VxIR9fKj2p1b5NWNYk6jDKV9jDCUzPqr//rHsxT28I6czWfNBveTD
         Qhnuu5TR+fGdN4T3jJom7+oOQoZrVc8OfB+nRcgB9uhVCBE07GLMq4oQ9eeISkrkDnzs
         fWxyWzGzi2Tt3joBOuNnnrGF5erqDLKMi81e79iVPkk0HU2lvot1QRXvcsm2atDNevNZ
         jrFOyh6b1q5jw9DS5SbKUJV8NWNpP94DYOyo7/IjeS2PlUwlCmrG/yuurGk1RgjU4/Mp
         //Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869574; x=1730474374;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjgWOobKfCIJoeql8xg2jECQN83xUAXpj1QssRud7oQ=;
        b=W+VJ5pWsojWrJ/FcNHWCW9vN6eR+Qr6TIPJ98NO/KBzNtFS9r9e3iiK7k1AysGcphv
         /ihDJNOsAYN/akwTKCedMBXo+nf4cHjzXpaCJ1qjjKkEPuBYsokMtiMMhzJr1z7MfXfF
         28DiUpDNSM08ahoMmbvHSUg/itYtBzYrsXXLMYSsJ52rUrHi2/8fO6auhPu7+DvVN6HH
         6ZTCN/oSWemjf9xTcXA7X+wuwhyy7sgs44XMoWR16ye8NYkAAOxWy3sES+qeYJB8EGUy
         SFfTEnKhu9R8Vw4KAQOlUbHyfr4zIZVyTFTbtIIYOq3oVwGNkao7lEGZJQR1tGxru60q
         8kTQ==
X-Gm-Message-State: AOJu0YzWBjZNGQpHRT2zubD51KxcxpHT/QHZZiOVI+muH+Ah1Ns1MrRx
	mOCsEgktLUNWGWMAki4tsklmj4Eq9y0yvaUBg10y071NDuqEo9Pj/uoPUWOQZr+qLtCjfNDcybd
	i2gvoI0YBUMWYFYrxMK7GEvEO8427Ag6o
X-Google-Smtp-Source: AGHT+IGk9sP2hO0WAyTkOdf+B5VnPad6Z9cvH618vurseYuP2rTZM9RP7hIPDgX8flcmxkHVaWXth04CAx3oJQHBr84=
X-Received: by 2002:adf:f4c2:0:b0:37d:4fe9:b6a7 with SMTP id
 ffacd0b85a97d-37efcf794bdmr6442513f8f.36.1729869573853; Fri, 25 Oct 2024
 08:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Francisco Agostinho <f.agostinho123@gmail.com>
Date: Fri, 25 Oct 2024 16:19:22 +0100
Message-ID: <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
Subject: IPtables rate limiting question
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, I'm trying to implement a rate limiting for my machine using
iptables. The use case is to do 2 things:

1) block traffic from the same ip+port combination for 15 minutes if
it gets more than 10 hits per minute.

2) block traffic from the same ip for 30 minutes if it gets more than
80 hits per minute.

For this I'm currently using these rules:

1) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
--hashlimit-above 10/minute --hashlimit-burst 10 --hashlimit-mode
srcip,dstport --hashlimit-name test10 --hashlimit-htable-expire 900000
-j ACCEPT

2) -A PREROUTING -p tcp -m tcp -m state --state NEW -m hashlimit
--hashlimit-above 80/minute --hashlimit-burst 80 --hashlimit-mode
srcip --hashlimit-name test80 --hashlimit-htable-expire 1800000 -j
ACCEPT

But it's not quite working, as soon as it gets on the list, if you get
another hit the timer gets reset to the default expire time and it
gets blocked on the first try even if after the expire. So are there
any suggestions on how to achieve the use case or what i'm doing
wrong?

Thank you,
Francisco
