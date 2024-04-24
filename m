Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA216D4FF
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713981857; cv=none; b=fHaLcOFVpxVnMOyXlN1A7caSLJTfBcxHSa3sSJcLLCfwL8dHCon3iBNXkpgdgfAgX/DfrQrnuHmc/CQc6ILnIw4tzw9Csl0/1dXwFeezvXZFF3MPUNercCJIfRf0KeLkaVC3rQJaAcCs9UtCY5P20qNmiV5vJgct84HLrUPdLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713981857; c=relaxed/simple;
	bh=qycfp2lXkHkKTcpqwjRonLMJh8a/BmpIvlgrR1k49pI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=AV3kaXKsqp/Yn/M76FXC4fW54Wmbtl2DOSse9rumU/yccE2b5mEhzM1lZCe8y5fEK3ccx892uhGyYPsX3FZQwwIW/yooxq7mlFRb3CoGAfsSxsEgKR8ZKPb96hgSrGrbhSBzhY54D30S5sUghiDL7nfyOfGXpvbFdaZMUtSG1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=UgeHoGo3; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="UgeHoGo3"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VPn1P5Zczz9wWG
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 18:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713981849; bh=qycfp2lXkHkKTcpqwjRonLMJh8a/BmpIvlgrR1k49pI=;
	h=Date:From:To:Subject:Reply-To:From;
	b=UgeHoGo3AhDAgNuf2kommjw0C6t31ENC79q6HbMOjbXBAV44ZwUvoS8HCkD6AQLlw
	 VNMgzb4mvOY48J1jAOUO8i9XYh5sB9j8XmLgC9AStQl6pqj8EpFmOWrThmL6NMSwh3
	 ey4+zOswxjwfCziiEKWGEcS20dSvou7jU1Tx6lIg=
X-Riseup-User-ID: 18C823F1F2C70D0DDA8913D9B293FA33091AA277163D02F4800F5B49680EEBAF
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VPn180JltzFvRF
	for <netfilter@vger.kernel.org>; Wed, 24 Apr 2024 18:03:54 +0000 (UTC)
Date: Wed, 24 Apr 2024 18:03:31 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: How to have a dynamic ingress device(s) list?
Message-ID: <20240424180331.3dfb6fc4@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am trying to do this:

# dynamic list, updated through a bash script:
define $nics = { "nic1", "nic5", ... } 

# ...
chain foo {
	type filter hook ingress devices = $nics priority -500
	# ...
}

The problems I am facing:

1. It seems the perfect solution I was hoping for is not possible:

devices = "nic*"

2. If there is only one device (e.g. "nic7"), the syntax requires:

device "nic7" # not 'devices' and no '='

Trying something like devices = "nic7" results in a segmentation fault.

3. Adding/removing a separate chain for each nic dynamically seems to
me less efficient, i.e. I am trying to avoid it if possible.


What is the right way to do this?
