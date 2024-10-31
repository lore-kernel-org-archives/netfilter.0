Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264414E2C0
	for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 12:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377230; cv=none; b=Iaew5M0fHivP8k6sAPXfIHUCQ/c445H858GWuuMpHHCpOEvjLSy98D5899/Ho5kM7bt2i0dFRyZ4eMy6AadRSewpKvveB2MJwp0uHDvZq2syzFc9zg3ymClDtp/knMJXP71Jbd982Cu9A/Ai3Z9zcYDBaaFAYravFjgd65DOdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377230; c=relaxed/simple;
	bh=01/J0iTzuWKrWWi38I3oREhkrCFOk3NmDk7ZTK3uuOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qHykDsDW7dhOf7n34twAnsZR5fVuJpnu37zCFybIR/CBerUoWSS1NVJVGHhLi/qBO/mEJV2cXj3NLHhbyh/TnvRjkcx5Asbru4mYkGT3IedbYqCJ5JpvdbvpJM+GSVrvS70454AJAnaTxciu7evImsb47Ad6+NvIWJNUKHIzHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1ifXHQz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1ifXHQz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431481433bdso7538685e9.3
        for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730377226; x=1730982026; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01/J0iTzuWKrWWi38I3oREhkrCFOk3NmDk7ZTK3uuOE=;
        b=Y1ifXHQzzhSY+RTHpGG/Zrdnx2Rqg98Xh6Ma72gvdp6QcHHPrBhbIgeLR2ca/d+FpP
         niea2+JBMxaYg6StKrGRIZutvelqYlUoHshhrUpV/eyUPfku+8WQ7WoQDqFEt1CbCZto
         dfbwI05uoga2p67Wdd2hBF1Z4fO8Wj/NF0ryUaedKxjK0Yaq23uMSSXmBERjPF0K3ovq
         k3iuuBUCBmD3VQE3wM1L+K3SGS+E+dpVsA9BdH+6g6xDZFXsm79gE7LXo7QmtiwX9KFw
         jU8KoNi7X5t+tsMoe5ab0dJiFU2jWF/qLjdnJqQhIm8t9M3ujNaQU/FNW3Q7J5JgGP+d
         q+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730377226; x=1730982026;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01/J0iTzuWKrWWi38I3oREhkrCFOk3NmDk7ZTK3uuOE=;
        b=btn3dmgphgsfsUXxssM/MjOKCKmquuuOD8YKOdhaIDvGjasfE2lHlRsYUtEVMXW99D
         gk5eoscQDywd+fSt+shEQ9jzlcqnwrAAnOL4xgKh4sWztsaK1ICQewCEhi3Jo1zwOV0y
         b1MCGzPgxEdINq8r8CQJU2GYb+a1v4H1h9yG0buchUpWhC0AZ6GIpMLRWTpJP45PYtOm
         /utuExCNtU5CqEbfDv1xqn3FOQantvR3BBGG3abgB3hgl+GyXZHUUZfjfU71TY1sGX3v
         uqCq3jlbz0waN/hgLptX5Yg04oACXXX/xizdVVOLZfXnbqNtvEx9y2HrGI9Zu07BSK1Y
         fTYg==
X-Forwarded-Encrypted: i=1; AJvYcCWIuXcdEDIfODhQoulyLaXVOZGFax2/SY/hva3/tXP6XrWqyhH2yST2lkbtsZ7QEZFFUqF8Ee87MwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrB0koKxdcY1+9Qf0j25y8lElkR4p/hWPy+ofjWnQqSZkeJnyB
	BmrPxIFUI8mUJe9XuGqS4XY4TCwiq/8exgevW3wcaRedOZa2vLek0ENjILxkLisWqqZ0I+WG6Ju
	aBRDViEmY6hflgrkqgRVDQTkWKWs=
X-Google-Smtp-Source: AGHT+IGjlTTu7HuFiB25GbhqZkVCgnArldVyG5WoqVSypWRsxDrvlXYmAEDuortJGMu7BZWjg5l/z27HPhF730nlr2M=
X-Received: by 2002:a05:6000:2a8a:b0:37d:518f:995d with SMTP id
 ffacd0b85a97d-381bea2772amr2869422f8f.56.1730377225804; Thu, 31 Oct 2024
 05:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMa3rT49eeJT-rKdrVRXyfQd91cvQy=Cid55X2RFEpP4P5hFJg@mail.gmail.com>
 <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
In-Reply-To: <85253915-6d36-483f-a84b-69de4a1ba161@app.fastmail.com>
From: Francisco Agostinho <f.agostinho123@gmail.com>
Date: Thu, 31 Oct 2024 12:20:14 +0000
Message-ID: <CAMa3rT6HD_5mroBZ-dPkvp85tWBsw+5FFwzWmMqABdaPyA7pJw@mail.gmail.com>
Subject: Re: IPtables rate limiting question
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>*raw
>:PREROUTING ACCEPT [0:0]
>:OUTPUT ACCEPT [0:0]
>:limitban - [0:0]
>-A PREROUTING ! -i lo -p tcp -m conntrack --ctstate NEW -j limitban
>-A limitban -m set --match-set banned src -j DROP
>-A limitban -m hashlimit --hashlimit-above 10/min --hashlimit-mode srcip -=
-hashlimit-name test10 -j SET --add-set banned src --timeout 900
>-A limitban -m hashlimit --hashlimit-above 80/min --hashlimit-mode srcip -=
-hashlimit-name test80 -j SET --add-set banned src
>-A limitban -m set --match-set banned src -j DROP
>COMMIT

>For this ruleset to be loadable, you'll first need to create the ipset tha=
t it references.

># ipset create banned hash:ip timeout 1800

Regarding not mentioning the tables, I was using *nat table for the
PREROUTING and before tried to use the DROP rules on the *filter
table, which was not dropping the traffic.

Ok so the ipset suggestion worked! The current setup that worked is
putting the DROP rules on the *raw table PREROUTING and the SET rules
on the *nat table PREROUTING. Also created 1 ipset for each use case.

Thank you very much for the help!

<http://www.avg.com/email-signature?utm_medium=3Demail&utm_source=3Dlink&ut=
m_campaign=3Dsig-email&utm_content=3Dwebmail>
Sem v=C3=ADrus.www.avg.com
<http://www.avg.com/email-signature?utm_medium=3Demail&utm_source=3Dlink&ut=
m_campaign=3Dsig-email&utm_content=3Dwebmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
