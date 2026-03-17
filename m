Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64039890F
	for <netfilter@vger.kernel.org>; Tue, 17 Mar 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736093; cv=pass; b=XuYATbAaXs3HPQRjFxsG6cx7pTLoShlxCotgqWea0wwQeNyNsJlJ4PkpUNm5dtP6ceXjiaS4G84v1VtNwZaLosyq2PkZ+KKF8ALlb+aGw0EFzpt0O30c7+5pnshJrBqlMtfys6aGAqU2Trnsy9K3xsV9vSX1pnYonQBNFu9pPgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736093; c=relaxed/simple;
	bh=ImgDxq883NPWm3vjQ32qTDSyS8SlWxtasFPJaSchMys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgfBzrLnsd/j7Xy8Lg2wgPykZfA2N0RH/i8us3OauNOW5f1RktICDvuugXv12LtBMSuR6GDnMsDDY68JFzszbJgoxwcGBCT5uWn1pU2+VcrNDal4p15qLtiYnWGoVFRwbboDxSH336uTWuiuYOij29zHHCIvPDkrhb+mtwkDEUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I85N+vUP; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I85N+vUP"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50919fc3a14so64214821cf.2
        for <netfilter@vger.kernel.org>; Tue, 17 Mar 2026 01:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773736092; cv=none;
        d=google.com; s=arc-20240605;
        b=hC/699kLn3iUKBhu5SsqKAHFbvUYff2mDRLfHo3igS9BOdCiNFcffeyjvCgcoxLxhM
         7x9hHRymQ7FKKQidD7EUj2YNPR5w7gpz3Ej0tsyJo3b/idbW4O0lW4jsw7N1zXr1x5M+
         viPOj+w2bo6SkBRurSwNI8Z379cALrnJ9M4g4L+cX2ix5vVCV5DmcfU+04X7CbbPha1Z
         o9YbNWQ2MB6FzSM9ZiHo8CINhVmMTouKwW77b4YyWBdml5fvm8Th3wPnoF1DtuEppiZ8
         VgUdICFC+XGSyMbWs1MboMBwwUB4gZKelOvtnvVrfCrM710NEQ220lLCtfIK5ti1b0C1
         yl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJpR22/OvJLldzfsNSVj0gaE1Q4SAr4K1beLGT0TT+I=;
        fh=n306jhbJzeV2J+0I1pPaX80SjZdHBkJbvTeYvtVxzWU=;
        b=UmEyuvNvj5A1DLGqc5TGBk3LdmBqHCXrMgc4rzaT1X4uPSgJoS1VfY8pq3OmSI3ZuE
         Cy4MvrBCPVbxObCS6QKHsNP6iiMQXGJWe9J4Z3o0c1WXgee88+OiWXZfY6bGmEky14wA
         ZTCaKpYiHnuMrw7aPiB1zxj5wVOQBxr8aGFCwV2slAbFMYotMO3787tN8XLBYIcHRGIP
         rmiVaFHaB9k698B1jVTghu46SnC8Zfbl22b4I0EGuxxymQWAaDn1WDU8NocJ1LfSvXkI
         5pBwmkJUjN3MwJeTZun7UsxCe0TsQZ7atHBK+mXwtaV0gGbu/iwF38n/KDZ/yfj0WdL8
         lhKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773736092; x=1774340892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJpR22/OvJLldzfsNSVj0gaE1Q4SAr4K1beLGT0TT+I=;
        b=I85N+vUPxAnf7sIv9Q+2k+o+UiiXxnQP/w8XTHl5rTzWGsve3icgzjYiUEN6ZsZlyD
         ZUU1umI3U378xu6YpfDGGx7erSm0XUhSZV7m6h15LG/bhCigvdxlJUTExZ+pP17uKmw2
         8gd0FMhxyOnxtxBpdniomfmyvpowxHuFjs4qZp8PKdqtGkIUuFQGZQv735RnWUwPmeOs
         ZV5GsYJt1LkgVyC5i/4+PEY0Ub/iu7t29Yb6doLw9xpGVEXMi+fRuSCFdyDGQO7IRUXQ
         UmwvbAKmhjoFvoSfko05U/TNa/GNIqOt/2U9NqckLDqcGIA4WQspCm+LrfJ0bzScMdFt
         744g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736092; x=1774340892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJpR22/OvJLldzfsNSVj0gaE1Q4SAr4K1beLGT0TT+I=;
        b=bhOS4KvYiu9RubIt8ToOZ+sRBEFpcl3GOQBf3jpMcyBsS/GhHvAOHyZsV7979PnICl
         dATBemXIOi91mmSarHEpoUbb9H4tYhjKbIW45K58I4c3iVon7VP60KKLJXqr1dp8eq5R
         BfIH2bnnNhbN0AhPyL9uBEU+qE2SMrreSFXZsE5BYCsM6HkLoF0fAY3axck2IRqbPRKm
         CYDkW3BsviSoIXS/Hx44Bhxh0Oc7kSH6IgLv41mCWRhBIHd1rjH+zpxEtCYENke6Bt4U
         d42QYECCKnORu/i0s6TfFnHLwhxISB0l5FkJKCJbjZCYK7Cdl6otVXJggo3Qjfw2VGE4
         Ib4A==
X-Gm-Message-State: AOJu0YxKk7EBR2YCb2q2aR+nmzfuiV17Ro0Epv2DAY1k2fxuqyfUsLDU
	TdfFfTu9Rjx9lh3barLFmFs+ahvzNVVVWN9VLvJWX7Svl0f7sWW40oGDFuADQFZJoISlcJUmQmb
	cCwHVkGcL+MBdbK6flAMl9AXemElsyVKqng==
X-Gm-Gg: ATEYQzyIrczUe94IEHLV7MFYy6GRrWc0h0aPCvq/EHI6z54Mtonb49XqapBTMjDcVqJ
	VZOQBMl7rAYlpHgsOr66DDylR3Ryu8qSPgqieUq5h60U/WHFSH7L9PAH3Iq4vfiufZUKSnZdcJJ
	EH1sS4hCaQ5pduSLTXSVfQTmnm0TQ3jjjJHBIu/0MkSwSywqW/ZEwMKaNITF3w3FGtD+RCeA9x1
	9fRciJO/ganwmYC5BQwd+zEo0Vf7ZOKnQYohVQeGCHZ1x0zfcJ5GwjbX8ytVWrsfEHuF48AGidu
	ToUoW517hFHIbkxKYf/fPrI4GikVTcuIvOyfty9sy6oy395EdXheTByqWtp9DjMST7I=
X-Received: by 2002:ac8:7f41:0:b0:509:1dc8:e9e5 with SMTP id
 d75a77b69052e-50957de6bd6mr204511951cf.34.1773736091608; Tue, 17 Mar 2026
 01:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwLUps_jV54QpqN6PPQiqBUGpyAVbWT-Ht+FgxM21-UxjJ-Wg@mail.gmail.com>
 <abb0hBaCsEFDW8Wv@chamomile>
In-Reply-To: <abb0hBaCsEFDW8Wv@chamomile>
From: Mathias Dufresne <mathias.dufresne@gmail.com>
Date: Tue, 17 Mar 2026 09:28:00 +0100
X-Gm-Features: AaiRm50cRTrK-WdV1FwC4Z-85vWHdKqvchdC4BtEzaZr0V6cYGOK93w40sSdyxk
Message-ID: <CABwLUptQ6sybaK6dUijY_BmvepZ1hZczqaL9LC875QZUNz8yYQ@mail.gmail.com>
Subject: Re: [nftables] table netdev, chain ingress, too much interfaces?
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pablo,

A great thanks to you, my mistake was the major version of the systems
I used. One was Debian 13 and the one behaving strangely was still a
Debian 12.

Once the older one was rebuilt using latest major version, the issue
disappeared.

Cheers,

Mathias

Le dim. 15 mars 2026 =C3=A0 19:03, Pablo Neira Ayuso <pablo@netfilter.org> =
a =C3=A9crit :
>
> On Fri, Mar 13, 2026 at 11:51:25AM +0100, Mathias Dufresne wrote:
> [...]
> > and the error is:
> > nftables.conf:7:5-42: Error: Missing `device' in this chain definition
> >     type filter hook ingress priority -499 ;
> >     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> It sounds like you are using old userspace version.
