Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7E3595B
	for <netfilter@vger.kernel.org>; Thu, 23 Jan 2025 03:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603129; cv=none; b=EDQqYansruswSOqxZqsi1qr8KHgj/iSlI9TE+1K2BSZGzZhXbacNY67jjf//IkE5uuUTTEGRYETlvPhSUeWlM841H1mDEt7xxbm5OrJLnqwrblmKO3TiW6ckQ0D7U/HDvyrKA//x7ooGUBdTaPAtmWUSL0o+lEUZUd5pjZmL/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603129; c=relaxed/simple;
	bh=y2yx9gccAxb3VuILQBZkgH2qRZaWvwykMHVjZ63wPIQ=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=XT8+Fgnv3NkPRmQ2myV/wBsP42YmpYNureD3Vr9fZI1NnT1/mLjSO9vSL/uS6nXnFp3uGTuvkPQ/Do59d1C+WMuNNZ3hhf+1k8g0ueglsGLGcapfuZ7mXUJQfZfpZkKytPAoOp+4Ly6FVf9HDN7X3O0tQAOo3rQfGKahc5ZmXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ayzQqzxf; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ayzQqzxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737603120; x=1737862320;
	bh=V4A1MapicS+EgbqkjoGT8V6ejFV32VSqabyrZIXt91I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ayzQqzxfxqsBoJ1KiB1uOFJ9yydMvtIiPWziLpZYXDE2a49aehWQhD/EyZJ4eNlkX
	 6U0RfbBcDmsnv0dM4XCbVu+lSvY7+13ovWT4vm1ZSOOgX18Q1OM3in2Wm8sJrOFfwV
	 R31ZQhVNz95ZglfBzrfFcd4o7MlV9WtfnOdLZJ/wLye2ZNGajPC1T/FyTA1/dbb4ln
	 40olKS5Lr3cdQz6alQWi0IKLJIMi81ii2/lbBNrno60ad7osyoEtReEOytR0cJG/t+
	 vp4VdKEe2UfNdxQCWYFTdkcrgNmUJ0nD5Ow+OBCrC1fsYzalkoP9qiCs/Qe1dfTx/R
	 wvU+8V/ViMAlw==
Date: Thu, 23 Jan 2025 03:31:57 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Subject: Raw Payload Expressions - out of bounds write?
Message-ID: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: ca4d2bd110803abe785490dcf8f542e7c3a8a5d9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Raw Payload Expressions - does this cause an out of bounds write?

1. Input configuration file (modification to /etc/nftables.conf):

chain output {
  type filter hook output priority filter;

  @ih,58,6 set 0 \
  @ih,86,6 set 0 \
  @ih,170,22 set 0 \
  accept;
}

2. run /etc/nftables.conf

3. Output ruleset (/usr/sbin/nft list rulset):

chain output {
 type filter hook output priority filter; policy accept;
 @ih,48,16 set @ih,48,16 & 0x3f \
 @ih,80,16 set @ih,80,16 & 0x3f0 \
 @ih,160,32 set @ih,160,32 @0x3fffff \
 accept;
}

The mask appears correct for the first re-write, but subsequent re-writes a=
ppear to be too large.

Please advise.

sunny
