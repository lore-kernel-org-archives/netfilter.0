Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E57F23E35A
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776940; cv=none; b=DN4q+XRXARu6b5qPnD1U62TDKa26Gfa4LicilmVIT8mRY/3SovlCzkdMot3VeSeIZ/VgnAkZQ56g6UOaL6/1ytq98tbgg+/8wtZ03lwz4t6tpLQwP4bwVzsJrEGDLd1t5ff4hvgyIm22fI2cNI4hbqVI6110S/mF1DFPy48Vz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776940; c=relaxed/simple;
	bh=QC5VQaJW2E6EuyNnh4akZu7AW/02STZxiMVI27JpOF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6ubeCguAPYtP1u4z4ClftX431FrtZk7TRFCqtkaFSoM2BLZ6RBFPMewuVpclqXoES38dLhnaVT54wUIGH2cqd5hbFoKpYFG9ezkq5nleEQRiuVXHkySZQ3fzZolgX3edQUq5gxnE6byOgbmDR/B0XOVV2We/gSAxO4ebVv79LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnCtJm0+; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnCtJm0+"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d43bb5727fso17916215ab.1
        for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741776937; x=1742381737; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZts4hQGDC3YbVfQkKGZCvHLHsmQpU5NN7d6LVxrjxY=;
        b=WnCtJm0+cY8WJgoX4369Q633zlSeEq4jKiyTCUiaQEXG2LyveWOa3+bnrD1G9KQMQk
         K3IVc11XuwuiKpusTqOz2uBdnQIXel+JOxt7ApcDLjhiQNPG1IO04a2BPJsL1vQtacoR
         7EkxGDR4EfDUFnhn0jrW1CQuXNIpbCtOZ8gQ8cKaJKYJ3MLx3D5wAeWqZ1GYZsP3yaFL
         bdsBdi7Jk5/1qsvG+3jK20yHWo8ws1Y4kYw9ujQ8O01/vZmwx/vKcoq3pptpIkkUFU8b
         LqswxtVXeNLZKxk+gHn/ZBPpThKzC+CHQ6upudB3qRSnDLq8zlF3IkjTfoB6i4zRTCE6
         GyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776937; x=1742381737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZts4hQGDC3YbVfQkKGZCvHLHsmQpU5NN7d6LVxrjxY=;
        b=ZlAHDnkaxB6o4juhybwYwAoVEBl/yzTfgymwZME8QY9HfCUNHnWuHUUW1hpUMjF8Ec
         7q8iUn2mHvSplDBvpnzDCA4OTO2ZiC3M8cFPZGYaYttUFUZGKPS55a2gn+CKClJa3nvy
         dmT5Ul+5ROHdqeu/CzJA6mHCBdSG3+afcsAjkPXeJXIqsAVNShFYV7odQvS6BYSyThvR
         u26fa6VT0U2SHU9JaHf/1H2O2xW2bIGH3h/cE4whNk5tiUvwDizCTIq5sfLH7b4A9gj+
         xNaVcdmN8sMGL+e5Wk+sai3rI21S5Ar81PdGDMFl84BxBBswAQR5HEpGnhZpGp04um0P
         VUkg==
X-Gm-Message-State: AOJu0Yx5DgLnI/AkgMZakg4VgUTg8oVx2jdgC20ArpSQ/37hifzJnsSS
	d74LLKtvJhyrPyho3Xqh16B8qiRiSXY8n1EzWsQv1nl1jq0TAX7QIWUKEaeeYgf7nAElKvrkjDc
	c8BOcBLw/m/gJul6p2Me1282Y7k4=
X-Gm-Gg: ASbGnctfYBMEOIEb0rhd0Yixpf/AYRRNSLG2zndcD+RqpPBEhK2rI14grBDsXOEhHiZ
	oaChnb7Bt8f8xhPtKRU9SuCd9E4LPBXBdZSFwraK8Q7znCKAVLS98IHblhxxf/9ayTj/7MtqYX1
	nhA53w5pPyonj4r3obuhLz0qWjaY5qjqG+xw==
X-Google-Smtp-Source: AGHT+IEAb3mk6hTD+u/9PamKmtAb2cBDnaSK4IeNURmbMxG5KwStzmDe+oBBmrhB/99SiefQY5gWCv+FG/jcYRCd8P0=
X-Received: by 2002:a05:6e02:1d02:b0:3d1:966c:fc8c with SMTP id
 e9e14a558f8ab-3d44196f809mr216576085ab.17.1741776937368; Wed, 12 Mar 2025
 03:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312071148.GA11288@breakpoint.cc>
In-Reply-To: <20250312071148.GA11288@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Wed, 12 Mar 2025 11:55:01 +0100
X-Gm-Features: AQ5f1JpXAAKzqbem5Y10wE_d46yLfVj0CHoO_C8D7rIvRwe2dzeIDrDCis0z5XY
Message-ID: <CABhP=tbcvzOBbBPTMQK+Sz_yBvQ95_Jb-5cgJk6ziFk1nH+zkQ@mail.gmail.com>
Subject: Re: netfilter expected behavior for established connections
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 08:11, Florian Westphal <fw@strlen.de> wrote:
>
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > Hi,
> >
> > I'm puzzled trying to understand the following behavior, appreciate it
> > if you can help me to understand better how this works.
> >
> > The setup is like this:  Client --- Router --- Server
> >
> > - Router DNATs to a Virtual IP and Port of the Server.
> > - Client establishes a permanent connection to the Virtual IP.
> > - Router adds a REJECT rule in the FORWARD hook for the Server IP
> >
> > I expect the REJECT to match the established connection, but the
> > client keeps reaching the Server using the existing connection.
> >
> > The packets of the established connection do not show up on the traces
> > using nftrace.
> >
> > Is it possible to "DROP/REJECT" the established connection ?
> >
> > I've created a selftest to reproduce this behavior, please find it attached.
>
> Unfortuntely this selftest passes for me.
>
> PASS: ns1-apNbtu can reach ns2-VgBo5h
> PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to ns2
> PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> > 2025/03/12 08:10:58.000388001  length=5 from=0 to=4
> PING
> < 2025/03/12 08:10:58.000388848  length=5 from=0 to=4
> PING
> PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip
> PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> PASS: test_ip_conntrack_reject_established: ns1 got "Connection refused" connecting to vip (ns2)
> PASS: test_ip_conntrack_reject_established: ns1 connection to vip is closed (ns2)
> PASS: test_ip_conntrack_reject_established: ns1 got no response and client is closed to vip (ns2)
> PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to ns2
> PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> > 2025/03/12 08:11:00.000519768  length=5 from=0 to=4
> PING
> < 2025/03/12 08:11:00.000520866  length=5 from=0 to=4
> PING
> PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip
> PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> PASS: test_ip6_conntrack_reject_established: ns1 got "Connection refused" connecting to vip (ns2)
> PASS: test_ip6_conntrack_reject_established: ns1 connection to vip is closed (ns2)
> PASS: test_ip6_conntrack_reject_established: ns1 got no response and client is closed to vip (ns2)
>
> Linux 6.13.5-200.fc41.x86_64
> nftables v1.0.9 (Old Doc Yak #3)


I've tried to debug this further, I did:
1. Install a trace rule but the subsequent packets on the established
connection does not show in the trace

chain input {
type filter hook prerouting priority -301; policy accept;
ip protocol tcp meta nftrace set 1
}

2. run ./pwru --output-tuple --output-meta tcp port 8080, and this is
the only output I got when I send data over the established connection


0xffffa20289e39600 38  ~bin/socat1:3357 0          0               0
      0x0800 0     10    10.0.4.10:8080->10.0.1.99:12345(tcp)
__skb_clone
0xffffa20289e39600 38  ~bin/socat1:3357 0          0               0
      0x0800 0     10    10.0.4.10:8080->10.0.1.99:12345(tcp)
__copy_skb_header
0xffffa20289e39b80 38  ~bin/socat1:3357 0          0               0
      0x0800 0     0     10.0.4.10:8080->10.0.1.99:12345(tcp)
napi_consume_skb
0xffffa20289e39b80 38  ~bin/socat1:3357 0          0               0
      0x0800 0     0     10.0.4.10:8080->10.0.1.99:12345(tcp)
skb_release_head_state
0xffffa20289e39b80 38  ~bin/socat1:3357 0          0               0
      0x0800 0     0     10.0.4.10:8080->10.0.1.99:12345(tcp)
skb_release_data
0xffffa20289e39b80 38  ~bin/socat1:3357 0          0               0
      0x0800 0     0     10.0.4.10:8080->10.0.1.99:12345(tcp)
skb_free_head
0xffffa20289e39b80 38  ~bin/socat1:3357 0          0               0
      0x0800 0     0     10.0.4.10:8080->10.0.1.99:12345(tcp)
kfree_skbmem


Is there some kind of optimization that just directly copies the data
without going through netfilter hooks or am I doing something wrong?
