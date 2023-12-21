Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2511651AC
	for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jcm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jcm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jcm.me header.i=@jcm.me header.b="AdROO2G6"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbd38c6598fso897692276.0
        for <netfilter@vger.kernel.org>; Thu, 21 Dec 2023 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google; t=1703187092; x=1703791892; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG/eVyi3oQl9ODBo0HtBJA5RohpGvNxUk/PZpM0qk+E=;
        b=AdROO2G61QTcnwOHE5QXw6vxmsifz1p8iRqDk1zMycTrJBD3UkHipMeESWSInVvoF2
         h9KTptBJYt74hx68aytvOO7qNhpX0RcYJgtt61FYYrmYqc/noPw4CI99vdEamY0U5ebT
         XEQwPlWA++TzWJWizK8wI20aEnAG5js//IwmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703187092; x=1703791892;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xG/eVyi3oQl9ODBo0HtBJA5RohpGvNxUk/PZpM0qk+E=;
        b=fkW+n6Tw4mJfYIl3Io8G457T+okXhsnbuzcRQSdV00vPpar1c5Hj3raDTiQ1gc7CZy
         qFXN+Plce9+wJmZ+Vw2eMqFz0B6ZlUudBC3lOqHwSlTmC8fich0hqt6y/4v/DlzY1TnP
         mU+EpAkRoMn1+U0xVm2TG0S6D4jIJtfPsOCh4AqBSkHneImT9wirVIgr0cw2fgxV1ldt
         zQM5dV4hcsXn76nAQqAtL8wM5hpP1M0ppFFF1qo3x6TO13SX1Q6xp5ZWwMGTtzjauKkV
         +6fr+wxBqOiYyvvaWjs73O0ZgyKOqLRVEaAENrW6jHP0ayvxkr24dEoK6L0oFbHTSrgv
         gw3A==
X-Gm-Message-State: AOJu0YxAcWLluSagUpLkyYU38I/mnIZLo1ajFWSR5g3D6yop5HUFSA0n
	29ABCpfzGeu4iFEc+8b4z0Je8sCv0enmUCbZ5+uOeKuFZMCFTi84
X-Google-Smtp-Source: AGHT+IECZinpXHeMDiK5EuMNNMaTrAA2MS/wrAxiS8T65B9mE/f+BPYqi6yYwituiUJ9fSGKRQSzlA==
X-Received: by 2002:a25:b1a6:0:b0:dbc:d3a5:d039 with SMTP id h38-20020a25b1a6000000b00dbcd3a5d039mr188265ybj.32.1703187092414;
        Thu, 21 Dec 2023 11:31:32 -0800 (PST)
Received: from smtpclient.apple ([23.187.176.2])
        by smtp.gmail.com with ESMTPSA id l10-20020a25bcca000000b00dbd996264d5sm936934ybm.41.2023.12.21.11.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 11:31:32 -0800 (PST)
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
Date: Thu, 21 Dec 2023 11:31:20 -0800
Message-Id: <A74105B3-C9FF-4BD3-8269-4431BBAACDEE@jcm.me>
References: <CANn7yVadxP=_fQGcFWamX7KpvccW0BLiqBm1f2u7fp808v=WAg@mail.gmail.com>
Cc: netfilter@vger.kernel.org
In-Reply-To: <CANn7yVadxP=_fQGcFWamX7KpvccW0BLiqBm1f2u7fp808v=WAg@mail.gmail.com>
To: Rob Ert <ertr3960@gmail.com>
X-Mailer: iPhone Mail (21B101)

Would have to see a diagram with traffic flows illustrated to understand you=
r use case more.


> On Dec 21, 2023, at 11:14=E2=80=AFAM, Rob Ert <ertr3960@gmail.com> wrote:
>=20
> =EF=BB=BF---------- Forwarded message ---------
> From: Rob Ert <ertr3960@gmail.com>
> Date: Thu, Dec 21, 2023 at 1:08=E2=80=AFPM
> Subject: Re: Netfilter, IPVLAN, L3S and NAT64
> To: Joshua Moore <j@jcm.me>
>=20
>=20
>> On Thu, Dec 21, 2023 at 12:43=E2=80=AFPM Joshua Moore <j@jcm.me> wrote:
>>=20
>> Is there a reason you cannot place a router in front of the ipvlan device=
 and make the forwarding decision in the router. If the traffic needs to be i=
pvlan then send it to the ipvlan device, otherwise NAT64 etc.
>>=20
>>=20
> It's a dual-stack Cloud-VM with 1 IPv4 and an IPv6 /64 subnet as
> described in the jool mailing list link above. I have it set up with
> IPv6-only systemd-nspawn containerized machine instances using IPVLAN.
> Also, I am using WireGuard and Unbound/DNS to realize IPv6
> connectivity to the containers and the wider Internet over my
> otherwise IPv4-only Internet connection; this setup works very well,
> and I am a bit reluctant to do away with IPVLAN, if it is avoidable. I
> would like to understand why NAT64 is not doable with IPVLAN L3S mode,
> if that is truly the case. I don't think it is possible to integrate a
> containerized router with this IPVLAN setup; I believe I would have to
> switch to a setup where all the containers are connected over a
> virtual bridge.
>=20
> All the best,
> Rob
>=20
