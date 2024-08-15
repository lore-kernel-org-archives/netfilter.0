Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0B3A8CB
	for <netfilter@vger.kernel.org>; Thu, 15 Aug 2024 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746929; cv=none; b=lxY1yz40m8KpY3RQVfLCdO1akKg4ZHqj4pWH7OH8kK/FL2P54a8jUAhKfmGxgta1/9v95h2tlryWQ9idTJI1Q0a2oNx8ti65hwQdE2DCUAb+NBAhz03KEV3vpBWlRa03iWN7teiyxZBz/5t2i3J0PvSiJNvitOGrNm37zIlxjPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746929; c=relaxed/simple;
	bh=wKi7Yzxtm20Ky+mIyZUQcSrMkFkblobBVQgxS4igkdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R74whom1C38IKCQMVLXtF0Yb4BcGIHo19ZlBIVifniy/VhxZnVbuVOQZwURO7nvGftxkqc1H8Rt3CvxtjTWiJ6LgpmnnoUb4WqlBnMvouDfziUgG+Rz7ZQ2l2JUv2TuKJ7sYyuzM6sbUFCSo32+rCfUe0YaCiEfwtKIJNCMgv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sefJd-00029o-IC; Thu, 15 Aug 2024 20:35:17 +0200
Date: Thu, 15 Aug 2024 20:35:17 +0200
From: Florian Westphal <fw@strlen.de>
To: "Atkins, Brian" <Brian.Atkins@netapp.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Output port redirect going to loopback?
Message-ID: <20240815183517.GA6867@breakpoint.cc>
References: <DM8PR06MB77179054B381DB1DA67B0D4DF9872@DM8PR06MB7717.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR06MB77179054B381DB1DA67B0D4DF9872@DM8PR06MB7717.namprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Atkins, Brian <Brian.Atkins@netapp.com> wrote:
> I have the following nat table:
> table inet nat {
>         chain prerouting {
>                 type nat hook prerouting priority dstnat; policy accept;
>                 tcp dport 10999 counter packets 0 bytes 0 redirect to :9999
>         }
> 
>         chain input {
>                 type nat hook input priority 100; policy accept;
>         }
> 
>         chain output {
>                 type nat hook output priority -100; policy accept;
>                 oif "eth0" ip daddr 172.16.5.220 meta nftrace set 1
>                 oifname "eth0" tcp dport 9999 counter packets 620 bytes 37200 redirect to :10999
>         }
> 
>         chain postrouting {
>                 type nat hook postrouting priority srcnat; policy accept;
>         }
> }
> 
> I would expect to connect outbound on 9999 and have it redirect to 10999 and reach an IP address on my subnet, for example:
> # telnet 172.16.5.220 9999
> Trying 172.16.5.220...
> telnet: Unable to connect to remote host: Connection refused

Expected, redirect is 'dnat to local machine'.
