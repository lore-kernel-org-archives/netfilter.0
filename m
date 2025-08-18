Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759F322A3F
	for <netfilter@vger.kernel.org>; Mon, 18 Aug 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526841; cv=none; b=NqA99XfBVqabus470t1WizuIBrRGRr9y/Uv+iKRP+Q0KQdS+oVWWyGAqzWm7+D4d73AUDSN6+p4BfVc9MiLp4nb2BM5yy7yF96lbfDhsITuZYs21JpyY2W8MgpSOwqsPLKGrfjGCnchJ2mP7Q+NIlgI1bRmJRptWsma9P0QNUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526841; c=relaxed/simple;
	bh=E28H7PQ6L0i336wCl5niVkp8ANh7G6ztS6uPPS0Wty0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeaZ5IjkRy8d5Ib3uLdeIoJ5a7WdrA18cGVPqMXNov21g/cWGFSxsF3u3wXoypz5MwhbUfst0aLOtMTqwe9GhP0rtHelOKPuO0f8+mlNGeicXGyZGKPkvZta+JgIOoRv26iyTji48RenhPa8AyhrjSxAnrhQ6IoZ3Pj7S6yyPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=ftxNx5fV; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Pes/+FJW; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="ftxNx5fV";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Pes/+FJW"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 2643060297; Mon, 18 Aug 2025 16:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755526836;
	bh=itWA7cirbTMj+7elUaBpgM3ATkiwrggXHPw/Wrh1vqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftxNx5fV9zj9KUswro8Slq6p8amL0VRKQj9i2oFiqOE5YykX+eutXdZEmvo1ibMLx
	 WcrBIjTxazPLgU9kp1cVGX9eG8Qw9sCTXTE3Yw/VBlWFdNRPddjUT9H/4yxS6WB9Wt
	 ulAX/HxUU9p9s3kJ/6rvkUHityHqFAKQwZUhXFOkVUy12LhurfH1hrlv3F39PS/jS8
	 ScltuqrykR/YN9+6On85+9c23G/LMtCrtetfxa1XwAPssKrMpRbySlaYoGWtPkOCg9
	 be6rhb1opQBBS25I+qZbJ797AQ/aJcpqQMJ7H2U2C9d1UDOCafg+UyXUO9QYAu1ML6
	 MIaLiYP47bRqw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 9017960297;
	Mon, 18 Aug 2025 16:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755526835;
	bh=itWA7cirbTMj+7elUaBpgM3ATkiwrggXHPw/Wrh1vqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pes/+FJWUH2RJzrCafzeVvF94YA8xwrXaJWlX5eBBX8tbxciukq15WZyuN+saHRYj
	 8rs5HtIReZN0+SFV27ZRLW7qJ0mT57/6iblrAk8GKJquU91va+L6N3mnWB3BX01CRD
	 OJ6m/skvptyGF2FFny3elyWe34ueuUWduOBpBDw5ZbtijnhPpjRM0eq1gWhX0byOZu
	 aBhAWww66MaVU8oEJCJk3jfMPW/ooy5jPdCGFrXxQ81kFUSArlxVjuATSFTnnW69su
	 Dxaxyd6bYZvMaUIWGkiA2Is08S9LudVj0CEYisy8qZzsiI2Mda3AzqTA5Julf83X5B
	 7FfT8v9SSG16A==
Date: Mon, 18 Aug 2025 16:20:32 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>
Subject: Re: nft for bridge.
Message-ID: <aKM2sOMlivuUJHOJ@calendula>
References: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>

On Mon, Aug 18, 2025 at 05:35:49PM +0530, ratheesh kannoth wrote:
> hi,
> 
> inet offload is working fine for me.
> ++++++++++++++++++++++++
> /etc/nftables/inet.nft
> 
> table inet x {
> 
>      flowtable f {
>         hook ingress priority 0
>         devices = { eth0, sdp1-0 }
>         flags offload;
>      }
> 
>     chain forward {
>         type filter hook forward priority 0; policy accept;
>         ct state { established, related } flow add @f
>     }
> }
> ++++++++++++++++++
> But bridge nft fails. Could you help with correct configuration?  i
> have already enabled below config
> CONFIG_NF_TABLES_BRIDGE=y
> CONFIG_NF_CONNTRACK_BRIDGE=y
> 
> 
> /etc/nftables/ibridge-raw.nft
> --------------
> table bridge x {
> 
>      flowtable f {
>         hook ingress priority 0
>         devices = { br0  }
>         flags offload;
>      }
> 
>     chain forward {
>         type filter hook forward priority 0; policy accept;
>         ct state { established, related } flow add @f
>     }
> }
> ~# nft -f /etc/nftables/ipv4-raw.nft
> /etc/nftables/ipv4-raw.nft:7:16-16: Error: Could not process rule: No
> such file or directory
>      flowtable f {
>                ^
> /etc/nftables/ipv4-raw.nft:15:43-53: Error: Could not process rule: No
> such file or directory
>         ct state { established, related } flow add @f
>                                           ^^^^^^^^^^^

No flowtable support for the bridge family yet, sorry.
