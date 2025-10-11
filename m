Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228A1DB375
	for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760203581; cv=none; b=U969UU8h2SKehAINpaJJJBtNoi3cKi+IK24EgzBGkm+MlfKrRYmM6sIpI5JOZpkg25vNjY8x/OuHvvPLpVBXFHk8o52ot8iijFJUie4yuuNkRANlkvknE741Jwjz7DTtqbMtOIixj8xLEFLE+PyRg+wDmbYqTM+hGh7Bc5+ezsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760203581; c=relaxed/simple;
	bh=r5BuikXm5eMOyBB8ouNX5ahW6NUvxNlRpudVoR5F0Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJ17HUT/9vFfjW7hFQsz469P7LUGHqnX2miQ1KYgTbxZ4xaiiAzCB1WEgmh2nt0AlQrpYUOyGnxFldezku64Oz/FIyVqCM5D5A2VDhlUlFcLsty+1bY+Ex5F8k2fPkx3eJL1qXCwzKgG3cl8it0K+5oNdmwq68i7jz/oRvX10rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apZxWFr2; arc=none smtp.client-ip=209.85.167.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apZxWFr2"
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-4418937b236so1849240b6e.2
        for <netfilter@vger.kernel.org>; Sat, 11 Oct 2025 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760203579; x=1760808379; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5BuikXm5eMOyBB8ouNX5ahW6NUvxNlRpudVoR5F0Zs=;
        b=apZxWFr2SwasHjmVFn0mnl0hOrgN1SZtgCVQ02lGNjGoLJ/tl47q2km4cD9dDbvO1J
         cqBLzUOmZFE6PngVWVnOafHnUMFy0TPPXPQgqXb2UVcvZyDE2VkIIdY9xJlGbQDR31sk
         bnYXXKNHEnoxiyWEmb1iOOxlSgkRE+nsK6rijBg+FVIBIqBCW5hhleH31VsMkQhu9T9D
         PECH6waY8xIUinLq7mmN9vRtKvOntVqHxcAxlbt0o9PreYPeMC9MIA0pXlVHafE7lpQS
         15EyZthn893+jtNildbQDkPa/vvk2nt3aEje9DpCmwdmAnmISy48TV2WRwpyC1ekC5Ns
         p0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760203579; x=1760808379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5BuikXm5eMOyBB8ouNX5ahW6NUvxNlRpudVoR5F0Zs=;
        b=HEw1c+89ku1wT8cBr3OLHSQjfP5Shwv3HhOFbH5sjov8mt2yZPXHCzrgGjNuYiuxNs
         vFwTx5z6ob4sSraRMG6gA51qvr+JQZQtTUH3oULf2rdlg/nemWtmfkjE5CxSgsWXFCA1
         e/mPE4yTnBOSvyvh1IrOMiK23td1cdZOd2Ygh4OlO7DLrFCbqO3jyWbugdKPwlyEX2a2
         I1kDhEhDQVhQ4sW7eAFmGr9InKHsR2wQbvEbeCz2OYdlvi/Jq4BI25mYPJdKCL7IQAM9
         7ykoP61o23vmd1eLrT5Vyxp6X/Q3vYlriepu2eZj/p8UycOfpDMlgU6XzSYbmRrNbn0c
         dBNQ==
X-Gm-Message-State: AOJu0YwWnD+mfeho01mKhA8sa7VkN7uRNmVZtB3t3e+N1T1D6CKfC8MD
	1ZhpBTK5wGyOTCSERbsnsC+LtJBh8QvIxxKIp0/Zfu+CkMAfrguozXI2Kaj0s7MO5TlEfpmsmCu
	ou8CN2CSbUM+oqJltU1s+4kBLaZZS4OE=
X-Gm-Gg: ASbGncss5apt5OOC7sraNnkkyI/hdz37mtu+Y8ZPButA9DwQCs1e5hg8cqJ7KATwZju
	W2+l2HBTtIjf3rKXqrPW0ixflEUH3nv1Px8UceyH0xK7WgREU+5O1+uqNDiHM6rIqyQx2rImrCI
	zmlj780kHJx2RkycBREwktYRC1QKQMo6UygS+tmOYltfqb17jbYL4mMlWT+NmRdxXWVUY2c9ZeU
	Ukb48QzjGo+1YLfca28soK2fRO5kt0Q8IMWD8pp
X-Google-Smtp-Source: AGHT+IEh1DjKe6mRzchv1DmylUEitgUq0CDb65pYMQrDxfLzJBoGZdpQ/slfEe7nu70lgDvZuchq6iRPfWR1qB+TWSU=
X-Received: by 2002:a05:6808:1186:b0:43f:65da:73e6 with SMTP id
 5614622812f47-4417b3e72fdmr7598425b6e.45.1760203578878; Sat, 11 Oct 2025
 10:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEcyiz83o-NK263Efj5xfGPuVMUqur7TT-RofZ-WkJirMzB9oA@mail.gmail.com>
 <aOpljpaGwHZMH-2J@strlen.de> <CAEcyiz9P17KroeRMVFXrwggAF2Yzy7_uadJoQ6yZBa=07LwiXQ@mail.gmail.com>
In-Reply-To: <CAEcyiz9P17KroeRMVFXrwggAF2Yzy7_uadJoQ6yZBa=07LwiXQ@mail.gmail.com>
From: Cyrus <cyrusrereza@gmail.com>
Date: Sat, 11 Oct 2025 19:26:07 +0200
X-Gm-Features: AS18NWCamCEG2AHgvNSe4WdMno8vR-y9m-gy40I8JuGU55jsnV3-3HZuyieZQyk
Message-ID: <CAEcyiz_MVC+FK011gjT7=tq1Sn1ZWUjq4wfwRyxC0Xs33qp_jw@mail.gmail.com>
Subject: Re: Is there a way to extend the timeout of elements in an nftables set?
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Florian. I was able to get this to work on Ubuntu 24.04 but not
on Ubuntu 22.04 so it looks like something changed between nft v1.0.2
and v1.0.9. Although, interestingly, the command didn't fail on
v1.0.2, it just didn't reset the timeout.

Anyway, I now have a couple more questions:

* What is the point of the timeout flag in those `nft add element`
commands? Having both a timeout flag and an expires flag seems
redundant.
* Woudn't it make more sense if the expires value defaulted to the
timeout of the set if it isn't explicitly set on the add element call?
Otherwise, an application like dnsmasq now has to be configured with
this value or figure it out somehow.
