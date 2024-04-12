Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2854F87
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712939843; cv=none; b=MfRTV2B9eSzcD4SNmTFWWUbiKPwO+oIXjx6c7eLtq+IV0evDmh6m1iaPQmmVcikETW3eRJ3J6DEXLxXKX2ouiE+xz7UPgWBeYz+1rhyk6hUvcHB99r+yY/plA9GIEx3wJkVZpAJsl91+k3q/22Wei5c/ujS53PbsZ5wKlLiR+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712939843; c=relaxed/simple;
	bh=9uktVSPKnbioEez5bhfkXuNRCAKQ2N5rczpRD5BWZew=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzfFFe0n8O9psZqN4H+2PO1kBpn5MPEXRL6GvC1vCAlYk5JeIZK/eq0iqSpxXBsUzrMotx9HOQMaBw9mHZz4gqtawb28GFCLDfuereAVTYnBlex6pu7+DJD1piR7N835aFtTon109KaTD/74vjVxza0ktp6xMF1OHsLIqV2dvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=S9bkFpGT; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="S9bkFpGT"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VGMfn0HxPz9xBn
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712939841; bh=9uktVSPKnbioEez5bhfkXuNRCAKQ2N5rczpRD5BWZew=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=S9bkFpGT3ZqtvhmtMWWKMoNqoOpS1NjL/LNizdHKOiVDANaHzspH1rfjs3UmuoU6m
	 gGcZQF7x1oV94cYB1RJtOdDXiqRJrRAzAVXLesGqNOdYKrweeRbcoQIMdnnE7apEPR
	 XNSrIfUCXJx934ucnpWS1vsTveBPnXLiEdcIZ/f8=
X-Riseup-User-ID: 5A5F5B56BE3E1914DAE8BCA60CA5EA009E46DE08A3DF8098718A2B4C58891C2B
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VGMfY22vWzFrSS
	for <netfilter@vger.kernel.org>; Fri, 12 Apr 2024 16:37:08 +0000 (UTC)
Date: Fri, 12 Apr 2024 16:36:20 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: connlimit from wiki.nftables.org not working
Message-ID: <20240412163620.74aaab45@localhost>
In-Reply-To: <b4f12fcf-0dc4-40d9-8874-0ebe442dea3f@app.fastmail.com>
References: <20240410172343.1f7f5ee2@localhost>
	<f0514bc1-c1dd-4f24-97e5-8c40807dbae9@app.fastmail.com>
	<20240411165412.0f0c65ce@localhost>
	<34397891-d5b8-45ca-8bbc-190a71b34cc6@app.fastmail.com>
	<20240412113848.0fd84173@localhost>
	<b4f12fcf-0dc4-40d9-8874-0ebe442dea3f@app.fastmail.com>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I will try. Thanks!
