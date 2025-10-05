Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47338821
	for <netfilter@vger.kernel.org>; Sun,  5 Oct 2025 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759647841; cv=none; b=uSYyVhc1JXmiDOEs0/+eiBnkb5yLXg0iqOwKBp5Pn1tYc8HgPwzFjLc/caxxLVqTTYySKGJGTGqgvOXMElalJvarO7iNdaolmNU2j6cxdaeQVc6NQqDf6EnMfay+quPQP0vTdMtv26xTa9GSgqcm0KWHMaHzoJN7b+dpvOvFS9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759647841; c=relaxed/simple;
	bh=OD+/j309cxpPE/UxPstiiCqTeQ9oemf1t5+l2U0Ku6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAm0o6cRaYyJN3PU4t7bacjWVFJjsamsshwaRZcZQqf3vJAkzt5X6xxZ7ulGr1fDdypMlkiR47sJYnYGjVrfyTSkEi9f1/mtpziQW5XFQopQ8i0k8w8Yp18fvgrGoY8agRjZD9Cj1awPArmWg9gD+yE5gynAPMxqwD8flqlQexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FskcWZEN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FskcWZEN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3e9d633b78so386581866b.1
        for <netfilter@vger.kernel.org>; Sun, 05 Oct 2025 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759647838; x=1760252638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMoVz65B4lP17V9+mctKlXRdw6BkcDfRmK3QVdOzX6k=;
        b=FskcWZEN2e6FqIuUUGKN6bJXKyMEnOv+zqb8NmiDtxF3jc27OJHiolHugNp1j3swTZ
         t+4WSNUNMvDOyyEz2QDkESV5cNintac/tKk/fBHQptn4CSiZ8br66A0DUB309kbJ65WT
         nQMdqODTHMEiYKoiX3A7aJwpXwTCO4CeT1c+eBQKqwiXevMHhuNU5xIsLEwvT+0CbdR8
         G+sxYDnMEiRkvuJD9lj0bsbfMZ1iqclWYyLnz8tcepwLAEzt2qY18wZT552lnLZGrV7f
         e6IllXEIX9g+6tAf8iwCBjkVjCa8bi12tArIAnNAqbH7XfXGl2S0cNeH++UkWavzDehM
         CTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759647838; x=1760252638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMoVz65B4lP17V9+mctKlXRdw6BkcDfRmK3QVdOzX6k=;
        b=ltMbLUZ8XcSBesq/hYe1BJDTJWUg4C5SWDOTO9VHtgcQZdwtYDcRMDIVa/nSYuEZV5
         ugV5v1vvb/KezrZkVnG1RxbsiRzCCOpS1lreBjHyN4eBpqZlbBjKAIgjZbCtlsXQ3OPf
         rYwR5CTm4zC34SUxy4JI3rE9zaTGnee52ZaY/rcQ/JBA0m7Ya/O8CH7UpJNG5ZpxV7fQ
         84/+hjFQrXWI421cTYI/33riRMSZYvKdtnvzYjIa8vWuqEMQ/UL6e085RI+RgNBr/AsG
         U3uCG5vlAF2AgxFhyttUrtI+CiFkpFxoZEenrMD3CXLdUgZjjUtZBZWpw+/Y7vW2FaPn
         mWqg==
X-Gm-Message-State: AOJu0YyVfl20secWO8w6egx0ToctR+EaRTi6PhvPxmhFlRzSBFM4YGnb
	XdzlPxydPczyxhQPA6xRE7ciyygCusXuBdmszK3hShUA37IHX5RaKOS2M5nCCCTQ3h5H3tX7Gcd
	iidW3WgCkHYJbxdtf95P+kzx2frYHLqEg4rmxEnY=
X-Gm-Gg: ASbGnctHdcF0y7ujowq398Fbn7lSkNjRU3JPNMpdD5ckZruXiCoX5alT+bznGtsKV+Q
	kogx7p6dj0a6aK1gBq+diRWuwP3XR8dGm6/uh87MhVNwoPsF0/rsi8Kmo+1ioJjKHg1DD6u5rgu
	10rSni+Vx6WcgGVW/gXk6Xkr6SJKwQ28LRT2fnM07JOv4pZS2ffitYj8X3Gy+QLz7lZ8dmEnMyj
	fi2h5gfIFNL9wgP8zJhsQpCJox2Abcg2MiIDxWpykOtaGCiXOm4taL4dujcP7gKIEB0Mh37OdTa
	hmheYu8=
X-Google-Smtp-Source: AGHT+IHl88pqcy7dfhO2wIWoi3SIMwC9Gw2RFEIrRki8b84yag0EqVNpyAPZLpK6GLqzwQhGRsRWqULYU+Fkk5Arhks=
X-Received: by 2002:a17:907:72cb:b0:b3d:e757:8c36 with SMTP id
 a640c23a62f3a-b4859595d68mr1625585266b.3.1759647838034; Sun, 05 Oct 2025
 00:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
 <aKM2sOMlivuUJHOJ@calendula>
In-Reply-To: <aKM2sOMlivuUJHOJ@calendula>
From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Date: Sun, 5 Oct 2025 12:33:56 +0530
X-Gm-Features: AS18NWBUmgkpnom4B-1rAyM4oL4_logBU9xEj69mskNgudTLV9sNT8A0b9QnXbA
Message-ID: <CAGZFCEHxw0VkH0JJYjxNHevJ69BMZQ9zbhT=YbYS6ti2j8DAwg@mail.gmail.com>
Subject: Re: nft for bridge.
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:50=E2=80=AFPM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> No flowtable support for the bridge family yet, sorry.
Thanks. For routed flow, Openvswitch case, it pushes Original and
reply direction with the same cookie. But nft case, it pushes Original
direction tuple twice. Is this expected ? or is this issue fixed with
the latest kernel or nft ?
MY nft version : nftables v1.1.5 (Commodore Bullmoose #6)
My kernel :   kernel 6.6

ADD cookie=3D18446462603462596360 (00:00:00:00:00:00,
192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
TCP
ADD cookie=3D18446462603462596360 (00:00:00:00:00:00,
192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
TCP
