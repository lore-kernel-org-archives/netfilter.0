Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BE56B83
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709898310; cv=none; b=Zt/NGBk7XSEgTigK8aBy5QWY8hUtN5yv3KHpWMJLd5wOaYP2h3HMbxUPJviz2zOSymvUnCaQbYZhbEop9PdiKLJNFs+JBPviAXNOpKXA1tZ5Nq8Zm2JJL2d0Hq2ZzgHHoKUcrZ2GuNjwiYX4sVUUeaUT0i9P6DanRbs0ckyDFA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709898310; c=relaxed/simple;
	bh=J9t9qC0Hi6wV37NtJMHFC1KFNV5/bZmsziB8hZSX5Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOYkbzzFT1iOW8T1VtnK18NYZD8c0G+femSST/E004XlcmB+NEekzUvxRXblp3CPa+TRu0XZQ5OsQFXoTv5wBbtjtRtOW8TOWBfOrXRfPAdJ8cFYy/+DVZ44H2H8mssAxw90vHwNR79v9X7XjOchKGJPimkaLwCBRFK+p8b+nmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlPr8ZV2; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlPr8ZV2"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2794644a12.0
        for <netfilter@vger.kernel.org>; Fri, 08 Mar 2024 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709898307; x=1710503107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBn5yRX1CrN+OmKoyxq+fsTveHp6Ife+o707Sg8cKak=;
        b=MlPr8ZV22yz9eEHjEeWajjzcnwfiunU1jSy1ta23LxpcggS354M5WGHIohzQOICxhZ
         w0uX+hh5f6PivDKLIdvWfWSHSQDTh/I+mJUufTMcVdhqnDIOX2L3k5Hquc0wSoy+xgvF
         jl1ctpHRSNAMe76wkQnfrIJdNwbnpL0w8q3yaZxpETggJ6VspbHj0AFymKUBsonP/tL4
         pw9GujfNt1OrPrApFmILTQQhF2qYE50oeBZoFOMaPRJd4CHG2CWs9ziWqucZEgGP6f1w
         /oG1EPMocaQnyySc4aY/te8anMzBEtFl/zbPsaqrM4x8wz45DIOg0oOGZ8HfhdsT8ml2
         bbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709898307; x=1710503107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBn5yRX1CrN+OmKoyxq+fsTveHp6Ife+o707Sg8cKak=;
        b=FXBl7EIswmUGosTpaDOPZZyTfOqJ3WmImizD9KLG/9W9Bl76xC9D2sYn0yCA1dVIuv
         v3EtBSguB8zUTu50YlICSqOFlHCzR+RPbtDn77wt7UE05MnhFIQXNLb6rTE8FYUq6yoz
         q9dWbhxS3czYSBKmoQNXPLfZt2sHhWE8hjV1/GIEvd7EGz1HSGXOoqGvCcHOT2OeYOeM
         njezJs4t8YvFW4VkMm2Sj2cQHOTwRBLhqyFtrqkbjg7INYiU7L1BlBlj0woz2mcjqs3y
         DmoqzDJiidse+dduOO4aU4xzoH5of8W4Yu29NkN/B3gIyLJU25FWJJmn1eee8L3oCXES
         tvOg==
X-Gm-Message-State: AOJu0YzgaEC+316X9gRwvzFHFK0FiNBTNiURh3sTKvNgWMyUify7TZOJ
	JTV4qq4weHUnTp+zmXYBbxDgP296tSOQ3oNpAujf6Elb4wrY3qrfRihe63RzPXE5F48kObr0XeY
	ZfM5ZmXJ3bWDSBpNLhEtWrxV9hLU=
X-Google-Smtp-Source: AGHT+IHOfWsrQrfTTZdcuoBWS9lgKkZ51Utc1fpNJ7cg+q/HSHhALtb6IFORVDIaX+j/Z2tgQB7ZVl9dFZmP6vr0eIY=
X-Received: by 2002:a50:955e:0:b0:566:115c:cc88 with SMTP id
 v30-20020a50955e000000b00566115ccc88mr1890058eda.9.1709898307302; Fri, 08 Mar
 2024 03:45:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net> <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com> <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com> <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
 <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com> <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
 <cd20799d-91fa-4f5d-ad04-04eba4c9f28b@app.fastmail.com> <CANvpR2CLZcSOUXhRxn9g_9kH79HA7T2=AXF5s0LY8tEqxQ-pLg@mail.gmail.com>
 <55db52fb-ad08-402d-ab2f-9106ddd538fe@app.fastmail.com>
In-Reply-To: <55db52fb-ad08-402d-ab2f-9106ddd538fe@app.fastmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Fri, 8 Mar 2024 11:44:31 +0000
Message-ID: <CANvpR2BZ7xjjbJz6P-THeSHw-uTVuOWTPfeBX98kAKp_49TL2w@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great Kerin. Good to know the optional.
Thanks again.

Best Regards
Sreedhar


On Fri, Mar 8, 2024 at 10:34=E2=80=AFAM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Fri, 8 Mar 2024, at 10:19 AM, Sreedhar M wrote:
> > Great Kerin. Thank you so much for the support.
> >
> > With the below rules specially using 'add' and all my uses cases are wo=
rking.
> > nft add set ip filter myrate  { type ipv4_addr . inet_service; flags
> > timeout ; flags dynamic; timeout 10s; }
> > nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate {
> > ip saddr . th dport  limit rate over 1/day burst 15 packets } counter
> > drop
>
> One more thing occurs to me. Now that you are using "add" and, given that=
 "1/day" might otherwise appear confusing in the course of reviewing a rule=
set, you could probably get away with changing the element template to:
>
> { ip saddr . th dport limit rate over 6/minute burst 15 packets }
>
> Consider it optional; the behaviour should not change at all. Still, it d=
oes, perhaps, better hint at the underlying policy i.e. something should ha=
ppen after 10 (60/6) seconds. Normally, that would be the bucket being cred=
ited with a token but it is my understanding that the timeout policy should=
 prevail.
>
> --
> Kerin Millar



--
Best Regards
Sreedhar
