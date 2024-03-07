Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495474262
	for <netfilter@vger.kernel.org>; Thu,  7 Mar 2024 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709806167; cv=none; b=I/0TvjMFJHkVfR3vSpdTRm/x1E7rU0173bOL8Feiko4LEzxFfzVes5MAX4JLQCK7REy1JnmVTukI9V2PiK4m5KpMNXyNY70a0L3L1RfTLQ3tnl4s8kWu6L1nfcNI7y1+0aC0VE6jNw6Cn2/kWtVHYRNTwMjxjAeyQzEyZTpA42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709806167; c=relaxed/simple;
	bh=aDMYj+NRpkrAz0muBUcdgLmFt2c7sn1RlkFaaXlmiXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWRG81L9WGBufEQREYMvA+SbD/QMj2G4RCsq/su5fV9dDiKFM0Fkh3UXNGZrnuGTl+tEMKwAAudbKIwBqZT+4NKfwwtLADHipJLfL6H+x2w/H6z0pXjSbUY9aLoiv/DuBv2qD7nm/ZLiEpoXcvt62U+Wj4Hszi/5WrvNSI1Pk1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGRGoR1i; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGRGoR1i"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5640fef9fa6so730611a12.0
        for <netfilter@vger.kernel.org>; Thu, 07 Mar 2024 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709806163; x=1710410963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM/nEpxHTcfR6cE071ret8Il7VEJcQLVtYuQKuWoyVk=;
        b=cGRGoR1iLzzGwa0SMdI/aNfqWOz5Ti88DfUN2BQK7NFe+ufAsNnBOjwQ5imL2uVsG+
         BEFpvQ9kUP5qZfSWYBqd4Th6clIt3oMqfc2HI0f+95hvsmsM5JJtmd8KLBX5jdf3brzo
         69vk/ucCwEN4gkuezkXvejxSn4YUhyioY01pkPQviTOEGikdWunp3bQy9gKknct0+Kmz
         dYRP4c0h5lTs1GDEaWYo8oyfgiNhDgHiRgqKPs6WWFF6O6PHvVZEvP/mFe7qUk/K4CLT
         7UpL8z2271ykWXtJSeVXT1LhpBAInVNezmUXKX2BmUQDySePI/x8kA0zkQDyFXw6VkzD
         WOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709806163; x=1710410963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM/nEpxHTcfR6cE071ret8Il7VEJcQLVtYuQKuWoyVk=;
        b=Iyk8IHEVrE5JfBqWgYv5OKCehMnq68a26322W+MfJc+4zG7aT8yJmDXdLQmiuzUHcg
         IAK+g+5vaqdA3r63Z8sjElr622ERbMIYtjTzgFI5rQ0tEapIrPDKZRUbw/aznyB+HPle
         /WmtIG946UHVzzp+oriNNSPMjR3smc2sJlCmocALqlU2Ync3VveSRvFyQ40cwGhy9GL7
         ZVSz5C+5uHVT4Dw1fwK6CCuBvOc78PQMSD1gGFRr8XysQqbD3bVnJ+mNK71EOgHu22sQ
         0AC/mVJ+X9JZYCxRCNiL1MyVTtto/ppqB8Ii+JPlDp+AyXkyPyGg5DHlhLoHkrjFxgfj
         ekXA==
X-Gm-Message-State: AOJu0YyTVexlf9u1mj62sn959kZBnCjcEwiE51ZSseMzUvqdFqcoMNbc
	peDm9QYplCSmpHIbaOiyCK+psziHfHWZ8bKzliDiyNfbCzE8v0HDqsOFrpBe6uyAoS94H7hrBor
	t3AoUm/km3SOZaB4CNMT+o+dW+xdletQIABrDfw==
X-Google-Smtp-Source: AGHT+IG15/cuWZmP/i6vLCABhZoS/0fCEgIwhiHNUKeMpE80A1Zu2w2LoLgRMxenqXI0ZZEYD7qLf+MkmJsj5c3bnnw=
X-Received: by 2002:a05:6402:222a:b0:566:2a20:fc20 with SMTP id
 cr10-20020a056402222a00b005662a20fc20mr12933453edb.9.1709806163332; Thu, 07
 Mar 2024 02:09:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
In-Reply-To: <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net>
From: Sreedhar M <sreemtech@gmail.com>
Date: Thu, 7 Mar 2024 10:08:47 +0000
Message-ID: <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: kfm@plushkava.net
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is really inconvenient that we cant rate limit the packets for
multiple seconds , we have only the close enough but not 100% right in
edge cases.
"1/second burst 10 packets" should be close enough. The bucket will be
initialised with 10 tokens and refilled at a rate of 1 per second.

I really cant have an alternative for below please
iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
-m recent --update --seconds 10 --hitcount 15 -j DROP
nft # -A rms0 -p tcp --dport 8000 -m state --state NEW -m recent
--update --seconds 10 --hitcount 15 -j DROP

Thanks
Sreedhar

On Wed, Mar 6, 2024 at 10:39=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Wed, 6 Mar 2024 22:11:49 +0000
> Sreedhar M <sreemtech@gmail.com> wrote:
>
> > Hello Team
> >
> > I am currently working on configuring rate limiting rules with nft and
> > have encountered a challenge. ex: I would appreciate your guidance in
> > achieving a rate limit of 10 ICMP echo-request packets within a
> > 10-second interval.
> >
> > Here is an example rule
> > example : nft add rule filter input icmp type echo-request limit rate
> > over 10/second drop
> >
> > I understand that nft doesn't directly support specifying rates in the
> > format "10/10 seconds," and I'm seeking advice on how to adjust the
> > parameters to achieve the desired rate limiting behaviour.
> >
> > Your assistance on this matter would be greatly appreciated.
>
> "1/second burst 10 packets" should be close enough. The bucket will be in=
itialised with 10 tokens and refilled at a rate of 1 per second.
>
> --
> Kerin Millar



--=20
Best Regards
Sreedhar
