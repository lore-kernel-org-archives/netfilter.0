Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7D54FA4
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710780979; cv=none; b=PeJpWF9FBA/RMDPew0QU1ptoIxmlSK+UiiS3d1FYvPPZtBvxi8zss4T8BqLk0eb683/Mt88ub1aeCYadEzbybzAMvs5gCDHgGPFABcfMouC5020owXD9zZGX9YJrX0KC8zTM7xRdqqyOyND5LW8+SXq/hom5zjatjKqeD/CQvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710780979; c=relaxed/simple;
	bh=zcecCSIX9HBjRUtT4D2DXYQeDuyCpiYMeKHQrAFdp4w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=iHLoz98UtQ9dmibXjZYCWIjLD81rrfVKXkxBAsnNNQHzAxZ44uSpkdw0AR6FMMMkPHTuGUq4+VAQNAZ69IF6Mo59RCLa+6Ipiz9teatMPJjGgiNaDeyyZEV9JHB2UvjD/wopH3WH9VMOexzUiaiujG0jz6Sfwe/WGfLf+KuqRFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=AgsXwzMs; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=AgsXwzMs; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="AgsXwzMs";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="AgsXwzMs"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 7A9506081701
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 17:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710780973; bh=zcecCSIX9HBjRUtT4D2DXYQeDuyCpiYMeKHQrAFdp4w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AgsXwzMshUBsFW5cI+Y/8V6995blLl4GLsXYJ+kSjU1Bu7rI0cYaqYybhpUliGrM0
	 le11CiJ406PS2gwk+ocEpqaW7VpWqnXLvynhnyIjb2OY/1A2B3puPP9Z+IZTQToYkz
	 V1GV+h6B6ZZw2STZTEGe7XKWuS5+OZlxDlBXzT5Q=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 463BC60817F6
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 17:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710780973; bh=zcecCSIX9HBjRUtT4D2DXYQeDuyCpiYMeKHQrAFdp4w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=AgsXwzMshUBsFW5cI+Y/8V6995blLl4GLsXYJ+kSjU1Bu7rI0cYaqYybhpUliGrM0
	 le11CiJ406PS2gwk+ocEpqaW7VpWqnXLvynhnyIjb2OY/1A2B3puPP9Z+IZTQToYkz
	 V1GV+h6B6ZZw2STZTEGe7XKWuS5+OZlxDlBXzT5Q=
Message-ID: <5e1e1a46-215e-42e6-8ce0-29d3b23bfbf7@tootai.net>
Date: Mon, 18 Mar 2024 17:56:12 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IP not banned in interval set
Content-Language: fr-FR
From: List Support <list@tootai.net>
To: Netfilter list <netfilter@vger.kernel.org>
References: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
In-Reply-To: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Forgot to say that removing auto-merge does the rule apply and working 
as it should

Le 18/03/2024 à 17:36, List Support a écrit :
> Hi,
>
> nftables v1.0.6 (Lester Gooch #5) from Debian 12. I have a set which 
> contains in a table mytable of type inet
>
> set toban4-smtp {
>     type ipv4_addr
>     flags interval
>     auto-merge
>     elements = { 194.169.175.17-194.169.175.18 }
> }
>
> chain input {
>     type filter hook input priority -100; policy accept;
>     ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
> }
>
> But
>
> nft delete element inet mytable toban4-smtp { 194.169.175.17 }
> Error: element does not exist
> delete element inet reaction toban4-smtp { 194.169.175.17 }
>
> where
>
> nft delete element inet mytable toban4-smtp { 
> 194.169.175.17-194.169.175.18 }
>
> does the job !
>
> Also, with elements = { 194.169.175.17-194.169.175.18 }, when one of 
> those IP is coming back it is allowed to enter :(
>
> What's wrong here ?
>
> Thanks for your support

-- 
Daniel
