Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6C172BAF
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091070; cv=none; b=sYR7Z9jzt0Uy6Zh4ybvNKDm9hLny3fluihtpkccngC0Y770woVZGylwzPmUtXp9km+aYEFGxK18hHMfMAgPYftyPsWtavprJRCTE82WEUYowVQJ32dlrauaDG2GVS/MbUXp7wzAUi8vYcUKXZANFj9mVKk/udhbmlvtbQF82Yl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091070; c=relaxed/simple;
	bh=dfBOovnC8/hCrp/1b3RzaEIPym82UD7MBA3ghdS6w7U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=r8zRrs9LvESM1mUiQZN7uTWwWsM8P9z+bHSY4bNb7CjErWEz2oQe7sbAE3+2NHJc6aJJn4phRvjzc5uZXDlDMLjkhV57DWkQp5mcAA7b6JCg8FoGqEifFnlOH6rp+uQM8o+CyVbPfdJkoxv2oM5TZUw1mAnUQzTC8iv+JBI0sLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGoI9Bwq; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGoI9Bwq"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfafe87b5fbso4273247276.3
        for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718091067; x=1718695867; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dfBOovnC8/hCrp/1b3RzaEIPym82UD7MBA3ghdS6w7U=;
        b=XGoI9Bwq2YjxkBshvb/QuAfZhm9SGVRDUkMTO70zlxmLSktwbDpyFPqfw397CqDbH1
         Z8F5QmwZmPz2kj1iVgG/h5+jS5Nl2znve0Ktp0f8zUtl++RuIZy32GMU14Of+QHQ74uH
         hMcdgpcLKk9p24cbf3/pabzs0j0dy85mU1YRwXpsLuA5u9njc/I75Nnegxx5ELrFyNy8
         QVCb0oKLaKk5yi+lRGYTVPWr20PeH6wEg0LDipFIPNcIS0UqOcRpCOl5neeyb9ZjdiWA
         cyli0tJNYSRMGGM+9ncot6NE0nrQ0F/7Fk2sh6jyZeqzJeG05fIm+DvdlZbLA9poF9yh
         dK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091067; x=1718695867;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfBOovnC8/hCrp/1b3RzaEIPym82UD7MBA3ghdS6w7U=;
        b=Bi564eUngZtvj8hAk7xmfgGkKOONSoVvwrhTgseAF/N8qH2OEkAfk04fuDkKifE54i
         1t+I5rHQKAb2haxnT3D2sAPNvA1C7hURibHDO1eTiN7Zr0UmJUYt/ctZTSrDgzwK7rCU
         qJYX0cPo7qWPFxQOjj9Kj/MbUzR6nuJuZK/Q1McJfsOSNoKb6XOTxTuzoXsi99+Y+B57
         HlLGngAMI2+enQy0AXzc2gTFHVwhE+0KxLSmwimWwPy/JuIdSDmkyHjLtxY/BbVm1W4k
         z94wkfTr/O7/nxpR2VsBeTJfVqLCu1dME4D70TxNWQZcqm5sj6uP9Ks9EXnWrV3lmAmD
         4l/Q==
X-Gm-Message-State: AOJu0YyxNZgdObfGthIxmn9HajATB/gQWqe5eqPzgSUXNNMQ+HFpXOZ3
	+0aJgj7ycQ5Gj6DQ5Z1ez9IooaHJmdxSWK1aQ0JEEE2DERxnayrbTgvvP4fH3/MLxsviwySzDAo
	j0V+aWgT/RUdTNwsXGtKDR4aEy/cIQyIa
X-Google-Smtp-Source: AGHT+IE2t8BkwwWSioqEKRsylZ1C11SPdx7G0SqsZz/3R3aIbW2Oo8Hlx7DwIMWYQb78Zl1jAEeo7Wy1sUE4r0EuhU8=
X-Received: by 2002:a25:d087:0:b0:dfb:1f14:c0da with SMTP id
 3f1490d57ef6-dfb1f14c336mr6430561276.5.1718091067503; Tue, 11 Jun 2024
 00:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aleksey Nikapli <excusemysmile@gmail.com>
Date: Tue, 11 Jun 2024 10:30:56 +0300
Message-ID: <CACvpvYW6ybpkCcod5uTGXEODG2nByt4FWUK11rf=mGVLuhy9Aw@mail.gmail.com>
Subject: Problem with migration from iptables+ipset to nftables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

I have a question regarding migration from ipset to nftables. I have
plenty of sets of this kind, containing tcp/udp/icmp:


ipset create MYSET hash:ip,port family inet hashsize 1024 maxelem 65536
ipset add MYSET 172.18.1.11,udp:137
ipset add MYSET 172.18.1.11,udp:138
ipset add MYSET 172.18.1.11,tcp:139
ipset add MYSET 172.18.1.11,tcp:445
ipset add MYSET 172.18.1.11,icmp:echo-request

and a firewall rule for it:


iptables -A FORWARD -s 10.1.20.150/32 -m set --match-set MYSET dst,dst -j ACCEPT

When I translate my set to nftables i get a set like this:


add set inet global MYSET { type ipv4_addr . inet_proto .
inet_service; size 65536; }
add element inet global MYSET { 172.18.1.11 . udp . 137 }
add element inet global MYSET { 172.18.1.11 . udp . 138 }
add element inet global MYSET { 172.18.1.11 . tcp . 139 }
add element inet global MYSET { 172.18.1.11 . tcp . 445 }
add element inet global MYSET { 172.18.1.11 . icmp . 2048 }


However, I can't use it in nft rule because it requires to select
protocol (tcp/udp) when selecting dport:

ip saddr . meta l4proto . tcp dport @MYSET accept

Is there a way to translate and use this kind of sets to nftables or
do i need to create three separate rules (for tcp, udp and icmp
respectively)?


Also another question is, is there some kind of list:set set type in
nftables? So i could make a set of sets and use it in the ruleset as I
could with iptables+ipset?


Thanks in advance.


Best regards,

Alex
