Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B545A79B
	for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385959; cv=none; b=dlGayIX9I1P0PDIYGjpLMcFIotoJxMFCDjzCfeiOndQ3C95l/8Q+8s19ioMq7Wz7W1Yb+QZUG7spcCnH5xKr0a3vbrqWQO32WFEH98RJCL2/DRuGtG9R22NPXTgChCT20PQeFRlQWeptpdUlKB3HP/DOMz0599WH5njhoX/mMsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385959; c=relaxed/simple;
	bh=d1nOEoOlWEhbu6WcYBZma9iWhmuSa1K3BKqG/B2BPvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDUp41xv1OhN/O8e4HZ/yR+r8bH9lYRotGH42di6qs/h1JKyLnfd31pPNnPKu2o9jU5FJS+rcAHmG/7LU6Vnc1/fYJ87dIwjL+OnsraqfWPqsXB5+qG+wIWlx+yPPvYjG7Mhct/sFwUVtyMX8ZXHlMAHx1RYiUa+KNVf6UNvcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkcYBnPp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkcYBnPp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so1741190a12.0
        for <netfilter@vger.kernel.org>; Thu, 31 Oct 2024 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730385956; x=1730990756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d1nOEoOlWEhbu6WcYBZma9iWhmuSa1K3BKqG/B2BPvY=;
        b=JkcYBnPp9vTqY44W2MUGXL1XDA7nsqGlQtErzDZb81xGWengWu+zZT4dgflJzTCfL3
         k9qcfYCKCBxmGmuKcKqnWyvnjozHYocs5MGn0pw/Bh2Bxx2HdwtnJW/C3L9IyQB850eg
         L8ikqOfoUXir8BjP4sQ4ekTz7Y5dAj+rqibTOs8l7f318UR5nVmxvyjpsKq+lST1uY63
         t7/0pBGN162lTCVg27hy9E8+0pYB1uzs4CpbHoDnNkRDw/iWEa40x/tQKSniau4pLO13
         g2JExdQ4DlkayW6WpOEM3YtDACOEB0oF+3+IsvTHupZ/cAj13dzheqCVwfhQp/3uJ8sK
         1b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385956; x=1730990756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1nOEoOlWEhbu6WcYBZma9iWhmuSa1K3BKqG/B2BPvY=;
        b=fFKDbXuTpjuk1z/VK49LbD5OjXCrXTQIADh3/lGrpiaMPsdWYU5CES6FcEihlfJv0o
         X4K+QrT9neUdzHkSlzYHWIwAm/YVw490NRPGK5EFDr00zIwbUnOn1ZxJQrUlzum+3LY3
         qdLLGBCicGqlLvciO3pP0Yqm00iB3mf6lpRXKihgh96EAD4uwGBHNWqCy+TZ8tQSFrgy
         4JCKZRxMvGMmWIXBXwjb9BIyrOwZTJH1RyOsFiG6L5VVbv2sXubQ2COmjYpIP8A0yzCV
         S25ttFMdv+foDSoV72OEKWsAAHHkE95Xs+fcj8MfMrMBViceRKBt715tdRiDkN/XfX29
         Xtzw==
X-Forwarded-Encrypted: i=1; AJvYcCXh3/ZiI8EBLe/zrnF3PujTQVittweTrQIubxaF0hnbQxoB+CpLXySGF3/1PCvQMRgkZ1fKlWh/VcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BaCA8qhD5Un/jrDrKe19ghmghzKrM8V9tK23doKjNeSBalVU
	Ke9WIcQFGuscS6oRsYjBJc/YAP+kECzGgNtWzQQULxCf5TkMJbOBQqV/caPsweQNYbS2FfDpSq8
	R4+kuQNs1WzHAeGKKJff4Xb7dJr24+MN9
X-Google-Smtp-Source: AGHT+IGnMpfSNbtVPNQkAslwYs1z3IkEEEjG578VKThnIcElRuSLj2bWJ0lM6osxusW5BhHv2TULhuA7YeTmMdcxoVg=
X-Received: by 2002:a05:6402:34c8:b0:5c9:7f41:eb1b with SMTP id
 4fb4d7f45d1cf-5ceb8e1fa94mr222108a12.17.1730385955774; Thu, 31 Oct 2024
 07:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
 <CADJxXUL_DuwGsC0vBaW6AXY3y5sGtK=6OwBfopw8Z69_AgfqUA@mail.gmail.com> <CAE1O4xpVpX94Lt9P8JoYgVf7vcuwhv06oR5Lt3ipHRsHWr7p2w@mail.gmail.com>
In-Reply-To: <CAE1O4xpVpX94Lt9P8JoYgVf7vcuwhv06oR5Lt3ipHRsHWr7p2w@mail.gmail.com>
Reply-To: mr.bo.jangles3@gmail.com
From: Logan B <mrbojangles3@gmail.com>
Date: Thu, 31 Oct 2024 10:45:43 -0400
Message-ID: <CAFR4Civ3JngUGA04eV3hD1_Z8tpJN09LPa6x-qf3CAyLcJet1g@mail.gmail.com>
Subject: Re: Unusual packet forwarding task
To: Rob Roschewsk <rob@pabut.org>
Cc: Martin Tonusoo <martin@tonusoo.ee>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob,
I have a feeling that this can be accomplished with some manually
added match/actions inside of ovs. Specifically using ovs-ofctl.
I would add both ports into an ovs bridge
Using your criteria to specify the match and action. Writing a flow
match by hand involves some trial and error. Something like the
following, though I haven't tried it out
ovs-ofctl add-flow br0
in_port=3D0,udp,nw_src=3D192.168.17.36,nw_dst=3D172.16.20.3
actions=3Dmod_nw_src:10.0.0.2,mod_nw_dst:10.0.0.1,output:1
This there is a lot of flexibility on matching [1] and the actions
[2]. If the network is is full of traffic that you don't care about,
you could add a rule to drop a lot of traffic that you don't care
about.

I hope this helps.

[1] https://www.man7.org/linux/man-pages/man7/ovs-fields.7.html
[2] https://www.man7.org/linux/man-pages/man7/ovs-actions.7.html


On Fri, Oct 25, 2024 at 9:57=E2=80=AFAM Rob Roschewsk <rob@pabut.org> wrote=
:
>
> Thanks Martin!
>
> I'm not at the point of adding code to this project yet ... close but
> not yet :) This will certainly give me a head start if that happens.
> -> Rob
>
>
> On Fri, Oct 25, 2024 at 4:39=E2=80=AFAM Martin Tonusoo <martin@tonusoo.ee=
> wrote:
> >
> > Hi Rob,
> >
> > perhaps something like this will do:
> > https://gist.github.com/tonusoo/0490bc5cf564689f3999f1de4eef098d
> >
> > On Debian based distributions the dependencies can be installed with
> > "apt install --no-install-recommends python3-pcapy python3-scapy".
> > Pcapy is a wrapper library for libpcap which processes the filter in
> > Berkeley Packet Filter syntax, builds the binary bytecode and
> > eventually sends it to the kernel via the SO_ATTACH_FILTER. Thus,
> > there should be very little impact on throughput or CPU usage.
> >
> > I used a following systemd service to manage the script:
> >
> > root@deb12-1:~# systemctl cat packet-forwarder
> > # /etc/systemd/system/packet-forwarder.service
> > [Unit]
> > Description=3DForwards certain packets received on eth0 out from eth1
> > After=3Dnetwork.target
> >
> > [Service]
> > Type=3Dsimple
> > Restart=3Dalways
> > ExecStart=3D/usr/local/sbin/packet-forwarder.py
> >
> > [Install]
> > WantedBy=3Dmulti-user.target
> > root@deb12-1:~#
> >
> >
> > Martin
>


--=20
Logan
