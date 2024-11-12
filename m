Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031712170C2
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731436138; cv=none; b=kwPBFnwDQGi2+LhKoDnch84c42KZ+bv5DNEFffwT+nkiAJnIdq4I2GsBesG08BtoHyyDJTCwZuJqV+5q37YRPg10XFoHhXipoHaMghRsVRTnmtB/tlJJ32uKCrRaubDJSdX0/Ksfqy01DFAdyzOKLFqd5vZo92pyKEb5xrAV14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731436138; c=relaxed/simple;
	bh=2gs6yOPA9D9o9FU+cui5DTFovtBD4QiayWtecZwqUdQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HqRokBGYyNDWi5vkBizFsgUM9Z08Pecq7ZV7EebOMCJAIJJlzRVY7cygOMML3XXuQdE+gzHplNWO0BzPrmz0nxO+htnEzih3A/Q6Nb/ReBFu0JZkkWvebB7gQxApvJ5OGJOLJR6zHGg+kzhps0AryWHlK0fvqkXzG4ojWTwQ/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEWc9dtl; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEWc9dtl"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso7833782276.1
        for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731436136; x=1732040936; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQCY7vSO4PN/7iOBRzPYqWwli1l8ar63GgHoTfu3w18=;
        b=nEWc9dtluymlO6O7TXoiQUxF+8tmSL+j+i/PyaGIRv/hA6yd9UhvFTQWyWOL6+v1pS
         2QqlFw7gDZCkadnkoXajLyW3efDzqz5qGBkuoL+QzDjfHWlc0Bex5UaahZ5tZcl3w4kS
         /klOTRB9eIloAhgkrkXi33k+nZo8QIYEeyGof3ozVWoLBIY0OVET3HpmOnTXdPp9mx/7
         C8SZS9mqmm5y8+Bblq4We1t8fCSK7682oqNdBAFvfqM1KPaEZ/3Ot9qOlKrP4X7UriWe
         KCwzLmseHxPwyGaiu06+ri/nGbTvrpcsh0yL3ZtTqnTUUn4FMg+4J6MlR+DSvm0Sbw/K
         KR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436136; x=1732040936;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQCY7vSO4PN/7iOBRzPYqWwli1l8ar63GgHoTfu3w18=;
        b=bUwnLk1js6sd4KeT97nx067QIJGTNIsMkIOee6SgFMctOD2DJa0/zRM/hGwQPnhjOZ
         b5sjtUmSxzRjOilw2URDCro6nxElWc79EsMcMmymr3/7U6qiDp8ONGvumUnLzOp7qfNg
         xQJ4XwoMycASN5SgIm44eDysyRdP9XO0q6ick2RFwpALVHo2d7wtw4qyMtcesQI0ntt1
         5pi2CiAhQWWdol/yp+6ojuUkG01GiC3j7YGEwAtAEzqzb+KK+eoWpP32gQ39sNGIbvBI
         jlpdSlU2zsGlB7+AFfdzzkJuI2kCqV4Ao+kWM6JhH2AQJ+ojYBa4afHYIn45GVukwtLk
         O6vQ==
X-Gm-Message-State: AOJu0YzAyn/tmJnbDIZbhwYUqMToNYAjDZOMjtdII6SW4uXQYXjN6slI
	SzSE3wXEgTct8AlxA0I18AaVav1curOL4tfz66UWdwqQ8NrfPfGDtO3x7BCazQ0xhaED2+I4zK7
	caF5rDauByWWoDvgGOpv2uXPbfiLBA7wO
X-Google-Smtp-Source: AGHT+IH9QpZerHR5Q4CWMj1fVVnTTSKWBJZVsSF50bOuYq9LooGN0CkYPQZ/NRrypzWNkl7dDzhxlw/sQOlBHq1IAUg=
X-Received: by 2002:a05:6902:2d07:b0:e30:e3f6:75ec with SMTP id
 3f1490d57ef6-e337f861df9mr17747767276.17.1731436135572; Tue, 12 Nov 2024
 10:28:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Tue, 12 Nov 2024 10:28:44 -0800
Message-ID: <CAK3+h2xXycJ887M9pvDvuJK82fP51PXAb99Bs3XNTSQV4ycQXg@mail.gmail.com>
Subject: iptables SYNPROXY small packet size transmission performance issue
To: netfilter <netfilter@vger.kernel.org>, Vincent Li <vincent.mc.li@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I setup SYNPROXY iptables rules as below for my  web server serving
one static simple page, then test the latency through
https://check-host.net/check-http?host=https://www.bpfire.net, there
are some country locations shows 4 - 5 seconds delay, which is caused
by server sending small packet size, see the capture screenshot:
https://github.com/vincentmli/xdp-tools/issues/7#issuecomment-2465554843

INTERFACE=eth0

sysctl -w net.ipv4.tcp_syncookies=2
sysctl -w net.ipv4.tcp_timestamps=1
sysctl -w net.netfilter.nf_conntrack_tcp_loose=0

iptables -t raw -I PREROUTING  -i $INTERFACE -p tcp -m tcp --syn
--dport 443 -j CT --notrack
iptables -t filter -A INPUT -i $INTERFACE -p tcp -m tcp -m state
--state INVALID,UNTRACKED --dport 443 -j SYNPROXY --sack-perm
--timestamp --wscale 7 --mss 1460

Initially this issue was reported to me when one user attach XDP
acceleration for iptables SYNPROXY, after I reproduced the latency and
did more testing here
https://github.com/vincentmli/xdp-tools/issues/7#issuecomment-2471174263,
it narrows down to 'iptables -t filter -A INPUT -i $INTERFAC -p tcp -m
tcp -m state --state INVALID,UNTRACKED --dport 443 -j SYNPROXY
--sack-perm --timestamp --wscale 7 --mss 1460', if I remove
'--sack-perm --timestamp --wscale 7 --mss 1460', the small packet size
transmission issue does not occur.

Any clue to solve this issue for iptables SYNPROXY?

Thanks

Vincent
