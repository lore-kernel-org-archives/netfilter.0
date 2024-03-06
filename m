Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A25C8F8
	for <netfilter@vger.kernel.org>; Wed,  6 Mar 2024 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711219; cv=none; b=Z09/P4HL/0lh8es7BMwd/9Nv6QUQ0hPcImpUunJKX04/3iCxn1esVi5eI+GMS/Uid0sPvjuHGz8zN+a/KUhYeUngH+iSu7q9ANdkJ1h/9LI56KQCKbg/Ir9H/83apnXeAZT3Hqya8uLSQsPDHGCIPF8u4sNSr18lOH2HJMFGdgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711219; c=relaxed/simple;
	bh=t0G/NE8DzbVuH9JtkblBSsgd51T1c2RFLban0HAR+mQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=euGx9+IM+0UVPPNMRgp7Cf8iVZjPudZRp2OtE+e1ua1f9kd/BTAFkcU/bBSnN9nUjiC+IOusui4SsTL8grLaYoEDJBKG+FBcKzVmyyCSxN+3FM5dDRjHLqUQfLloKiUkRYnZvKxjRIXhGwLClAsmOIdTfXktlIcNNpTnyw4SrcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9CsIS1D; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9CsIS1D"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5673b5a356eso1749700a12.0
        for <netfilter@vger.kernel.org>; Tue, 05 Mar 2024 23:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709711216; x=1710316016; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i3xVpE3vu+DSRf4uu/WQJGRPWQ16WqTnvCB3YfizEag=;
        b=M9CsIS1DxEw5Cb2FOMZW7n7zMgY6Es6lpcXInktJtRVxBIqj0VoTEzZHgb8Kg8sSDw
         umuk5USUJUxOITe3SnjYK1bPjXSrHeaYQbanogU2a4x/dpWowmyJf6bKdMs/Z2rX/8gX
         0qlAitid60agOmhY5Xm6u0Awb6d1cB2jqOLp0HIg9l/KLgfmQih9BLuBLE4Sy3mpiDaH
         bvxrnPWo8HgGavK33VLXKOaYHqYWdC3YpfvCnlp+8QsU1z4j9aeTCPfXyAU7rCWFpjkM
         1EJ5/w5DKl2wuuuv0abZ+b5UKTi5QspWEB3fLyILz1VhJ7UAzIRzoVc6i31a9yIgLQmU
         dSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711216; x=1710316016;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3xVpE3vu+DSRf4uu/WQJGRPWQ16WqTnvCB3YfizEag=;
        b=j3mEk/KY02T3Q+jPp8pPO0aWpYaAeKejZLS7Idq1tYSwoM1D3hSRTzblN96w01O5F2
         TABchfOzto5UR0vmU2GRtGb0/ewhKvlaWCkehDxO9Ax7jnnDvlnZNhznDGUgn1isjxgt
         wUZlhK1zp04GsNeuttLW+0LGcDqHBT6tcZAB9VxfDwWU+slEvX73sK+O6ElEL/N29h5V
         A12IqrWpjzvp7UM4K0aKwGrJAThSPYzORn0GqcasN1z/2icH0sGcKirnyvf0HAeZCNY+
         l44Rqis9HjmxhLIJEHsFm/HUyG8ObFGwg2MAnHxXUF32QcsuZmqtZRmB0jDpN5rBkO/D
         Dp2w==
X-Gm-Message-State: AOJu0YxcwZF2KGwGphTCPmaQTxkekSKMynCKO6dcA8p/mEs3iTF+vMDf
	6y6BCxCHzWD1nBX/9LGmRj7PUKoinBEMhJoIM0nO3306lF2UdqIaMpU4UbDzGKaph66iB/KFD94
	xnEDFenK9qPScjcR/qGTp+j+sZ3OiW+1/MKKJqg==
X-Google-Smtp-Source: AGHT+IGSYO6SzVKv4K3FUPYyx5xJJJlBnyNZ36WSUfTq7BNno3y0PIAQ1fmN1RWwrZxgKE0GQMRKmJdwmEXksbc18EY=
X-Received: by 2002:a50:c305:0:b0:567:a2d8:ca92 with SMTP id
 a5-20020a50c305000000b00567a2d8ca92mr2384707edb.23.1709711216517; Tue, 05 Mar
 2024 23:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sreedhar M <sreemtech@gmail.com>
Date: Wed, 6 Mar 2024 07:46:20 +0000
Message-ID: <CANvpR2AsqNG7zXsZyw2ONxTH65WDCfEMAEDSt4mJGSuZXmZOZQ@mail.gmail.com>
Subject: nft socket module
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello
I have some issues with nft socket module , please find this  , I cant
get the socket functionality on nft that I was using iptables, could
you please advise

iptables-translate -t mangle -A qrms0-pre -p tcp -m socket -j MARK --or-mark 0x1
nft # -t mangle -A qrms0-pre -p tcp -m socket -j MARK --or-mark 0x1

iptables-translate -t mangle -A qrms0-pre -p icmp -m socket -j MARK
--or-mark 0x1
nft # -t mangle -A qrms0-pre -p icmp -m socket -j MARK --or-mark 0x1

uname -a
Linux localhost.localdomain 5.14.0-362.8.1.el9_3.x86_64 #1 SMP
PREEMPT_DYNAMIC Wed Nov 8 17:36:32 UTC 2023 x86_64 x86_64 x86_64
GNU/Linux

 nft -v
nftables v1.0.4 (Lester Gooch #3)

iptables-translate -v
iptables-translate v1.8.8 (nf_tables):
