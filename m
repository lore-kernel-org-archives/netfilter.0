Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585751EF36D
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755385; cv=none; b=rTBOCLpJ2Ljvqx9o39dCjn5HElZ9ZrGMKM7fJrKYCXZm18LnIv/v57IBBEijXEoQue/a4hAs/LjjSsvZ7m3DKzZ3eLx3K8mRG1ypGD1ubhMw76MgL0oOGsSYCVoJdpQGTz0KLoaQqteeW8/GnWPBvvzJYnLp5WQFtigopyeXlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755385; c=relaxed/simple;
	bh=I3cbtOt9k0YzdtDq8EoL6T+yFmjkJEyLgs7Qe9r0T3A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzqRAopLVduQesFnjEJhskbLeuMlviK58f+d1k87lLvDKMCq46FcxQsyBcH0tJ7lQt7kLUNm6EuuIcdgZV3bwWgFNgz/IiMnPhuwyPmUQCwiRlChHYx32OXRuamzSAgRO1T3GxTOUFNiUEblndzSIUMVd/XI0QrpZffkKdFVVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=LQTi0Me7; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="LQTi0Me7"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id D867C1241E56; Fri, 28 Feb 2025 15:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1740753756; bh=I3cbtOt9k0YzdtDq8EoL6T+yFmjkJEyLgs7Qe9r0T3A=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=LQTi0Me7cUFrKvRkAAVGjxr7E/dqWoS9EJ2xajSUxNlxR/IBQVVnnVa5nM4X0lwVv
	 IN8GhFw1C3VDVjVIHNX1vsZo/hzgNi8jFHSsnhlZIp0Xd224SK4S2ax2UhDbGWTu43
	 0tLptTjFMyH34ENZ1mg21uDsNx1jYYuA3dV1hJF3OHuZyfV/3ycy5TUPQCOVhwpU1I
	 IXTLzQLttpDJU12iX2BU/WsXR5l16MuTNj8z3azmem2+w0FWoKnS1NbWJo4gMTC4QW
	 3AB3VHZQPzet9XftQyrFS/ViYHIdig3ZxPkrH7DwKgTKpK6ar3sjPH3cno+AZwSb6M
	 1nvQqQBMzkozg==
Date: Fri, 28 Feb 2025 15:42:36 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: [SOLVED] Generic map, also with L4 protocol
Message-ID: <Z8HLXFcsG26MWotY@alphanet.ch>
References: <Z5fuieMugg4fcNKR@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5fuieMugg4fcNKR@alphanet.ch>

Hello,

The goal was to add the L4 protocol in a DNAT map which maps
an external IP and port to an internal (private) IP and
port, for external services mapping to internal services.

Thanks to Pablo Neira Ayuso:

>    map multihoming_ext {
>       type ipv4_addr . inet_service : ipv4_addr . inet_service

        type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service

>       elements = {
>          46.140.72.218 . 8080  : 192.168.202.10 . 80,
>          193.72.186.130 . 8080 : 192.168.202.10 . 80
>       }
>    }

+         46.140.72.218  . tcp . 8080 : 192.168.202.10 . 80,
+         193.72.186.130 . tcp . 8080 : 192.168.202.10 . 80,
+         46.140.72.218  . udp . 5353 : 192.168.202.10 . 53

>       dnat ip addr . port to ip daddr . tcp dport map @multihoming_ext

        # @th: transport header; destination port
        dnat ip addr . port to ip daddr . meta l4proto . @th,16,16 map @multihoming_ext

I could test it and it works.
