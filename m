Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C61E2858
	for <netfilter@vger.kernel.org>; Thu, 31 Jul 2025 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754002794; cv=none; b=vFKYbJ/xdynY++vFiljV++E261B6HDW1jB6KoCPeTU4Nr9ia5HP0VLODI/6dbc4DWPIQzDOMvQY47EUdvYeP0azTYWF4XZpSYYAGYrV4/IIf2iJOYJRPDZ2uWapRtOcETPXgwuzFatgp6/UZPqeOVs3LAavqoT45iqMzxf1IMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754002794; c=relaxed/simple;
	bh=rnbxgA1kRyskEwUnBb+6Jt2QNhEV8Z5k949fWjgeCIo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=iJtI4jR37ODPzCVNdkk/SOZZXpvhJfkhUcA5BXJ0Tgyh3GeQy2q/lf9dKVc7Ky7WUFs9TU6Da9YNgiRJBaNF6v+xF0gCb/6lDUDkA/ibCamyrWpXN29i3lT0br9l8Fz81+JFUqPkDfUOFPIy9mTbDJuKN0AEHB4wn7oekZYDeCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2pum60T; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2pum60T"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-87faacc4b8fso51138939f.1
        for <netfilter@vger.kernel.org>; Thu, 31 Jul 2025 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754002792; x=1754607592; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rnbxgA1kRyskEwUnBb+6Jt2QNhEV8Z5k949fWjgeCIo=;
        b=T2pum60TdE3ubk+ChgP5iy1A/+F9BARN/v0ehyNdYgKTfyrYGi/yGJteRy+S4jL9+4
         ih7tOZg+v1Hjf9QKD7D2ckG/mS/nuNquFZ1BJUT5w2TbpoRYWMg2sV36WrxRCNPPFgPe
         w2e7/gTfrBnYPeF1SCLRzscM1Tq25zdWLIUxJ1fWoZtUbK48u/O63EZZ+8V3Xvl9rG2e
         bdupYkR9lAbyVHujBw7+3cZw/5AhU35MARNmaaEHnHSYmuR6/C3VqQx2iieUHiKJuyjb
         0AbBRAkscXEYbkUw2q+Y9l07n3yeBu1tl9l93cdgoayB0rJeKGH0os0aDgEVVIseLyWD
         349Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754002792; x=1754607592;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnbxgA1kRyskEwUnBb+6Jt2QNhEV8Z5k949fWjgeCIo=;
        b=PZq/G78SqQ1vh/aMS5blAN+iU3k5P3nD5px0YL1gMlRQ/V83P5F7GnJFYWCe87jLys
         3zRTlVNT+e2vxOPiPi6bB8WAR6YcpF5+h4va51DQPX2oVBjotg0ALNdvcta1RI5zeVpC
         H9zilnPrUbXygy0sy1ZWTQR92VqE5rhiLEFoqUtDqQBHS3PusVPqf4m+7V6sJaxsU6xT
         EEbleuRqy3MOIOU2Xoutdse/l32KjPsgGBlyy+lE8iTTBMvs7Ko8WBau7RRXN99YVNKP
         DfYj4CZEX9S3/WTlEyvtU2+mBgqS4OmIbSLzWG3+ZGwFA0f/5STD7rjso+J1wlEQ7isF
         CqeQ==
X-Gm-Message-State: AOJu0Yzxk/G0CTXqUJm1LqZQgvhfDR+yhj1ZF4n086FfnoRaImJrfoTs
	1aExPZjnEzb/T10DHD062EBY6qfL8ZdK9ZRVUlYHoj7RgsDjwGfg8dUuKiRmdA3MOX37JMD2/1w
	xwTs8n+tVYkbE0KmVWnd+gYudjse34BloKhd2gUI=
X-Gm-Gg: ASbGncsXW1jOKP9xWvLaYZLt6e2FHAzm3gq2GRdxry6S53SGCD7tbM7EK+/ShH4nmht
	/e1PtHMVeNwAKaKhbWcoF/mXqlZuSP8K3oRHX1j7iUlT4uGcead3CjDnHtlxGJ+3H2etR2WUO3y
	QGh0JmtfPdOoQq60Ho0279PajtJWwipGFYdMtJXfUoVplIZkNeWWE+xmd0fWEEx6ko1GtKMm0WR
	ssgAA==
X-Google-Smtp-Source: AGHT+IHnj+o/HvqNgxBXq/yhddCOWFpx1h8SJ9vbhJlEqtksZHwl67IvdfJKME1D6nTcSjcVFf4AFZe+gFNbCaR03jY=
X-Received: by 2002:a05:6e02:188e:b0:3e3:d197:b578 with SMTP id
 e9e14a558f8ab-3e40d68924dmr12749485ab.8.1754002791680; Thu, 31 Jul 2025
 15:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Fri, 1 Aug 2025 00:59:15 +0200
X-Gm-Features: Ac12FXwL0JWXNvr57tmAnGSOJYBXzKUf_WsHfsc3gqCkt0qEWUc_V_gBZ7jxuzw
Message-ID: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
Subject: Query on nftables DNAT for localhost-to-localhost traffic in IPv6 or
 without route_localnet
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

We (kubernetes) are currently exploring options for port forwarding
traffic that originates from localhost and is also destined for
localhost, to redirect it to a different destination IP address and
port [1].

We can use the route_localnet sysctl parameter, however, that does not
work for IPv6.

We are trying to avoid solutions that rely on eBPF or userspace
proxies to reduce the maintenance load, and hoping to find a solution
within the kernel's networking stack.

Any guidance or suggestions you could provide would be greatly appreciated.

[1]: https://github.com/kubernetes/kubernetes/issues/132955
