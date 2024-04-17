Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60112E1DE
	for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713389097; cv=none; b=IbJEMJ+C/WsNP6BWfidDY/jGsPkiAw5xK2Yx0X3Xjexm7DA76Gj8Zz1UmN1FzUTt+1XGs4+9az7Ecwm7RWT2lQupZe5gpOGRXGeseVGrN53fb5kejm5PofZViTROwGhLe7f6cVJPMPp1FwtYUBQGDB4d751hWnGCz+vB8slFZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713389097; c=relaxed/simple;
	bh=Ji8jsiAo4I8kXxJLC2xNcU27ZTfw8pjMUsYk5i5yC2g=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Pb4BNe8k/nBgUv7Mu4MSyZbS+KVIbvRyxmM607mH7GYaK+FL+HPw5STOKWpcUpBXW+q9Wso6MbGM+xZ7avoc0ROmmPvW0O8prFLq4r5K20HOUY0HNkMv1l8kg0nHpqwxYeZiMqXXBwNi/AMnZcU2ZZZWU6wu672yrqJINX7h+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jcm.me; spf=pass smtp.mailfrom=jcm.me; dkim=pass (1024-bit key) header.d=jcm.me header.i=@jcm.me header.b=RbKQUvUI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jcm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jcm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jcm.me header.i=@jcm.me header.b="RbKQUvUI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so237804b3a.1
        for <netfilter@vger.kernel.org>; Wed, 17 Apr 2024 14:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1713389093; x=1713993893; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ji8jsiAo4I8kXxJLC2xNcU27ZTfw8pjMUsYk5i5yC2g=;
        b=RbKQUvUIhJkJx2O2HC+P80VVrl/YxDcM8gJy2fUPVTYCr2htu8188i9ztSfo896e6j
         q2z0LKCIpkGs/EDqAmFX2xn2VM6WF4tXgNg53n5UWDvgpWdaNvCMG7SyHEjdiA/buvwS
         HId8uyhdld/WBQ5LwuNBr8XKkqyctG1AEIvZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713389093; x=1713993893;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ji8jsiAo4I8kXxJLC2xNcU27ZTfw8pjMUsYk5i5yC2g=;
        b=XugDdb0Ck1JCIWW2IKPR7r4oBeJfWZzTsxldyQT8LSeo3lQGdcEsX9f50Vo7Q/7QG6
         vwjhIv54ehmqY2W5UW2A8LjSo9NNyKSAPC2ewX0SJdl7pM+pymqqH2WFxmpgz9Wjq3v+
         tyrqdXNgXS/GfMH0RTFNgwaLZ8qeNf2O0Qe/fd5WJqOEiUayu3tMxoDGVHLEIc1SZpey
         jN8nv+bRK1glcC5yxMX9rEqJRXlUWXk19WJN9/X9X0Eq1ash1bhrTdriQoUbD82mB3kA
         zbRzq+lz0teWNjtgmODI/3UPXL0XptTG/fOYoWa7rW+7G1uTT1eD5/8BhvpjFvSGZWTo
         c7bA==
X-Gm-Message-State: AOJu0Yw+Ol9Z3zm0Vbrrr2UeYzDd25iRK1632M4eBgLI9ZFU4eiI1OZd
	RIpTMGaCOc5I6MKssEzzvhT0Mh43zRa+DsUFA+IvlZ8EwXf8OGmK/0fIMIKh/GI=
X-Google-Smtp-Source: AGHT+IEExzkXu+prK1VAO762YeCt2toRruv5n8pAie1MszNFv1qrPFu5SaHJLw66ozDQSBuFLUMwiA==
X-Received: by 2002:aa7:8e54:0:b0:6ed:d8d2:5040 with SMTP id d20-20020aa78e54000000b006edd8d25040mr1011981pfr.21.1713389093446;
        Wed, 17 Apr 2024 14:24:53 -0700 (PDT)
Received: from smtpclient.apple ([50.46.33.125])
        by smtp.gmail.com with ESMTPSA id gs9-20020a056a004d8900b006e694719fa0sm123155pfb.147.2024.04.17.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 14:24:53 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joshua Moore <j@jcm.me>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: DoS/DDoS protection for end nodes
Date: Wed, 17 Apr 2024 14:24:41 -0700
Message-Id: <85A01097-5738-4D36-B203-E322A1D186AD@jcm.me>
References: <b437910b-b962-4d5c-bd1a-1a6d35ef2bcc@thelounge.net>
Cc: netfilter@vger.kernel.org
In-Reply-To: <b437910b-b962-4d5c-bd1a-1a6d35ef2bcc@thelounge.net>
To: Reindl Harald <h.reindl@thelounge.net>
X-Mailer: iPhone Mail (21E236)

Agreed. Also trying to react to a DDoS could cause you to DoS yourself :)

I=E2=80=99ve seen this in hardware appliance firewalls trying to be creative=
 with threat detection/IPS.

> On Apr 17, 2024, at 2:05=E2=80=AFPM, Reindl Harald <h.reindl@thelounge.net=
> wrote:
>=20
> =EF=BB=BF
>=20
>> Am 17.04.24 um 21:43 schrieb William N.:
>> I have been searching and reading, and reading... I understand this is
>> a huge and complex subject, especially for a non-expert. I read earlier
>> discussions on this ML - some answers seem to say it is futile (i.e.
>> something that should be done by the ISPs, not by the end clients),
>> others suggest there is benefit in doing at least what is possible. So,
>> I hope to have some things clarified by the experts here.
>> XY: I am trying to do what is right for the network security of a SOHO
>> LAN. The nodes are distrusted, i.e. there is no assumption that they
>> are/will always be "clean" just because they are on the LAN.
>> My questions:
>> 1. Is there a point to attempt DoS/DDoS protection directly on the LAN
>> nodes (Linux based)?
>> 2. What is the right approach (using nftables)?
>=20
> you can rate-limit requests but for a real DDOS you have *nothing* on your=
 side - your upstream connection is overloaded and dropping packets will gai=
n you nothing
>=20
