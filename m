Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940B21502E
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435265; cv=none; b=W1D141FXpiIMPukp9kezas3xRVgFoyOXeLjVDVWirnjhnyaltjs+4tNjLX6KYUXYH3oBhRk3UM0qSbeidMMiSthIy7klf8w84k6gtgr7WZOClca6EGXlRzHqvIDI6ZvDLlIeU6CyHjHfdmYcs8e6RkhngYoH3m75HbyWWrlrLUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435265; c=relaxed/simple;
	bh=PKqDbtCiKMr+QP1HLLpVRxQVDzbuMYvPe9bh+L4HTG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYoj5KIftAeCoJAF+wyGFxDx65aJcNN3tpe0kIpEY8gfTKUVFCbRERefAKivLMBjnCP7MFubE8YdVhQ1hbqvOhpcvfX8pwtJE4571kA7wPprYFLFvBU8AdVETd8aNqz9bxPYSC7xH6PYHa1yf51nWOFDlR2hR+EBhUSuc48YLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=48438 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAvP4-009HDw-MY; Tue, 12 Nov 2024 19:14:16 +0100
Date: Tue, 12 Nov 2024 19:14:13 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Thomas Koeller <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: ipset vs. nftables set
Message-ID: <ZzOa9Zx_1s4WSI0x@calendula>
References: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45ec57eecdb93fe0d03f63702ef68ebbb79bbdc1.camel@koeller.dyndns.org>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 03:55:13PM +0100, Thomas Koeller wrote:
> Hi,
> 
> migrating my existing firewall setup from iptables + ipset to nftables, I ran into a problem.
> 
> The firewall uses an ipset containing ipv4 source addresses to implement a dynamic blacklist. There are multiple rules that use this
> ipset, and these rules are in chains that belong to different tables. This doesn't seem to be possible with nftables sets, that
> apparently always have to belong to one and only one table, is this correct? At least I couldn't figure out how to create a set that
> is accessible throughout the entire ruleset.

Then, unify your tables in one global inet table.
