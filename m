Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7C1D1E92
	for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845544; cv=none; b=QThSxQPKcSm8qVglSthAssJmUwaqXJg7buQJYb/lqec1nIJ+YPJRON+ZyT4Upl01iOs9lt+KS4niA5M71xmUV80sdA85OAEQwcPrbQT6JJeDkR9nnB2NH2z0iYUqXKEjs4yQs7j4o9+6H37MsRgPQxAH3LqONrOydqPMcvoXnrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845544; c=relaxed/simple;
	bh=edWctErjqIemO8iFkr04y3NRBm8E+x8R+tNMWgLA8oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rm1N2v8614plrUz5kbxIWuZtFCVQS483EpbCzQmH6iGN9Ql2PISszPcBABcD24EZ5Fe+ZoGqnrrY0jqVDu3M6JAHTBFje4NxK59eNKD6TeYGa2qptEfFmdAhcUoKdXFAnuGnHPlJ574RWARpsxqgGnHtCQ5wqVSeUpVSmI/xyRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tonusoo.ee; spf=none smtp.mailfrom=tonusoo.ee; dkim=pass (2048-bit key) header.d=tonusoo-ee.20230601.gappssmtp.com header.i=@tonusoo-ee.20230601.gappssmtp.com header.b=jiS7Fj+P; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tonusoo.ee
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tonusoo.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tonusoo-ee.20230601.gappssmtp.com header.i=@tonusoo-ee.20230601.gappssmtp.com header.b="jiS7Fj+P"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-27beb2496f4so797844fac.1
        for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 01:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tonusoo-ee.20230601.gappssmtp.com; s=20230601; t=1729845539; x=1730450339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=edWctErjqIemO8iFkr04y3NRBm8E+x8R+tNMWgLA8oY=;
        b=jiS7Fj+P3VUku2QqH/Lr6ZHMZJ7X3yqB8+NMztZq6clZuE4J3RAiVa+SJwB724VDXe
         gxkHRYMeKMt15tqEsL3x8YccXjxCs+Pz5tPyLzX+PjVNLXfiI5MTQfkLPIafnsBroLHE
         z71x1tNlGg69/TBdlrWtKw24XtH7yhjjVxz/fApO1hlHIm/mc5NNotPQACSONFpL/x1B
         8nx+nK4t16cz+coJj+jzggxvP8EQbD3xoMshRLAYHIiM5buGySZ4MNDdsy+xHoXxzN99
         A0wBbj/tSNrAGJ9ejybWohsOCqPQsfzyuicGL9xbDp5oz3stlA/F/HxZ3J6BM6RU+4cN
         kdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845539; x=1730450339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edWctErjqIemO8iFkr04y3NRBm8E+x8R+tNMWgLA8oY=;
        b=fqHELrZ7XzlgVsRyjW0/iVNVyvxV7n08TerxjM3LaAxfXZMRTeRQc9t6fsd3nVJya5
         WggL5/SZFRieUSWSe82/xDnijHnZwSAHbMrh8DFHOtO1rxEWbP9r7Rbd3+NkhHMwrEJ0
         AwIAn8O6xiaqWes8I7GbUqUFTT9i+QCsFmv5SHR+AyOyxMBQX4GSxKNDPYoZVr6DxDNi
         RsIxfZfHbpo41GKPnOsalWFIP9wlUpneRX4TCrs+BFQiWsbr41BQkYcj75Sk5gTwp7y9
         kx3/LxmtCz1Jl5ZRDqTn+OXg5l8jW2kbkffnBo7RpKsve8PEDIu2GI2CayiGdvb3Tssp
         ec9A==
X-Gm-Message-State: AOJu0YzZ346WCiy2QmBG2j0t3xT0U1NikI6nhEsbCsyPX6/PtwjGPJjT
	dE6oEJKC7sM8Nz9HgEPr8PKCAwGhviEdL/d+hlT6hCobboeLtGjEVGyX+0IpKWXkOOrHMTcQKB3
	cxzBO9SNbsHFSm/iYpFOYl1F5+eV2qpVlfBnFjlRqe2SsduNbAL0=
X-Google-Smtp-Source: AGHT+IEkmu5tBUcArKQ8uCfn/5ma/IfVIaF9dX7rSBfcqsWS3xcK+vqvZFt2BAYtzPgwvJduwL1JujHn4NVtre4YF5w=
X-Received: by 2002:a05:6870:d1c7:b0:288:6c52:ffab with SMTP id
 586e51a60fabf-28ccb8323aemr9202937fac.24.1729845539488; Fri, 25 Oct 2024
 01:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
In-Reply-To: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
From: Martin Tonusoo <martin@tonusoo.ee>
Date: Fri, 25 Oct 2024 11:38:48 +0300
Message-ID: <CADJxXUL_DuwGsC0vBaW6AXY3y5sGtK=6OwBfopw8Z69_AgfqUA@mail.gmail.com>
Subject: Re: Unusual packet forwarding task
To: Rob Roschewsk <rob@pabut.org>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

perhaps something like this will do:
https://gist.github.com/tonusoo/0490bc5cf564689f3999f1de4eef098d

On Debian based distributions the dependencies can be installed with
"apt install --no-install-recommends python3-pcapy python3-scapy".
Pcapy is a wrapper library for libpcap which processes the filter in
Berkeley Packet Filter syntax, builds the binary bytecode and
eventually sends it to the kernel via the SO_ATTACH_FILTER. Thus,
there should be very little impact on throughput or CPU usage.

I used a following systemd service to manage the script:

root@deb12-1:~# systemctl cat packet-forwarder
# /etc/systemd/system/packet-forwarder.service
[Unit]
Description=Forwards certain packets received on eth0 out from eth1
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=/usr/local/sbin/packet-forwarder.py

[Install]
WantedBy=multi-user.target
root@deb12-1:~#


Martin
