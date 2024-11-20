Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3015855C
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.139.196.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732133204; cv=none; b=AIIoODYvuDjjrDsZbfQ6GvqVgpXtUFmWgpAP+0hhaQQxD2zOk54jmudT2YhVB6JYZAc/37MIyOTJa/4h1g5tVcPLx7MbZim99gzX7Q9ip9sphldmNiqVFXivT9SWtSSmXG6QzWjDECJXMhvx2zy6L+cpUC0nlZoEL6Kwnv+t+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732133204; c=relaxed/simple;
	bh=L+Uwfu1EBkmzEoWR2kAj63u5OEAImOVH++hir//MpFw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=X3G6ilvkOtcft2bYN43AY42qc2+eX9pqIVCqUmp5wucXMjDvaxkZo/rueH6Tc9sZTC5+U7tSNbH7XG0xjxhsdcwkb+ZIFntzNB64GYBOtDbKN1htfuJO1p/7Iv6CEE68tGDkz+29DfWTYpRFhxHum0pNTy4E46OuaKnhfaqW/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de; spf=pass smtp.mailfrom=dorfdsl.de; dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b=QuzK+wgc; arc=none smtp.client-ip=82.139.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b="QuzK+wgc"
Authentication-Results: srv1; none (SPF check N/A for local connections 
   -  client-ip=2a01:170:118f:2:9410:35ba:d4d5:43be; 
   helo=[IPv6:2a01:170:118f:2:9410:35ba:d4d5:43be]; 
   envelope-from=mm@dorfdsl.de; receiver=<UNKNOWN>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1732133197;
	bh=L+Uwfu1EBkmzEoWR2kAj63u5OEAImOVH++hir//MpFw=;
	h=Date:From:To:Subject:From;
	b=QuzK+wgcCnW60i/88w19Koh/02cc49Nib2HM6hzQfPrE8KH0u8JPfuskNHtNnlB3v
	 9KbBKauS758f7V7z0GhoXIYT6e9p+2UT9JjKja/7QxELin9MXctcVis+L3ZeFI4jSR
	 hLv8CwYZ9yDkLJycPRkvUVXlB0dQ5c0k8g7XtJPLwPTRr3V44357YE4ZXdn/V0xBnu
	 f8kB/uKXkYv3IHbPykx8r9xw1nPIK9UYSKwg5gTfZLleqYyWfsFisnN37mP/1ozxwW
	 iRiKBodydQUja501/qal5i8jDF1A8vF2L8ZWVZUlljvTHNY/X4auLWrNdDIo1v2tLl
	 7NavbC4MKx9RQ==
Received: from ryz.dorfdsl.de ([IPv6:2a01:170:118f:2:9410:35ba:d4d5:43be])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6~bpo12+1) with ESMTPSA id 4AKK6bT0033658
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <netfilter@vger.kernel.org>; Wed, 20 Nov 2024 21:06:37 +0100
Date: Wed, 20 Nov 2024 21:06:36 +0100
From: Marco Moock <mm@dorfdsl.de>
To: <netfilter@vger.kernel.org>
Subject: logging to a different place than kernel ring buffer
Message-ID: <20241120210636.6df71d81@ryz.dorfdsl.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello!

I want to log denied traffic, but to syslog or a file rather than the
kernel ring buffer because that messes up the virtual consoles.

What is a good way to achieve that?

--=20
Gru=C3=9F
Marco

Send unsolicited bulk mail to 1732133134muell@stinkedores.dorfdsl.de
