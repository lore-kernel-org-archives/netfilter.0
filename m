Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D141F818D
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864626; cv=none; b=b/hDHLAJ8cuURjvU4nmsMhUZgQaDoUpZdoRMuDBCLdF6X8z0P8xVBE8kbSACNViGo6PSb7kpCuHdildLoOWTBo0oTdISWcj/+HWxJbUY/aKSZLwZdmElltLUuRaT9ycL1CUUnrhorG3rYsQ1ZEBu1xQtP3ogZfO22TZG1jYjLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864626; c=relaxed/simple;
	bh=oa8kIKRJO4pz1OY+nwK6L/bv2Sv0oDxC0MoadKIQ6Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+RcnZegbqfHOjPcvgTXaj8rZVMJb7SsYC1v5OIjCgjDolEpS80/gRoinzlmKGFQRuxw20If7vUASdSq3ghiF5LasSCnO4f8IzJqLAdbMDayW2xXe2L/Zs5l3SOlR/MtILleuKO8v8f5RHTx9cG3SLBDZoxqnx5/6BnVsfyQliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pabut.org; spf=pass smtp.mailfrom=pabut.org; dkim=pass (2048-bit key) header.d=pabut.org header.i=rob@pabut.org header.b=XGYmzRGL; arc=none smtp.client-ip=74.208.4.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pabut.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pabut.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pabut.org header.i=rob@pabut.org header.b="XGYmzRGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pabut.org;
	s=s1-ionos; t=1729864617; x=1730469417; i=rob@pabut.org;
	bh=oa8kIKRJO4pz1OY+nwK6L/bv2Sv0oDxC0MoadKIQ6Zo=;
	h=X-UI-Sender-Class:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XGYmzRGLVKr1/8Hhhr+mmjHM9PwLuhNn/DZY2Bnt58SdpnInpXQphYyHBXyxu8+D
	 gT94m8UfzuIR1cXKOzbNBEs+4nUT24IXtOpW/T66wr8yPDfjBcMu89vr2e5MF1jxY
	 e56AHLsX8MehNqgLVQN2KgrVPZr53OC4RHyHDYCcjDhru17BkHeH4v3Cu2n1K4oiA
	 K8BGARTgkj5tzNEfwawJBGIS1iQ1/EpacLCfQ45mS0aRIuBTzZinvkGykXzMsVv5k
	 tHwDHRDkKTrbFuKY2/PSoaOiroAn6F4sSxpcfy8ulyWEa7iaaRDSfZKdFShz8SlK/
	 TARH182fhwDV26H7GA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from mail-ua1-f51.google.com ([209.85.222.51]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N6KxR-1twyem1EFd-00wJZ7
 for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 15:56:57 +0200
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-84fd057a973so579189241.3
        for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 06:56:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YyfP86j8HTFb0SCe+rGiwokCBCKKkX8eFnKen52Q89FLULj5CKr
	0/VcfcUcqgh4CACfIifrbnPFM5bxf2wFlmgVRlotpve+iPyWc/Tf0WFOxtRdiV4FWzllZYFby8y
	04PxMLkqM2rs7QtDjD9KbkPx8sLc=
X-Google-Smtp-Source: AGHT+IG9GQIY8+l+WNrR+Zwpd1sWmQfO52bUz3LA2Wb854iAPp9ymnvhaI6x1ouTlTW37i4MYpPBnwqSy2+JDE20Ky8=
X-Received: by 2002:a05:6102:5110:b0:4a4:7161:609 with SMTP id
 ada2fe7eead31-4a87119efc4mr6642023137.20.1729864616731; Fri, 25 Oct 2024
 06:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
 <CADJxXUL_DuwGsC0vBaW6AXY3y5sGtK=6OwBfopw8Z69_AgfqUA@mail.gmail.com>
In-Reply-To: <CADJxXUL_DuwGsC0vBaW6AXY3y5sGtK=6OwBfopw8Z69_AgfqUA@mail.gmail.com>
From: Rob Roschewsk <rob@pabut.org>
Date: Fri, 25 Oct 2024 09:56:45 -0400
X-Gmail-Original-Message-ID: <CAE1O4xpVpX94Lt9P8JoYgVf7vcuwhv06oR5Lt3ipHRsHWr7p2w@mail.gmail.com>
Message-ID: <CAE1O4xpVpX94Lt9P8JoYgVf7vcuwhv06oR5Lt3ipHRsHWr7p2w@mail.gmail.com>
Subject: Re: Unusual packet forwarding task
To: Martin Tonusoo <martin@tonusoo.ee>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iyg578sSURHXkUGU3aCACaaO3LUz+wdrIwsruLLEOkQ82oz20NR
 c+1OB7JBOqbx7iY+GNBoY6GaIwFzdSG77FhMMAtTrIGSmGDQWBKIeYwGXwOEsdPNqP251MV
 0iX85b4ePqiCl9rxyaypoHQx0M4Y3hjAMLDi0zlTgI0GsspI5jMpk9sdcl0J77ReqDrc/VI
 Z/SLbAG0Npun8a6zEvuUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4P3B+nQEcAQ=;FqUEY2AkZE6BTicIYhzFF7X1kEw
 aGh8eZfJXkF06lHkLN01sWmzjZRLhfs1XZOrPEtj5vNHqC00mqfCrpu32fUGoqF+tfK8hVz63
 A6DOcNbJQCaYy7g9OLtuLzuC+XWShQkpQ/AWx2tmM3alS8PVOnLcQWrg7YjNzreli78dE6655
 SIv0+d9C2VGnYTb/gUg56b6WdOk/vdCHJULhNNZvSPRBXVu01uoSxisQR5BvM3XGX600XJSo3
 Ew9OhLZknYn4yd/TeqoQZVFpfNxJ2J30gW0vKENL+coQ5evC1uCEESO+9A/5m4KH/g7F8TnR3
 OhdIWhOBycny1Fb+npEUYRCIP5WTCOBv3xt2yZHcMFyS2wAOOnd6MgFEHT03EzWbpqsFEtkZl
 pMbLOaSkQZWp/BoA9QvjcwCaWSLsON0mb9i+5iz5EHhdgMY9k6dHz0ljCWgoOTb9oVadZf/y3
 vFI0dTyN8eUJ0+wNyKui/3QotsVdl5DkdrthpjJ12qSb6Ysaop+i2rVeTqfC23Ktir+pTXqqW
 SGz5jvEZOmxBDZuJIh2l5sRnJ27rSJj2ZImhPkUjR/QLrO3si5BhgvLIrMGU8RnEgeTqjHIOM
 r7YeDirkN7FceLXNgVz/qfgSGdimmKpOmxBOgGe2hsrg7NIGaWGfIACu4AueDH54sHErYRjXt
 MelPC9sbv7DMPzg7se4FyYllZyMQ6y/S7eQxx56mM7cULZLY9ESh0gxbX/ZGerxZM65TEcHTn
 Bw1URsYm07f679r+ibPx4D76yaCzNpqww==

Thanks Martin!

I'm not at the point of adding code to this project yet ... close but
not yet :) This will certainly give me a head start if that happens.
-> Rob


On Fri, Oct 25, 2024 at 4:39=E2=80=AFAM Martin Tonusoo <martin@tonusoo.ee> =
wrote:
>
> Hi Rob,
>
> perhaps something like this will do:
> https://gist.github.com/tonusoo/0490bc5cf564689f3999f1de4eef098d
>
> On Debian based distributions the dependencies can be installed with
> "apt install --no-install-recommends python3-pcapy python3-scapy".
> Pcapy is a wrapper library for libpcap which processes the filter in
> Berkeley Packet Filter syntax, builds the binary bytecode and
> eventually sends it to the kernel via the SO_ATTACH_FILTER. Thus,
> there should be very little impact on throughput or CPU usage.
>
> I used a following systemd service to manage the script:
>
> root@deb12-1:~# systemctl cat packet-forwarder
> # /etc/systemd/system/packet-forwarder.service
> [Unit]
> Description=3DForwards certain packets received on eth0 out from eth1
> After=3Dnetwork.target
>
> [Service]
> Type=3Dsimple
> Restart=3Dalways
> ExecStart=3D/usr/local/sbin/packet-forwarder.py
>
> [Install]
> WantedBy=3Dmulti-user.target
> root@deb12-1:~#
>
>
> Martin
