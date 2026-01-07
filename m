Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BC313E07
	for <netfilter@vger.kernel.org>; Wed,  7 Jan 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783159; cv=none; b=h849OL5x9lzNw042PDpWYdoUsLpLAuysO3zCLwpv2nHTuJXg2YdtAMaEXVSC3ic3O6GdExQ8J1nQXCVghz6nsrq1N3mrGENtd5OnOodm3Cu2Z5etFr6OYpTWG6klLq06PdiXG0xzJvxOtWIr/LEkA3F4y1HFEOVGQju6tV++S4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783159; c=relaxed/simple;
	bh=rySINYqQCPdrM3pyk67dYEiSHvdKJmFsbS4jI7v4mog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UELsHuJ7vJdZN/fG3POkjcSbLFfzy+njI0LCM/pwO+HHZqdby5QW8/gUxSDXa9/8eI9ienRTfqu5NYqcE6gc3H5mZ7hNZThE47m5pyhhmxhefIC1CRs4wkpdGn4qL5vV+v0WYYIgOseqyr9yURLFeqa6Q2WYN9aTRlhfDp8W0tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghPHaS52; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghPHaS52"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so3134267a12.2
        for <netfilter@vger.kernel.org>; Wed, 07 Jan 2026 02:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767783156; x=1768387956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rySINYqQCPdrM3pyk67dYEiSHvdKJmFsbS4jI7v4mog=;
        b=ghPHaS52+ELhMz5/1wSJAaxFmuGxB4qeHGxf+v8XurflgScRK7nXhfgH6UP9YQ9A3R
         Ofopq8MIurEqroJMqffDHVUPO1bsGAjnqdJM0v7X/IcD+KPmaFLIfnlm+yX6vyH1qBfX
         Nx5QRSAiLkS8WlNB146vk9d43j9hVWxVUTMsBavIQWomgRbCgufLspnFs/4CwSaSoxXd
         pkteuYaBNyNmEcG/NPqD/z/B2SQvKSra34Q817g5pogcFqNc/BXFQO5AaGZ3x4cY8tWv
         Pw3k5eM2/8eInrTHoj4/gBZQdLkSx+JFwiMjX9WWMermz1WzdRyA5AWqdQsf/0xVg2AF
         QCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767783156; x=1768387956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rySINYqQCPdrM3pyk67dYEiSHvdKJmFsbS4jI7v4mog=;
        b=q10RnozsleKb9sc6UBX0NyilpKTNP1en0IAaoWBtLEOK5UE+gCkp1/GUSvmqLF1S3A
         QPzvbjpThouQORcSBtDq/gyA8VWySmOXrHFNSBqMn78kbDW8jsft8YuNoPPt0mp9k9JN
         bAMa9AavKwV9NsP3qQERjeYFbVHl4r5crFZrmnhslMouVqO3n2tf6gIo7aZ0uxmfjtGy
         2Ma8qVWrIEaQ/fkbBac5q+dtmIlQx2Z0H/xrHWDqW508kpED2NQ5assdn5MQbeAfA6hn
         fvQlk0/1g99E6DG3vjCpPhzQmvYCAXMInsUejNkDL+FIJcC5o1HYUssE54EZNBBQOfXe
         0/pg==
X-Gm-Message-State: AOJu0YwPEzpBkOQQviqc0jmMhICEiWUIMZ+/BT1FTsaOXiO+ATk+fJ3Y
	tE4HhnioSrlgtigqJhVpFtiUwinI+ZaGdc52yfbE9AbElnc3u54Sq086D1winVXiX5pUGbrNOn4
	bkKfcQg4i7P3O2GYaCcJnI231uXec8AUPLyUp6b8=
X-Gm-Gg: AY/fxX5U/UtuxgT8cOFHx77mPc9sY/N6VaTDTyQTXOQXKlGqKHJbLfeEKA4p+a+n/Mw
	uiOfTcYspktyVGNhaWATOtYZt+bL994OodEgL4z0AuoZxl5wzx6CPCY4ZRiJhgApamjqQyR0AcU
	njarsETjtisJ/MYvCVjbBmMwpoy5m4vEvSFdCwlMnV+olKzspQSKFdlreEFHZAOlJDMpZlg5Q2J
	JBmHb2fasy2AbtOL5qGJLbbSddIaGqWAcuihWwIJSqC7BPV83kwiEdN0WF1S6yfar4ffzyT
X-Google-Smtp-Source: AGHT+IFqCg79hwbH3lsmINYZ2k4351h3ErXaPFEmAHTJTU+0Tsh8+2L14t1sO4GdpvDmgF7Faok/wM60Vg6JkOTzgKE=
X-Received: by 2002:a17:906:f5a5:b0:b72:eaba:aac2 with SMTP id
 a640c23a62f3a-b8444f3f59cmr199761566b.26.1767783156087; Wed, 07 Jan 2026
 02:52:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com>
 <E1B33049-8304-4686-8806-56D7F5AF54F8@slavino.sk> <CABYZ2k40WHg2Thzo0=4r6Y6UTAtrw3EMRq=0fwKVViL40exAMA@mail.gmail.com>
 <1ED8A4EF-7A6B-4253-A35D-5070EDBEE9C6@slavino.sk>
In-Reply-To: <1ED8A4EF-7A6B-4253-A35D-5070EDBEE9C6@slavino.sk>
From: Dmitry Konishchev <konishchev@gmail.com>
Date: Wed, 7 Jan 2026 13:52:24 +0300
X-Gm-Features: AQt7F2rKbmr7x9g8pFdVH4l1xxakxOlxRO-ly9CNh1lZDi_b50A91UpdwPSrEew
Message-ID: <CABYZ2k66H=TepZ_7i9+MFNm3ahxmgPW13cbWogvsqzyVDJKj6g@mail.gmail.com>
Subject: Re: Dangerous examples in nftables documentation
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the suggestion of `nft -c --debug=3Dnetlink` and hping3 =E2=80=
=93
it's much of a help.
