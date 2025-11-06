Received: from e3i377.smtp2go.com (e3i377.smtp2go.com [158.120.85.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D546AD531
	for <netfilter@vger.kernel.org>; Thu,  6 Nov 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434509; cv=none; b=RjxTfkrM+5JuL8iGmzayTJzQ1YZ63D9/lYCZgZIouS3o+RcLTV3YTk0GD0jDN1c0qKgR17nqIttxzm8LHgx21uSABVIkoRfbyAYTVgwrEwPQgrNMSpFbkQOveVKflZXsbr3H0fgj0wL5lerFSxQ3XoZmm+thQ0u68XTwKNltYo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434509; c=relaxed/simple;
	bh=6nAUGp5x+yT+9E8M1v6AiKDK7LSBp36pYVUWLMVCfME=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KwlPat8UVc1HnvhWgvn3e3I2G8Qi5VcMR8jE15AlP2pbGk2/ksSD1nHUV2tCL4MFUIQLmCRgPBBLHSzdRYC7TKQVpkk9S1MaINqkn2ZdxKT/OzEqBSdDy3cWYKFF3B+MOICbv8hCKpivLQiaMG2wY22bZhWeqK1qwIm7z4zuyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frumar.it; spf=pass smtp.mailfrom=em856510.frumar.it; dkim=pass (2048-bit key) header.d=frumar.it header.i=@frumar.it header.b=bM4OVdxL; arc=none smtp.client-ip=158.120.85.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frumar.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em856510.frumar.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frumar.it header.i=@frumar.it header.b="bM4OVdxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=frumar.it;
 i=@frumar.it; q=dns/txt; s=s856510; t=1762434503; h=from : subject :
 to : message-id : date;
 bh=pHR7ysrZ/oacVYN0FI4bIiOdTlOhQyre3jTakmGg7PQ=;
 b=bM4OVdxLeV9cwa9WIvdsC249IDR/ZTVgJdDtR0JNkjHsplhDWpcXroJ4T2A0GKB7F/ZKF
 ytZo3LNzGflmcMe4dKoJVfqvD2DC0bwfPur5dEo2PB39NxHl1w9kDq5DaJLHLsaJD0ynS0w
 3UNyUzK6KPJP07yUeKyzTKrFYKsagOI1fOzTfzPl8BgoKZs7f8WbQhJ8lY5J8yz64kX8d3Z
 FCngezcuYucWMc0unHaMpbWqZ1pPbd2wAaYO7/goOpHMN6MhuapG7EvQEWnwFdndWJM/Qjx
 35o0JgKbEWycpkhhhfuV2g+la0sjr8GtbQlO1NMb6wB1/hOZZNRc9mas/WBQ==
Received: from [10.104.244.142] (helo=frumar.it)
	by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <pierluigi.frullani@frumar.it>)
	id 1vGziw-4o5NDgrodlZ-korN
	for netfilter@vger.kernel.org;
	Thu, 06 Nov 2025 13:08:22 +0000
Received: (qmail 12476 invoked from network); 6 Nov 2025 12:53:07 -0000
Received: from host-79-10-10-166.business.telecomitalia.it (HELO topolinux.localnet) (pigi@79.10.10.166)
  by frumar.it with ESMTPA; 6 Nov 2025 12:53:07 -0000
From: PierluigiFrullani <pierluigi.frullani@frumar.it>
To: netfilter@vger.kernel.org, George Shuklin <george.shuklin@gmail.com>
Subject: Re: coexistence between nftables and iptables ?
Date: Thu, 06 Nov 2025 14:08:22 +0100
Message-ID: <30930903.VsfAaAtOVx@topolinux>
Organization: Frumar
In-Reply-To: <203843c7-371e-4e5d-9624-c3e00db722c0@gmail.com>
References: 
 <6842094.MDQidcC6GM@topolinux>
 <203843c7-371e-4e5d-9624-c3e00db722c0@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 856510m:856510aJvM5Q1:856510so_RceUdA_
X-smtpcorp-track: MPdavpXY00WP.F6YG0HODiC1x.qJr-mw2C2_J

On Thursday, 6 November 2025 13:13:52 CET George Shuklin wrote:

> There is DOCKER-USER chain for those things.
Not really:
Or at least not really for my need:

# iptables -L -v -n | grep ^Cha | grep DO
Chain DOCKER (3 references)
Chain DOCKER-ISOLATION-STAGE-1 (1 references)
Chain DOCKER-ISOLATION-STAGE-2 (3 references)
Chain DOCKER-USER (1 references)

~# iptables -t nat -L -v -n | grep ^Cha | grep DO
Chain DOCKER (2 references)


I do not need to play with DOCKER-USER chain. Rules created by daemon for me are fine.
I do need to modify all other rules ( INPUT-FORWARD-OUTPUT PRE and POSTROUTING ) for all other needs __except__ dockers, but I do this, usually by flushing all availables chains ( at least to be sure that at boot everything works ) 

In my firewall start script I have:
/usr/sbin/iptables -w  -F
/usr/sbin/iptables -w  -t nat -F
/usr/sbin/iptables -w  -t raw -F
/usr/sbin/iptables -w  -X

Obviously the -F and the -X will "kill" every  rule and chain, thus also DOCKERs one ( and  those that call the jump to DOCKERs )


> 
> Don't try to use 'iptables for docker, nftables for filtering, it will 
> cause a lot of bugs and issues.
That's my suspect :)

 
> See ready-made template which allow to add firewall rules into nftables 
> to filter ports for both local (non-docker) and docker-hosted applications.
> 
> https://github.com/lidofinance/ansible-collection-server/blob/master/roles/docker_iptables/templates/iptables.rules.j2
This link leads to an 404 page :(
 
> (If you use Ansible, you can grab ready-made collection from Galaxy 
> https://galaxy.ansible.com/ui/repo/published/lidofinance/server/docs/)
> 

Thanks 

Pigi


