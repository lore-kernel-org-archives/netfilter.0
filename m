Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C7139D1B
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716830267; cv=none; b=e6h026Bw0a8x92vKIFBOYV2DntTXiWe0AOFmJbzwhRGGDOlh42/UDo+6wBxMDZTJkTDPsSG619ntf0GcWtyaGVSd6gIaV637EDav8zau99Qr0NY0ojnVSdBenB1PeF3kOB38M79VGmYlx4lb+X2sZXwfjRoh+5aS3UFaIN1iz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716830267; c=relaxed/simple;
	bh=92XqNEP/w48uyizxoanTqAq0gQSw0DeIKJU8KjvoZWw=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Um8Pp9Y0LCoGH32DrbEytc3iGuF0+w30nTUic2d7HFO1ccDkczCY0+wOz2RKxw1DTCd/WGKtlJbDVQO+jjnDeP/pO7Mjbs3XmG26t5cIpUSE/2d7/0CURi/J9GQ3cNQQ9S37eqhfl3d0/375e+PpHvVYE00oUQjoO+pQxu3RZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=QwpORIG/; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="QwpORIG/"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4Vp2Qd6gkzzDqSL
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 17:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1716830266; bh=92XqNEP/w48uyizxoanTqAq0gQSw0DeIKJU8KjvoZWw=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=QwpORIG/BfRYmaFBGTrSqL53F++MVSSjNVK7r5NOh4qZfUGo3lwvewX59wOFTxr8a
	 e/qrfmmmyVvdrayMez/4cM8V/4sWbMGj7ljAfwPw/ME5thQZ9X/n0HqZeMN+ZfkD99
	 6JH70WpdXRZjqx03/BdjqV2Jvnk94dNdzLDk+mdY=
X-Riseup-User-ID: 06DDFA62A6AA7C1A7688D2CA85F814588606D19EEE4D8ADAB95EE8D9F4A86B00
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Vp2Qb3L3bzFvPk
	for <netfilter@vger.kernel.org>; Mon, 27 May 2024 17:17:41 +0000 (UTC)
Date: Mon, 27 May 2024 17:17:18 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nft not logging some layer 2 frames?
Message-ID: <20240527171718.7db995bf@localhost>
In-Reply-To: <70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
References: <20240524155729.4fd15210@localhost>
	<70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 May 2024 13:17:50 +0300 Teodor Milkov wrote:

> I just tried putting log before counter and still nothing showing in 
> logs. But does order really matter?

Perhaps not. I just thought it might be worth trying.
What happens if you remove the counter and use only log?

I tried this:

table netdev xxx {
        chain ingress {
                type filter hook ingress device "eth0" priority -600

                counter
                log prefix "TEST: "
                drop
        }
}

and I ran 'arp' on the other end of the eth0 link. I can see logging
works, i.e. without specifying any particular protocol whatsoever.
Counter works too.
