Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15A6E613
	for <netfilter@vger.kernel.org>; Wed, 26 Jun 2024 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426371; cv=none; b=fiHDtSIS98IdCJV0A6UPcil7F2aXd07l0Dqg82jfycv93Y5Y7MJaxysEZGsPMrTesSaXcL0u6fos8Zowjd9Cr7M8HIe8aIVmY3CCgdkUrhjCu7Nbal4JoB4o7qxBuIqHRzRTlaBREf6byzbnqWB+QuFdOiBqND08bnC2NMwOyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426371; c=relaxed/simple;
	bh=xzlLLRxzwhpcygBuRG1MAoOryBc+I1XZrtoB2OrauKA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Il07CWhf/8EH4taJ2AeuMB2k/6i+of5KbAJxBhO0fpAkQMx4RQe5gGTlM0NglOpF+FkpeV2hMaJZkfeoBsw0IH+MOER/T4ent0r17TVw1ebvJZh/xBV/y+2Fwds7rsVXcV+A+xhHWDmYBGmKiWHTd3A/4Zwv3Tv1ZCt9IMs4E80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=kcCOEQ+P; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="kcCOEQ+P"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4W8VWZ70XQzDqKS
	for <netfilter@vger.kernel.org>; Wed, 26 Jun 2024 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719426363; bh=xzlLLRxzwhpcygBuRG1MAoOryBc+I1XZrtoB2OrauKA=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=kcCOEQ+PeqvnCyq54T4lNGvh/P0yowvmVpBWnF5uBmr49GI7vmd54904kbRKnKbDA
	 clqLDmGb62lV4XAhWwpWcpSjSL8IuTN7rgmT9xjqzAVhZjQSstL8cAY7c4xaGl6kVI
	 tRbFcG02mbu4e3GE+Mu5PvyhGd0+nRpDpCBmb7dQ=
X-Riseup-User-ID: D39E32FDD3B71AFC38F01DB5CF3F6574AC9DC2A3FA0BB26086289062AB1084D9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4W8VWL5hHTzFrBb
	for <netfilter@vger.kernel.org>; Wed, 26 Jun 2024 18:25:48 +0000 (UTC)
Date: Wed, 26 Jun 2024 18:25:41 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <20240626182541.229c714a@localhost>
In-Reply-To: <5d77f8fe-af85-4f63-a919-3c3be153a224@del.bg>
References: <20240524155729.4fd15210@localhost>
	<70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
	<20240527171718.7db995bf@localhost>
	<371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
	<20240528150131.3ced9e3a@localhost>
	<ZmiWl7L5dA2HgYVL@calendula>
	<5d77f8fe-af85-4f63-a919-3c3be153a224@del.bg>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jun 2024 16:36:07 +0300 Teodor Milkov wrote:

> Could you confirm if a specific kernel or nft version is required for 
> this? Also, should certain Ethernet driver features or offloading 
> settings be disabled to accommodate these logging rules?

I don't know. I use Debian 12 VM, nftables v1.0.6.
Perhaps the experts here can provide better info.
