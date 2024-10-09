Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE9173336
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504131; cv=none; b=eoNax4j0o+CcHeEE7VdVoH7RvphoOSLYygKc6lT0IExXqMVKP0K8qQQKT5GfdGJjpcA59VrSLCflZeWfEhvI3wG6E/tMFBEYDQWVdDrehsGQEVg1f7euf7xvlFCEDoTM8P/+fzD6fQ/fmH6GFnw4ZDfg6r5Lxx7l/zjgTdokzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504131; c=relaxed/simple;
	bh=l26FpMzwCq4wzvg2HSVxo93MOaUy3zzt6E28vR914OA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=l33VaorzmRlgbtbF+lTeZ3vPHpVlMfGRpj90HM3icxs5gvppph70jOaLWjEDTl7GW7Nvo6dR0CYvC33xrTT9dsFjiSwhftuNbxy3MFo608LuoVeCYMmqciF2iDZSMqjhsFP9YBKwgmis4FVZkh/iOJUFRX/JiNqHUn1FvXfnys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXJcbcaX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXJcbcaX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso1313305e9.0
        for <netfilter@vger.kernel.org>; Wed, 09 Oct 2024 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504128; x=1729108928; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l26FpMzwCq4wzvg2HSVxo93MOaUy3zzt6E28vR914OA=;
        b=VXJcbcaXfE5dUmov2bQeTSmZrTr/IHKdntdkr21zsyoaLp35UEMsQNxw0EsbIeoubY
         7kQsLwuOUzWBCtzvSUphqw2LG2+L0Ipt/eLGSrlNtC4AFoekWWEAOXNGudQWBI5v0TSJ
         57ObTi5JLmZsZaU7B4InCeBg21jxnpfwv9lA3hZBFSmsT5PdBgxeaUtSBM2qO2MK5eg4
         CKlmY3ahrc/GR/DTC5QLaSASqwTV9PRYimXPUxPDV2C9qEH00PJ92nevFysgrqZdJ0aV
         hkzrCV+aCPWogf2QOX267KB5Xi+jS6UrDZSbme1fIac5UF3Z+I5YAzBey+ljZpe0wCGN
         sBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504128; x=1729108928;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l26FpMzwCq4wzvg2HSVxo93MOaUy3zzt6E28vR914OA=;
        b=hYGSrzJ4TRbxWmsdbBmzjg8vXsfwB8g13mm0i7/9gWT1vnrm7B3kkmdJnZuPisQpmo
         7IV+OoefKCN0SjGhIljW37A//L56b9BfUcqJ135F79fuujOt2Yf1hYhw5fKR/ySlOERy
         559hFEVriGVkCdwLSL0YQ/6L1l/Nc7mgR54Lx/7qd23L+ILzY6DuVsVVeRNJVkWtSdWZ
         LvSHmV2U3NFsNiri4PX56Wwa/oLsYot0qdHQWrhvM67VIDFCPyJp4CZQasVUDjyR8+ww
         GBbw8ySqanfHESrtPDf54/U1F1ioP30b75fQ1Z49huU74j/5AlpR3USDut6qtHjbuqKO
         aIHw==
X-Gm-Message-State: AOJu0YyviR6x6/aoyG6aozZX6yq8ZCqxSRX85WJvPt0GXvPvu65HNegw
	xUoOpu8a88+GRMfAvpAoZBIMX21VOBYZYOjV8cSZnpYwetJt91kFCrrWVIUpRh8meuN/u+mYlK5
	6IEGSeRzlRL3Dg5UEW5EhnmV5FnXcVHuP
X-Google-Smtp-Source: AGHT+IGo1S+OcMFat2ZHVFkjWpZesa1h0pnCiZueD1e1D4Gn3cEdxYQKrz45B1oF8HB+MqndyIr4WFzFOXTsJZZGvg4=
X-Received: by 2002:a5d:568a:0:b0:378:fe6e:50ef with SMTP id
 ffacd0b85a97d-37d3a9b4eb7mr2390399f8f.5.1728504128118; Wed, 09 Oct 2024
 13:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Graham Bartlett <graham.ietf@gmail.com>
Date: Wed, 9 Oct 2024 21:01:57 +0100
Message-ID: <CAO4D2DPQhOPVQXNxgyJBRetFsgFwUj3JGnfa28cnep2MOybb=Q@mail.gmail.com>
Subject: issues when trying to inspect payload > 250 bytes
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

I seem to be hitting a limit when inspecting past approx 258 bytes
using @ih, 2064 16 0x2222.

This returns the error 'Could not process rule: Numerical result out of range'

I'm guessing that there's a hard limit on inspecting past 250 bytes
and wondered if anyone knows of any way that I can increase this ?

many thanks
