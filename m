Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8116D13440B
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713289694; cv=none; b=otwt73Ax0a+jvnytnBxBdy9xliScLLdaehRZxJXP1Q41QOGcyiLnZDMXLkoEtM7eqsqIMZEFROVAii/0ebKwyjVLownI5+oEpYtp8n9aYqMzAfhuCfeCh0ZtEXquU7/a7w2AaCbARloxO1TUTpFetDzuqJPbmzp9G4RJLSDJ0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713289694; c=relaxed/simple;
	bh=QUzBLx/IQ39gVdK+7VlIHJqBqQuQsDLiZgQg5jPkwj8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=eh5/Gb6vvsgReaJSh9jQKisYNyy+CFynFn/xSaCW6v4nrx7+jfcoBvQczu0iK+JfTly9oG3pdNtR5d3EOM/C2gSvtqYRP2SwcirKmETSopWDt+j2Y9tUOkN60GLFO7CIt+0wmX/j+ta9NM7bP7UDT3ZFSFw9YIX2Ce/kPCT4/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=atvRgsGi; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="atvRgsGi"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VJs2Z48zNzDqfr
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713289686; bh=QUzBLx/IQ39gVdK+7VlIHJqBqQuQsDLiZgQg5jPkwj8=;
	h=Date:From:To:Subject:Reply-To:From;
	b=atvRgsGiKnwUzPt9yGed2j8861VlEBi8GusNtEXJeAOTRYMb69g7GCuJqsylBo486
	 o9CHkjrwlxUY6j3AC8IZQ5fZVTHp8cZ87bXG5hX7Su8yYFJZjm8v3dWafu29Q1koWd
	 tGGOtCOhIu0D4eCf4rQqVU/bSul+H5wZozl0mUPQ=
X-Riseup-User-ID: 824F4F37DA1AD6DC0C4018B6A698924A03D4A9B1B92562C3D495E09EDDEB9221
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VJs2W3GM7zFsY3
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 17:48:02 +0000 (UTC)
Date: Tue, 16 Apr 2024 17:47:48 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Combining/compacting 2 rules into 1
Message-ID: <20240416174748.5612bd27@localhost>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I am trying to "compact" the following rules:

table netdev filter {
	chain ingress {
		type filter hook ingress device "eth0" priority -500;
		# ...

		meta protocol ip \
			tcp flags syn \
			tcp option maxseg size lt 536 \
			log prefix "TCP MSS: " \
			counter packets 0 bytes 0 \
			drop

		meta protocol ip6 \
			tcp flags syn \
			tcp option maxseg size lt 1220 \
			log prefix "TCP MSS: " \
			counter packets 0 bytes 0 \
			drop
	}
}

into something like:

table netdev filter {
	chain ingress {
		type filter hook ingress device "eth0" priority -500;
		# ...

		meta protocol tcp option maxseg size map lt {
				ip : 536,
				ip6 : 1220
			} \
			tcp flags syn \
			log prefix "TCP MSS: " \
			counter packets 0 bytes 0 \
			drop
	}
}

but I am getting errors, as my syntax is obviously wrong. The first error is:

Error: syntax error, unexpected size, expecting newline or semicolon
                meta protocol tcp option maxseg size map lt {
                                                ^^^^

What is the correct syntax for this?
