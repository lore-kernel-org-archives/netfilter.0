Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B81624FD
	for <netfilter@vger.kernel.org>; Sat, 15 Feb 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739646364; cv=none; b=eTeCuk59LoUS9QJ51VQi1uC3dPaNAx1XxNFdcYEG1OQVKfCErBw0jA82/3v0DPTaltFOjQph0L32MrqyRHi5DqRegitVdx9Yxo3QwVUmC7g2upxexJ7NKy8i6uXh4HD3mBqah63xsFZWhJsO8MFHl+7MDZuw//2G84CWrP76eOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739646364; c=relaxed/simple;
	bh=ObjsjNpgdpIoGgUsjHlZul7sfdfFDb+hwC4WhKEBlxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dXm0l5xL+6V+PinGFjWpOHkOGGUU3HE2UPhB19t4n5XuKFL1XQhDhBs4usrV+HKEaMSSvX2i7TC//ZA0+gk66YiDKvwN6oCOOqKLa14nLFxIdOWYWHfaUrrNF1ZeTMLExTHubrIR2CdstybFbkxHd7N7UacgIry0K6gql04HTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8NAFQac; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8NAFQac"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f3f149c334so119821b6e.1
        for <netfilter@vger.kernel.org>; Sat, 15 Feb 2025 11:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739646362; x=1740251162; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y83pnG3Nn9zkYRhUhiQdPcnAF0CTBHmoKmzI3MoSSA4=;
        b=d8NAFQacyzSEt3FopXCmOl/UAmgpxsgva/kaI4PartAv/ZCup7EV2LxpPrykCGSxDh
         ieyT+QCX432BSWePS4yhlaFi9zS71AnWZGn5PF+Wg1NnANxhCOlQYfWlk54WXpHMT+tT
         9iwQa0Nt+OOWBsIxPw45y/YpLSxSph4Z/pJMU5DaJJmAROspNc2rom98NzLjHOGCXjbO
         q58nXPSzIi2xj+KzStpISHVGxv3wAIKeP4lqwOXygK1FY1MEVWUBxp9j5AZNM9onbd/d
         FO9fFyY4Uz1bvEAjgUYBxltNvvW6jqwkAYKXttHtVnVLzJn+u2whYOdoFQZJ5TyGZqAu
         qk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739646362; x=1740251162;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y83pnG3Nn9zkYRhUhiQdPcnAF0CTBHmoKmzI3MoSSA4=;
        b=gPnJXeuFGzHaqZ5LKgPbgOsxRhE1Cu5VPmvuzk8gms9atXKkyJw40vqayQPYTDPaAN
         VavJNmO9sDy32imL5XsCA/kRahIgvejbrBLx4sjSLWknxOj7yl8xY2RUrEGghTfnAAr/
         jYAKLK2B9bFE2R0KposA23z500zDLOahDE8HZVVt3gwaIFcujQBel2ZOpb1UsJVaWpEO
         KUY8sCKpqmtc1/upe5eBfszQvAn4VHYFj4bZQFuqDEMMn+SA35wAPLpG3gNNSBSFPhv2
         +5Cudcc7dMkgRwsULcrTWWYJtQSyO4JgFRaQz2RPsWYfw9Cu4UYhaLW0/jVJAzgULu2I
         LGLw==
X-Gm-Message-State: AOJu0Yzd5iQYincyPIeEj0wKkximaUrKjHWkk3ITHUkl4h19KwQW0xFP
	MuJxvfUMQs8paTFHvivQQYoazE0SML3mQidYDie2AT2EOXE6yfkLTcc36XSfDwIKRaxF86A9FrN
	+F3WWnsTRWR+gLppRMrqoTyhX1XBAvClHKGU=
X-Gm-Gg: ASbGncuZikZ6IIc/w1zNwBZM/XzrucbBgdiWhW1VFvQLSvg9FOXCsSqOfzXT7A15hzm
	nEztEjT1vnnAAIhZjGPlzFrgE4J7BXULd+DDSwsSGTVZw26doJs/69bMRCEe9N/ztKWaD6HI=
X-Google-Smtp-Source: AGHT+IGQrIg73Fj/qJm5Qc2vNCLX+DyIrA96MvqxaQcYpa6dDMHQhbb8EAMxT07Tx1su/y1AuKyULzDblG+hQrM/log=
X-Received: by 2002:a05:6808:200d:b0:3f3:de17:c9ae with SMTP id
 5614622812f47-3f3eb08a4d3mr2466529b6e.5.1739646362136; Sat, 15 Feb 2025
 11:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
 <CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
In-Reply-To: <CAOazyz2H52h0unuTEadOFP3cWD7CfHUMG+HUGwVnnZQjtWRJ9g@mail.gmail.com>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sat, 15 Feb 2025 21:05:46 +0200
X-Gm-Features: AWEUYZnPZtRuwud3t_KtBbk0W4GbUreLkv6SGCR-N2ms9EqgARaAqkemccwQBMw
Message-ID: <CAOazyz3dGP+QJ_BOvXQ7gnQzTvOhGcxwA9y-RRJx=CjmMNmWhw@mail.gmail.com>
Subject: Re: Static bidirectional static NAT for duplicate IP devices using iptables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 6:09=E2=80=AFAM Alon Bar-Lev <alon.barlev@gmail.com=
> wrote:
>
> On Sat, Feb 15, 2025 at 1:57=E2=80=AFAM Alon Bar-Lev <alon.barlev@gmail.c=
om> wrote:
> >

Summary: I am trying to access two devices with the same IP address
connected locally to a Linux computer, each resides in its own VLAN.

I made yet another progress, I use arptables to mangle the ARP request
of the host side, but I am still missing ARP response to the device.

nftables:
---
table ip gnat {
        chain prerouting {
                type filter hook prerouting priority -300; policy accept;
                iifname "v10" ip daddr 10.0.0.11 ip daddr set 192.168.110.1=
1
                iifname "v11" ip daddr 10.0.0.11 ip daddr set 192.168.111.1=
1
                iifname "v10" ip saddr 10.0.0.10 ip saddr set 192.168.110.1=
0
                iifname "v11" ip saddr 10.0.0.10 ip saddr set 192.168.111.1=
0
        }

        chain output {
                type filter hook output priority -300; policy accept;
                oifname "v10" ip saddr 192.168.110.11 ip saddr set 10.0.0.1=
1
                oifname "v11" ip saddr 192.168.111.11 ip saddr set 10.0.0.1=
1
                oifname "v10" ip daddr 192.168.110.10 ip daddr set 10.0.0.1=
0
                oifname "v11" ip daddr 192.168.111.10 ip daddr set 10.0.0.1=
0
        }
}
---

arptables:
---
arptables --new IN
arptables --new OUT
arptables -A IN --in-interface v10 -d 192.168.110.10 -j DROP
arptables -A IN --in-interface v11 -d 192.168.111.10 -j DROP
arptables -A OUT --out-interface v10 -s 192.168.110.10 -j mangle
--mangle-ip-d 10.0.0.10
arptables -A OUT --out-interface v11 -s 192.168.111.10 -j mangle
--mangle-ip-d 10.0.0.10
---

As far as I could understand, although the arptable uses the backward
compatibility layer of the nftables, the mangle functionality is
missing from the nftables, so I must still use arptables.

Any hint how can I use the arptables or any to respond to the device
ARP for 10.0.0.1 with the MAC address of the 192.168.110.10 or
192.168.110.11 interfaces? This is the last bit which is missing. I
tried all combinations I could find of the arptable mangle, nothing
seems to respond to ARP requests from the outside world.

Regards,
Alon
