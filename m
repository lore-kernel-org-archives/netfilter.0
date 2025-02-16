Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C56C187325
	for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698128; cv=none; b=HBL51DPZCNC2gxfQ+TmQ8xx3YOZ9f+xuc/1758a1rESh+HhYrSQiXob3oOxPpsf0umw5oUvEGJa5PdZdv3vHPfhN7zvB2aSuaEG8wlUtM4ReXpkHE/wfnGLhmvDmWRMxPxaJMFIqkNnYY+1H3VwOko7Q/KccikYM/VdcjE3u9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698128; c=relaxed/simple;
	bh=JzXV3Tgic6Rw+id6SlTAJZ06fX+GQSoOQ0wAHlQYAD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a71ByL0EZlPXQmblLQFvhv3kX4ASi6LTO+s9gKqua7qfA+mcNnvvief+d5KNjiXPsddbTqD8ys5FMfHa9R8U7SWnCwj8t0aMygRzRYaTCjZqggAg7IoHw0pt+0DqQgAE2WFdc6P6O/fxyNwKN/JSTz02KPeORI5MedqqHkdpCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5XWU1lO; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5XWU1lO"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f3df03d786so1479185b6e.2
        for <netfilter@vger.kernel.org>; Sun, 16 Feb 2025 01:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739698126; x=1740302926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8t7rrWV5C1gJ+bDZMplYOZiHNyAaSyFA3iHlsnyFZw=;
        b=H5XWU1lOWHAsQ4Ix5V8f6h2aCuRnwYHhM1+lOqWDPOdGbnVNXizugv9fWhvChb3esa
         Jq8Vwe4Fd0gpgjoKXpHRaK6QAl9k2CG5P58/2o26jRThOiujRtsaKGKCr+/VFo4qCVrd
         Hz7Nf5mfndRuWhp2JSYneMQIRLtzrH4M/0fP6dXpTCfhAiCWCgAx6oe0jExO+LuQ4uUL
         +WyFZ3T8bOOMOtXYdGsTI59wiIqZ0r6V0QBzRvnBLb1E6TvVv5YTRt2Ku8DOvTiaJ156
         pG/5tfcbch6iqu8glxjbsOxDu9InINJcK6w4f+oY/841cCnK7iOMm1wxomDz2cOqb7O0
         W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739698126; x=1740302926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8t7rrWV5C1gJ+bDZMplYOZiHNyAaSyFA3iHlsnyFZw=;
        b=UtQWYPqggmFXyUguyogiJ2E9vnIEfURibZbGJZargpk6RmXlfwR5EfQdzNgGzEqzcu
         tiuMKob4Fq2ApjRXHTeIv0pD2HCg2XViAXMTI9AvQEBzcggcspQN3Oiu+9EurkIr+J+C
         FqrwYlHXkWyYYLKBvyKvDjA8kKLCwZ8dFuY+4FlPlSt9fswbHJ7zFD6Ef7Xeranqr1kl
         r/88pwpHMV93pYNPpLshQ+4dTlSteQTIxj6mvroGu2JRaNwOQEZJ8hLZ3avVcQ6fyTmx
         arBPafXerK95zXEhvsnIIV1ob4psB9hu54sbV45sXQ+v8rnU4ofuFMv+UZresZE+rWuU
         7sOg==
X-Gm-Message-State: AOJu0YwZTe4UGjSOBD4Zvgy3Nx/19VQ+IUJE5TzFQVKKsORFBW4UDAtB
	8xmbtNL8OOl4ibBTC/k3x1sNj8tmaCktUIm6bmnUQ/Qnax7Fh38G2VF1PxFN8/jmKyV0p5GzeX/
	7SIBwRGmDevM+zWA8DF75t6VjpPiFp/TZ
X-Gm-Gg: ASbGncv6cXuIBEzrE/ytGZtcu8k0pu9vZH9dv7Kj8YbEBHwH7DB8fEzMdd0WMomqJUe
	g/MJ2OA8XYQ8UEweDF4yvb7xoLSaXg5mC8mSATTQiSE74Bn5N3P92usBwUxIMn3c3knPszi4=
X-Google-Smtp-Source: AGHT+IEga9OwsyA/64ci7QlnoQcbwokVkssgdvd2MXGkRGKGguKoooOie3QabUkCBacSx1safw4WWLRO3pmA9/pKYKQ=
X-Received: by 2002:a05:6808:1a06:b0:3f3:c29d:f95e with SMTP id
 5614622812f47-3f3eb0a42bdmr3320140b6e.5.1739698126253; Sun, 16 Feb 2025
 01:28:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
 <CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
 <CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com> <20250216124022.127f90f3@gnosticus>
In-Reply-To: <20250216124022.127f90f3@gnosticus>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sun, 16 Feb 2025 11:28:30 +0200
X-Gm-Features: AWEUYZlMlxexPOQVdz-FNw-9mM2m2SuquwrUOkf0sYZTz7f2UvLxezbKd4U-k34
Message-ID: <CAOazyz0KRqij4oenpBKbgQHJMem18OAQmNkyytfPSG0y0L6X_w@mail.gmail.com>
Subject: Re: Static bidirectional static NAT for duplicate IP devices using iptables
To: Adam Nielsen <a.nielsen@shikadi.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 4:40=E2=80=AFAM Adam Nielsen <a.nielsen@shikadi.net=
> wrote:
>
> > Summary: I am trying to access two devices with the same IP address
> > connected locally to a Linux computer, each resides in its own VLAN.
> >
> > I made yet another progress, I use arptables to mangle the ARP request
> > of the host side, but I am still missing ARP response to the device.
>
> Isn't arptables the wrong approach here?  If you're using NAT then by
> definition you're mapping IPs to the target subnet, so then there
> should be no need to mess with ARP as the packets leaving the machine
> are already on the right IP for the subnet?
>
> I am by no means an expert but I would've thought that all you're
> trying to do is to convert a 192.x address into the same target IP, and
> just control which interface the packet goes out on based on whatever
> the original IP address was.
>
> Is ARP mangling needed at all for this?

Hello Adam,

What I am looking for is a static NAT to have 1:1 replacement of
addresses from one subnet to another subnet.
For example having 192.168.0.X <-> 10.0.0.X in both directions, so
that 192.168.0.1 =3D=3D 10.0.0.1, 192.168.0.2 =3D=3D 10.0.0.2 and so on.
The NAT is in reverse so that it does not NAT incoming but outgoing
communications.
And to make it more difficult, two interfaces share the same
destination address, so that we need to assign them with different
virtual addresses.
In my example I proposed two conversions: 192.168.110.X <-> 10.0.0.X
and 192.168.168.111 <-> 10.0.0.X.
The 10.0.0.X is the device network which cannot be modified.

Do you know of a NAT configuration that can digest this?
For now the only solution I could come up with is filter hooks + arptables.

Thanks,
Alon
