Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3601627E3
	for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 19:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB0fr4r6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33680da01d6so988727f8f.2
        for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 11:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703185935; x=1703790735; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNWr7x1G9JYpzGqn4sonodyCJbyOmriisWbBQCFG1qs=;
        b=DB0fr4r6YFsXBzMFSomeD9V7DTVHdJILA+mlo+EVzAXCx9C78WFAZnEQ3DjFs+kNtS
         HIhwMxLftppqH/BuY9fUPIUYdyHqpq7Ey0847FEiHRBkUR82UhgzdDTfvLmhibRrgOcp
         Mu19FJ9iyAoykQq/vBDF2GFwIyi4Tc2nwAQIQRTMXZgJWUjWW6No/lzizmXirYPT/kj1
         IPd+yw6q6mhSiQMY4bvRsCriC5DsJKl/GOWDTcI1L5aiFIro74B7dyTFuoRk+1s/DosQ
         /dlg7XerjmHGrBdWReI05uiD9uJzCI+l+hUoAEuU9Wyu5nvJXGvXshPQLp+szjs1CEdP
         OvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185935; x=1703790735;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNWr7x1G9JYpzGqn4sonodyCJbyOmriisWbBQCFG1qs=;
        b=H7ousN9aes/IHWf0CCjW5Ck+5kfabzXkKFBfY/B43KJzH4xxjVF3qKDf+gaTG8b43q
         Z3TeToBg+4n0BOyTCv1OsSQpseCCkmQvkRF+8Ldy8skFsIAbxTYVlituIeJ2x5zcP5oW
         FUNrmgkrqzx6ipxkCISkunN4V7E5x8TZsLvDmRhnQSyaPwC1Q2Qm6am0pSUEbMyGRuEt
         h8bJwz34mmsOYEftP89tSZMtlTDHJE9lWlKMQhVj51UTs9AEzrd29cWuEk+pS1xSMOHU
         w0LJvmzQq7Fr7pkAY9UDNioxz+bDouBwTtXGeb63b+uAlhdb6JgFj2GOo4U3BmwnRv+z
         Jjgw==
X-Gm-Message-State: AOJu0Yzh6ZGOgJbSCKHzz3LjNfETmUV9r5JLRRVCpOJpvp5pNijMhAKO
	hFTZ+kC/h8Vzi8hFZQa/0MqZpwzTcsqhXDuEzInt8IHNNvbylg==
X-Google-Smtp-Source: AGHT+IFUtxTYHlGGTsoJrojeAfETe83IKwgUtd6oQcAdBA6Q7/3PPKJyvHuHKiGntJQuo6vXrSA5ARr6AJG3V80fnhU=
X-Received: by 2002:a5d:42cc:0:b0:336:6e12:7c66 with SMTP id
 t12-20020a5d42cc000000b003366e127c66mr135757wrr.111.1703185934704; Thu, 21
 Dec 2023 11:12:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn7yVZ_uPzyp=yMm3zN+LsAQu6exn=H=a-ND3XV=tXx+ciL9Q@mail.gmail.com>
 <6A64CF4E-1BE3-4E68-98E7-FD0106DA173C@jcm.me> <CANn7yVZkCm5KbRxDhJ78TCvBwj7P2adEuqWE+0EQxHAen_YFbA@mail.gmail.com>
In-Reply-To: <CANn7yVZkCm5KbRxDhJ78TCvBwj7P2adEuqWE+0EQxHAen_YFbA@mail.gmail.com>
From: Rob Ert <ertr3960@gmail.com>
Date: Thu, 21 Dec 2023 13:12:03 -0600
Message-ID: <CANn7yVadxP=_fQGcFWamX7KpvccW0BLiqBm1f2u7fp808v=WAg@mail.gmail.com>
Subject: Fwd: Netfilter, IPVLAN, L3S and NAT64
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rob Ert <ertr3960@gmail.com>
Date: Thu, Dec 21, 2023 at 1:08=E2=80=AFPM
Subject: Re: Netfilter, IPVLAN, L3S and NAT64
To: Joshua Moore <j@jcm.me>


On Thu, Dec 21, 2023 at 12:43=E2=80=AFPM Joshua Moore <j@jcm.me> wrote:
>
> Is there a reason you cannot place a router in front of the ipvlan device=
 and make the forwarding decision in the router. If the traffic needs to be=
 ipvlan then send it to the ipvlan device, otherwise NAT64 etc.
>
>
It's a dual-stack Cloud-VM with 1 IPv4 and an IPv6 /64 subnet as
described in the jool mailing list link above. I have it set up with
IPv6-only systemd-nspawn containerized machine instances using IPVLAN.
Also, I am using WireGuard and Unbound/DNS to realize IPv6
connectivity to the containers and the wider Internet over my
otherwise IPv4-only Internet connection; this setup works very well,
and I am a bit reluctant to do away with IPVLAN, if it is avoidable. I
would like to understand why NAT64 is not doable with IPVLAN L3S mode,
if that is truly the case. I don't think it is possible to integrate a
containerized router with this IPVLAN setup; I believe I would have to
switch to a setup where all the containers are connected over a
virtual bridge.

All the best,
Rob
