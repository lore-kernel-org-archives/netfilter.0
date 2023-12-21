Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E035D208CC
	for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 18:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2yL65+R"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d3dfcc1a4so9006915e9.2
        for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703183894; x=1703788694; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxnlHdBg7ZggGn2tVDjA0seh0TtV4M7T9b2C3E4U8uA=;
        b=m2yL65+RMIiihsLrHxJC7XXDep7epRwg4JhOrB7HBFFVifVlbAWZC7WvklB/rxQC1v
         HVeibgNLLjzTPOuCMQMa6Am1k5nRI5/BMUIhZsDef6f2nSBkPlFtlpBlYpX4+S5neBYk
         YW83CL/Knej+JostX99pyzwEhMNBZ6PFbfHLMU63Welk8pPr42y8VCWZChqXh2abO47I
         7w1dz+b3ZJvCqxLO3w0xyWtk53qLESNj0Yjqke4j4CYtQ9qAL7VixzTvZ4IcU71SN+5a
         IyKZ0LVKmCMSSrpsbibUx2dcOgUQ3Wg93asyRLsKUpFvLSLOqZFmOFzWOyZ2rZXYZDFP
         2w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183894; x=1703788694;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxnlHdBg7ZggGn2tVDjA0seh0TtV4M7T9b2C3E4U8uA=;
        b=qCFdRQcVawKymHy4CeOBQ0GBA6KUGXv5H0bq6RFVTYRJVj9ALFya3k4hkLmGrPVMch
         5wytzswbrqBZK0daRfY74AuPz2AtCZvaaKu2e2x6MpcWCKYpX70OM2l2OY10Im8+NDwM
         zaBjvpV6BApDEpc5C2IBt/9U3ZdKeMvev0ipTvzIIbAbZmAMLysLQamehkb2pnDhg3Ho
         ETN5J23wJ7W09GNrfc565jFc4EpUy8yenoKlxh0J1RVid3yBNaVnRvaEbk+Z4Nat0hAF
         2EerlWMkRHO/AfV0B1xaHhN+csK5Amc/SW/yyv8ZzN5x6LGQUiQHGS5fvyayqt7ibyGi
         I/dA==
X-Gm-Message-State: AOJu0YyFZvOVihfihP3RkBUql9SfhbGTKGvoJdrCNXqKBobhp5tP4lXO
	0Hi0WUPhNDZetvuZQrwGJC/9h+0LKcNkzlaEMBamQxQiQgRxiPNY
X-Google-Smtp-Source: AGHT+IHH8cL3xQGdoUcPy+lszYjdBhZGD3H3Nu79o38jDw5FeGMFmbirdAQOYCKLRUL3G0p5JjFMGxXVxp9JqD/PMww=
X-Received: by 2002:a05:600c:35cd:b0:40c:3751:b661 with SMTP id
 r13-20020a05600c35cd00b0040c3751b661mr94456wmq.61.1703183893744; Thu, 21 Dec
 2023 10:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Ert <ertr3960@gmail.com>
Date: Thu, 21 Dec 2023 12:38:02 -0600
Message-ID: <CANn7yVZ_uPzyp=yMm3zN+LsAQu6exn=H=a-ND3XV=tXx+ciL9Q@mail.gmail.com>
Subject: Netfilter, IPVLAN, L3S and NAT64
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I need IPv4 connectivity for my particular ipvlan server setup and was
hoping someone might be able to help.  My grasp of the subject matter
is too limited, but more knowledgeable people are telling me that
NAT64 will be difficult if not impossible to get working with ipvlan:

https://mail-lists.nic.mx/pipermail/jool-list/2023-December/000498.html

I am a little reluctant to do away with my ipvlan setup (described in
the link above), as it works very well, albeit minus IPv4 connectivity
:-).

Since =E2=80=9CTundra-NAT64=E2=80=9D is designed as a translator for one ho=
st, I was
thinking, maybe NAT64 could be realized with Tundra-NAT64 running
inside the individual systemd-nspawn containers as an alternative to
setting up full dual-stack IPv6 and IPv4-rfc1918 with masquerading for
the individual containers? I can install Tundra-NAT64 in a
systemd-nspawn container with the following systemd.nspawn overrides:

[Exec]
PrivateUsers=3Doff
Timezone=3Doff
Capability=3DCAP_NET_BIND_SERVICE CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE
CAP_CHOWN CAP_IPC_LOCK

[Network]
IPVLAN=3Denp1s0

I would rather not keep these overrides in production, but I assume if
it works with the overrides, it can be set up beforehand with
systemd-networkd without overrides.

According to the documentation, ipvlan in L3S mode provides netfilter hooks=
:

=E2=80=9CIn L3S mode, virtual devices process the same way as in L3 mode,
except that both egress and ingress traffics of a relevant container
are landed on netfilter chain in the default namespace. L3S mode
behaves in a similar way to L3 mode but provides greater control of
the network.=E2=80=9D

I was hoping someone might be able to give me some pointers as to how
to get something like this to work, or tell me definitively that it is
not practically possible; but then, I really don=E2=80=99t understand what =
L3S
mode is good for.

I am also open to using =E2=80=9CJool=E2=80=9D or =E2=80=9CTayga=E2=80=9D f=
or NAT64.

Many thanks,
all the best and
Happy Holidays,

Rob
