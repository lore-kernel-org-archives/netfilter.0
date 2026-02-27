Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEB25B1D2
	for <netfilter@vger.kernel.org>; Fri, 27 Feb 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186098; cv=pass; b=hiP315lFvANtjQzr+QVDyKIS0KxBs06QGCjv5mynYX9WroK7tXqai9Qpk3Yv4P2c6v00QQebPbOc2xMD/iw8ro1tnDFjs9/0d1usTml3pvwgoXE/0Jyc7xwA236e2UEufswKip5qFjpVvrYTfyO3avbxymsxMgvBGpe8gy66nOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186098; c=relaxed/simple;
	bh=NlH7WKWwv8D/k6L3TG3U3Zs1Ir/o1bQoQDF57eVsoeE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GsJO77Cxt86lMZv45oB1hR8x+GUjv4RHtEPITaiNOHA5PVbbv2jClqp/aadWlYNxxPBwyHgrDFx7C1JDNoCx98nTuhFLT36hQ2MdFdGwduwkByBtsXvCtlKHkWKFM3zqV+yA64o2wap5yVogC5/N99qx7bj9Y08SEN6ygl8zCq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpnrFkEw; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpnrFkEw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65f73d68faeso3012019a12.3
        for <netfilter@vger.kernel.org>; Fri, 27 Feb 2026 01:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772186095; cv=none;
        d=google.com; s=arc-20240605;
        b=RQdF6y0XtOcUvwW/ZKdqwUWOVvvDHPh9TR21bFmzhU7TI799zyq56oKr/+DP6E3HLb
         5PDKcvSjAdQnSjqtLpvqU2oG+R+CVoYpj307ZI5Q39323atIXL69Use4G16u60zQfSzE
         hAbjYqH8c9+gD7GUqMLr9NRazPVglxj3GAFo89VDnc6GL9lAZ811s7XERASH5NmAwl4H
         KJa5e/9DskfluuVnF0UVIUOrZU2oExET95ljxMs5hi5S9h/ZrE9TDBNF8xVlC6DxVpjb
         O71nu4rNPMrk961ZPlszAIsKxpq1ANPy4nFkgj+m/3liP5UWp2xZL75IGsajGJUCyEYg
         ewDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NlH7WKWwv8D/k6L3TG3U3Zs1Ir/o1bQoQDF57eVsoeE=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=bTvPOJ5olnvtOmnUYta4XS/J6uQPLvsojw4y/HM0u8CFMML7ngBwsr3HPbRx+SKRrl
         j0Z5i7fGbkTsJLufhhvzp/53kxTQq3Go9KewTz7Eb5rKgjEpAMl+5y3rmY5DTGJcg32y
         zmUWOJHzEOF9EWhN7CWm5vqByg/zvSK0KSod5bA8Jc25VXtKTxy8P+pbgXRqFDpAWop3
         8tboVS8/GvZfDezFIOZfY19ZbvfyTrMA2/T8yPF2mmiCMghsJy8rRwuLiHZj7bgsYTcR
         futHtK21HY9Oz4GZxP76b0OiJjAeJJRZp5iuJ/UvONM1KnxnZx3+wZJAmkLQRgFfIImd
         VfDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772186095; x=1772790895; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NlH7WKWwv8D/k6L3TG3U3Zs1Ir/o1bQoQDF57eVsoeE=;
        b=lpnrFkEwPmx+B0E3EcNC6JUoSmweiI9LjJsr5oOsN8h3CugoXkIsb6PMmzgI7OK80B
         VVb4VndwBj3TYYq/Msm00yhP2Ny4DtSIjK0e0oAIRHB/DWvqTq0A9SArDBX1DQJ/0nat
         wS1GF0X9+BFYL2tCGp8O25ucTZu1slfHUOuXxSQ6AhbCcjnaywere6nWrz3hdb0TGSDL
         GynkP45FcQodMa/FRd871mb/ujtb8AV2u0xu3aIJAJVa5BrxFGJPAxqtF0pQ6meM/Ib7
         guk2SEPAU/W9rayGlRfsi80MmlPVvG7RKbNL+afdc6U4urNhtAvvl8PJxkJ38MncCKxQ
         HZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186095; x=1772790895;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlH7WKWwv8D/k6L3TG3U3Zs1Ir/o1bQoQDF57eVsoeE=;
        b=pSzyfGbLIEUdTH3UP5CDQWIs6juEfCOqgEHpN5SEN9k31rjLCp7UjH+IMCVYnLfJ7P
         y4LholDNx7dK+W1ksTepbyd89CV7eR4h2iGKrNZhwflEZsRrB1RzHtDEvkFtZoTc9CwT
         OpQfq7y0g+ba1LPU+15+8AY9cnAr/lELq8j4pGHfeXyRgFfBcXjZGC397fSJKLsQyM70
         PG579N4yx5pCpwWxavF0g8Flzrj7t/UGYcgsimqW2LyYJ1cC3GWk/rnxC5Gk0rSM0F5A
         FzRggInQkTeAbk/rF1X8sZb4hnXOOXtwfdkIXdAyTCJNHYS//Xgi+t7Y90lHe5sMuoke
         iqVw==
X-Gm-Message-State: AOJu0Yw7TeVl4BbmbpGrXjA1wTZj3FURBdjJ1VVWOMrX9J+F6wyWv2TN
	EZfvEU2JwBNhfeUAbZn+As3ljArJZbVYTYVvwHIdBpXu+HJy8plcLhe867ZvN2Tr02p9gIfA4zj
	QGA0lIlAwdLie6Azaq3j9YA1E9TSCIfXv3Q==
X-Gm-Gg: ATEYQzyLlJ5OOwU6PW1DnrgnZYugSzPvX6/jR4gE67UOoQVe4yzx9Ivbk5zhxkZTtoI
	6rPdb3P6JCLhc2qoscYDgn4Pai9tCuae6jigwgRWb7EBIdeBKFNIHK6r4hlfD2mW4sWkU0g/DJD
	OfNNf69hocwQ3XdFBWUtirvvU4AWgQ84wg4clB6XYXrxajO5uzc9tNFwbPSv6qmrzSn3YMlhIR/
	+XblbM64IJ6S5YgMtCIh8FNciTcGJcvwdFIHPm+heKCJZ8KaWSVVOuDsONuuG7845NhMprSnnKj
	v08VbHNr
X-Received: by 2002:a05:6402:270a:b0:65b:ef58:4ce5 with SMTP id
 4fb4d7f45d1cf-65fde4cd49emr1490457a12.28.1772186094923; Fri, 27 Feb 2026
 01:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Subham Pal <subhampal789@gmail.com>
Date: Fri, 27 Feb 2026 15:24:43 +0530
X-Gm-Features: AaiRm53Zm_OkCdmD78iYJr-BZbMuzsV2IMqahRSJ-SIqm_7qOAKHmQsI94mFjSw
Message-ID: <CAHeizqFastcBUqr3zNBOskM1q_XswndUGNtrXubtBMrPVyym3g@mail.gmail.com>
Subject: Using "typeof" & concatenated map target in nftables-json
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am trying to configure netfilter using libnftables userspace library
and thinking of using json based input due to its structured nature.

But, I cannot figure out how to pass a set/map type using "typeof"
keyword. Also, setting multiple targets in a map in the form of list
of string creates a set, completely ignoring the "map" key.

I am in Ubuntu 24.04 and by nft version is 1.0.9.
