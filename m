Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540EB376
	for <netfilter@vger.kernel.org>; Fri,  4 Apr 2025 05:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743743751; cv=none; b=IIdgw4DLnghuZc0iEpO0UobbKE36CQL+XRSZ//QJVFeft/z1/IyehCWI7uMCh30U7ElVwevuEg62iIauG1QososYCOY4j+EZRbCdnt6E8o+nokKtpIRs2fjB+GVVTtSkJSZJPT/rBmb3eLiTWrj0sgnzG8Eh7Qiq3Ho65wF1cPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743743751; c=relaxed/simple;
	bh=+APal7ELVilrQXERmPw/EC3UMR3deE+5PkabnilbIPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFKelQXR7V/5JR3cpcwBLSedca9dkRmKFMDeWnRUA43/9oOCBUYrYM14t/lDqFvpjt2/lwugAh1OX9bzNZ5S9AiG7TnbfOe8oV0wNnaASQLo8VYflUbs430+Lfj27cOmItMY3dUXBIxAAIqhL/2Sxn1V2HuW/HvsxCk8LHBEszI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qcv43869; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qcv43869"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549963b5551so1938950e87.2
        for <netfilter@vger.kernel.org>; Thu, 03 Apr 2025 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743743747; x=1744348547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prr+bSeOC04YyR7xJ79EShiUmrz/N6J8LaI43fiGfWo=;
        b=Qcv43869v15rnPt7Zl01MCqOhzv5I+bvKtIQy/KJNvMeADraDShSkydG1SYtScDjx2
         Si73tAK0PvG3HNUWZgcNYhYjvY8mKGdbhqG8KWFs+vlaoXiWlhVOVVXAZmdoCIM0VCdq
         BS0xEypQ1hM/pcshBRairrI5vxM7ZSKFCK+VQUGHG55PCyYFdpkDUbGwjvoi9P+FtgCb
         SMuRDXsCpDFyPhyG8lmlZi29+F+e8yiXyMZITverZaUJRBQNe/YE8p6SM9rOZ/6S1hDu
         +llmedW+z2DBApGdMXvYPC7luxdy8r926HtinAYJfjZUWWV1KsVm+m052RCr7xlJPGIw
         S0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743743747; x=1744348547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prr+bSeOC04YyR7xJ79EShiUmrz/N6J8LaI43fiGfWo=;
        b=lke5i+R+2sywnuVIgVw/wMh+Cy9GdWyWdBg4105W8DoRUfi6SrYTv+oem0vR9seCZO
         L+IBaJOVdNLMzXz0hLtAFHyZAvrahgvWoD/YL6cIv/0b4BCBBmR2LodH6CfyYp12cA9v
         PjNGi05e4oFjWbBtqcBPtKC3z5TqkKVwIZpUqvgupC81hUaFHAKLru8wLpY+euAqLnEb
         kmEmLHIv2/0K0rfwPl73RkPZDmN+9vD+2GvCb/oyYUHztF3SmCHrLLmBbc39dle/17Xp
         icudjmRuVczBNYK+l0dT+0b78I7QAC4ltWZKbTFscwGx3GEQ5z3of0nZst844HvEkJ9E
         jRHg==
X-Forwarded-Encrypted: i=1; AJvYcCV4/ea/lpI5THvfPw0Up97scTxa+YNC7GB/qWkf/53PVHtQBCgz54wOyb40v3TYDjgN3UbHyLXeP5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EV5EKnBtdeMlK3QIjIG77+RWXlIDm8Xjib47SRtfI/Iabk9w
	nWFC/DUY2wnvi36uM0H5k/1a7q8LeJjlUzytReNtApPw+90QGTzD7lue4z14Zo+0fWsG83psIo3
	u9h2MaX2KgPk50vl6m4nOuky3S+nb+j2W
X-Gm-Gg: ASbGnctPLLZX3OFDCMhIn/ihP9bJEAQpm/PiHg6dMsV7/gmr/2cnheg6l3TK9z8lk16
	D6n/6R3IZoI5x1dAiB4UYIdQqXBddmUYiT/HpoGJWhQiuLa93x9nnQ0nzdTk4dbm83P+iw8V91V
	VfV/cdvRHD8RnoPu/1ZS4MtIoA2QZAb9KS45R1ylHvPU9NtJ65dP80+MQs
X-Google-Smtp-Source: AGHT+IHCC8vIpTC4KBiu16HLvb1wVtcwI6TlCZnDsEYmDg84+uAZf/8laE1wU6DnFMNfG71P/YulvtGuWzJ6dIWDNkk=
X-Received: by 2002:a05:6512:1189:b0:54a:cc09:eacc with SMTP id
 2adb3069b0e04-54c227dc5f0mr457567e87.39.1743743747224; Thu, 03 Apr 2025
 22:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
 <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
 <CANgxkqwR0V3LvEECApmg-d=xZKN35j663VqsUoCZj9JgQ=UKbQ@mail.gmail.com>
 <20250403182511.GA24688@breakpoint.cc> <20250404032247.GA15620@breakpoint.cc>
In-Reply-To: <20250404032247.GA15620@breakpoint.cc>
From: sontu mazumdar <sontu21@gmail.com>
Date: Fri, 4 Apr 2025 10:45:35 +0530
X-Gm-Features: ATxdqUGZXMDF2L-8Z9weEy8YercA1PmI2bP40hPtxt2CHjXyFTfXRCZ3CyJgHG4
Message-ID: <CANgxkqwnMH7fXra+VUfODT-8+qFLgskq3set1cAzqqJaV4iEZg@mail.gmail.com>
Subject: Re: Nftables v6 address not matched properly in nftable set
To: Florian Westphal <fw@strlen.de>
Cc: Bradley Hook <bhook@kansasdeaf.gov>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Florian.

On Fri, Apr 4, 2025 at 8:52=E2=80=AFAM Florian Westphal <fw@strlen.de> wrot=
e:
>
> Florian Westphal <fw@strlen.de> wrote:
> > sontu mazumdar <sontu21@gmail.com> wrote:
> > > Hence I feel somewhere the logic in nftable/netfilter is incorrect an=
d
> > > it looks like a bug.
> >
> > This set type had many bugs, you need to tell us the kernel version you
> > are testing with.
>
> Looks like its a bug in the avx2 implementation, I'll send a patch
> shortly and will place you on CC.  Thanks for reporting.
