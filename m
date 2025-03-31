Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4D7081C
	for <netfilter@vger.kernel.org>; Mon, 31 Mar 2025 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440435; cv=none; b=daUVh72NIsYuFoUSJH5XyG+hZ2kFiGCcIbZoApeLL0UBxPSGhHztYujfqEl2aBy8rF465l2iibtL4fPBsYyw/DIkadYRS7Ss1iQfovB3k9jWWiNicjMA1xoKCyzh1hDM6BkXBxx1yZSdourH5UpM4t7nlqN1qIFeR+1td/2wQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440435; c=relaxed/simple;
	bh=0uY0kngcfEdhg6RG+ZfZfJTMMSnT7y0BU6ZB5QG0zKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLUsaIFu1xQVVTmMBgNxH9EutCoh9p4USKkj6Hurg1xEVd/ryJLJOJQsFBwaFgDHOqQ79sHW9qZtx6xYDDDEglqdaR+JIJLO/pkUCWTB/aAVm/3PxCarMA0KFrYl5TgqGFy+w5+U5O8jJ7WC1NqlnMbn1vYMrJPtRClsxZ59W/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov; spf=pass smtp.mailfrom=kansasdeaf.gov; dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b=pfXvFCsE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kansasdeaf.gov
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kansasdeaf.gov header.i=@kansasdeaf.gov header.b="pfXvFCsE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227aaa82fafso89093655ad.2
        for <netfilter@vger.kernel.org>; Mon, 31 Mar 2025 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kansasdeaf.gov; s=google; t=1743440432; x=1744045232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uY0kngcfEdhg6RG+ZfZfJTMMSnT7y0BU6ZB5QG0zKw=;
        b=pfXvFCsEF5hsqWcZvLnw9gJS2r8LmSMS11HZ6Miw7CPrUga6AbFactzcZaUGWpr45E
         pouG7dRzObmzXFTHOGvADp4YHKLbHHw3meARUas08TrLJZ0dRlKZDrA4KhBhytix8MGz
         PQgHAu1RLp/AEGCruZerQ371EC2PNAvDub1Mr08tFAyV0IHJN7CRsAK8wjW4yTprHzBF
         eQInVVIFZvS5erj8nvIzEjeOnERuLw3BaRCAS4z8wP00pa+iZNDfSLsj77vlcwIF1QA6
         LSUsUvA4stCn/9/OhKB1Uuj6nzBUvHkvdvl3vwEK6vLOhH5A0bBsI4Tg+JE8YYBQu/eL
         lLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440432; x=1744045232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uY0kngcfEdhg6RG+ZfZfJTMMSnT7y0BU6ZB5QG0zKw=;
        b=BPb19LaZDrwBGUiyh+itCut238doJJKk7MyeNJjLnNYvKbfdngY7Iwd+7AiDOC4z3f
         fK/be8cwDCeDO/i/OYTHHOjyJEIlLmq0GXlOJaJ89DIe3DPcVDWehHUoIyz79N2nMQyy
         rhpbsfizf76PSkm7xEyPNrLznySFLl3zlMS02e2oTBzR3BKlt92PTnzTxSXQ/NdZLgIR
         5Aj2mE7sb/efJO5b7xn0Z42LltqOQWLYDlz5jm7/yfkbC9lgEg/MBQ4KxUiduauMZKTs
         e0x83DMuQ6IfkKoBtMcN/+oI1dcwLbtLPZpf516XcXrYRdSynqZoR7aQOdPYleCPnvaU
         XANg==
X-Gm-Message-State: AOJu0YxMq7n26Mhn55ILQ3YovwO8p2JJxeTqBs6QIXH3IEC6GBztJNy2
	tSt7tPcaSSfuJAfUClIvgn1CMVgyZh1Ps1MC/m2GGWqlBZGQP5Hq8FNIbdh5GnLWgy3iUmfzPQ7
	eGCsgPuh1M3YVHGnywb+E7sTVyjI2xNGY1VRaTdhqcL7kJqr5nN82oqa7DtcpaXIeEFezMxkzcN
	qMa8/+Ptoh4m1YjCXBMryuUxhTPyGVQUgCZp8F
X-Gm-Gg: ASbGncs/RjS3UY65BlWKNyFjPVLjwNADXcvMuV5aij49CxAGDGahlXdFPjVpetfz853
	yuWz9c/Lc6Y2dIgr9xTrp30crRUHMPNGs0HEPKfWw6NAOfvh4SqKq68n4SDTelpcXbmbKcC0ktu
	pCwFaUfUtutghBEwHGo6pj+enn7Hk=
X-Google-Smtp-Source: AGHT+IHK9LdzEw/zpwU4WNjQbTJwPJoiLV22pOqhsB8T9HLS49wRv4N1eRlMikGJ19Y6cBotp8uyrFfRlGWd7Zql81c=
X-Received: by 2002:a05:6a00:1823:b0:736:ff65:3fcc with SMTP id
 d2e1a72fcca58-7398043958amr12445865b3a.16.1743440432311; Mon, 31 Mar 2025
 10:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPrh4R458ZB8C5-Zm52FsnyGQMQv2EBp-pvkQ2wcZSeHhtoeNg@mail.gmail.com>
 <Z-rIIhraCyG8KELs@calendula>
In-Reply-To: <Z-rIIhraCyG8KELs@calendula>
From: Bradley Hook <bhook@kansasdeaf.gov>
Date: Mon, 31 Mar 2025 12:00:20 -0500
X-Gm-Features: AQ5f1Jp1gK9KjV5QgtT9zlRK9CFrFYDgemFnNKds3Tfm4atsQSVkff4yTBzPDtA
Message-ID: <CAPrh4R6NrbEXPg36Ogu-ftaoLQf84FDQAu-TjJdnY5HERQCvhg@mail.gmail.com>
Subject: Re: Packets not traversing postrouting chain
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was in the process of investigating conntrack when your message came
in. This all happened while the machine was active and the interface
for the faulty ISP was still "up". There was a cached SNAT entry in
conntrack that was bypassing the application of the updated rules. I
flushed everything with conntrack -D -p udp (the main issue was SIP
traffic) and everything cleared up immediately.

Respectfully,
~Bradley Hook, J.D.
Network Administrator
Google Certified Project Manager
Kansas State Schools for the Deaf and the Blind
bhook@kansasdeaf.gov
Mobile: 913-275-9982

On Mon, Mar 31, 2025 at 11:51=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter=
.org> wrote:
>
> On Mon, Mar 31, 2025 at 11:19:31AM -0500, Bradley Hook wrote:
> [...]
> > The issue we are seeing is that packets from 192.168.122.252 to
> > 8.8.8.8 are not traversing the postrouting chain at all. We can see
> > the packets leaving the interface without NAT applied. We can see the
> > packets hitting the forward chain with the trace. Other traffic from
> > other subnets are being masqueraded just fine. We just aren't seeing
> > the packets from 192.168.122.x/24 hit any postrouting rules at all.
>
> Can you check if connection tracking is tagging these packets as
> invalid?

--=20
*Kansas State Schools for the Deaf and the Blind Confidentiality Notice**:*=
=C2=A0
=C2=A0
The information contained in this e-mail transmission is confidential and=
=20
legally protected.=C2=A0 It is intended for the sole use of the individual(=
s)=20
entity named in the message header.=C2=A0 If you are not the intended recip=
ient,=20
you are hereby notified that any dissemination or copying of this=20
information is strictly prohibited.=C2=A0 If you received this message in e=
rror,=20
please notify the sender of the error and delete this message and any=20
attachments.
