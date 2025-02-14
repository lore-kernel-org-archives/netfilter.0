Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F54C1922DE
	for <netfilter@vger.kernel.org>; Fri, 14 Feb 2025 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577471; cv=none; b=Mvx38dCoGfngzdEIuepYge/J129wL99s2H3Vnn/eGA7BuJatcHGrAYRARnvOyMvmiIBCZ+AmPgHytyHVNVioJuN+HN8+kLBW0Ao8gCwuiHp85hKVxajfGROyu4UDly15OAf5zh6LQVpG+BOhSx0NSWf3gvcnEU3lTKhtXoP8K58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577471; c=relaxed/simple;
	bh=7s+EQst/5k259m+/wIfloI8YBqrGIvRjznf55gVHXzA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RAaKHWRMMq124eqtiOpen1xcZ1EMIEfB5YiAXI8zfFo1G9fBKhsLSITVKxxxMSL1Psqek+Z88RPm4mdyhxgVLi6pSQgjvhRIU1Y6pwSduTcL2EmYLIgmA+f5cA73fgPfNtYe/WIG+WyJQUqWUiJuvWPmAmfv6O2LRGAHbylXANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rsraz4Nj; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rsraz4Nj"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2b86794e3abso1248354fac.0
        for <netfilter@vger.kernel.org>; Fri, 14 Feb 2025 15:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577469; x=1740182269; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sXLA7wiOsQvEbKNG+yQHBS+SaKGEa8RFBKrCSFjcj5I=;
        b=Rsraz4NjXmqDrDMDF8+YgAhQ5ytqeEWPxDVf3S4EPgqAyVpkinHnAiX5PXDQ2ABSvk
         38QRTyXfqZRZnlbtiUU7Qg2AG0jcyL3T1Yg7o5Zqvia8TaXqsLSxv3B0/NyCpYWvrrUX
         ESwWtNs9MOM5V8pQl+Wwjhc6NZ/MXpPS1trdjkSg7exuMkh5CtdgRCwYhxDrzto8g8t+
         lA50WMk58AyhB8RJ49WpJCyCuGFwL3FCqgpny/xI6bfB7DC0mojVj54fnDFu7C50JF+O
         Y6reazOEA47jrMAOOfMo4ifciFpLN0VUOjoP+nRWBWl0RTVGfKxSLGyYw+KeAq8QOqL2
         k/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577469; x=1740182269;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXLA7wiOsQvEbKNG+yQHBS+SaKGEa8RFBKrCSFjcj5I=;
        b=tfRtBvL2IF8qqDiwzGh9zuDvpm8Vrodl/QgpIMo+Ecj2G39/VJcAPUUfjot5vgcq3g
         jRxRErsaNm+FTE3/ywawINLGYbRU9uO/cnKohJ/fAnL6KxLvNNnbegs0KTT0L5GFF3ZT
         tFkKmcONUCXjfORoi8O+SPTgzIToVmkcLfovZxlWML7K65VhqLamNAW2Mr0DHUiCWnbU
         mnT2DIoIa7qhao02jxmAFz3U/PBun9zg3HPaF3zLsbSaPYtJGpzNeT6j7WSpTjSJ15TI
         m9U5xRB3mWg0Mh5dZqDwuzkWJgusF0bey/e2kPQ5fhkri4YhPgrMC1ySiHS/UlIxcxhH
         OvHg==
X-Gm-Message-State: AOJu0Yxo17MgZ+Brx0EXkQF+H2VWXMi/lLHbHVSFSXCeDS6eOZlLNDff
	haFRvpfGHgoIqiZcnYAorRzR+dIWLWk+Lr+ZJ1nMcukhhxkz/yoUi+avIHUDRQkK0z7SHbHN96A
	yJHn3MeBfZi0qh1iuVlWaBifuroeU3UtwmYE=
X-Gm-Gg: ASbGncuQai5lJuSY0BqOFzvSlZHnqnFZanCMerag5WMEuoABxjayqYwrA/1fRR0eirj
	56sqef05Dw43RP9Iv8NONR+tXR9WftSmfAlvBn0pu+zPpSarncFmQXUh/pd9YAZ0z735xVn8=
X-Google-Smtp-Source: AGHT+IH7bEEvePBaWSQosfexXabFRRKt6bRfnvLS87WuI24wQQgthEnuWfDhaL9UQBG8mhQ11SrJNkZ4S7ukFd24K6U=
X-Received: by 2002:a05:6871:297:b0:2bc:6933:4a9f with SMTP id
 586e51a60fabf-2bc99d3fc2bmr585571fac.25.1739577468936; Fri, 14 Feb 2025
 15:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sat, 15 Feb 2025 01:57:33 +0200
X-Gm-Features: AWEUYZmnJWQdvONaLY83LYDKPVxg09mnSJYJg81SAKF3Mda4j_hKRoH6mQD7jr8
Message-ID: <CAOazyz1wYSHCYt+nk7hu2fmiW+GRRMMX0sejAa-31xH_VeWvXA@mail.gmail.com>
Subject: Static bidirectional static NAT for duplicate IP devices using iptables
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am sure this was addressed before, I tried to find relevant
information but could not. I appreciate any assistance.

Constraints

* Two devices with the same IP, this cannot be changed.
* Devices do not have a default router, they must communicate with
applications on the same IP network.
* Host applications should access the two devices using UDP and TCP
based protocols.

Network Solution

* To avoid address conflict, each device resides on a different VLAN.

APPLICATION -->
Kernel -->
* v10@eth0 - interface on VLAN=10
* v11@eth0 - interface on VLAN=11

Switch -->
* Port1 VLAN=10
  * DEVICE1 [10.0.0.10]
* Port2 VLAN=11
  * DEVICE2 [10.0.0.10]

Diagram [In fixed width font]:
---
,-----------+--------.       ,----------+-+--------.
|           |v10@eth0|.......|          |1|VLAN=10 |---DEVICE1 [10.0.0.10]
|APPLICATION|    eth0|-------|   Switch +-+--------+
|           |v11@eth0|.......|          |2|VLAN=11 |---DEVICE2 [10.0.0.10]
`-----------+--------'       `----------+-+--------'
---

I would like to have a bidirectional static NAT so that per
application point of view:
* DEVICE1 will be 192.168.110.10
* DEVICE2 will be 192.168.111.10
And per device point of view:
* APPLICATION will be 10.0.0.11

I thought of having v10@eth0 address 192.168.110.1 and v11@eth0
address 192.168.111.0, however, I am unsure how to set up the
bidirectional translation to the device virtual address using SNAT
without creating duplicate addresses.

Any assistance will be appreciated.

Regards,
Alon Bar-Lev
