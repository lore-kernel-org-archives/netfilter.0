Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8032A19C561
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236444; cv=none; b=ku3N9n0NizwDX6cTokimvci2Dqs95uGiBuHEJNks4cMhIuB/YdLIW20xf6NGSnJx3laxMmG4jJBL4CmMdqPE2gqAQE0Gq6H/XGAqjc81yT9CH4wmAQX06z2A9jReANUWfqgrtjhc6ddk1KbJWqmcApw9ZoZebnVlHSaxNd1YfhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236444; c=relaxed/simple;
	bh=WLyPXAKusxM2Xjm2q/9P01/RtcsRRy0F7uhGx6NjMTQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9cVTmrvzS9vQ2PlH7xMtPy0QjVYDGkFnCZL6/Ril+ln0SO5oCAz67xJajp0E1+lx7Ae5JzOr38zy2KSpXjrMsmwBpeKgrMA6rsCxXu0Cu85LSLrSZDDDPxuy8MvZlVGLrfcBjILovj4WWja5acGSnUKtC9oWx4A1Pb9SxLOmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=u0tiDU4L; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="u0tiDU4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738236434; x=1738495634;
	bh=WLyPXAKusxM2Xjm2q/9P01/RtcsRRy0F7uhGx6NjMTQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=u0tiDU4LxVphxW422OqLzqqX0FYLlo0NSprst3L/RX/BIGI6dFgYCbUX/u+CxRlLh
	 mzKHsyGudT1T9XPFUNwywgFF5wKlpJ8xgggDFTdGf3cI3yKCb4kbV4hoZUwlEsULiN
	 2a344rTlumX8b8k9F3gxtTrB66NbMI8TAXkgaOXdufXf20okS2+B/MHRr5H+m+utVX
	 Egacu5t6yj3m1M4wvZVDXSyRbGmx3396pXDM0uEgEtk5A2TciFPv0puKqw0ojE/AfT
	 46sFH5n0P8ngj0Mu5aDsNiA9Gj4keLcpecBGV+VpaYcOzWXL+ZnqbOkFgmUXoyTWvO
	 ez4yDxhPwheYg==
Date: Thu, 30 Jan 2025 11:27:09 +0000
To: Pablo Neira Ayuso <pablo@netfilter.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <PVrkUQp56-Jj22U0UNcuDB2ECbRGvxlQdpV9wqJEScEZCv87qu5FdvjBKhhAzXkGv71nnXYmPI2TlxCo-dz_Mz-2Y52rrOVQLWvmPYm7cIA=@protonmail.com>
In-Reply-To: <Z5jQgcbCXiLyPwV-@calendula>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com> <20250126135021.GB3073@breakpoint.cc> <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com> <20250128003706.GB29891@breakpoint.cc> <Z5jQgcbCXiLyPwV-@calendula>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: fbd9cd5711bd72720fd0e2e42b533c7b00ef2620
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


I can't see the problem within the code.

Aside from the latter half of NTP timestamps, which expressions do not work=
?

sunny
