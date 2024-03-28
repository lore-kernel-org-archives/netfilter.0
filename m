Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4452033E
	for <netfilter@vger.kernel.org>; Thu, 28 Mar 2024 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711614047; cv=none; b=dh7KndOjFbAE0Lv/JhtPXCYpFYv1FfoKaj3OGHb0h6+vDUa3G4Mln7WdzdyoV4TkrQZP2gMtXv6zQXSUl+bipOsLR+XTRB3+WkLfVS+5RgAtXXanlrpdLvurO7vuNL7HIP2B9/pYP7/S9gMMsiTJPLE3/K4VW086cy3lrftSojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711614047; c=relaxed/simple;
	bh=AJdsBBu3WolORzNJfc0BJWr46fUa7UHdMqkg8z0oZ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=kfmTCsV0nZZVo6R4lGPTEO9aaUjDu6Yxitxu08kUWE7Q28bqpvuqNpYxX4pzPYHjOJa1uEL3LNdFRbKYHWUF9NSKzDGWIt6dFDs/ZUHSC+TJhP7RkwEfIJvxlSLXu81JRvZSn6bVepvjmrnVgzDVSgpf2BsO2ZIEyBGkz2ZN+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsisyk.com; spf=none smtp.mailfrom=tsisyk.com; dkim=pass (2048-bit key) header.d=tsisyk.com header.i=@tsisyk.com header.b=BZqGEh0Y; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsisyk.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tsisyk.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tsisyk.com header.i=@tsisyk.com header.b="BZqGEh0Y"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4affeacaff9so206698e0c.3
        for <netfilter@vger.kernel.org>; Thu, 28 Mar 2024 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tsisyk.com; s=google; t=1711614045; x=1712218845; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWclARioFDx7r/Uzmw++RIVBmkLQo/HNx1NlnWT8U60=;
        b=BZqGEh0YDPVQdTcs6cV3yo9tdsOkcb1DCiQGZJOXKTezfUPwSg06h9QXKZ5OG6I+lq
         +UYceA9uDMUPsRrT8OP1fIizNyijSUHwtfFpSh9vY/Qxl9v1Dmw/zgpDTYGktc/0ah4h
         Mn5XM4J9mcnP3un+ve+63dMzrD9wWKhZrpBFESW4jxmEigpuhpWjHIz9KWMOOdHA3DRf
         ixUWMi9sRKfMYhmIDBDvc8PjemiQ2WxFPt308J4LyTgCJFqQqGvEkB0eA6MnwTz/gYlY
         tJEZOK0kALMX81Z20ZdDTgxpippQv0WwUVmpsCwSvQmnNQ+5c+loqrH28E5G4DoTjvlh
         mj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711614045; x=1712218845;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWclARioFDx7r/Uzmw++RIVBmkLQo/HNx1NlnWT8U60=;
        b=SoT0sImJp02YfaDz4BKEGs6g8xA/OI/8fF6PKLiRbrnmrhSocTtvriydjrZsV7BeZI
         JikSs5jRBzMBwAAOu7x94bCZC6cv5hHd66+zBCNd+3Z/Sqv/56pbDkmwb/cZ1y57OVSe
         JN9VKt4xIupL81SzbmwZW0G5QtsElYwQxgxX9shB1oWDB8LnlIhYTmDgVwV9L2sreQY+
         059FR10TJIyFXxJKMB1yMBSNnTqWvJgIYlzFJqfAwpP8K3ud3AEG+cmC33IiQYASQdAU
         bz+9wywR3uza2Ier1jUm3FOrCaMvZqKPjFCTqa/sVGNIOBwdyFLplJA3e6oK3ef4QNqw
         Uj5Q==
X-Gm-Message-State: AOJu0YyU+6U1WQ85ZST5eXJZTKs3JA/Ymnx4ku259zqbNIjYYEIH1Lzh
	OKMMWV+Y9Osk+89A1KTz/5dx+/zoJXP9wSsoQhGAn6eLYym8/IS1Z264tPyM+Upl9zFnBBLbuFD
	HqFyJdeVpXqhDlIegCaeycHPRkxav+xlh3JLApd0vLOIlbeV2aTOZjA==
X-Google-Smtp-Source: AGHT+IFd6p2tXnNskC3DX/wvP9rmJ+ilxLPizAQpwmspQjI5cbWAsXZDLeMCGgnOENaGr/Ob9tErU1zJmDBdK9VgTKo=
X-Received: by 2002:a05:6102:2427:b0:476:f23c:53e with SMTP id
 l7-20020a056102242700b00476f23c053emr2605680vsi.24.1711614045251; Thu, 28 Mar
 2024 01:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzR2PfY6hY8dqkfWzN2RGG2yU7RR1t-G4d=dqa+7iUy9mjFyw@mail.gmail.com>
 <ZgPj8I0MmgAX0O0a@calendula>
In-Reply-To: <ZgPj8I0MmgAX0O0a@calendula>
From: Vlad Tsisyk <vlad@tsisyk.com>
Date: Thu, 28 Mar 2024 15:20:34 +0700
Message-ID: <CAOzR2PenHJ2tja_cLGHz4UAH3OasesTRcx6+DvUj6iTHjFpsYA@mail.gmail.com>
Subject: Re: Mask as part of element in set
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your answer!

=D1=81=D1=80, 27 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 16:16, Pab=
lo Neira Ayuso <pablo@netfilter.org>:
>
> On Wed, Mar 27, 2024 at 03:36:19PM +0700, Vlad Tsisyk wrote:
> > I have a set of pairs of MAC address and mask:
> >
> > aa:bb:cc:dd:ee:ff 00:ff:ff:ff:ff:ff
>
> You would like to match this?
>
>   xx:bb:cc:dd:ee:ff

Yes, I want to match those addresses, where the first byte can be anything.

> that is:
>
> nft --debug=3Dnetlink add rule ip t c ether saddr and MASK =3D=3D VALUE

Sorry for my mistake. I swapped MASK and VALUE for no reason.

> > But I have to create a new rule for each pair. Is there any
> > workarounds to use sets?
>
> You can use ranges in sets.

I was thinking about ranges, but ranges will not allow match over LSBs
of MAC ignoring MSBs.
