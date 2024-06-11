Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F706249E5
	for <netfilter@vger.kernel.org>; Tue, 11 Jun 2024 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130336; cv=none; b=uFbMnl25kTjs5+jrUaexQMk6KkhX79kNBdoFzLsvVr6dE81mZPqIaY3gKj0xgtgCzo5elxlyOyvJ//0jWf2eKhsr82JUXI9vCT8/Jiqzhg4ca32qwLYQ5Wq+oPhlauzMIlZsL+hcft+7uKEWBQYw/90SGwp0j1KaJskUNzfeZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130336; c=relaxed/simple;
	bh=W+YMFBjjx7quzRQ39X5ftsf4TwUxxH9sYSlkTYGZx60=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0R+HeCeMP3ORxJKI4gSZKsoFcnl8bhNAg0TVxo37sN4RPVU9/Dr3MHH5RX+SZbXtWqjj5gPbSEH07qp4jL+hA2QkkwWpdmkkWGfu9kpvdE+3d28gbRfYySZujN7gimJ5Z82Af1J3Um2tqE0NL12u7kvQPAMr9vZsjPm9bX0q5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=52816 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sH6BV-002ddr-4h
	for netfilter@vger.kernel.org; Tue, 11 Jun 2024 20:25:31 +0200
Date: Tue, 11 Jun 2024 20:25:27 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <ZmiWl7L5dA2HgYVL@calendula>
References: <20240524155729.4fd15210@localhost>
 <70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
 <20240527171718.7db995bf@localhost>
 <371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
 <20240528150131.3ced9e3a@localhost>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528150131.3ced9e3a@localhost>
X-Spam-Score: -1.9 (-)

On Tue, May 28, 2024 at 03:01:31PM -0000, William N. wrote:
> Following the example given here:
> 
> https://www.freecodecamp.org/news/how-to-use-scapy-python-networking/
> 
> I did sendp(frame) while watching 'journalctl -f'. It showed me:
> 
> kernel: DEBUG: IN=eth0 OUT= MAC=ff:ff:ff:ff:ff:ff:00:11:22:33:44:55:90:00
> 
> Unless I am completely mistaken, this L2 frame was sent and logged.

For the record:

        ... log prefix "test: " flags ether

shows:

        test: IN=eth0 OUT= MACSRC=90:dd:b4:12:ea:f0 MACDST=ff:ff:ff:ff:ff:ff MACPROTO=8899
