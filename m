Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A411FF7C9
	for <netfilter@vger.kernel.org>; Fri, 14 Mar 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970034; cv=none; b=IASW3/MMBl2SB04ZpPR4QbsHDwfCrGJOZT2QZ7tOMCg8L0RCcZAIG8+052344h+Kre+j/3/mIRrkJxFcp9qwIlrULuV1yR83e2O5F+Kfi/WariUJ2tqECeJ6zcPh/F384EWcu93c+RzvgHVn9y1eUA4qmeXJQ8tZDJcQ9k1uHBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970034; c=relaxed/simple;
	bh=32DPO4sAt1ynWhqFlIB3anWP1ZYJ1awgz932hew/sDw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LabAfrZebVRwx3AhKigN2+SkgpLT10Vhq6S7ZDHPggDxqGjo7S9iKCUPfTMCYNXjbmGu4uOY34jupHx4ncvTWvw1/dPGXpHqVzm/0FudbTmC91scd5kZVN1w07nTcrsHJ02FTrPz0oNiAdeuK5MH3G7dBIXqtoAubq7Rik4/wYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=womenled.org; spf=fail smtp.mailfrom=womenled.org; dkim=pass (2048-bit key) header.d=womenled-org.20230601.gappssmtp.com header.i=@womenled-org.20230601.gappssmtp.com header.b=2kOXA7tY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=womenled.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=womenled.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=womenled-org.20230601.gappssmtp.com header.i=@womenled-org.20230601.gappssmtp.com header.b="2kOXA7tY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso1812897a91.1
        for <netfilter@vger.kernel.org>; Fri, 14 Mar 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=womenled-org.20230601.gappssmtp.com; s=20230601; t=1741970031; x=1742574831; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=32DPO4sAt1ynWhqFlIB3anWP1ZYJ1awgz932hew/sDw=;
        b=2kOXA7tYP2V77mnVRpVgAM6zjnVmiaySmPZnxHe7JNW+SJS8HGe5qm9hr47FGkHOaZ
         JTD28VMbr40hfXo27rY0+diRW1z0FppIAOmqyKAQa8+Pu9u8OyKIaD0c3+mYclgy0m5k
         QKJnqhuI7UBwZZIfL8YzqE1UFVi6MCDdHJfNQW9bd30kz+OX+ueRc73y2AAFYtcjX35W
         yJr6AV128jqCYLqS+OmUZub8Yki6/PSjS6S6ygGibmAubQkAjKRvdokQ5ACad3+bdGl2
         SzTOUSAPqGYnG2ZdemGZovwKsz9jcXumfwbMxHIns3ddNch4CngMasoAm+DTkdGcC1jB
         Ur2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970031; x=1742574831;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32DPO4sAt1ynWhqFlIB3anWP1ZYJ1awgz932hew/sDw=;
        b=uHww791bqhZlzllbikFQll5doxZZXBB6lf9OWzvENcG1Pci0nsQDHTUgC9upc6NOQy
         +W74i3PSDG6SSfyRGr8el0o10J+k93MFjWWvGz71UJWEL5BHJ98dWnXMZtdGnMg9YYmU
         WcCsbyLxMtgLjkfcvWnprNOjR08HkGdPPAOxEKyDLqP/wL86Ba1s0vhHOBw/jdHisCTB
         pUdm8gD1K25G+Yq/dS+Z+JC+9BObfZBst79u5+a++xxdPxDk21zxny6EdejG2Tdi83lW
         eUk5ycwVnh0L7XC6nciNQKQJTfHyvt+fqVmRCns5vuKNMCEogjEDke9Vz1K30oW/Q5yF
         qScg==
X-Gm-Message-State: AOJu0YyHUrg+wyUHoUpHzjnkf40bDJ9449jYXWCQS7375UdECORqcVAe
	ao3lPIrIAwU0/6qGPVpuOe/ifSJEDXEXfc1TTNK8OK86jBMq5hrsYZ+9+YeTryqVAsvaeUEwquo
	cVvBrYIHVptWJkG8s+rXjTaps9fA+aMe69KBVlsSmcnLpIEy0
X-Gm-Gg: ASbGncsBNYEAWm7uoVQlkwm5xuyqaEPs5caKcBFyZbQaQURKhEQ01dvE5ik5u7XH/9H
	0Np3ANWzFVpJFHZ+kuuBONMhcEAsJn9rNRmwLQfa+lYiAdjTCj6I0W7XtAF25sN1KbaRKIFSqTl
	Qxe0tTC3VPUjxo+EmxlJs1VzVu4Q==
X-Google-Smtp-Source: AGHT+IHkhh6O7p3W+vOXEBmaddbxoP452jO3/fPbJ2FNTabg9QOjf69ocR1Z8CKAKoNy1UrIM3JGRcAt9h6zEvKKVgA=
X-Received: by 2002:a17:90b:2cc8:b0:2ff:7ad4:77b1 with SMTP id
 98e67ed59e1d1-30151cb4ab1mr4527415a91.2.1741970031295; Fri, 14 Mar 2025
 09:33:51 -0700 (PDT)
Received: from 550069475255 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Mar 2025 12:33:50 -0400
Received: from 550069475255 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Mar 2025 12:33:50 -0400
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gloria Martinez <gloria@womenled.org>
Date: Fri, 14 Mar 2025 12:33:50 -0400
X-Gm-Features: AQ5f1JpufkFRZ01iwO-Nl7RtgTQIzew08QvWzpoizN_EzcHH-KYD0yya6_dJ6tQ
Message-ID: <CANs4MtALrHVOv94E-xDbtfn2JxsW-8JopQQ-t5YPGQyQDg6pEw@mail.gmail.com>
Subject: Can you look at this blog article pitch I have for you?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there!

I=E2=80=99m Gloria, a passionate advocate for sharing business expertise an=
d
inspiring women to step confidently into entrepreneurship.

Have you ever wondered how your business could flourish by nurturing
strong connections within your local community? Networking is more
than just meeting people=E2=80=94it=E2=80=99s about creating meaningful rel=
ationships,
fostering collaboration, and unlocking opportunities for mutual
growth.

I=E2=80=99d love to contribute an article to your site offering strategies =
to
build local business networks, from attending community events to
leveraging partnerships and local online platforms. This guide could
motivate your audience to take bold steps and watch their businesses
thrive.

As Oprah Winfrey wisely said, "Surround yourself only with people who
are going to lift you higher." Let=E2=80=99s inspire others to lift and gro=
w
together. Would you like to feature this on your website?

Warm regards,
Gloria Martinez - WomenLed.org

P.S. If you don=E2=80=99t like the suggested topic, do reach out to me with=
 a
topic that works better for your website.
