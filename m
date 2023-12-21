Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2EBA5F
	for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jcm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jcm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jcm.me header.i=@jcm.me header.b="YSotJOr9"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5cd8879ce18so635242a12.1
        for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 10:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1703184187; x=1703788987; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGeXPoc06fo757BVXfVehuEM3kaP8SWqOFiR+gDDtCI=;
        b=YSotJOr9gU7rz+37IjzuR/9jfiN2/z0/AbqKXB7RirVdd5mc5TcNjGAqeMHphHSUgW
         RWBjOM0G46ApbBT3872QQXHqBfqqI4RwIxONckhBnBaSX9YYR3QKZLeuzYVZF9dBNv9K
         LN7CZc7xh0zw1h38oF6rs23dhB2GbRiAhG2/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184187; x=1703788987;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGeXPoc06fo757BVXfVehuEM3kaP8SWqOFiR+gDDtCI=;
        b=ljQI/w9MySavF/VUOpJC1yIY18McZD2rXDgktA3Y54xbN5PjNNsnbSaDS+6kiLReIX
         wrEzvsdbC3IKz0QlNnbPEYYIejgsj1/EpcG1w+kac8fwyfUDLqRQj0g7fZrZFOElqhd3
         vhVk72qVy9Ek61fHcjQsUwbGXgMrvoTSxuwysgMl8fipYfS/4Sq2O4Vo2+ZUbsN+y49d
         5JmIZfBr3jmVY9uyKlqXqVOxqwNTslAH/5vEmH9icHAsEM+D6fHbD+eZ3UbRxhSav33+
         E1QCPDpHzo7lnKM21Nf1UDn6qg1xhCQpAKzpbSw4F1ns7SCWTntaJDx5SOL2cCaVwT2R
         qUng==
X-Gm-Message-State: AOJu0Yx3eXgoNdqHlTBBAo1PfcVI/zvFIxmk47YAQ5EV5CuHueEBNFu1
	+7v6QfkhLMkBwh5lo/xRwYEPwyLFgd/azI7C3rHsAcSGxfw3IFiZ
X-Google-Smtp-Source: AGHT+IEkVTaH/hjQtRzKWPG77npXPUts9HdnqlCUnwuEJGFqJir9BwkEAn0jNcqGeHBSf+9XYLHLRg==
X-Received: by 2002:a05:6a20:430e:b0:190:86b:cce9 with SMTP id h14-20020a056a20430e00b00190086bcce9mr159118pzk.24.1703184186971;
        Thu, 21 Dec 2023 10:43:06 -0800 (PST)
Received: from smtpclient.apple ([50.46.51.4])
        by smtp.gmail.com with ESMTPSA id h6-20020aa79f46000000b006ce835b77d9sm1942993pfr.20.2023.12.21.10.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 10:43:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joshua Moore <j@jcm.me>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Netfilter, IPVLAN, L3S and NAT64
Date: Thu, 21 Dec 2023 10:42:55 -0800
Message-Id: <6A64CF4E-1BE3-4E68-98E7-FD0106DA173C@jcm.me>
References: <CANn7yVZ_uPzyp=yMm3zN+LsAQu6exn=H=a-ND3XV=tXx+ciL9Q@mail.gmail.com>
Cc: netfilter@vger.kernel.org
In-Reply-To: <CANn7yVZ_uPzyp=yMm3zN+LsAQu6exn=H=a-ND3XV=tXx+ciL9Q@mail.gmail.com>
To: Rob Ert <ertr3960@gmail.com>
X-Mailer: iPhone Mail (21B101)

Is there a reason you cannot place a router in front of the ipvlan device an=
d make the forwarding decision in the router. If the traffic needs to be ipv=
lan then send it to the ipvlan device, otherwise NAT64 etc.


> On Dec 21, 2023, at 10:38=E2=80=AFAM, Rob Ert <ertr3960@gmail.com> wrote:
>=20
> =EF=BB=BFHello all,
>=20
> I need IPv4 connectivity for my particular ipvlan server setup and was
> hoping someone might be able to help.  My grasp of the subject matter
> is too limited, but more knowledgeable people are telling me that
> NAT64 will be difficult if not impossible to get working with ipvlan:
>=20
> https://mail-lists.nic.mx/pipermail/jool-list/2023-December/000498.html
>=20
> I am a little reluctant to do away with my ipvlan setup (described in
> the link above), as it works very well, albeit minus IPv4 connectivity
> :-).
>=20
> Since =E2=80=9CTundra-NAT64=E2=80=9D is designed as a translator for one h=
ost, I was
> thinking, maybe NAT64 could be realized with Tundra-NAT64 running
> inside the individual systemd-nspawn containers as an alternative to
> setting up full dual-stack IPv6 and IPv4-rfc1918 with masquerading for
> the individual containers? I can install Tundra-NAT64 in a
> systemd-nspawn container with the following systemd.nspawn overrides:
>=20
> [Exec]
> PrivateUsers=3Doff
> Timezone=3Doff
> Capability=3DCAP_NET_BIND_SERVICE CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE
> CAP_CHOWN CAP_IPC_LOCK
>=20
> [Network]
> IPVLAN=3Denp1s0
>=20
> I would rather not keep these overrides in production, but I assume if
> it works with the overrides, it can be set up beforehand with
> systemd-networkd without overrides.
>=20
> According to the documentation, ipvlan in L3S mode provides netfilter hook=
s:
>=20
> =E2=80=9CIn L3S mode, virtual devices process the same way as in L3 mode,
> except that both egress and ingress traffics of a relevant container
> are landed on netfilter chain in the default namespace. L3S mode
> behaves in a similar way to L3 mode but provides greater control of
> the network.=E2=80=9D
>=20
> I was hoping someone might be able to give me some pointers as to how
> to get something like this to work, or tell me definitively that it is
> not practically possible; but then, I really don=E2=80=99t understand what=
 L3S
> mode is good for.
>=20
> I am also open to using =E2=80=9CJool=E2=80=9D or =E2=80=9CTayga=E2=80=9D f=
or NAT64.
>=20
> Many thanks,
> all the best and
> Happy Holidays,
>=20
> Rob
>=20
