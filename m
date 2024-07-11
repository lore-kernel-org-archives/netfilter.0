Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAFC121
	for <netfilter@vger.kernel.org>; Thu, 11 Jul 2024 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668787; cv=none; b=YvjyX8ibecQtGYfsa38TSEA5eOUrrhHB72G27fL4g2jNyBTRf5Bvlr4fVQznq6h5YUKzTdY6af82Pj1Jf/I0C8eAgXo7SS2NfXn8SCieazro6Uz9C6XS6ObEXdXKL2DooLStr0Fci/MTmu1wHu0RS5DT1tjC67vcicU45/I3EV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668787; c=relaxed/simple;
	bh=70pNCh0gTngXESz19XhJgIZXkfMZO1ZAwvDtsiSnZZw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CaMwFwG54Cti7YzV1MDfztXYFZLTRioFpJQUaqt157XdybxfmVNo+KOZ3FoHN/ocnIvC9oJsyl7FpmU1uosmJHT3m7ypwGo3xkdvCZHCk62ysvJo8B2s33AAEPx+VkSqPf6HXvpJ4MiTU/izrHHz8AI7aE5u7nKTt7+jn0P/mxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEouo2kY; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEouo2kY"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b5d6ba7c90so2609276d6.1
        for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720668785; x=1721273585; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hFOLRE1QEbGoioM6inAqebQ6pt+yClTlw418Sxdop1I=;
        b=fEouo2kYS5SI7SRIYffz039i6uRWtSKqWvwiMCalYI5rMsPhpKLP/+/cBOjhgrctSd
         esWyGod5bMR5kdWCXqAe3qwGC764mu56CtRVEIffnA+z0hk0tadGPGwELiAMgdZAgAq9
         +hCMpxT38s2R5JCmQaQasyo1v6z3O2Y6OQqU/b7d79gjpeKpJ7EwneTnjI1pbEDlKU8K
         +BDKN8LZWU1p42aqxjn7OR9Xrsw1FBsljpzBk5JwCHTu3nFqOtwK/+iyvzCbR9sVoi+U
         bOZ3rePozy+AHDD+AilJm8orUd8QCcsf6oCs3PY44SsgsTLOwCmSXrsrdzxL2Io6hLtM
         qESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720668785; x=1721273585;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFOLRE1QEbGoioM6inAqebQ6pt+yClTlw418Sxdop1I=;
        b=qJM6TwfvIMQwurLcoVNugMEHlvW94LQ3Gv82mTji9Eei0TTVlHPVWyiHeWrxFgau0G
         uCFaNn+mxP5I7wOPdfVxNNPo6P4vprnmsy8KcKCX/pyUodzyCVlG/dYW7QPCw9XikqYv
         iIu+fBcRyTs5kgwLQASbDV5S95kp9sE8dB6+MS6WgGbPzcmBLQMoBfjxk4BnVL8q88HJ
         Ovy02bMljsMbNlmS+wZHsgTj1CYGh9Zm+/7Qa8upPKg9O/MWz39ORNHORJwDgCJlDE8Z
         gQgejdkRrkqbeN4Xok46nYs7ex7EzuuyCAINqXeFt6TKcKV864m2Hnzfd0d5f8i+YzyX
         gDIw==
X-Gm-Message-State: AOJu0YyF2oiRqXG0AJePc27TJaBMCq+j+fq9gwIKjcuQxALKouy1FuMB
	kLNJsyczF1uW+5dFxjPpYqWHV8CYFwQ/Ij9woVlMBUy1bdVHO7v/J7o9j2sRIKVvdRv+NPQ9YUw
	LTKjnmMpAvzwVuXDI1hQ26dobwhAFZFGZaIg=
X-Google-Smtp-Source: AGHT+IHPZKn6saObcmYNAYzrbAnMm7aIlQbIkn4/UQTnYRkyHAPJflP1m6B7izouUI+njJpBeQG54+v/PHEik4TfbKQ=
X-Received: by 2002:ad4:5fce:0:b0:6b5:32de:bfe7 with SMTP id
 6a1803df08f44-6b61bce076bmr75146556d6.22.1720668784954; Wed, 10 Jul 2024
 20:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Ayre <maayr3@gmail.com>
Date: Thu, 11 Jul 2024 13:32:53 +1000
Message-ID: <CAEoHhZyh=Cri2gkJmSnqj-MBa3wp2xEGMV+F02iM9TOv4QeWGA@mail.gmail.com>
Subject: Transparent SNAT bridge with physdev module
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi there,

I have a very basic SNAT + physdev setup and I'm finding it wont work
and it would seem to be a obvious bug to me if this scenario is
supported, which I believe it is

Some of my versions here;

$ sudo iptables --version
iptables v1.8.9 (nf_tables)
$ uname -a
Linux us-sjc-eqnx-sv1-gw-0-5530 6.1.0-15-amd64 #1 SMP PREEMPT_DYNAMIC
Debian 6.1.66-1 (2023-12-09) x86_64 GNU/Linux

The relevant iptables configuration is this;

iptables -m physdev --physdev-out ens87f6 -t nat -A POSTROUTING -s
10.0.0.0/8 -j SNAT --to-source x.x.x.62 --persistent

The result is that SNAT works in the outbound direction but on the
reply direction when the packet is unNATed, the dmac is changed to be
the bridge mac which causes the packet to punt to routing instead of
being forwarded correctly

I know this because of the following packet logging I subsequently
added on the mangle prerouting and forward chains and can see whats
happening at the intermediate stages inside the system;

kernel: IPTABLES M-PR:IN=br_nat_in_3 OUT= PHYSIN=ens87f6
MAC=52:54:00:2b:95:c9:82:71:1f:83:80:b6:08:00 SRC=52.94.29.126
DST=x.x.x.62 LEN=84 TOS=0x00 PREC=0x00 TTL=241 ID=46108 DF PROTO=ICMP
TYPE=0 CODE=0 ID=54612 SEQ=408
kernel: IPTABLES M-F :IN=br_nat_in_3 OUT=br0 PHYSIN=ens87f6
MAC=a2:20:71:68:06:df:82:71:1f:83:80:b6:08:00 SRC=52.94.29.126
DST=10.117.117.91 LEN=84 TOS=0x00 PREC=0x00 TTL=240 ID=46108 DF
PROTO=ICMP TYPE=0 CODE=0 ID=54612 SEQ=408

$ ip link show br_nat_in_3
226: br_nat_in_3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
noqueue state UP mode DEFAULT group default qlen 1000
  link/ether a2:20:71:68:06:df brd ff:ff:ff:ff:ff:ff

Same problem is visible from ebtables logging

So I can imagine why in some of the use cases of different scenarios
rewriting the dmac is necessary to push the packet back up to routing
and get it forwarded to the correct place, but that behaviour becomes
a problem in the transparent nat scenario

Maybe its never worked or never been supported in the history of
nftables/iptables but some of the examples I found online led me to
believe otherwise. It does make sense to me that it never would work
because theres no toggle to turn off this behaviour and its required
for the other scenarios. It would need to be smart enough to turn off
that dmac mangle behaviour when the physdev module was in use for
bridged traffic, though possibly that would not always be the desired
behaviour

I did have a quick look into ntfables and whether it could do this but
1) i couldnt find any documentation for this scenario or examples of
people doing it and 2) I am understanding that both are just frontends
for the same underlying functionality anyway since I can get the
following output with the nft command for my iptables rule

$ sudo nft list table ip nat
# Warning: table ip nat is managed by iptables-nft, do not touch!
table ip nat {
    chain POSTROUTING {
        type nat hook postrouting priority srcnat; policy accept;
        ip saddr 10.0.0.0/8 xt match physdev counter packets 10959
bytes 1033744 snat to x.x.x.62 persistent
    }
    chain PREROUTING {
        type nat hook prerouting priority dstnat; policy accept;
    }
}
