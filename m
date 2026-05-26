Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75813481B1
	for <netfilter@vger.kernel.org>; Tue, 26 May 2026 00:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757061; cv=none; b=cn6LWHWaPdjkcEXKtz0x2gQGNTpdPrFVy6VVe8/mGexWK79AM1ByX+eA0nPFE0D/FRdPNRamx70FtjWtbdqLPOrmFXSw/5sknvdzkdVm0hJzyXlxXbOKdM1QFtv0XuDBE2qo7ohNahX1BtLWYvvJ0qd5IGghuKR+80y0S1Y/K70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757061; c=relaxed/simple;
	bh=g49syCZbrcyGAV9vL1/MJ6akQY/Cc2tC8bQI1paTbJo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ZXSr6abwxs0EGsRIkl77oxe/MHStK4LukI2I38h0p2T4ff2M2q5WRe1GimzVCxCwxA75/+pfzHX/EHTSXoglMOK0E38vj4mdUUqwhdSw91l2CvUscn2s+quIwX87pR+GyCoXRUvOWGdbm4tfn9rPXNfe8JYYxCzHhPf3ddRBxIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTUHXcJh; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTUHXcJh"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-91080895355so1153009285a.3
        for <netfilter@vger.kernel.org>; Mon, 25 May 2026 17:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779757059; x=1780361859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hA54FWWuSZ64hEMdKMnMsjPDeBci9LBWwEtXQnY1uf4=;
        b=WTUHXcJhRkunsVbpohwRjzyZkL+8znmVVSOdQk93LdipV9lk1AHjXN2NPOFM4pksSE
         pWrt99O6+FNF8rRm98no5oF4Eyu1DHZMV72USHx8LeWlXz5KVBX5rNrCSE4czbrQr7Dx
         ykXk7UdTe8UfJWfpVfBGsQmomiGAn3vX98fta9sayhWwDkVl4NQPwGuFEs4oIu91XmT3
         V7HZ1j9VYpDemIza9HUgFVG838+z9JzpLia7WubY7fuQM8lqduanNUbPav9X/NqlQi7k
         +1DiDxvUjpxhm4iQEfCYHOu11KxsMDCacfy4TDt5DdYyPVJSISvSouE0jCcx1FBajWX9
         lIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779757059; x=1780361859;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hA54FWWuSZ64hEMdKMnMsjPDeBci9LBWwEtXQnY1uf4=;
        b=OsUOSDNiOhADFeVSlwpWPrvy8rbaqPqBozapDPYNGn1yAos8Qm6o1kDjUDRPBRol+z
         0xnCP8cbfQVIesulgdckx8Mx5E+KKHD8oqbgilnG3NtXzvQ5Q8qJzhan3kMhhPw3NBRb
         9869KVZCRP0aEcxPZ26kVa892V6JyfvbUVULuFMsKInBzLQwZNTZXmF9dpvQQ3N7kDMO
         ct4EO6QPLqDFNiVq6mKm28g+wxEKAOqOnbe6+003trviEmVywMgUPl4UssHo4uo4GNjJ
         V8n+toAfPpXQvonDESTtW0wkXlVvFmD6s2iMrlKAZItGM6WmcIAYdjtDtxehplKyJh+9
         P+dg==
X-Gm-Message-State: AOJu0YwVblkcvpFyASjaQjWGBVROoc5FiuDm/ff38vcOtYtnoKYiv90B
	dxzp6QiSYTQbKKkUz5IEqv87vCLTtgZrjUWlpFabuwa/riJybzQHw0vFM1vLjg==
X-Gm-Gg: Acq92OEufS2EzXHo2opwxqohizIakIIq8rgcE9HhzRtnEVJkHiwFr17TkuoS+vm9/lb
	6/m0BsozQkiDanc5JKyioC/7AgycjoolVumyHrbLo9jMy1oLArlftYrbLrhSM8mwDB3r9oW6PrE
	m1gM9SlFVXyBnaOM7pPg4AiSHuxoCiqIlj9NCyLS0riubpSlfEAMfQL6YXsTAbiW9H7O8NxD7Pv
	3FGwfMaHJi3rDpqs3cgMvKZnGoRkiM2cHDgGuAzykTTyoI0bUBPftE+MuoFLrS5kf71Gma8Qk9j
	YPqrDawvKFLIG8Rh6CnBcNGsxdlSroHPm9iDTYoSAto3XLDhmGDl68VOeudy896kq/9ahQEll0B
	aMsSF10QAB5jXlEICeTlBth6SPM3WXjDiCSR841aXNFcQcyPZ9DSFlnYJxRLDgQ7esWJ7fZVWeO
	vtk/Fdnzy3YFKHcjm9
X-Received: by 2002:a05:620a:4408:b0:90f:7732:4bcd with SMTP id af79cd13be357-914b49404d8mr2456101985a.27.1779757059158;
        Mon, 25 May 2026 17:57:39 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87f4b93sm41042685a.33.2026.05.25.17.57.38
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 17:57:38 -0700 (PDT)
Date: Mon, 25 May 2026 20:57:36 -0400
From: <imnozi@gmail.com>
To: netfilter@vger.kernel.org
Subject: ipset not completely working in mangle:PREROUTING
Message-ID: <20260525205736.1c76666f@playground>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

iptables v1.8.7 (legacy)
ipset v6.34, protocol version: 6

I have four sets:
  - blockSetHost (hash:ip)
  - blockSetNet (hash:net)
  - whiteSetHost (hash:ip)
  - whiteSetNet (hash:net)

I added rules to match the block sets in filter to INPUT, FORWARD and OUTPUT. The rules match and jump to chain blDrop. In blDrop, if either white set matches, control returns. If no match, the packet is dropped.

This works well in filter. But there's one artifact. The blocked packets are 'accounted' to the internal server where they would have gone.

To fix this, I added the rules below to mangle. Here in mangle, the white sets never match and all of the packets (that matched the block sets) are dropped.

Is this another instance of 'it doesn't work in mangle or in PREROUTING'?

Thanks,
Neal

----
The rules used in mangle; eth3 is internet:
-A blDrop -m set --match-set whiteSetNet src -j RETURN
-A blDrop -m set --match-set whiteSetHost src -j RETURN
-A blDrop -j DROP

-A PREROUTING -i eth3 -p udp -m set --match-set blockSetHost src -m state --state NEW -j blDrop
-A PREROUTING -i eth3 -p tcp -m set --match-set blockSetHost src -m state --state NEW -j blDrop
-A PREROUTING -i eth3 -p udp -m set --match-set blockSetNet src -m state --state NEW -j blDrop
-A PREROUTING -i eth3 -p tcp -m set --match-set blockSetNet src -m state --state NEW -j blDrop
