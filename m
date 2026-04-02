Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC33F0776
	for <netfilter@vger.kernel.org>; Thu,  2 Apr 2026 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775170851; cv=pass; b=cs/wBaeUS9dQEo8347iaSVIZOxdnro1p/Mqcu2u29qs5uS2zoUm9yP9Z4ZGivqnEe3X4HLRro9+deHC4m36bIvr4eQJrl0FGGN28CLBvmFNdhs2zJKdHHocnetDmyizkXYXGzafSELf+RgwfVQJWZ7etnhhBdor0uKmjSyjDIQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775170851; c=relaxed/simple;
	bh=hXRpol2B3+NzvKW9ZagWY4F+5OlJbtHR4iPKhJ57Spw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=W4mCOW3iMR1mi4WW6br9vTA8guE1F5H1GYuD3xCrcD4Ifn+aqeclLaOI7uAuUdKY8hbofd0raAC4FFfw0mymeUMgYEyx7rCZOgxjHXCEYXEjHm/VnElJ3WoP13sJQhzgA3uNcfq7YhJQ16WAK75CKhyG5SPaKo2qmD4zN0oDPP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2/0wKFk; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2/0wKFk"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7a43424f861so9981857b3.1
        for <netfilter@vger.kernel.org>; Thu, 02 Apr 2026 16:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775170847; cv=none;
        d=google.com; s=arc-20240605;
        b=FR17BVW+C8xuRdNBlwWnLJ0YXo0mbPEoVRe748F243C54PiCBQmGsWKpHFPExZ4dAA
         OTpQgxzX3CI1iR1TTimzNP0JJ1w/kr6YlyIaCtdNP+vB/PletohW7o/UqUtExz67VED7
         W3uAWY6/LLGoI8gYU0id8XU23EsqgTpdCfpWM/OgzpQIeTjXxD+clxOUf0HeLS6T0xPk
         OSxp8DJjZmR2jxGh2Y5J7guDNfLkuXoRwsaQWv+qpr33Xut3pxtjbbmo9f/Dsz3Rb4kx
         aNRMcWSKATihlu/uGgp804xIumzKoLn5uwVMqzelud6Qf1c2nc8o9o5k6OQq3cqjwh52
         nFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hXRpol2B3+NzvKW9ZagWY4F+5OlJbtHR4iPKhJ57Spw=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=l2SOlS9OT6wAl5L6pyl2AG+WV24mSq6kh0yGC7GsSTfsdVgp2dhL433jVA4TlysxDD
         ZR2tjdJUZClDjGdt+DWWD2UBVcF+liiNX21ejNDNlI3e1QjNQsGhBQ3RA9FQXxlQ6L0K
         LS6yQJeKVDFXRxI1F2YyJ2MkiY6nsN5OWmxrbc7fBsVAlId7Lr0pbrNbcYVZ0LfdzYjl
         svnis1x2vWQ4jNv3ZulQQINocZCTLVGR7aUQjvl19WKpTQr3ToEiSuiCqrDemVnczKex
         ngHINViYLVIeClerswUs7aJWIsv+19OBEn9zNnaHIl1op6hGyBm5gy29UNmyRuImRCUR
         krjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775170847; x=1775775647; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hXRpol2B3+NzvKW9ZagWY4F+5OlJbtHR4iPKhJ57Spw=;
        b=X2/0wKFkVuaKLHK99mZO4WfRxviv+WCKxAbAYzWy1oyvW+VSqPIbfFo+xHoFgX++vX
         OkHifybIH0ma0vjPVjtX7h6Sm2ZMZzskOiY6W51szqxc2adya5otxodgW4G198YNT3k+
         Mu2qzopMfVYH0zA114eN9qgNhZSofAacLoDxx5qTYgb7JvQhgnV9VJNXMTIG3EDsxDHW
         FbYEAVOo7jfDYnG6p6WMak81G4k4okqgNo6OfLZ8K8RwQZkpww8euyhDEhkaFD1nEdDp
         omI5aLbnY6IWYM9aGv4RpaG7+svQ+ytHL7gVPMct+jccqFc5nMHskLbxBqtob2hUK9nO
         Br+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775170847; x=1775775647;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXRpol2B3+NzvKW9ZagWY4F+5OlJbtHR4iPKhJ57Spw=;
        b=T4vTCI5xCAwmABtIWNlEWEZw4QyCgbgHfE0CSnD6902Zv4E6FWPaUsVHMyWAd8nrbV
         9XtFVpxr4YhmFPYmooi8v/cbuzlZsPYgksOAFyW64o8hZN0452hyX7XLW5M6V/FBFcwG
         nCDxDuDpRk2Ktmg8l5N2v/+AhRhj5rvbZDUxoOaKQfWTH9FSYoY1CaLDjouU37coKgFz
         7e9n7ixfe3pDql3IGskOEtn+q1tqrgdlvsSQ179RGt6/k1jh1XKeqlRV2ZmDBRweumLJ
         iMBiKrq4Ys8+/O9B6FzAKYqDuQFh1NJZiF7/s+DV781OwGhJTjTzNJlr72jd94LaWRl0
         hzvQ==
X-Gm-Message-State: AOJu0YzeF5mVxzw2GdfMCw8EUC5Ssk+9usQKCzC3apgtpwFhi1Y3Qcu8
	3Wigst10q5rFZrCzvZv6YZhypy/vniACMAeYP8+Wr4IDBzRal6uY+vfsSwHdgObvUWW9xu5/HXG
	822P6FEV+72WnHzfoaTcDIvpr3BTPtuRCtV8a
X-Gm-Gg: AeBDiesnu6coCNPlsSKJhXvRPE/ghpL0PmWw1BLDvSwJamb5T8UbxVId1PT1Nvg9Po+
	i+8+2wb/E4vlrJkCAbc7FdVpBTxVYbSdYqwZQDlrMgWKEm0x5NuZho7gWALlkYH6BEZRa7Laad3
	hOJ5AQgV1i1XAxj1VGlY5cmALt/g8Qd+PR8rvX8by9ocNFR3n+ClIwZ8uXj3lTuniqkQ9mG8Ra1
	2vICsQcYg8mCm1Tu8OLzu3bfQ6I/px6R9e4XF86jrrLJ2jEvSupFytax4KMWdhdMd5QTEPCjXgU
	89lOPXwg7F+FxqFVXOCxcrer4209fIDdPL9+GUhV
X-Received: by 2002:a53:c704:0:b0:650:1960:c8b4 with SMTP id
 956f58d0204a3-65048829ca4mr562321d50.42.1775170847250; Thu, 02 Apr 2026
 16:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Luis_Mario_Niedas_Hern=C3=A1ndez?= <lmniedas@gmail.com>
Date: Thu, 2 Apr 2026 17:00:36 -0600
X-Gm-Features: AQROBzAsKeFAS9hkWj8osljJg6nci47Q3cM2OKNH55pBIVdjK9g-sjAH0J_PwqU
Message-ID: <CALtjan=uhF_TjxyK53Ya5PVJsNgiyhOJ0Twq=-H-h1JbGhZFoQ@mail.gmail.com>
Subject: 
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

help


--=20
"El futuro tiene muchos nombres. Para los d=C3=A9biles es lo inalcanzable.
Para los temerosos, lo desconocido. Para los valientes es la
oportunidad"
Victor Hugo
