Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYj9hQFj"
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB851708
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 03:50:51 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce353df504so232788a34.3
        for <netfilter@vger.kernel.org>; Fri, 01 Dec 2023 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701431451; x=1702036251; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4drhBiJap9PRchnv5RnxaMXrIuWQpLjz+63xlCcneiM=;
        b=lYj9hQFjDtdD4PRrPEqr45Fe1Ljxa9/nzCwNHHHWBOBzL6YYwjQH8aOKyNepCQ23Uu
         uyZc3GYg6PWuHHXvN1IPPBEeDAbA9BMaxJ7o0+B1R3glqJI01JLNN0JZxviACnPlhrRs
         SGLy3XmeSEYR5Oe2Qc+6m5Gn4U0seenGaW1k1sZqE+32gyBtbGzpDKhJEzM2x8o0Slhl
         qNm6Lyg2oXPmXq/Ys+tjcz0oWbl8tnmHDartoaa4w2iKg0ZJ75EEfDLaBARHBK9g6Zug
         +Ry1vxgGNWzLbEnuoBJ4CsHSfsrKyLIpwhzkQ19ZZvsrP47CkL34gBKaHDzI14S7ZEsA
         ZYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701431451; x=1702036251;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4drhBiJap9PRchnv5RnxaMXrIuWQpLjz+63xlCcneiM=;
        b=BJFxIOkloX5r8Mat/HNk13UAVIJZeafdfN/jMAjdRClFm35gf+CnlHIKQULaVSWD2w
         EmO8Yyu6goXvra/qzyDWVqMTgWhNyGlt+4eKtfnBPxp0dWf2XiOAfdvr4chE23gTNXYo
         hQ4V5t/JRCNKBZEC6q7XkGAuNz6Bjlby8BJ4wi/sjGaiZff0pIdCgaIb1uUy8bISrSbW
         pkNSu/bes8E7pe2arW+VPwqPzHwaMKFl+qpXOURY7idDreu8sL0rR5VqjZduciQNMVn1
         idrP1sTYPHrFr6q737v+QagLslXyug1DOm/p42ca4kunycS0hMZAOgyvd0X1QNz+WXdh
         8yAg==
X-Gm-Message-State: AOJu0YxrFWhfCYVp8rD/bp6Cepx/593qNuSKKtrBvdy5qCI9omEHwurz
	KSS5A7h7NV/tYdJvreryNjkYyj46A8bGxLFlwwxnrfX4tSw=
X-Google-Smtp-Source: AGHT+IFM4A7vy48AVOW295B6JGwpCZHEVm8Jq5yfepnFtISclOsRmSbfRMZA0BsyCXeYxazliWlGCNiOKac7uKurNQY=
X-Received: by 2002:a9d:6252:0:b0:6d8:1460:17f3 with SMTP id
 i18-20020a9d6252000000b006d8146017f3mr2842345otk.18.1701431450809; Fri, 01
 Dec 2023 03:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: You Yu Lu <zxc70208@gmail.com>
Date: Fri, 1 Dec 2023 12:50:14 +0100
Message-ID: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
Subject: Unit dependency of network-pre.target in nftables.service
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello netfilter community,

I have a question regarding the dependency of nftables.service.
OS version: Ubuntu 22.04.1 LTS
nftable package version: 1.0.2-1ubuntu2

In the default nftables.service unit file, it has a default dependency
that it needs to be started before network-pre.target at boot. Based
on my understanding, nftable rule are loaded before the network
interfaces are configured.
# /lib/systemd/system/nftables.service
[Unit]
Description=nftables
Documentation=man:nft(8) http://wiki.nftables.org
Wants=network-pre.target
Before=network-pre.target shutdown.target
Conflicts=shutdown.target
DefaultDependencies=no

What is the reason to start nftable service before networkd configured
by default?
Is this the intended behavior for nftable? Or is it fine to modify the
service unit file and change the dependency to fit different use
cases?

Thank you in advance.

Best regards,
You-Yu Lu
