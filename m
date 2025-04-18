Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD7770E2
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943407; cv=none; b=HamJcOr3QfUbYhGu0guqbt3YlMkoG/KYj+Wp2Nwu9XK3XCXqjk4gIywtF1fwXjH9NZGUjC9Yndx50ktfspOUKwaV8qgEZM+ypNhsCWX2OTKm4O2RIhAXDUebufyyeCHxW6jtGBNA3a/8lH/aTpVdNgml3oJk1OdAmHJn1ZBaEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943407; c=relaxed/simple;
	bh=LAbeRpsM43mTwswWFdjbCFa5iK013OZ9a/yvqw2HEQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCIA7ADbHqHnIbCm7vq22cvKA6PSOUlOftUwTI7vblBNU5Mbq6bVfa+FWX6in3xCnaleDwF9NSMztxzXdH3aZWGNhosFbZ/drh7bZMwLrAQ2PKS2SjNlMCuTMwLtfHBtm87VrqKnC3lBOJGujvr2i2IlVzhE35/1Qy9fsLSpJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=eq3wsFw0; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="eq3wsFw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744943391;
	bh=LAbeRpsM43mTwswWFdjbCFa5iK013OZ9a/yvqw2HEQ4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=eq3wsFw0t9CIjxYg2yxXXCIRqrendo8y4exhsxPlEo4Om9unpZ+0re/NffP8bWahN
	 JhaOaecsg6kxEy/O1wbqYz8HK+gCnuYgK3nuOiA5imuu1TeTV2RKX5HnA/xvLPmsXd
	 mYi0/sS6KvonkWa/atc6Eusa8P1/ylWQt1oq4IMc=
X-QQ-mid: esmtpsz20t1744943386t380dd997
X-QQ-Originating-IP: 4awEd7HT3eMmj2w2QoISgh0Fh8zy/UArkgZ13bZDV5A=
Received: from mail-yb1-f176.google.com ( [209.85.219.176])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 10:29:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5862446756036824767
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e6e2a303569so1133091276.0
        for <netfilter@vger.kernel.org>; Thu, 17 Apr 2025 19:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6FEjJO8Z4YjlzKQspQpR11wUUhlX4u+6uI8FxBqjoLM8BcNwXa8YWjvweFpdGr1xoC4D0VOOdSjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcdPswZ80fHUMNoUHGLzy62OpT+GqVTtUDd3CPZjLm+LVt+oZq
	l40pcXnmZmCSwe4hRMNdeVUV/Qoq+cPZK7/yMEczgnNDylV4+to/tutXq8AE5xsKT5RsYkoOOa3
	LlI41m/4OVTktVokV2Bo8VFSDFbk=
X-Google-Smtp-Source: AGHT+IEFHvO7hE8nxTewEUBKnhi7vBR0/bHbrNaVGMy8Z6oXUXp1wVjyjxC2QGfjwWsZvYqKiK1Kvja64V/VHOY35cc=
X-Received: by 2002:a05:6902:4812:b0:e6d:d7d8:7fc2 with SMTP id
 3f1490d57ef6-e7297ee7148mr1639627276.45.1744943383676; Thu, 17 Apr 2025
 19:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
 <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
 <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com> <weuaFW4cJd3LV86Dm_XEPqzgsdQlndvgmC3sLnNg4KEH6kM_9IuaVzS3EItenqX_y5N0Ke8Q-eVuv8_oQUYikrH1u9XUyF3ZUploTxzY7OI=@protonmail.com>
In-Reply-To: <weuaFW4cJd3LV86Dm_XEPqzgsdQlndvgmC3sLnNg4KEH6kM_9IuaVzS3EItenqX_y5N0Ke8Q-eVuv8_oQUYikrH1u9XUyF3ZUploTxzY7OI=@protonmail.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Fri, 18 Apr 2025 10:29:32 +0800
X-Gmail-Original-Message-ID: <A14BD98815B0492B+CAC1kPDNdUO-v5UEJYZgtOL1iZTBBxteUdfaGDAAgVQNEzcoWYQ@mail.gmail.com>
X-Gm-Features: ATxdqUF8RBrFu0fSiqYrZl5nSxBeMPF4P100ZWP1NlCjpwFwOdgxMgeiqLVVjrk
Message-ID: <CAC1kPDNdUO-v5UEJYZgtOL1iZTBBxteUdfaGDAAgVQNEzcoWYQ@mail.gmail.com>
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner
 --socket-exist in nft?
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MQjKimNqHmeyElqOEsa4nBX9iWld7uqhnKMgtfQv/pFsKYwGJ0IDHczj
	eHqP5ATJXCSN/l6yf6u0rFGrJCploffMe7n1+W+tDXQXFXkG5rYKrYH8KHgDcUiOKVfnYZU
	H/CgE0RWu0Zly5kfv6cvj29f0HGkmKmuodiJTv9OSYZTu2dAsLzQ6OSAzQcmAwt+t1uwR6o
	mRlAOKTXimHwrkMzl0o1pRCGH05xlevJC4OSd/IgEUirhycZxbWt+M7NeVjnrH2YcCZncFC
	H38mwPHatVgcVWn3lDhJ/qmEkAPkB34LBO624Ki6DvEAmAtiuTeCI7TLODuEAgeBrJflipj
	AnYbJ1DCQuQz5hRIUusG2Gu6rGiUQeuMzxggLFE+XZsOQfcyIrVOdxbiYoAD75TTTe6GXWx
	6zPyKLVWWOa88Ljq3iuMBgDBZo5ohCTCv+HvEAuJ/QN5kJmDbkM1phTz/BLCgzZy8eRT2Cz
	eQg6qJmRBm6cATwRY9gB8/GlJmHP3GUOhfFukwVZVdHyAy6ZRBjdDL0eOqZ0t7QPu9sTV8g
	u9Poy8Jvz/CEFn4uFmIDV/dWD6sYyAXu9VIfWEFDes4cXzKJlL7q4V1vPjV+MaS0zPqgYNt
	vTcO93Mivj9PlG2QEbZqjtfCs5Vvw56fGnQUSLVUnRislx8+Q7Pxmjzb0w/C6l0J6lvfkM5
	vKKa8xIq54iifYDSjuEEZIHM8SlpeTYdq7yYHQhOIa94NxYYVmpJwT8Ni9ieSSRxmmjThYj
	E+a3RP0Wyy5FcOZDxAVUjUOCl/ojtJWXw2Uv8k89G27/HYY4Ipv6KdpPN3sWUlFIrhn5bV/
	DEZTCrFal+ZrTC6QXWWqABf+qUu+tCN7O1TDOQNRV00ziYb92Pr1x7iMgbcWsOmJJlEmVcK
	zruJVP4RS1R1En75XUm0jTM16QYxQcQg7tVMwFXNBlzADXzJ0o8zrLLFWX3pUuZUGi3A4PB
	1q/y7ZXpS3hRxAQVxqS1Wh+8kZrlZ9Z6Ldmo9hHC/ZAz9wTdze2hiyedO
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Sunny73Cr <Sunny73Cr@protonmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8817=E6=
=97=A5=E5=91=A8=E5=9B=9B 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> > --socket-exists
> > I just want to check is there a local socket associated with the packet=
 or not.
>
> Apologies; I have misunderstood what this flag does.
> You could try:
> `iptables -A FORWARD mark -j MARK --set-mark $FWD_TAG`
> `iptables -A OUTPUT -m connmark --mark ! $FWD_TAG -j LOG --log-prefix OWN=
_SK`

I mean that I want a nft command equivalent to `iptables -A OUTPUT -m
owner --socket-exists -j LOG --log-prefix OWN_SOCKETS`.

Is the --socket-exist feature missing in nftable?

Best regards,
Chen Linxuan

>
> Regards,
> sunny
>
>
