Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D13630B9
	for <netfilter@vger.kernel.org>; Tue,  2 Jun 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413499; cv=none; b=ejZgOVuEvhDOYc1nlNtsr+jiN0gsWlxSY2ZI2+iaIIEWULUk3Xw7pEPXC4V/v4fvfTmOWiVgwxJntWADpPljGBvM3+p9Pl5WtSEINiVqBcXJE8Q22NUDxvfDakVhIfPZaU6XlcxZqsxzqFKAUQKN0Ot2sAgSGdVnleYwDLSeyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413499; c=relaxed/simple;
	bh=HAyGv25eXOzPtGnZkwjT9h8gpyY1mSJGWc9NZKeilPk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVvX+ZlNNpJ/6uBKWHwcAFVkxMlUylrP2iqm6LTX8+oncVkz8L/IkwiKNX3Yd3BAWyGDqoVa9hBGaoc50+mq/eN6kBjKwpFYPkUxmxaJaHAC/m2CWG165IMYDDxscW7sGZ1phk+ctOHXG/yHVHkJn1zeiCu6/ROa5VXfB4sMB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=yEvbCEpg; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="yEvbCEpg"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 0450C208E60B; Tue,  2 Jun 2026 17:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1780413078;
	bh=c7WfVdfmO0G5EzPxevUhGsyy3LGXHuVkJ4ClKC8LQnM=;
	h=Date:From:To:Subject:From;
	b=yEvbCEpg9IxBSvrWZ76tZbr/0BiQJM7oDMcMZdacwxs6WfLZNOz8EnKbSyDEVfv4i
	 ZoHD+90B/P8GTEO41dQaHcJssbl73az8SFiwK0n0Vwhdc4z5J1Ij/MHiczchFvjjtz
	 KuXTmQUKRUFSX6Kym47mreXDWWzKkcViYsp1HCYzpuCDTWikmz/jriuv2s0zKYRPi/
	 dMU+8PCcp0d/3aiNII2RQCqH9E/bhfEID6/RQcLEc3djdU7Z6e4/63Ipw6JK+r4T+C
	 d+d+sydhHEyhGBtERO7SN4+uMP4c1OTRGP2aXQT4cmJuqH6G+wdK1d0LUxnX0C6o5s
	 ZAXkQCZfx93BA==
Date: Tue, 2 Jun 2026 17:11:17 +0200
From: Jan Kasprzak <kas@fi.muni.cz>
To: netfilter@vger.kernel.org
Subject: conntrackd master-master IPv4/IPv6 configuration order
Message-ID: <ah7ylcA705Ai0HQi@fi.muni.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

	Hello, netfilter users,

I plan to deploy a pair of Linux routers/firewalls with state data
synchronized using conntrackd. Unlike my previous deployments, I would
like to use both routers at the same time:

one router routing IPv4 traffic and acting as a standby for IPv6 traffic,
and another one routing IPv6 traffic and acting as a standby for IPv4 traffic.

Can I use conntrackd to synchronize the state data between these
routers? I am not sure which commands should I run at takover time
(as described in conntrack-tools/doc/sync/primary-backup.sh).

Or maybe I should run two instances of conntrackd on each node, one for
synchronizing IPv4 by default in one direction, and other one for IPv6
by default in the opposite direction, and having dedicated scripts
for promoting to master/demoting to standby/starting up for IPv4 and IPv6.

And two separate conntrackd configs filtering out the unwanted L3 protocol
by universal prefix address:

        Filter From Kernelspace {
		Address Ignore { IPv4_address 0.0.0.0/0 }
                # or Address Ignore { IPv6_address ::/0 }
		...
	}

How would you recommend to do this? Thanks!

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    I don't like Python; its lack of inline, anonymous, multi-statement
    functions makes me sad.                                --Eric Wastl
