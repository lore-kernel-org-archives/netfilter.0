Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A2131BB2
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713544113; cv=none; b=V0oI+6UZKI6PzqQT04I7FG+xnoaa99gTNivMXdo+4h3yvpPBZ4MZxegaSj0hJ16i3vXN7x2ddWRohjYDj0qkXrsecAYt/MXKXc9couxySIFZzAM35L10bD9+BuXOe/uh63zIaVBAnZ/CrPmza8NdJN0n/JDO5CEWBFjqBF/qYuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713544113; c=relaxed/simple;
	bh=S/XqtZqMjCGaMg8PkXlouw05tUA40aUM+3VEPjqM6Pg=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8W+VA1UOQbzZE08CBxBdY97Ci8osTpAWUu8rAQXiH27Owh68tNP2kh8icV8f+8/t5lRQ4sHzUQh56cyz+P7JEintx+J5E5VfMOw6zXZw1rgIz5H3L0iE3TJF4VCPYTaX5rp5g5HRJM8yRlcsAEEkS41W/aALJ31Epl9T/ylRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=D1AbG5mu; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="D1AbG5mu"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VLg7M1Ybjz9vNf
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713544111; bh=S/XqtZqMjCGaMg8PkXlouw05tUA40aUM+3VEPjqM6Pg=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=D1AbG5muRx5lFFTTB4zTCLmLJz0HdI/9Hfznav+qcut2cP5Jda8jpXUTGsy51Yd45
	 GjiNGxPz321H3DRD754OhL9apNQR8hvXT5LtLV8PDJ5pCQnSrLjbd8uzife6ilw2Vr
	 wqcwJB/UaJtA15IMPtFObqQZXIPF/g1tQ/zAHoI4=
X-Riseup-User-ID: 3FD7E96146B4C2493D13301DC09097257070D0D4309437ED5C1FEDFAB82B6037
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VLg7K2DBhzFrsM
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 16:28:28 +0000 (UTC)
Date: Fri, 19 Apr 2024 16:28:11 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: How to measure/profile ruleset performance?
Message-ID: <20240419162811.43288975@localhost>
In-Reply-To: <7370616d-997afb3d-332c-4a26-afe9-e2a7c4e80c19-at.encryp.ch-74726170@at.encryp.ch>
References: <20240419160232.4caca594@localhost>
	<7370616d-997afb3d-332c-4a26-afe9-e2a7c4e80c19-at.encryp.ch-74726170@at.encryp.ch>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Apr 2024 16:06:14 +0000 Serhii wrote:

> To evaluate firewall performance you would need to generate high
> packet rate.

How to do that?
And how will I know how individual rules perform?
