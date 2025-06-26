Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07FC1865EE
	for <netfilter@vger.kernel.org>; Thu, 26 Jun 2025 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750912090; cv=none; b=M5HR1HUB7J/5m1bQHAdnVCkauy9WhLepTkqQoS83B8jLkSan9GI3bU4oMrcsDWc29RQykJsiH+cA+m9SwVG5GtjE0zExH2vxVVX5EoLLBEiMjNbt7RqbFKPQTaJ8UG36fwE3pMLIDzsWnhENjTZuRpHZNyY1M79FqBnKWwb1gAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750912090; c=relaxed/simple;
	bh=Idwj5YCZC3JzbeGrXOTHn7qVhOoLLkFjPOE+YkHPcwQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SFSodrN233YvaV+lFfr+vumddG7YkVB1FcZimQSjDKbbYH1DFCrIbfaiXY9W+0zsK4Qy6wTV8iv6J0QX3bk4gqLkp+cLNr/3Y77jynfwqcFQrbTmIvb1Li15Xgh8iEgqbl3ycYqAzwUvcwRHg85JMqSjJyi+jAksA6JhSdkcboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWpiPrf+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWpiPrf+"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b43cce9efso4326791fa.3
        for <netfilter@vger.kernel.org>; Wed, 25 Jun 2025 21:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750912087; x=1751516887; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ui/phIQLw3Jji4NuLAxzBYqA/b/PnXarnoaoejm9eV8=;
        b=BWpiPrf+AWXNvpLhjfSTENHAJqeBW2eqs+zcB3mDqQ29wjPmhT1puRobkRGgBwZ71u
         u5MmoGf3BNXKY0AtzSvIxJCtTKHZGs5mvJA12QNH8u8iC4h7+JWMkIGSxml/A4lHCaue
         vM8zYRN+NUNVxZ1C+fuWDv3etlksfx4y8v46k6layUEGPE7iavZfhBknVB0GcqNkazCN
         LQBpIHu/ThJvcWJGzRn3yZu+yOiHVfVkiMMyDRL87U593v5IV4d0PBBjhlmQtlPgSgg1
         6zIryVCPbFw+ATM8dykypHNX/43kM8Q/3Q+R3GbOHYDz9OeL2sKlTZeXuXX/mkqCOZOR
         Ws3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750912087; x=1751516887;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ui/phIQLw3Jji4NuLAxzBYqA/b/PnXarnoaoejm9eV8=;
        b=oK+4MEziqVg27k979yOWITyFz71QbzDj87Jwe65p4asMUVBnYptE2U9lgvijAstBSi
         kEY+LvN1MOssYdUuYAI6ZkoWTrssAXo2R08zzxB9Zt9AcRteb1xpK6yBz83Yh5s6rWCB
         UFYB1E7cVAhBlbRboQ4vetmeZ0X5ucAU1AQtiunDTjl2G2kfU8PvhXIv2ggUsWWeVQLs
         sdB1UxzaDeZ0hLqmbHjIztxP1FQDKaJoVNw5T6WwkuODwBF43ZArCAMZMr0LdAxOu+j8
         PLGs/Zvy3zjjlxmUrNofIuhubd5w/W6zRNwv2Iz9xY4PWh40BiB4K7KNVf9kBAWDFhhD
         sOiw==
X-Gm-Message-State: AOJu0YzsUfRITcRB0HcA5zJ2j4Zwd1A7KM9ZHEyrWYB4/z4v7ChrbraM
	xHJEff3T73W7uEgEML85o60zulNagnezrNP6ujIZPsAy0S0QxX4HlAm+Ha4ZPTDyHYjn6m2qjBx
	lCwoQWFaWeJCZHXu8FMn0c/6u5Xp1MtCxPOa/obc=
X-Gm-Gg: ASbGncuOhPNxTWjn85U1i90agzjze3xxaYdDH3foL+jCzn489RbwDdg/05GNHlttZqw
	Wigap6c6zAEUhy4x7YLXBWy3lct/3GGbH+dwhEn9xhmO0BKXtXurgP8OCHVMKcn7ClzcpnQgoYc
	OdBwGzQK7UL1MXCCTtPAOjHjH7dvdY3s54KnbM2TVnusS1Mp0v4DGBIw==
X-Google-Smtp-Source: AGHT+IEWEv/qLu1+TZpID2sHjinikiThEJFrWFL9wVOS/wzAYkLnfm7zJkIl9SDj04ReoGGV62i5eflNVO3HhadX/oA=
X-Received: by 2002:a05:6512:2315:b0:553:cf7d:72a0 with SMTP id
 2adb3069b0e04-554fdcc4d03mr1620640e87.5.1750912086470; Wed, 25 Jun 2025
 21:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: sontu mazumdar <sontu21@gmail.com>
Date: Thu, 26 Jun 2025 09:57:54 +0530
X-Gm-Features: Ac12FXw779j0-513NHqSr4X06PJty3xw8lIGw_DmZblrWVeBcz8npCtICeQoF74
Message-ID: <CANgxkqwQpVQDM7AP20A0pCsGkPhte9tr-1gwdJJRVxqB9M2nng@mail.gmail.com>
Subject: Element-Level Logging Support in nftables Sets
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I am exploring whether it's possible to add logging support at the
element level within an nftables set. Specifically, I'm looking for
functionality where an individual element in a set can trigger a log
when it's matched=E2=80=94something like the following:

table inet mytable {
set s {
typeof ip saddr
counter
elements =3D { 1.1.1.1 log prefix "element1" level info,
                     1.1.1.3 log prefix "element2" level info }
        }
}

I understand that nftables sets currently do not support logging at
the element level. Is there any plan to introduce this feature in
future releases?

Regards,
Sontu
