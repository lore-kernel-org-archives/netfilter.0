Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4733594A
	for <netfilter@vger.kernel.org>; Fri, 10 Oct 2025 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120231; cv=none; b=O4mPPfKRfdYoFrvj0rR7jnaQ6mSUJ5fuqz2/Eu1GlDH9alKIu8JXHxdRK49eM3ROOSitclga4wmufPIl7K9OBqomc4qak6IKnNXzLdgO/x5xCspuo8SyMSe2m62smxTbM8Pl1KfkLAUfZn/kUtFYGD2kSVAbB0ElsuDmmWGKsf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120231; c=relaxed/simple;
	bh=+KLUIp5iJhllF7LBCnJTPHzz9Tlayqu+7ecQTOly1kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIH7O1EHn5J4mxPAPadYlv0JXCIapLl7ERZpAhpRsBjNhx2/nJnsJTuIWwUvn/tcM6NfxQbJU6GEuTW8aNWx93UwyLfLEjpIdr+fP40KTQssWhrvSJhSJmlIqW05m7CdYAjNYw2nOsS30vD8Y5eVAd6tw0UDd05DwAFtFHM5QlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj1+GK+v; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj1+GK+v"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d6014810fso23008167b3.0
        for <netfilter@vger.kernel.org>; Fri, 10 Oct 2025 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760120228; x=1760725028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRQC4/6HRbVOIhffpPQo+bNXnEW/+R3tjlrhZ3cZ8RM=;
        b=Wj1+GK+vWJjioogzedVWi6X4E87d2lxBOTfRWq5+6PEToy6tX7fyw/PGM9d6cpY+nk
         Clh+IL0CCToAEmwX92uZzSsmFztgpm3giiArlcIo+tz5FPt8xoV76ndlpxMbfwRXw0Ae
         HepWoSZ54WSoCC6eTLwf1uU5Qpu58LYJXxyovdf9dfF6UdzoUlToAxt/s41PIo7fWAlJ
         XXuXaawSz0XMuxMfGOwC3+jZAHWI1lxKThLNUYNK/LRv8Wg/I83s7shUY8Mx90i39Ib6
         rHLZPyT18p+olG3XuNXZirjqHnfwgh99xdoZHLrrUEd6CYCiPHG2rHKKs0lXzBoG/SAf
         ZGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760120228; x=1760725028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRQC4/6HRbVOIhffpPQo+bNXnEW/+R3tjlrhZ3cZ8RM=;
        b=oLbe39ngXxNxmDgJWVVUsxRFc62UbvBxjP9A9lPcJB2tO64OAuyTiJKJ02I239jUg1
         T42ZsRVlwkj95MctI2O/oqJR0iJUvg3ytDM2HJwNUXEzE2Phbddy8Iz6kWrv0nlHqZDQ
         jCfbVM8gbORdP+JUEFqHCfw8RbtDm6v+2w1wELRA5IlA6wC6f3+ZoNeMBY2ZvWEVFw5M
         Ihm1yh+hviUlFiiCV1Jan2+UruV9xfcrm27Vcpn+eO8rs/IkMvdDfomYOis2UZYDCtTZ
         JFzh9Ro9kpPdhvFyBfESPdC1VY+tePYbGRrsl1UcJpz6eoWnloSuFLrmTuoez4XFtgsR
         m+/A==
X-Gm-Message-State: AOJu0Yzi4cNrrOqy5g27DzqcfSGpljTyUlSBJuO2z+oQYnneBl1oIjBq
	Pz9OsZuhYA5s2Y5jo7uctg2lM4w/4Z7fiiqwROSyT40vrrxjcCJhoYspPhy294Wf5V5uIDOxCFg
	WgP1d/xAXx+Jnw4ReNCb1nYCVGjH4ckw=
X-Gm-Gg: ASbGncsDxyDy9sK61aZu0nWa2mQeZLJ5Fr8OMEBUa3WN2ttzJm9rFTs4H8dMe0cyZXK
	ACt/SNI0/Ku3WzoMR4WPkyokSgoNCiPqMQTkp1STyP3zeE9lfMtqxPYkoSmn/cjxG7tyTuRE9kH
	YYMVB9GIMxUxXiPK88YuTI45hQRAjgXux1JK7G8iSnJ3zWo49AAAqFUJGub2SHeQLcJ/rgjyfGX
	APkpzJnwFRD2sS987t90HmufgX5H8UC053e6yK9pxCcrNAM5MhMsVEHSgmLm4NTOoqt
X-Google-Smtp-Source: AGHT+IEBlTD+i4qIWdzzVt+HsTzKimQb8SJRsMSDdE0yl4GOVJjwbD6pngHRWsAjWni+crZvk0GXcExpNcUBMELZ0e4=
X-Received: by 2002:a05:690e:6cd:b0:63c:f5a6:f2e6 with SMTP id
 956f58d0204a3-63cf5a70bdcmr32524d50.56.1760120228375; Fri, 10 Oct 2025
 11:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2145964596.1381722050.1760118324261.JavaMail.root@zimbra62-e11.priv.proxad.net>
In-Reply-To: <2145964596.1381722050.1760118324261.JavaMail.root@zimbra62-e11.priv.proxad.net>
From: Brian Davidson <davidson.brian@gmail.com>
Date: Fri, 10 Oct 2025 14:16:56 -0400
X-Gm-Features: AS18NWA0P0i3_6XgSQFG5sosfjJ5INuCWEkLIevf8-F0abu8KlJC8q_Bfk5TxZY
Message-ID: <CAOoaxdGXagWNmav2pyZSZ0U1Q4uew=WjRUK5SDkNF_6X-LchKA@mail.gmail.com>
Subject: Re: Rule with double check ignore with 802.1Q packet
To: "Antoine C." <acalando@free.fr>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 1:45=E2=80=AFPM Antoine C. <acalando@free.fr> wrote=
:
>
> Hello,
>
> I found a weird behavior with NF tables. I am trying to filter specific p=
ackets and I cannot understand what is going on in the following case. It l=
ooks like a bug, but I do not know NFT very well so I prefer to ask first.
>
> I am using 2 virtual interfaces veth0 and veth1 on Linux:
> Linux sopvubu22-214d 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DYNA=
MIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
>
> Interfaces were created with:
> ip link add veth0 type veth peer name veth1
>
>
> NFT were configured with the following script:
> ---
> #!/usr/sbin/nft -f
>
> flush ruleset
>
> # INPUT Filtering
> table netdev tb_in {
>     chain ch_in {
>         type filter hook ingress device veth1 priority 100;
>         nftrace set 1
>         ether saddr AA:BB:CC:DD:00:38   log prefix "--test 1-- "
>         ip saddr 192.168.140.56         log prefix "--test 2-- "
>         ether saddr AA:BB:CC:DD:00:38 ip saddr 192.168.140.56 log prefix =
"--tests 1&2 -- "
>         ip saddr 192.168.140.56 ether saddr AA:BB:CC:DD:00:38  log prefix=
 "--tests 2&1 -- "
>     }
> }
> ---
> Then I send this specific packet:
> echo AA BB CC DD 00 50 AA BB CC DD 00 38 81 00 28 48 08 00 45 00 00 1C 00=
 01 00 00 40 11 E0 F6 C0 A8 8C 38 C0 A8 8C 50 1D 89 1D 83 00 08 2A F8 | xxd=
 -r -p | socat - INTERFACE:veth0
>
> And I get the following log:
> trace id 5235f40e netdev tb_in ch_in packet: iif "veth1" ether saddr aa:b=
b:cc:dd:00:38 ether daddr aa:bb:cc:dd:00:50 vlan pcp 1 vlan dei 0 vlan id 2=
120 ip saddr 192.168.140.56 ip daddr 192.168.140.80 ip dscp cs0 ip ecn not-=
ect ip ttl 64 ip id 1 ip protocol udp ip length 28 udp sport 7561 udp dport=
 7555 udp length 8
> trace id 5235f40e netdev tb_in ch_in rule meta nftrace set 1 (verdict con=
tinue)
> trace id 5235f40e netdev tb_in ch_in rule ether saddr aa:bb:cc:dd:00:38 l=
og prefix "--test 1-- " (verdict continue)
> trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 log pre=
fix "--test 2-- " (verdict continue)
> trace id 5235f40e netdev tb_in ch_in rule ip saddr 192.168.140.56 ether s=
addr aa:bb:cc:dd:00:38 log prefix "--tests 2&1 -- " (verdict continue)
> trace id 5235f40e netdev tb_in ch_in policy accept
>
> What is very strange is that the "test 1 & 2" is failing, despite being e=
xactly identical, apart the order, to other tests. I get the same log with =
'dmesg'.
>
> The packet sent can be decomposed in (ether + vlan + ip + udp) headers bu=
t no data. And if I remove the vlan part (81 00 28 48), it works.
>
> Is it a bug or do I miss something ? Maybe it has been corrected in a new=
er kernel version?
>
> Thanks for your help,
> Antoine

Despite having the same expressions, the rules get interpreted
differently by nftables. The second rule checks the meta protocol
also. This is on kernel 6.6.104 and nftables 1.1.1.

# nft list table netdev t
table netdev t {
        chain c {
              ether saddr aa:bb:cc:dd:00:38 ip saddr 192.168.140.56 \
log prefix "--tests 1&2 --"
              ip saddr 192.168.140.56 ether saddr aa:bb:cc:dd:00:38 \
log prefix "--tests 2&1 --"
        }
}
# nft list table netdev t | nft -c -d netlink -f /dev/stdin
netdev (null) (null) use 0
netdev t c
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 8b @ link header + 6 =3D> reg 1 ]
  [ cmp eq reg 1 0xddccbbaa 0x00083800 ]
  [ payload load 4b @ network header + 12 =3D> reg 1 ]
  [ cmp eq reg 1 0x388ca8c0 ]
  [ log prefix --tests 1&2 -- ]
netdev t c
  [ meta load protocol =3D> reg 1 ]
  [ cmp eq reg 1 0x00000008 ]
  [ payload load 4b @ network header + 12 =3D> reg 1 ]
  [ cmp eq reg 1 0x388ca8c0 ]
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 6b @ link header + 6 =3D> reg 1 ]
  [ cmp eq reg 1 0xddccbbaa 0x00003800 ]
  [ log prefix --tests 2&1 -- ]
