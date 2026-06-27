Received: from outbound.qs.icloud.com (qs-2003f-snip4-11.eps.apple.com [57.103.86.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B055800
	for <netfilter@vger.kernel.org>; Sat, 27 Jun 2026 22:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782599117; cv=none; b=bSP3w6V41lsh1LlvCveTPSqNZHAkDUo4dqR+eZ5TgTj5USwAdmt29n8SYv/vvAcjkumSnk7/B8fUUgfffGDI/QogtzmadKYN/REUu618AZyQI5GapKHXy+EEheMnKFG8aKfsl4L67b77GwHAtTH9TF5oGQeaiDQYNoQuxsZLOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782599117; c=relaxed/simple;
	bh=3UA12xPHQMeHhZflM8wubFDfjQ2fLpvTHlqwC8XetPE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=TApfa+32yz5smZWrn86f/fGN4uNX89+bxLwYigp3WwP8Wc07/dbXPOS7PFfexCiM6AiD2O9WdgW1zcrdDqPL2oF2MVuNl1/DDdleFslKsu3xAYhii2m66og0qNOxwgm6KKa0pONnNTZBPQMtDCWyxJcyv0odCXjxaI6eucy4IKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=E5PcMmmD; arc=none smtp.client-ip=57.103.86.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="E5PcMmmD"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-1 (Postfix) with ESMTPS id 98EC830000F2
	for <netfilter@vger.kernel.org>; Sat, 27 Jun 2026 22:25:14 +0000 (UTC)
X-ICL-RepId: 019f0b2f-df59-75d7-9b59-1e5c99e3cf4e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQtMHVwCUxxBAU0dXwVSEhVdRVkMUxxaGV44Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgNQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOQg08AVUAXAJdfE91LhpfBUUPVXFfA1wfQgBOdSgCXXNJek0HLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782599115; x=1785191115; bh=mes/JhKrubXawsqnKh8xD+YxKhF9uTdFiZify51xyNk=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=E5PcMmmDWfHOwi5ndBhET3aVSwjZcRU+FG9jepldU3QjuXFTmkcKNb7N7IHncV1bX02hed4d/IAsfdKSOMY48MqKprY8U/hyHOdK/ywO4f6acPDm/y8Iaw56MTXFc2PCwCudFcgHHGUU4H89zOslOOdSWc7rFyOBjPHc9fzwr/e9ad4WfZQkGBaugwWnptNkta3tbs+Zpb5oHRvmL9hZYmPqPDqNQGRddMRQNQwq2IEDY3FZT+L93BSUkdNW8HYlQGBCfkpBpb7oIfJzOJYiLXOKRXWomQ6gj7gpPT8DSCHHPUA87J5fim/12JGlMKLjFVLZWHVC9meJbNvGVdK4Wg==
Received: from smtpclient.apple (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-1 (Postfix) with ESMTPSA id 2A32730000A1
	for <netfilter@vger.kernel.org>; Sat, 27 Jun 2026 22:25:14 +0000 (UTC)
From: Sigmond Axel <jadwhig@icloud.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: RA Guard DHCP Guard Pattern Possible Enhancement 
Message-Id: <24D28770-E7FC-4756-B247-296FE56A9C54@icloud.com>
Date: Sat, 27 Jun 2026 17:25:02 -0500
To: netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE5OSBTYWx0ZWRfXwhjjJVe8jJJU
 l6OdNphXN8T9RjBMXOSrLSzWxiHj4pj7enyF8MCTFv2GCgLHTKe3Mn2W3wPso+lOdghDbZlAgtr
 1NsX5AXdxjkO5fimT+fzXCXuV54s4hI1nPXLWmSg/H8ucN9QXqrbOrIIicqfbW2ftuc7YOMt1cK
 Rggza9seufA5AKj/hc22YhAjvJxwJy8NHdjzNaQTp/O8NjSWA89C3YCkRyPv+0vvw+PKQMNm+CZ
 y0ICFnIFNT/WEttAvo3/Axff7yTJctx6ktS7mp/rJjoOrAaCiJZF+cKwdQSRQ7bm5AIQUFhtW3t
 26kKv4YjKFZ9mShupZe
X-Proofpoint-GUID: oZBZGnnBc6p_4R4Xsmg9iZ21vSwafsjE
X-Proofpoint-ORIG-GUID: oZBZGnnBc6p_4R4Xsmg9iZ21vSwafsjE

Greetings,  There is this old greeting format where one leg is placed =
forward and a formal full body bow is then initiated. Required by =
royalty 100 years ago for greeting and respect. Virtually extending that =
now=E2=80=A6  =20

Problem:   A broadcast can come from anywhere to request a change an =
existing RA ipv6, or DHCP ipv4 important configs.  The reply is =
initiated by a client in both cases. The first reply is the trusted one. =
The reply broadcast contains the MAC address and the ip of the =
responder.  This can be stored in a tuple set for future reference.  The =
problem comes about when there is no proper way to test if the set if it =
is empty.  The set is set at size 1 tuple set with ip address and MAC, =
once populated with the trusted value the client will initiate a renewal =
and can reset the tuple set on the next reply=20

The RA Guard and DHCP guard have the same pattern also DHCPv6 too.  =
There may be something I am over looking. Maybe a  null set setting. =
Could be a very simple and useful enhancement.  Or something I am over =
looking.  Sigi.=20=
