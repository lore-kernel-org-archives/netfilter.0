Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946415A8
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492515; cv=none; b=D4+2IJ9aMKP+5pE6ieREKCshP58AsSS1vet6PITPHAsHAh9bE2nJ+jqhBQiluekZt+tfGCVfIypuqfT8dd/EzXyx31V0+iyZ7FJk4VNkTXpXK7nXKKeWINDRj43VSnR3XzvChVIMP+SC1Upqa9sHpjQcJIUgig/zJ08m++siYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492515; c=relaxed/simple;
	bh=U3Kw94VV6u5AEwZHA2eMJvmHQ8iWSFNnAeO+6C6EwRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndtVo8FrhzaBC1gU0sETKpE2VxkmNxPyENm4uWEmHRTro0SZ8Y7e/h9Nau77qVQPbvT4aepHFJKkmDDohqH/oOtAADLozDzF9wI84F/Kj1idYDF4A/VaP6Z1QX+kFVnjLr1aFtjODig34JG92xI6QJhCpREWIDVQK2261H2+lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax60MNbR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax60MNbR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade33027bcfso397326266b.1
        for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 00:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492511; x=1751097311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0agaX/IYPE2Z5QoTf0mPjepe7+CIsoiY0DaMg43NryU=;
        b=Ax60MNbRIHtJ5g6MlOTdeUUh9T9pAcT9+ZTFiIQG8KCa42WEjl1q1rqaj6SblsFehd
         LWq1Iu0DoH99W4rWIUQq962LMStyltU6ENrgTu6LmfLLohftBSA6r56q7Sx6yBzSfRUs
         YxwQr02QHhTHzyCFKv/txX/neTmGd80ri6HP/icyhgK+mhkC9C93NJySQb3LPLa3rv9f
         RoX4pHfeqGxVKt3eIm0QdgOPgHarHWIY+kLX+7AmDpX3tEYCBo2zXXrHBqPeirKo6oHc
         Ul1QoK80FhxAeI8f02kydfUwH2cs9kJvG/lrqba6M5faH/IO01eLQQ+D5/njV7OdOXL4
         gydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492511; x=1751097311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0agaX/IYPE2Z5QoTf0mPjepe7+CIsoiY0DaMg43NryU=;
        b=c8sfsJZ025NiQ9A3aEyS5MkxzhH7qV9btA9W7xwCV+BrAJlmLoHDWw2ve76kIY9Q09
         +oj/YHDbAdfXGtDyupvML1aC2jWMflDpmUMJQK3Pmc4UWXwuTS2wJbGAea7em01Vp2HI
         j4KIaz6Mr7v59/y3wU50hWpnE2dAapiPkqGzXUMQpMG+kjyEXcn0MXGZha1Ec5ZN4v/u
         aaIxp1hk5Wl65Y1zzQmr4hZE/2YNzY7CT3GCGQiE9VQ2mrY9D6+dYfsxzGiHcuk14QT0
         vEVUo9hfSz/BAJjXgmjA0vEq7Dx0Vrh1V7/n5mI4sO5NUQXg+FP6dogr++Fbe6eGa8/q
         +HkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHjHP0AKX16xYKXY2GQu6Ysu38Er+whoNbtfa3nRaRPUNaVq7XQaR4APUZ5I3hUlyptznu9kPgY28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgr2N0ESxzPACOSUk7Nz10srtCN+SvNWNGxku2g0muShf06Po
	0Av6XpoWJnD0R/nOB93DCjOYtoE2stJT0z5Et+GGFEbX7M8NxiwEWWEAiKsMYGxpBuJSG9stRGD
	HVubRfiXDsyO4ZgcB9YqrbTeo9gS6a2M=
X-Gm-Gg: ASbGncuSFBeD7FB0LoLCXLcK+9VLLeEQRFAYs0PObVH+nM5Ov469+25VUDdMxALKhVt
	kXQ/G6FSHI4y9d4DKU8+C+NO+BFFmWNURcsE7sUU6Y3vFczpVGAN0inWWr1QQYqzKtbcLmul6Vf
	Eilyyoi/zGaHj4Q9EKggK5tzYPR4OBmJ0SRKpur8BBCQ==
X-Google-Smtp-Source: AGHT+IHyoDCPpBCJoIfnt/aOnWYr57uLVu360gPS2kIY4e60R3bwTNQNchqtLqvQFGmAoA0E7UDYTteSXagZvwSyI6M=
X-Received: by 2002:a17:907:c895:b0:ad2:1a63:3ba4 with SMTP id
 a640c23a62f3a-ae057b89b76mr528641766b.37.1750492511081; Sat, 21 Jun 2025
 00:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru>
 <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru> <7wR-GVqRP8l9UDDo4OaeWZXZOMKF6adK7-bORlkCF2AY4NKDLlPX1R91egntfEvG3tWyXuSY81TpbWsF0zyYk4MhPc81-g7HdntMFp7zPHE=@protonmail.com>
 <eb707b4a-0f98-43e2-a68a-7498aeed9b17@tls.msk.ru>
In-Reply-To: <eb707b4a-0f98-43e2-a68a-7498aeed9b17@tls.msk.ru>
From: Pavel Penaz <pavel.penaz@gmail.com>
Date: Sat, 21 Jun 2025 09:54:59 +0200
X-Gm-Features: AX0GCFvvZkbIDKM3jOiG7MEIi9gImhAKbxLq1fmwqKWMJAC68U2WQfYPNCKxfGg
Message-ID: <CANPmkQsQUPOpY2o7ytVVFuCtvLq-98cNvBYVFiAfxbPEatHyTw@mail.gmail.com>
Subject: Re: order of netfilter hooks and check for martian source
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Sunny73Cr <Sunny73Cr@protonmail.com>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
to route the return packets accordingly, can you try adding the
following two rules with "ip rule add ..." and check if this helps?

to ip1 lookup table1
to ip2 lookup table2

Best regards
Pavel

On Sat, Jun 21, 2025 at 9:26=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:
>
> On 21.06.2025 03:48, Sunny73Cr wrote:
> > Hi,
> >
> >> from hostINT back to extIP, gets routed to gw1 through eth1
> >
> > Looks like the default route for 'any' source has too much priority; wi=
thout looking at the code, it seems that the assumption is that there's no =
point checking the other routes, if there is an 'any' route. I suggest remo=
ving the 'any' route and relying on SNAT for 'hidden' clients. Add more rou=
ting rules if neccessary.
>
> Unfortunately there's no way to remove the "any" route
> or make its priority lower:
>
> # ip rule list
> 0:      from all lookup local
> 32766:  from all lookup main
> 32767:  from all lookup default
> 32770:  from ip1 lookup table1 proto static
> 32780:  from ip2 lookup table2 proto static
> 32790:  from all lookup table1 proto static
>
> # ip route list table table1
> default via gw1 dev eth1 proto static
>
> # ip route list table table2
> default via gw2 dev eth2 proto static
>
> It is the rule 32790 which kicks in *before*
> reverse-DNAT (for replies, SNAT), while it should
> be consulted after SNAT.
>
> (There's no "default" route in main table.  It
> has regular local routing information for locally
> connected and inter-connected networks, there's
> nothing relevant in it for the packets in question).
>
> The problem is that I can't change order of snat vs
> order of routing, no matter how I change priorities
> of the rules.  Or I don't see a way to do this.
>
> Thanks,
>
> /mjt
>
