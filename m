Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD4279346
	for <netfilter@vger.kernel.org>; Thu,  8 Jan 2026 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890277; cv=none; b=jXUrtD/rxAPY+34YPc/IPPqsg7inP2yALtBA2/oa+o9xC4awUNR76Vmh6YJVrGtvWpZ51dO8RgIjeOO5fJwblMyWdrSyy2Gk4I3bKF77WF/kTu+R7ZK4xEdCrbnORrFjV+Y2QTvPICAdsr9WaBfuIxNAre90Iv631ncoWTmFnd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890277; c=relaxed/simple;
	bh=4pPRw9oYA8PqQz85LystWpWoSIkMtW4b0dekmZYtL8k=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=og7n6HcsO81dcRzmay3zDSfVctPjFyxZD5n8HGuliwYTzn1Z6k+95IGtuB9XMLGVCB4wnO7LgeICB48TQC1+/geDQ6U/7alxSIMQ4B2fMFR75gHyXnutzYuVKlwslxaTSiHBqRmhe2Cr+tKPr5beJluSjLYRjTtahlWSVutoO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=WvrmceRH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="WvrmceRH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so19380585e9.0
        for <netfilter@vger.kernel.org>; Thu, 08 Jan 2026 08:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1767890273; x=1768495073; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGYO+FSR1GnbOp5bJOl5O+6DDnFqwaPN5Y4EftYQ0E8=;
        b=WvrmceRHMSkkyutUTZKKWoidcHNK1mo4kKrAqG7SX7oQUA146EnWh4kgQ9zJHkcRs7
         hXb66gBWjPolCk06tXaZNoxr8CC8pf98PBSzXlzZxusRDKxTn8H+dNUzYOirvtl+sA4F
         d8Lk+3kbHh/LqLS1OzRymfajEqvK0dmXApi8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767890273; x=1768495073;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kGYO+FSR1GnbOp5bJOl5O+6DDnFqwaPN5Y4EftYQ0E8=;
        b=OJszceIcJJ4n/IN5KHpWP+/2fcIr/CoQAkUm8bVSSOGhbDQZyK0PstIoqzBQQvTHXU
         ce9dlpgJ459ENwrSbNKC2Xkm/t7JxGMSATK/8tME64mqDzlnhHRHn0QSeILGImKITCbe
         X+OM0LevL2WgjgafPmMwEXlgbjbUkgAaDhOVppAGzaxjP5R+RJslyfcg1PugXzwyZWCv
         K5YnhOnk9IIk3FW7fkvXKVGiLMIiN5pcvOENryfabe60AhOo+dq7wQRMQSs2ThhKINXK
         zhHXCCe72hPmSpuG3yd2rNDQllNswuX8Ma++rA4w9LVtxuI1UA3xwAWPBznlK+CR1V0k
         VjDQ==
X-Gm-Message-State: AOJu0YyNSUAU/YPyqygf6OdXIwE8eFlZsN4cLX2+JhK82+IG/ZVTeCp/
	YAcjhVRKbMfTAY+oUrcKeVTnCxaurXJgWo1qtuy2SLG8//loywKsE0JWeD2lKli/wUAb4ZMamoE
	CvHM=
X-Gm-Gg: AY/fxX4EDju8wIeN1ahQknd5KdbGHj3U/XYkDLC8eatSaDSBB6wZJVK9jSaKCb5fsni
	rcND8j+fIGt7jMzFPSAfFwqCcKYo5pcYNYtenZdkMOGScvgZ2ZOgsN2AqOv1VFvLU/g5FBUsgIo
	/zyuX1SJtXvIMyD13ju1+x3pDDDNwJZ12I0WsLfTWuJVbMhPGZLEJoNRm09FjSJeVDmJOriHPWP
	IbVzJWQ5PhQOnTnWnvkNbpfF4IOn/fnoQlwgaOhjFcH96gNsBYfMcKl25/s8+/C72a3J5C87MpO
	WCfSeNmRYVSLCTy4c0D0G9QHDwgqMLUMnqS+F4HBTQajTcuImo5UocwcYAwDuVzbtyqcNklfNtm
	2oVOwc3OXeJlB3ME+YMwVeqRIXNR0xLGTXIPtsXaTOyNkMGfUpNfMPjnrDJcCm6AKHgHwU4p9uu
	Bba5jhIkdfeRV81RX/IlgAR7zpD3ljxyqCO0y/OsZ48rnqjIF6OhzYI4sF31FAPWfONlCgZgOT6
	V8brA==
X-Google-Smtp-Source: AGHT+IF79wCkHGcflgx6CjcAo5nQHbnTq0p/nZkxJdGQlvW9cGyHgzyTnSZYI4wK+rN2GYs47vw9bg==
X-Received: by 2002:a05:600c:1392:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d84b369cfmr84980425e9.21.1767890272857;
        Thu, 08 Jan 2026 08:37:52 -0800 (PST)
Received: from smtpclient.apple (ip-86-49-249-77.bb.vodafone.cz. [86.49.249.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653c61sm158290795e9.10.2026.01.08.08.37.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:37:52 -0800 (PST)
From: Michal Slabihoudek <michal.slabihoudek@gooddata.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: [BUG] connlimit breaks localhost connections since 6.17.13
Message-Id: <6989BD9F-8C24-4397-9AD7-4613B28BF0DB@gooddata.com>
Date: Thu, 8 Jan 2026 17:37:41 +0100
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
 Tomas Klouda <tomas.klouda@gooddata.com>
To: netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3864.300.41.1.7)

Hello netfilter maintainers,=20
I would like to report a regression related to the connlimit match.

 Kernel versions:
=E2=80=A2 6.17.12: working
=E2=80=A2 6.17.13: broken
=E2=80=A2 6.18.3: still broken

 Distribution:
=E2=80=A2 CentOS Stream 9

 Netfilter component:
=E2=80=A2 connlimit (iptables)

 Description:
Applying an iptables rule using the connlimit module causes TCP =
connections
to be dropped (client observes connection timeout), even though the rule
action is LOG and not DROP/REJECT.
 This happens specifically when connecting from localhost to a =
non-localhost
IP address (i.e. not in 127.0.0.0/8). The first connection succeeds, but
subsequent connections immediately time out.
 Removing the iptables rule with the connlimit match fully resolves the =
issue.

 Expected behavior:
=E2=80=A2 connlimit should only match and log packets
=E2=80=A2 connection handling should remain unaffected when using -j LOG

 Actual behavior:
=E2=80=A2 connections are silently dropped
=E2=80=A2 client experiences TCP connection timeout

 Reproducer:
Target port: TCP 443

 iptables rule used (for custom logging only):
 ```
iptables -I INPUT -p tcp --dport 443 \
  --tcp-flags FIN,SYN,RST,ACK SYN \
  -m connlimit --connlimit-above 500 \
  --connlimit-mask 32 --connlimit-saddr \
  -j LOG --log-prefix "IPT-443: "
 ```

iptables ruleset:
 ```
Chain INPUT (policy ACCEPT)
num  pkts bytes target prot opt in out source      destination
1      0     0 LOG    tcp  --  *  *   0.0.0.0/0   0.0.0.0/0
       tcp dpt:443 flags:0x17/0x02 #conn src/32 > 500
       LOG flags 0 level 4 prefix "IPT-443: "
 ```

Test case:
 First connection from localhost to instance IP (X.X.X.X):
 ```
curl -I -L -k -m 3 https://X.X.X.X
-> HTTP/2 200 OK
 ```
Immediate second connection:
 ```
curl -I -L -k -m 3 https://X.X.X.X
-> curl: (28) Connection timed out after 3001 milliseconds
 ```

Without the iptables rule applied, repeated connections succeed without
any issue.
 Notes:
=E2=80=A2 This looks like a regression introduced in 6.17.13
=E2=80=A2 The behavior resembles an implicit drop, despite using LOG =
only
=E2=80=A2 Regression might be introduced by =
https://github.com/torvalds/linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a=
4b93b0e

 Please let me know if further debugging data (conntrack state, =
traces,or kernel logs) would be helpful.

Best regards.
