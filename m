Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8512C7FA
	for <netfilter@vger.kernel.org>; Fri, 24 May 2024 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716566643; cv=none; b=YeMWYS88PpHwBvO+I3y3lzSFotlSylJ/S98mknNou9FPCSVfC8nLkLMoPMrRAKm0LmaO0U8ASCnEi73TLgUa6nkUkXDLipu5qT16mBMa5szOCnW8zZCFo2tK8h3aTNqZ0QrwI7tm/qlYzVWIV+clVEfi1BuATuukVD0hGfK5Xt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716566643; c=relaxed/simple;
	bh=9+WVw68XDMiB8d5/ggkTCe0jPkM7G6bzEBKK5v3u/TM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bbfus8ZHlvCUcXUwpW2+M9GrFaHv/dF2nQcrLeUowUO2zTp2Z4mLETWYGe2ncIWK0URDUu74jNx5v0zW3iA+6qdgMeCipIP+JrFGJdZcaGb4t6MsltVnJPhhLEGMZKOcETbt3lLdqk21vX4OIXQ0e5RVIVP/9yWMlcft7YCLxnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=nYhS2UDo; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="nYhS2UDo"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4Vm8nl6Nm2zDqPn
	for <netfilter@vger.kernel.org>; Fri, 24 May 2024 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1716566267; bh=9+WVw68XDMiB8d5/ggkTCe0jPkM7G6bzEBKK5v3u/TM=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=nYhS2UDoZPhVZ/O62pIS6hsIiWPI0MtOclWDD85vkCwLn92DHGH1uVgbDqEbCxbPk
	 GSVEYSWEVSlP3kiTmcF5ovXpZj1C3wtQk1C1OHi+fOUnc0fuEbGW50jnd2UMwVFMJG
	 AyKwfBg9Pg2RwKu8NcsYkldMKl8RoC096Xk0E2lw=
X-Riseup-User-ID: 4702F2852400C7603ACE6DFBDCCDB38374FBF99297579F7B3120C1BEA93248DC
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Vm8nk2c8SzFqhw
	for <netfilter@vger.kernel.org>; Fri, 24 May 2024 15:57:45 +0000 (UTC)
Date: Fri, 24 May 2024 15:57:29 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <20240524155729.4fd15210@localhost>
In-Reply-To: <ee410abe-b6c6-4e27-a516-fc3af750481a@del.bg>
References: <ee410abe-b6c6-4e27-a516-fc3af750481a@del.bg>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 May 2024 17:42:37 +0300 Teodor Milkov wrote:

>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 vlan id 99 counter packets 441 byt=
es 49415 log accept;

Have you tried putting log before counter?
