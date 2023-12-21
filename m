Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E0651B3
	for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+JyTDqy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so14299165e9.2
        for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703188119; x=1703792919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oa3SX1fy28fjP1o/93912ocjS6EQQDs1dFONBeqy+bU=;
        b=N+JyTDqyUVwrT4hnyj2YVEry7I4DDOpZw+PWEftt5siXCu+BzleMxr6yHB4ZV74c3z
         9DZxuTS0QSufcf5b9R7HxBuzChgdmQZ4yZdfo9NXUSwxookbqrXfcMywen770NbTz8LI
         Lm9L+pqhc8oU5+eCqf84zUcQGYQQ8PuwFnLP/ZaMMaVhMVRHGYotFqoeEnrDcpqYw0Wz
         RAdycLjOO5E0DYfT+ahLr6g0H43dbco8/un4sTT/ZuGIhfQI2QDupSvrO60CeIAQnk0C
         2FbZYLEhPCEYw31rVPFp8Vhhpfv26uO1RL0AtkhYhexE9VKwR4q15wuD1gqCWP9KPGar
         hITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703188119; x=1703792919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oa3SX1fy28fjP1o/93912ocjS6EQQDs1dFONBeqy+bU=;
        b=TxeFHK4tD1/jtFjN+JFZ0E7wlw+hFDP9M4hmM/Z/AgnUfCk324/RIBRBRlRI1EITAK
         YkJQaU0t0ZLrG0nx7GlgE0f6mzXY2/L8dJTdSHjkrVhS1CmH7tF5gxFmI/KKTolF/bPq
         VF0BaqaRy2QnE3MBpZMcTbT/jkRGIOxaNWfmVw51Olc0EyOu7+nj7ZmnytFBgctxIjIf
         Fk6wUf4rXpChpl51ZLKUmzb08M7HarAWFtHwevF61kDDaitTP5cPoQJLyIOpKJn+8dEb
         uFpOaUbmJtshh+G1mMh3UfCY+22iYFT4rMEIZjFcdPJEJ3sW4DYIrlT6P7yZ1jnUWBCy
         PS7w==
X-Gm-Message-State: AOJu0YyeCXhJaL0V6ew5GNjt4OizIpbW4E2Wj2PGJjtNVT0q8+S/njse
	h9dKq8ktq9OdiwT9tLdX4/u5mx6xhkw00EbcDnTqJG4G1SxymgGT
X-Google-Smtp-Source: AGHT+IGL+m7RI2g0mCTBhgMqIgR4cQSK1TUnWw2nF79dAZzMGNlSXu42kVd6zhF++lNmspViDqtJDDoW4y7WPEoKQu0=
X-Received: by 2002:a05:600c:4208:b0:40d:39bb:b8eb with SMTP id
 x8-20020a05600c420800b0040d39bbb8ebmr149959wmh.118.1703188118565; Thu, 21 Dec
 2023 11:48:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn7yVadxP=_fQGcFWamX7KpvccW0BLiqBm1f2u7fp808v=WAg@mail.gmail.com>
 <A74105B3-C9FF-4BD3-8269-4431BBAACDEE@jcm.me>
In-Reply-To: <A74105B3-C9FF-4BD3-8269-4431BBAACDEE@jcm.me>
From: Rob Ert <ertr3960@gmail.com>
Date: Thu, 21 Dec 2023 13:48:27 -0600
Message-ID: <CANn7yVbt3nqerwU-_OjKFpD56RkqdgG5aUj_5FVoR1SOi3MrBw@mail.gmail.com>
Subject: Re: Netfilter, IPVLAN, L3S and NAT64
To: Joshua Moore <j@jcm.me>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 1:31=E2=80=AFPM Joshua Moore <j@jcm.me> wrote:
>
> Would have to see a diagram with traffic flows illustrated to understand =
your use case more.
>

My setup is as described in Fig1. of the following three page document,
with my WireGuard wg0-tun-device in the default-ns:

"This can be worked-around by assigning one of the
virtual devices to the host and eliminating the
configuration on the master interface, as shown in Fig1."

https://people.netfilter.org/pablo/netdev0.1/papers/IPVLAN-The-beginning.pd=
f
