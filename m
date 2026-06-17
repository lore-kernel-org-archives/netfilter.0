Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A346B5
	for <netfilter@vger.kernel.org>; Wed, 17 Jun 2026 02:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781664217; cv=none; b=h4pjmpLCqDv0K7ueLLsOis7blqD0IEH9t0EWDFoECpiRNbzvKiXSBuQetvtWlJAcDOeznrTwiox53yKn7imy95uhy0W37ba+vv5FGVgMOOOmD/NbKTKc3nsVDrLq5qmTsBgnd/TzMalj9PIkHKsp3RCmCgsGZ9/nJCZPVw95QxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781664217; c=relaxed/simple;
	bh=E8AE3WW3QzL9iNMOkMLg1ZAfpAD0qgnImnYhbGWYQvQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ogMlnLlY542IDVL1eixiKLw1SzK9jC7h7ecbK4ymRTSeD3IpUkCCZBXQKa67bFT4dBpJONlerMHY3Llie7x7UKZmv3jEysyNeR9Z/A9d63xYm6ns2jZKkeG/eaUSj4QcAxMrQ+DAsI5U6TFzZK8BF+qsSx0AsvTsgP5/+T+mLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLcZvkgH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLcZvkgH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0aa420401so38626075ad.3
        for <netfilter@vger.kernel.org>; Tue, 16 Jun 2026 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664215; x=1782269015; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8AE3WW3QzL9iNMOkMLg1ZAfpAD0qgnImnYhbGWYQvQ=;
        b=ZLcZvkgHiagUg7NML5ntui+REJ1d22kVU8BH0TTXGshUSifoI4iyZxV8uR4cfrSdWi
         X1K7yMGlfYDde9gurDbbQ/W+YhgJcXn0+wbrauiHHWnPmw9CS2ygYwRtGQT6B5pX/mAo
         Wp9ADMkfoyflcwFzDsCMdzz5SRpt8uA/agkyZ/wVaRS58DoIWGj3rY6WumhGrmKXK52N
         DjranheBsHe4HqOw3QgL8USU0L+KBUIfrD1Lts5/QuolT+krAv93/igsZ4ONLbno0fyZ
         isMEA817Ugwn7bwt2jqPp8jv3MwPGP1TkzjfGKsuQzdYgtqvFN5syl49KbUtiGJV+iuf
         uLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664215; x=1782269015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8AE3WW3QzL9iNMOkMLg1ZAfpAD0qgnImnYhbGWYQvQ=;
        b=LIUAeaIzNQLG1nP/Ax1z1gDIF1SwqNldFWEo56pyUi45aqsODAPNMuUJ89YMjJ19FB
         nkL453hLcz4ENOxnRL09kqQAT9w2Y8n9ujWzS00D3x9ggmVCKbF56SicZScH3dgZlZ99
         gQH3p4n3vRQqN0Mwa33TUPBZEuOJIR2lDytMsFK7B/un8/B+B2Yd13pdTS9OSU5s9K86
         LySC9BM79dVagzBNuEq09fLvUXt/VVtX90tzLbvRpx4ZLPKb8gmP38qPZeMuI+owCrP8
         4LIFJ+v7Pk2cJR/R9FowAwEs/pDXM7/7GF8kU6CwnpqFaSkXWYRurnWsnhMqEsX26Bzp
         ayFg==
X-Forwarded-Encrypted: i=1; AFNElJ/XbvPGjZADZruY+/hnvH+8Ng9W4Baxfyr8ErdemKGOoe51l/zXqbh+u1+hLiSFmdeJaJYUewP1RHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxatH8crnP5MgE84aMja+n/44O2pQvd/dXleTEX3DOQs+Czn8xL
	9n8JW2rkXE01RQWbukMhHJ6MpolLO6T4iIVwGdy0WKBRKnJd2YfnUeVs
X-Gm-Gg: AfdE7cmrlyl1MNZJdVK65QGG9LlIxCJK1Zd5GcoYHpF/qIzA8Ugx2mAnP7K1Z3VSJhY
	MWk/CZaXFNcLJLDZn/V4OQd/aSr0bxuSJPID96zBCAvQZ0HNcdtjLEv7hkAc34nUO6qauop+dDT
	gDDgBF8hwqB2sZuzp1eSi1z73Q64WVtaPVEEaDg0RsExueSlP+kNivnwSRORdv6DvZstrrf/OzV
	tn51lc1yIL3BRfeV5C2aAcA1pd+AHN9wJlPMYiLS5PNHpGhmqNTlaS4/0+EKyG19fSoQM10Nagt
	6DoN5vVRKbLZbSE0ASGfreYdR0OOnaUC2HuGryGPhc1zYSRJzQOv2qQJSK3yZ8rzTM7TowAtsR3
	FLgdJiGevDciL2B9F4b39NbPjasEUkydKxVd/xSKriVaD6wZyXjnTORVzKYOQZEYRPhgPlKj4O6
	LGERjzuWFUjkmhiehcbtn+QVeA/ECYA2zm5Keh/0Ipw7Mo5AUE4aITAPYwBWnc
X-Received: by 2002:a17:903:32d1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c6bc0c8905mr18661545ad.12.1781664215159;
        Tue, 16 Jun 2026 19:43:35 -0700 (PDT)
Received: from [192.168.88.2] ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6b3f65c27sm13707435ad.3.2026.06.16.19.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:43:34 -0700 (PDT)
Message-ID: <9785e186a6c8256319382149fc71fb90976f6e8e.camel@gmail.com>
Subject: Re: No meta ibrindex/obrindex, only meta ibrname/obrname
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: Corwyn Briggs <corwynbriggs@gmail.com>, netfilter@vger.kernel.org
Date: Wed, 17 Jun 2026 08:13:32 +0530
In-Reply-To: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
References: <8400bf65-82b4-495a-a5ef-4ad7a1fafb08@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Doesn't look like anyone's asked for this in the 12+ years since these
keys landed (2014), nice find.

Every meta key that identifies a specific interface comes in a
name/index pair: iif/iifname, oif/oifname, sdif/sdifname.
The bridge-master keys are the only ones that are name-only.

Closing that API asymmetry could be a legit reason to add it, if
someone's keen to write it.

On Tue, 2026-06-16 at 20:34 -0500, Corwyn Briggs wrote:
>=20
>=20
> Is this an intentional difference or rather just something which was
> never implemented?
> I wish I could offer a fix, but I haven't the faintest idea how a
> person would go about implementing one, so I appreciate any advice on
> this issue.
> Thank you all!
