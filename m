Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB419182B2
	for <netfilter@vger.kernel.org>; Mon, 24 Jun 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253124; cv=none; b=bhv/R/TIH9zeUnA5l/Gfa5V3HBz7OdOQIkv13p/7JlAt8wOvQ1g8vKLdEUfwxf8CUoStnydm9SdY6dAMONSxrxRLTirx/VRyC6kfUkjkS5zYRDuELCg838MgkMPRYhRYuI3R5bLO5i25QXyQ2P3HzA8O+od+BcliH3Uzp2S4jgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253124; c=relaxed/simple;
	bh=FSRoZvpkxiheQuPV20XSRthD+vLIUnzy4dB5G+Hy/6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsUVbC+9vgtqnYFx4Ay+XAPigCHuWfIlXEdxNn/oalvO40M3TizE9+riGyKIO3HOUDgq75+Gb1E7ff+vEOwEXvmgtKbPsAtXeNPoyDzD8HeuKfJ7q9WynoqFV0oXDlNBzXW1pUvncD4k+9KlUdFci+meMWMh6QupbVEWFdp/yxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=50218 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sLoGx-005BhI-OJ; Mon, 24 Jun 2024 20:18:38 +0200
Date: Mon, 24 Jun 2024 20:18:35 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: netfilter@vger.kernel.org
Subject: Re: conntrackd: Trouble using multiple Accept addresses in kernel
 filter
Message-ID: <Znm4e0HWXFPomGqp@calendula>
References: <a0d8900a-4098-449a-8db9-adc49d8c63a6@smile.fr>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0d8900a-4098-449a-8db9-adc49d8c63a6@smile.fr>
X-Spam-Score: -1.9 (-)

Hi,

There is a fix for this in git.netfilter.org/libnetfilter_conntrack at
git HEAD.

Could you check that this fixes the issue for you?

Thanks

On Mon, Jun 24, 2024 at 06:04:51PM +0200, Yoann Congal wrote:
> Hello,
> 
> We are trying synchronise conntrack tables across multiple machines using conntrackd.
> 
> We only want to synchronise conntrack for a limited set of IP addresses (for example: 10.132.159.60 and 10.132.159.62).
> 
> I'm working on Debian stable packages : 
> * conntrackd 1.4.7-1
> * libnetfilter-conntrack3 1.0.9-6
> 
> Here is what I wrote in conntrackd.conf :
>   Filter From Kernelspace {
>     ...
>     Address Accept {
>       IPv4_address 10.132.159.60
>       IPv4_address 10.132.159.62
>     }
>     ...
>   }
> 
> Except that does not work : After debugging, it appear that in this configuration the kernel does not send the conntrack element to conntrackd. If I understood correctly, this filter is read by conntrackd/libnetfilter-conntrack as "Accept CT that matches  10.132.159.60 AND 10.132.159.62" which won't happen.
> 
> Switching this to Userspace filtering does work : CT are sent from the kernel to conntrackd and then synchronized across the other instances. This difference in user/kernel filtering sounds like a bug on one side.
> Userspace filtering is a bit heavy for the system, and we would really like to stay on kernel filtering.
> 
> I've also tried to use one "Address Accept{}" bloc for each IPv4_address but that does not work either.
> 
> Some random elements I've gathered while debugging this:
> * All the example I could find only used "Address Ignore {}" blocks so I guess the "Address Accept" option is not heavily used?
> * The code adding the IP to the filter is here : https://salsa.debian.org/pkg-netfilter-team/pkg-conntrack-tools/-/blob/master/src/read_config_yy.c#L3258
>   nfct_filter_add_attr(STATE(filter), NFCT_FILTER_SRC_IPV4, &filter_ipv4);
>   Interestingly, the error messages some lines higher only mention the "ignore pool"
> 
> My questions:
> * Has anyone pointers on how to setup this usecase (kernel filtering + accept on multiple IPs) ?
> * Is this a bug? (In that case, I'd push this to the bugzilla)
> 
> Thanks in advance,
> 
> Best regards,
> -- 
> Yoann Congal
> Smile ECS - Tech Expert
> 
