Received: from smtp2-kfki.kfki.hu (smtp2-kfki.kfki.hu [148.6.0.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D767174F
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595975; cv=none; b=BIA04RAWKSdeWuP517t7az2SGk0OLjLWAr817gA0NIMt8VFQYIV20OhSxOmKcYVau2+bhxzmy0ByUMA1XcYEWJZFN69TI93mj6xiQKLBilZyi+dz7P/7KqBMuetFwIYaDHkpksBYIBsJ5bNmjy/7HBmiYPNk/9LBzyp/E/ckNmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595975; c=relaxed/simple;
	bh=A1vvU3sWGfOK6daESQDVdx3+O19sSLCLdAOq2T85gWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=p5vIldK+UleuD2li5BOlPHHlqtQRjxRY9VhWCaDbnjn55Ic9aa4qaoIHVCGxTCNlhV0x8plRV10N9Gd3ILtLJVQjLUvkmJsFSut1bkFtzqfCJTiVS1bgPVxJUzIUVHK7VYjXcTrDEjKJjFH3HW+u7dPKtQeQxKYmt0Nd3HjDoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blackhole.kfki.hu; spf=pass smtp.mailfrom=blackhole.kfki.hu; dkim=pass (1024-bit key) header.d=blackhole.kfki.hu header.i=@blackhole.kfki.hu header.b=fR8NYyVl; arc=none smtp.client-ip=148.6.0.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blackhole.kfki.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blackhole.kfki.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=blackhole.kfki.hu header.i=@blackhole.kfki.hu header.b="fR8NYyVl"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.kfki.hu (Postfix) with ESMTP id C93B9CC02D9;
	Wed, 10 Jul 2024 09:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:references:message-id
	:in-reply-to:from:from:date:date:received:received:received
	:received; s=20151130; t=1720595492; x=1722409893; bh=Y5TIye4f6O
	/9lBxeKruzOu3ztp5GHTORGa1T88s//Bo=; b=fR8NYyVlMkqP5xdvrU8QfIcjXc
	WYiNaXOLYUZq0u0b9ep3Dqfr+5x/2mqVtmgOFwjvZwFd5a0Tgv3qTiFIJENSkfA0
	PPjM8oXpEOAmihbuPkuSXMz8XRxTttBkPdrZEOyfQr+2F+3zvsBZzXcnbf2DU4Qs
	hkz0hC7VNjmjdsk6Q=
X-Virus-Scanned: Debian amavisd-new at smtp2.kfki.hu
Received: from smtp2.kfki.hu ([127.0.0.1])
	by localhost (smtp2.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP; Wed, 10 Jul 2024 09:11:32 +0200 (CEST)
Received: from blackhole.kfki.hu (blackhole.szhk.kfki.hu [148.6.240.2])
	by smtp2.kfki.hu (Postfix) with ESMTP id 7BDD3CC02CE;
	Wed, 10 Jul 2024 09:11:32 +0200 (CEST)
Received: by blackhole.kfki.hu (Postfix, from userid 1000)
	id 7608B34316B; Wed, 10 Jul 2024 09:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by blackhole.kfki.hu (Postfix) with ESMTP id 746B734316A;
	Wed, 10 Jul 2024 09:11:32 +0200 (CEST)
Date: Wed, 10 Jul 2024 09:11:32 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
To: Kevin Johnson <kevinamiel100@gmail.com>
cc: netfilter@vger.kernel.org
Subject: Re: Understanding and debugging conntrack source code
In-Reply-To: <CAFiPqxWHmNKNc3o_HFcZ+OVJZhFSdka8BJeyuLvhf19y9MnUkA@mail.gmail.com>
Message-ID: <b4262091-dcc2-67f1-f8db-e709ebd613a2@blackhole.kfki.hu>
References: <CAFiPqxWHmNKNc3o_HFcZ+OVJZhFSdka8BJeyuLvhf19y9MnUkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi,

On Wed, 10 Jul 2024, Kevin Johnson wrote:

> I've been trying to understand the connection tracking (conntrack) 
> source code (specifically nf_conntrack_proto_tcp.c and 
> nf_conntrack_proto_udp.c) by sending packets between virtual machines 
> and observing the connection states, looking to possibly find 
> vulnerabilities or perhaps weaknesses.
>
> Are there additional documentation somewhere that aid with the 
> understanding of the conntrack source code (specifically 
> nf_conntrack_proto_tcp.c and nf_conntrack_proto_udp.c), since it's a bit 
> complex and difficult to understand?

nf_conntrack_proto_udp.c is simple because we have to handle a simple 
stream of packets and just update the timer in order not to timeout the 
conntrack entry too early.

nf_conntrack_proto_tcp.c is more complex. The code refers to RFC793 and 
RFC1122 at a couple of places, of course. The tcp_in_window() function is 
practically the implementation of Guido van Rooij's article (the first 
link still works, you can download the pdf from there) with the addition 
of SACK support (RFC2018). The hardest part I think is the big switch 
statement in nf_conntrack_tcp_packet() which handles the reopened 
connections, possible out of sync cases, challenge ACKs (RFC5961), 
simultaneous opens, etc.

> Is there a way a debugger can be setup where when pings are sent from
> one machine to another, I can see which conntrack functions are being
> executed or which lines are being processed?

You can easily sprinkle the code with printk-s ;-). That of course won't 
work in production, but in a test environment with constructed/replayed 
traffic it is fine.

Best regards,
Jozsef
-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
           H-1525 Budapest 114, POB. 49, Hungary
