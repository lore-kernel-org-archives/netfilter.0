Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260F1A23B6
	for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735553779; cv=none; b=EWy/QfGHdwKX8rsPMvw7QooickXHFBueRUtfkT/AgJ3hpARWIiuPK6jAMZQsOVz3nRQwLS41xbDq1mkJefgmA4DgGlXIx9LLsh94la1xWbuiZN43ai5DO7yrh6YmAbLK2fdzBv0/a0TblCynerVDfMovw8yUaWUCSrJznxVYxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735553779; c=relaxed/simple;
	bh=kTjdRQrK1WLJARxyc/vaaOYw9ykMKZ/dQhKk5wNpXkE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BGgV48AicnmjDwG+tCx2GUN1ypaZ7dCKS1k+Ho42QDRztXKzVdqWySoMII4Axsi26oDT7pS/Rb0jfq8TTfcpBDheBPS2Wd0qB3xftn1Nh27jubcGTTSDb6fuQ7hNGYQ2Gov2IYSb4v3wMp/6cEdzW9NXz8WNAZojHUarLE14Q50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1LRU2Hf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1LRU2Hf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436345cc17bso65661315e9.0
        for <netfilter@vger.kernel.org>; Mon, 30 Dec 2024 02:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735553774; x=1736158574; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kTjdRQrK1WLJARxyc/vaaOYw9ykMKZ/dQhKk5wNpXkE=;
        b=d1LRU2Hf7MICrPv4vFrR9q6Xqr5eP0nNK3TKLENlskrcegv3yHIZa8WulKtRiynXe8
         56Nsj23sfdiHHyT2Akayxz1NEzAykf4RptkSaFogqZAg/PgCOSWSg7owQuGg9LW9wIBa
         YKm7ZzD3JD/r5F+uXMDr3d3w+7jiKSv8NvcZhmNL9XFyuJ8Z8E0+xYLzq+kL4mGYL1XI
         OoRakTiqHogQzwS07Dv71bWrBi40BHE0qO7TQL5FWZG04g93GB9hOoXvxA0UOpv68teI
         tM5fVjrWP0MuIejqtu/IvdRNA5GH7OXq9dTJvc8cG4khb+L28V6E7TpV96AGWvm/1bRW
         EYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735553774; x=1736158574;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTjdRQrK1WLJARxyc/vaaOYw9ykMKZ/dQhKk5wNpXkE=;
        b=ua80XFgIGcCw8k+BACSaa0SyUwFwFXlpuViFu9TIcC5J59w10Z5NWPE0lZ90k60m1i
         lAiajSrNE3oIYF7uoaDK6OKO2sbO5i78k48tWY9SnV+SBlrQnAdEPAuk6bn0oYRhhuF9
         E8VJtr2DxdKsJwvYLJWtc4nERA25ORqly52qUVaEeEkIl7YSA4x9+k3M4u+fzq3DPSuA
         ndcQShHXxGbnpmicBLUPmDAnzgPCYm+wFnGf+Q1lfdg11uY1s94QjEAWniY6IfjAtxl1
         NO7OE+nEJDVzBHAXAvTRfZczQ798VkLmxpyfZv81oMSv8rAmVFTQLyWqUbYpq0UtwOUp
         dH/g==
X-Gm-Message-State: AOJu0Yz5qF3+athAwhJlz+vBbvg/WtN0ejBOkN+e7XTBoM0/LYaqeTW9
	1USlHD6FbPNPOTfVFt+tvgYsIwonkPYZ185z+dBXxgzx8+s471xdkovb68+KN+sLbiXkl0um3/I
	qjyI152nDrFUozHl84SwnKFasrjHrEes2wRE=
X-Gm-Gg: ASbGnctjaOs9bzjahYk0k45ltti4mVSjv3Bwv/pWWZ3dCF0a1qy3b/6pUfgOkpC2NCZ
	9/xzH4xMT32gwkXNpYBNWV/KGfoJ5NeJ9EGnHTg==
X-Google-Smtp-Source: AGHT+IGlBkx2gnT3BqduLPS8iARmAKI5yvlzHy7YljckB/a3SwzoYkGCN7h/7RMPWpbXjkzTbd1IHLbpZZXcAtOfqVo=
X-Received: by 2002:a5d:5e09:0:b0:386:3213:5b9d with SMTP id
 ffacd0b85a97d-38a223fd110mr27459615f8f.41.1735553774372; Mon, 30 Dec 2024
 02:16:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aksel Nyman <nyman.aksel@gmail.com>
Date: Mon, 30 Dec 2024 11:16:03 +0100
Message-ID: <CAFKe4zsiyGxitj_ZAaFgMyzOCPhypn1JOx7fCKfbyNsN7AKNDw@mail.gmail.com>
Subject: flowtable ipv4-via-ipv6 routing
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

It seems as the flowtable acceleration doesnt support sending ipv4
traffic via an ipv6 next-hop. At least when i have tried i see the
device running the flowtable sending arp requests for IP addresses
that should be routed. If i add ipv4 next hop addresses then the
flowtable works fine.

The use case is having the netfilter firewall also running FRR with
BGP unnumbered to minimize IPv4 address allocation for link networks
and with flowtable acceleration to make it faster :)

Cheers,
