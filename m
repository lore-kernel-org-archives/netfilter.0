Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B123F299
	for <netfilter@vger.kernel.org>; Thu,  3 Apr 2025 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696174; cv=none; b=fGbNvyguGr0uwajkrVtW6DfhZ0Q8aR83Mhu0xBUf4oEGDTvBwl8O8XzHnMdcAYtnZ6Qqeccy3z8KYIXHGp2UDMc39KrEaqPyqZjIYAqY/GNXYnEJjbjqlM62k85tLV+y8LrfxaC8TBAlS47vufY50o+Wukr3BmpQwpkjKNIlN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696174; c=relaxed/simple;
	bh=b6L4dVnFLGXDR7miEjZ1GxAczCjgwFl9inaCZoOGI0o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HrD+at/oPUKx5v9JaD2cP3cu/jNnoAwRB+Zzw3MIkguTNyqOXuc4wJmzVXVZwWOfOXm5tu6b4k7fBnDal/OgnPG9fPjz7pm2Kp2JUKpvaYzJiHLkTlKx0CmzGlAHxHQix4xXtRSYsiA/VqloPMUdtJQDUepgUDp90VfAg9B9uiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efobs82g; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efobs82g"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1309589e87.2
        for <netfilter@vger.kernel.org>; Thu, 03 Apr 2025 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696170; x=1744300970; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b6L4dVnFLGXDR7miEjZ1GxAczCjgwFl9inaCZoOGI0o=;
        b=efobs82gOtVzQJVtzvWfJ9AXkVtH/JQjg2fxJ931oKwmRHBT8zx5T416W8VsAvxHfZ
         fPoMyv59FmHxL7YV3k7RIIYqmJxwOqcipCvhGi8zee5c+JY774pWcIUY0fQGOMjMD3vo
         DN6OXU9wRnG74JEOHBTaRxMnbzCNpYbk6lx0e89RiWFYZak1FADuXJk97uKAxQy/63h9
         lMWXF8mjza43/pY+7/NM0JetHz/tYWspe5cR58nsjIOnIWy33sHrW6jexMi2w9XOGa+8
         isnY4+xRJKm3viibVm58pT6j3wrgMGz5dNhnvKWCyXuMrX26tjxWoXz52ez4FgzOLRpd
         vOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696170; x=1744300970;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6L4dVnFLGXDR7miEjZ1GxAczCjgwFl9inaCZoOGI0o=;
        b=HJR7FO1T2dO0YdK8QWQoph57vKMKQUbcgw6p1zDcl18GWQGS57wB/rKo1DuYncT95C
         FmM+JqQQKAm6ZrnDSN5mhrMtqJUWXIspOwJTyKNHDEceR7XB+5rUmsJuYNPILjAzym4+
         2L5zrlKnTEPz1cgn8A1sKljf4NHff606P8Lw3wQfLZTJ9t0Xb2HnJPOdsJkOMccWUqpI
         rYmFSvBHl5P1GhOgrYyenXZvr9OForhT+WIHoSeG75n+U0FxFhAfPHwYWrkffX1dth2d
         zLSSA9RqLtTT0WvQV0GIM0V1MDaLGVrOCuSLJcH5u3+5zx9dO/nhxz+/bcAPn6FIqF92
         ea3Q==
X-Gm-Message-State: AOJu0YzTcyXXMYLCwD7yudglilGs+gLS4YsVhpH9Xqh3VewTt7k/fAZO
	WZogcOrukN/v2kuJ4YMs/4Ap+SqmwktcAmAaGwxgsIPuRv3soUIvYgr7iEzRrkK25NE67vXO4qe
	2EnOG8tRbXfHOJK6OrXPQ1ZO/cqZFCUTJ3MI=
X-Gm-Gg: ASbGncsakjdNUbuZOpYfnHPuTX2kMRyK+T0iWnnZmgH28227RGDDdNG52OydSpHEte4
	lTYSHrcn6WZQ/jy7MHkuqSwG7YRrcBP/E2xtaFd72fovJGJIjMoKKwISExaQ2T2QqAyd9NMv7Kh
	FlixicFvpH0p6nTlyceAJpGJhDVzdfjEWy4GCyHllBjU8Hnp8g9jgyl4vATw==
X-Google-Smtp-Source: AGHT+IF3wfiHCgZmEN/LyCsEeX5cqk0XRxmSX2iomGP5L8O+VVhtvxfUXA9eS/ayN88X9fFOb3dhP6a6nOz18NxgKi4=
X-Received: by 2002:a05:651c:1142:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-30de02f7108mr82149891fa.36.1743696169804; Thu, 03 Apr 2025
 09:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: sontu mazumdar <sontu21@gmail.com>
Date: Thu, 3 Apr 2025 21:32:36 +0530
X-Gm-Features: ATxdqUGkm9MtZxuMe_If-mTquGes9BaXBvTtgFUQL5yPlyzGya_md34r_Y8d4NQ
Message-ID: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
Subject: Nftables v6 address not matched properly in nftable set
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I have nftables to only allow specific v6 traffic, but I see that v6
address is not exactly matched.

nftable version:
nftables v1.0.9 (Old Doc Yak #3)

I have created a custom chain filter and added a rule to match it
against the below set

nft add set inet filter_table set1 "{ type inet_proto . ipv6_addr;
flags interval ; counter; }"
nft add element inet filter_table set1 "{ ipv6-icmp . 10:0:3::10}"
nft add rule inet filter_table ip6_filter meta l4proto . ip6 saddr
@set1 jump accept_actions

I am sending traffic from 10:0:1::10 to 10:0:2::10, though my set
source address is 10:0:3::10 but still the rule element is getting hit
(verified via the counter command).
If I remove the "flags interval" from the set it works, but I need to
keep the "flags interval" because sometimes I want to configure a
range as well.

Couple of examples I tried with modifying the source address in my set:

10:0:1ff::10 (rule doesn't hit)

10:0:ff::10 (rule hit)

10:0:1::11 (doesn't hit)

Based on these tests (comparing with original source 10:0:1::10), it
looks like only the first 40 bits and last 80 bits are matched, the
middle 8 is kind of a wildcard.

Another data point is if the set contains a single ipv6_addr (no other
fields) it works fine.
Below is the sample config
nft add set inet filter_table set1 "{ type ipv6_addr; flags interval ;
counter; }"
nft add element inet filter_table set1 "{ 10:0:3::10 }"
nft add rule inet filter_table ip6_filter ip6 saddr @set1 jump accept_actions

Can someone please help here, I think this behaviour is not expected.

Regards,
Sontu
