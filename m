Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B2199E92
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720637034; cv=none; b=n+dGRPy/isVmAR4Dn2qPzRsz9Zuq4WN5cCgaawCRi8q65gSTB8sMUmV7v9La29KuhbzlN6bqylRd94tkum3bY+A68q4IwDyX4Mp3LjxVAzOu21RKo1aTcCpccYj1vE5EWbKWwxS0AedWruA0XwW1fG4PjjAgwxU5kKz8k4rlaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720637034; c=relaxed/simple;
	bh=NJd0ZokMUj2WFHFf69/jfaBv51ygSJrOpzXvO8CfEpE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=knj0sxgyfAnuidEAABSTONWYquGp0jL9KT/Dfk0QBsHLrMvJNvFx6KZE5ftA/1is4c7Q6p4ms5rorb6tbuognCpxGn5J0+caubjj4VJK09SwCPNyMgEBYf92w6M8nFH2o9BAoHu+MbFPFtCYANu/7X1Wde44vyMZd7AxqRFE1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=o884LBhk; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="o884LBhk"
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WK63Y5kXtzDqch
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1720636505; bh=NJd0ZokMUj2WFHFf69/jfaBv51ygSJrOpzXvO8CfEpE=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=o884LBhk7jn3Q5x0gYl+GkOzaZJ1KFHJyv5E29MIkzzr62i9LBDnO+Q+fTi+LnrNV
	 tY6c3TZlNSExV9o4p2KETMxKbQVh2nh+gZtvh9Ws1uCpNFhuvbKuTnkjm7BDWtpklI
	 x+8jiarac1U6Tlyb9HJEfnipIElahPghfRqPzau8=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WK63R5JKnz9wGK
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 18:34:59 +0000 (UTC)
X-Riseup-User-ID: 542D95EE9C5E02B53924F64F4C983D16FCE234CC3AF132DE111E724DB6ADC91D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WK63Q4yP2zFs2c
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 18:34:58 +0000 (UTC)
Date: Wed, 10 Jul 2024 18:34:51 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: nftables rule optimization - evaluating efficiency
Message-ID: <20240710183451.0f193976@localhost>
In-Reply-To: <20240702190318.618a3933@localhost>
References: <20240702190318.618a3933@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Jul 2024 19:03:18 -0000 William N. wrote:

> [...]
> Also, it is not clear what is the actual "load" of different
> instructions in terms of CPU cycles and memory, i.e. one instruction
> may look as "one" but may actually cost more than another 2, right?
> 
> What is the proper way to evaluate and optimize rule efficiency?

Are those difficult or somehow inappropriate questions?
Or is there a better place to ask?
