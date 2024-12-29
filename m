Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215124CB5B
	for <netfilter@vger.kernel.org>; Sun, 29 Dec 2024 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735466473; cv=none; b=sCW9bfAKu9EDAXnFfXE8cu7+9bpLuapnXNAFgK1sddREoVEK8U6/+f9Oh3NAkhSKyxz00GFuyUr2bj5YBEN7XHw16oypjLxC7TRNfKyfS7arytGceh0pcrYrQSre+1Kkvlp7a/RkKxV/YHxfRqOBDWbMNxIZl0kd4MjgFt+UA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735466473; c=relaxed/simple;
	bh=pVzMzlm2cRjYCy2eoRc2qQv9mKKTEA5+1FD/Tz9KfMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MubfShvv2Dp/6s7kgxJUeryHk2Bj2XvPRKYKxdiCvojqeic1i6SZFADGWlzZF8paUxr6LGGc0A/prHd/suUnTm9r9CBbZUVDxdmEWSpnWtoE0vWT+jvdRJJRSZfbYZZfw2alngRTOLzsCwp59bNw/nJ5Oqx8gAPzCrVhVG2UkXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHPuapib; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHPuapib"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163bd70069so3743135ad.0
        for <netfilter@vger.kernel.org>; Sun, 29 Dec 2024 02:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735466470; x=1736071270; darn=vger.kernel.org;
        h=disposition-notification-to:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRKC3oQ7ftaG8Db5Tl1gKT/btjvU5Q9fXUTCP21bCtU=;
        b=aHPuapibo8FSXAMyPNgeRZkotF+wJGylhq5YBtw9UIG2JmMU6G8NLRcp5nt5Znn426
         q88QW8UvOfPOKDM+bRnbJRXugHzWZ3MUfnY++neY5DEPBrUJcMtFx+LtSuaeat0lg80L
         372EnJD5FhuhwffARjDHjJQ5TqjioK6BJjkZxMU5khSjkTmQ5VnLykktRgVddcUEnBrR
         No9D0jPdBIjFyqpCNHrgl77c0QO9H99R2eezBo8CzSr2M/89c/aGZBrgIMHTCCzpSUWV
         jglP2/iUu6ytUHzTyiYbntmnfBey9HewT3Q9lx971Ap5QZgo8vMHKGPS9BxC8e8QeXHf
         KeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735466470; x=1736071270;
        h=disposition-notification-to:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRKC3oQ7ftaG8Db5Tl1gKT/btjvU5Q9fXUTCP21bCtU=;
        b=wIxfREvU5ZfZoJhJObfTFgQBjjUjiftK2UfOK2ojRxwVYWnjpNtpkNOl0/rBuBqcaz
         iOsrmKtq92ThtM2wRNRgRW2ccmYWQnpctyfN6Nlaq7BaZS+so+hW3xbKn4sWg7k77Zpv
         QPeJ0Hf7dwIcDeGBZBVYRGBDsLSJjK9jSvBy8jiZVqekQSIOuhxxi6B5GQpXvuFSEtDk
         zbaVoXXjbs3cpf9UnFETHoRBYWpnFkDi/WM2digM5IV8L6JSmxtML2ryJ8MkHRny8Us9
         m0FKnAPENZOIt6yNEF8tls+1iErBgCW5xRjmsJcce8PxoXbOw5GCbwum4cQg26oA8rkb
         tkzQ==
X-Gm-Message-State: AOJu0Ywh5n0kTpU708n51/Cb+qa03V74slMOqtj+2k2F5Yz1B7s7mct5
	1RtzTE1Estl/vmDZBIzE9QZjPRBHLUs5GpWBUCGzDQmDbUDXQg89gn3tCTk2fciyAQ==
X-Gm-Gg: ASbGnct4fdZYmKsmlvgAq5t33gLa6Z8jY94rYU6/ORlTU5ZZY7ZqczGoeZlqWrDq8Vy
	Pp8xGqp2vsT2eY2yPzTwYlYhbRhzrfzFtwtmFyDZRoMqBhiXZqKWTCDyrj3JZpTHgyU6x/2er3J
	5U38QabVkLLJ0gC/ZMpgLo/IyO4Cvvesxwxh5J9gMh8AmP+PwiD+rMHuGtSZcDnRIOKLnuyZDo2
	qhC7FHsyfjtjsotO8EhwsgYIK6H5MBvStyFrumz+Di+KxN7RfC9TC0=
X-Google-Smtp-Source: AGHT+IGk+2fRuAV287sQkuJMn+r72+aELrniueq9OCvcrgbWwOBAjiYTpj+pLcOHb+znOkkQzBklDw==
X-Received: by 2002:a05:6a20:258a:b0:1e1:aef4:9ce7 with SMTP id adf61e73a8af0-1e5e0484c5fmr46202684637.17.1735466470226;
        Sun, 29 Dec 2024 02:01:10 -0800 (PST)
Received: from localhost ([2a0c:b641:69c:caa0:8566:eb3f:80a1:5bf9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816540sm17889474b3a.22.2024.12.29.02.01.08
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:01:09 -0800 (PST)
Date: Sun, 29 Dec 2024 18:00:36 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: netfilter@vger.kernel.org
Subject: expires larger than timeout causes error
Message-ID: <Z3EdxDDREx_TeWZT@lilyforest.localdomain>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: Mutt 2.2.13 (00d56288) (2024-03-09)

I have an IPv4 set with timeout 2d, but update its elements to 4d when
a rule matches. It was fine until kernel is updated to 6.12.6 or 6.12.7.
E.g. the following snippet gives an error when importing:

table inet blocker {
        set spam_ips {
                type ipv4_addr
                size 65535
                flags dynamic,timeout
                timeout 2d
                elements = { 1.2.3.4 expires 3d }
        }
}

a.nft:7:16-22: Error: Could not process rule: Numerical result out of range
                elements = { 1.2.3.4 expires 3d }
                             ^^^^^^^

kernel 6.10.6 worked just fine. nftables cli v1.1.1.

Despite I can't import the set, existing elements can still be updated
to timeout more that 2d.

A new bug? Or a new limitation?

-- 
Best regards,
lilydjwg
