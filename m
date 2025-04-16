Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F481487F6
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 01:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767834; cv=none; b=UV6TVTXio3wP20lvhYOvC76sEJUn72+ZRKcZk+S4ZHg7jTlIj6GdClZqyV1dJMQity3Ips9tI5KD13L1yPkp/ierwLA6lhLgXQnq0l+4FKgEWvllkn6XzF2bqOG2cK3BKTL0CdbNBUGAeBIuilq4NBQWSkvUGljI+wqUZvvGtis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767834; c=relaxed/simple;
	bh=7Ev5mjxqhp9tiazw1trD9TvL2tJTYHGhY3w1q52MlOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0e2Iwkq+HfW2mifcIAlN8KPQDsxGvQERfttDrtPKCHaFNpSg1g941EimBCGGlKPI+QnwoDXNlLo6sU9IHodXXXHZHMgvR5iuBnWlPc34hYxN0w00aGJeWDFsuhw/AYFiAKHd3fjMMYhi3iQMd3zq5d3fk20Mhp52tO523z/QvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Qxj1FVDq; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Qxj1FVDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744767818;
	bh=7Ev5mjxqhp9tiazw1trD9TvL2tJTYHGhY3w1q52MlOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Qxj1FVDqbtNRvUAOgwHSRnPyvknSOBnXBOc/mI11cPNSBFXEbpuO76l1lfitbKT8i
	 sh4TwfhUIYrKAtIlTlcrLvG50OyvKsB6wyeM9dGtnxd07bcL5izM7TR7CCYvCEFVtQ
	 Iz8KFIeQr5Hst+7LJxE3yECEkxMBBUPYWiglITck=
X-QQ-mid: izesmtp25t1744767814tef3f27c4
X-QQ-Originating-IP: 4Q83oDXI5x8gYyMH1P30K5RtBwNopv8UYS78g+iF2kk=
Received: from mail-yb1-f169.google.com ( [209.85.219.169])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Wed, 16 Apr 2025 09:43:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4422866010329631238
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6df32ad351so4979430276.2
        for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 18:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCkmRYZKfgU2l9f5QhEsnX6xJ3wmFF2Ge7t6C0rbFGcewehZ0cAAlbZSD9QWSse6+JkuvLGegyDSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tnNxwx3XMSYjz3pP7kPt9KCawpnx61WA1NRaYxHWMLGz5AOv
	sXq1arHZ6ng5FhTPTLGJnEUd9ih1n4lNlIKTiAi5b0j0tF3rIjcqdQN3VHjrG9Y8iTi2xjbwF2Z
	smNp06Oi+uPBxWXSnobl2VFn/vnw=
X-Google-Smtp-Source: AGHT+IGP2hM1yWbmytVjSzEWraYQfvbDZmOAGP7yeYfkyOr+qYy5TaeR5Y7LjZSkMx8FrZe/BInjrNKg9hRKoPL/0KI=
X-Received: by 2002:a05:6902:2681:b0:e72:719e:269b with SMTP id
 3f1490d57ef6-e727596e4demr45924276.16.1744767810541; Tue, 15 Apr 2025
 18:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAC1kPDOzuhA9T2PDrYX8c9833B3QY7ECYDaXKE4zbkyc1FfX1w@mail.gmail.com>
 <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
In-Reply-To: <9bsxFpl1jZK-Q-1fvltsQ9TIJQbKJLLZ2BOKaF1HF8AAaaczi4Nazmyc_joMqUNu_Gbnii28h2OAIrFKNJyfOXU-C6si-ocGfhl9nabaQrM=@protonmail.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Wed, 16 Apr 2025 09:43:17 +0800
X-Gmail-Original-Message-ID: <9EB64149B4C0D3CF+CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
X-Gm-Features: ATxdqUFJZy6sA27IV3tUbDjzLd9yCZj5rX6C9Mxs_4jSq3MlBnilthSizJe6QyQ
Message-ID: <CAC1kPDPkQXWENzPeCRjmNO1cOFOD90RzPSCEPq-0cNQnfrPx+g@mail.gmail.com>
Subject: Re: How to Achieve Functionality Equivalent to iptables -m owner
 --socket-exist in nft?
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: N10XyoOyIIl0a6DNZbzIxrrlMtZ8L8KHJuRsQUnC1w29u+Iz5sbz/ugr
	tw1AUbuQft1B5eD54M6uMWXKd67ryalcooTNt+tVyb5KVMZ37SPLu1SVHXxfHxUn6gUvFGK
	jc7kbS+imZeMLK1G6oVHaMm6XkP8bmBLiVcyo+C1nD1eGMgb3ZSUk8modxxyPA0uc/HSFld
	HMFYJKR9uUafagOqntTVv/Cnh7Aw6iC9HnHG0PZv/Rz2dUwGP1Fc1Hqipnz6d9UpyO/w6WH
	IiTPm/sOmR45EYRZdZZwDUXv1zl89VKXhD6N2DwLSPGZFecX5hSr2qQLwTOcbrsktOfpOqD
	0itWZACYy///U7DsbveFkF1n3Lk4DtVGMqjzxYK+hiC3bCeL5mI9AVvVbkPqIaRfs0zcid1
	F1jtBqzNMWSAokp0Vp0AHSJpJQodHxAlU0GtM+7d4zcj3wFc1KUHiJpQhmYJ+svzrmFn4W/
	oJ0zD0Eq2TeF7hB3XymgzHy+bxPRLR7/oBd0UaCmlT6wExyY6XTiTXJCxv/WpMawkmFEQJR
	cOK1pTWFXXDZ8p4DJqhdHWVZC531mI82AEKDs/vaBixBDaFmzhy6eVxNvwL6NmgliVZWZIL
	spUKbna7Z0jNdiLrh7DwXW/tr2NFpUtuuWdiPjTncPMLEe3FDWnQo+/8NJ8sPERuot/15Rj
	dK6chjzPCztWfbL4DmU2lNq9JAKfG60XzpcsC9IO6d1/Q4TwGN5Oh6uKrTg+xpDelvMKVtR
	e+UeTMUDxWu4ZSuTilf4U6dKgFbSpineoO4hnTTEFdoUor/QJsoLmnK9PaLFFoTYzsFP3xc
	epNdMB9Rmde+sSDiFC02BbsZwsEjB5TMJ+T4mqUCYWZgDWrE758ncEQubkT1IjDaEPHAiH8
	IOK9vm3fguEji/mCbsL09k27aSKbC83uGZ36KwecLQk2tSwhC/9RGzj8hZOcPon/qJkE1xL
	2vzX4MHfqwr9r1vq1DYMRlsBdm7vT3VzCahu38wZ2Sz2yzSEdvUXZRLLfF2bH5PMHgNjA1a
	911viqKA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Sunny73Cr <Sunny73Cr@protonmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 04:24=E5=86=99=E9=81=93=EF=BC=9A
>
> > iptables -m owner --socket-exist
>
> You may be looking for 'meta skuid'; you'll need the user ID that 'owns' =
a 'service'. You can `cat /etc/passwd` to find this information. 'meta skui=
d' will match a packet that is destined to or sourced from a socket that is=
 owned by the user id that you specify.

What if I want something like `iptables -A OUTPUT -m owner
--socket-exists -j LOG --log-prefix OWN_SOCKETS`?
I just want to check is there a local socket associated with the packet or =
not.

>
> Try `su -l [username] -c "[executable path]"` to run a program as another=
 user; if it does not do so already.
>
> Regards,
> sunny
>
>
