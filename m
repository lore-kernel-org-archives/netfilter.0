Received: from outbound5a.eu.mailhop.org (outbound5a.eu.mailhop.org [3.124.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4D12003DA
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.124.88.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423384; cv=none; b=GnnXpkvdk1PpTpp5FjRTodTpYC0ZMIOWGIkAzrENyFKh0vEE2QIZ/u4HJEIxl4nTyAkydz32SJZZO7YuzaZNkBZdx49tytFoHwPS/2g2OEMz36Xt/mKeievlSnAinFDHmeVkPmL/Gx6Nq3wPvGolJIEzP4khBqf0eTZweXNyhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423384; c=relaxed/simple;
	bh=VRZJrfFEZH7HQ4Xh/cPc7UjYAzuEtaMckxB/jvoU9BI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=sqWoHM44DihIl44Hd57fi8ENm8EqazxNcXUZgUkmk0p2NAuniznLSDzlhZQAF+xYkuqOvpbzW17ZWn4Yu2Ac3+cCkGQ52a19dH6twUesyiQZrjydAhDhrldT8oYgq9hYnNlnU6x6sP6JxII67u24zc6YvWgucHO/0+WSEFn5Fsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=S2UN+k6s; arc=none smtp.client-ip=3.124.88.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="S2UN+k6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=mime-version:content-transfer-encoding:content-type:date:to:from:subject:
	 message-id:from;
	bh=VRZJrfFEZH7HQ4Xh/cPc7UjYAzuEtaMckxB/jvoU9BI=;
	b=S2UN+k6skl64NrWT3H8AZrkF7m/9ppl8n0ovK7jivN9Lb5sHzSlJsAWJd52O1juV4VSXGY6FTRShH
	 3RMPXXXzLYaWPF7AdL4IhAnSQSgUJ+ANDFfYfCf78ZyXmzYZObNxbk5V4Ci9RIMVOTs/yK8t22VyvU
	 +ae/OwMxb4eCWxLAYJaZ5kulv+rlZjiOXucoZqeLZIyMJXZVbTadvrhkpmS/Bclm29Myt1rh7SRapX
	 107+hbvx1nzHDpjvvJOo8x24VM7sxQMeragkAfNPvCxVJRK8VVXZX+LcYl0K0FAWOgGSWrpmGKKOc+
	 KOIRE/YPA2HDh24texB2yk/BVGxOhvw==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 1ef23b04-a106-11ef-b219-25ccbfd3c7c9
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound3.eu.mailhop.org (Halon) with ESMTPSA
	id 1ef23b04-a106-11ef-b219-25ccbfd3c7c9;
	Tue, 12 Nov 2024 14:55:13 +0000 (UTC)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPA id 1A9A096893E
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 15:55:13 +0100 (CET)
Message-ID: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
Subject: ipset vs. nftables set
From: Thomas Koeller <thomas@koeller.dyndns.org>
To: netfilter@vger.kernel.org
Date: Tue, 12 Nov 2024 15:55:13 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

migrating my existing firewall setup from iptables + ipset to nftables, I r=
an into a problem.

The firewall uses an ipset containing ipv4 source addresses to implement a =
dynamic blacklist. There are multiple rules that use this
ipset, and these rules are in chains that belong to different tables. This =
doesn't seem to be possible with nftables sets, that
apparently always have to belong to one and only one table, is this correct=
? At least I couldn't figure out how to create a set that
is accessible throughout the entire ruleset.

Thomas

