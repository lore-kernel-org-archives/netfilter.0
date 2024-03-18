Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7573716D
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710780236; cv=none; b=ogOtFLc3N+1SB1Xi9+/LZ3QW3UJqP8ivyRauuKbNVYds33+mXdmnq71o5ObuXLoekYB0qqEzp+G+8pM3DGO20TLChZP2hksZndBjzQ6oDGMHDwTAWLX9KSKGtuARVK7iScc2tA8JeQxeyRMe0OMqU7mek5ymsx0uEVBUQcN3BdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710780236; c=relaxed/simple;
	bh=3dSMXzlYlKmuuWvf2YRUYmHSKyeEfcQPsZTG+ziZckM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HcDjYmXqWQEUTe3G5emg0y0eTPPAYyNEw+qAj0uga4BFZtdInob0QUntCamINmWu9o0JZMaIsquVd80F2H7pPTgQ0B7RY+VNfe59sfBnSE29vIxFq25zCjzJSqN+T8FkQgsynY0qmWmO/rlJLv/OdCsXx1tD7Vu/KQ0L/011Zig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=wHV4BPjp; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=TmPP/ccl; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="wHV4BPjp";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="TmPP/ccl"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 0F92B6081701
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 17:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710779806; bh=3dSMXzlYlKmuuWvf2YRUYmHSKyeEfcQPsZTG+ziZckM=;
	h=Date:To:From:Subject:From;
	b=wHV4BPjpCdi7DiwZLYvxSw1sUnpKzMuqdMWEya7otfvhLtxnNKWaPdMo7ly/KcDN7
	 aMk1BzSaDZ/Dw8f7FzR7K9eu53A6RS99+n9AYF8VBK6pY2TFsakFOecsHa3PXSAUCG
	 QmJJpDjHUFwQeuEd+WXoJ0lHoUR+ArVxkYCKLhrA=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id C645D60817F6
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 17:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1710779805; bh=3dSMXzlYlKmuuWvf2YRUYmHSKyeEfcQPsZTG+ziZckM=;
	h=Date:To:From:Subject:From;
	b=TmPP/ccl1iSyLHWW7K5Op2P8P2j4/CNIDwEkVHvLvqEptifaNe8GKD0fzx4eFK7jz
	 RBvksoA5HiB7jgdyVKvd5iujOrPGVFt3oZSCfTMKW5CVw+mj3Xehl/DTbk1E+2ltvl
	 Nil8vCBKMvn0oRdVGEqwYSbYV8ErvAWIKR6RDcJ4=
Message-ID: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
Date: Mon, 18 Mar 2024 17:36:45 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR
To: Netfilter list <netfilter@vger.kernel.org>
From: List Support <list@tootai.net>
Subject: IP not banned in interval set
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi,

nftables v1.0.6 (Lester Gooch #5) from Debian 12. I have a set which 
contains in a table mytable of type inet

set toban4-smtp {
     type ipv4_addr
     flags interval
     auto-merge
     elements = { 194.169.175.17-194.169.175.18 }
}

chain input {
     type filter hook input priority -100; policy accept;
     ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
}

But

nft delete element inet mytable toban4-smtp { 194.169.175.17 }
Error: element does not exist
delete element inet reaction toban4-smtp { 194.169.175.17 }

where

nft delete element inet mytable toban4-smtp { 
194.169.175.17-194.169.175.18 }

does the job !

Also, with elements = { 194.169.175.17-194.169.175.18 }, when one of 
those IP is coming back it is allowed to enter :(

What's wrong here ?

Thanks for your support
-- 
Daniel
