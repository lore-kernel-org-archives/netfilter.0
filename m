Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="N5mysXQC"
X-Greylist: delayed 589 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 05:53:35 PST
Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [IPv6:2a01:4f9:3b:2a5f:86e2:89a:e1f7:b837])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674C5A6
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1701438223;
	bh=SoraJbM9h7ZQ8fQeDcgiHit2KAAgbqV8OHpwXlitRV4=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To;
	b=N5mysXQCYX/HAs72Xbm+XNLppsAPjadBJCDwe/I8JSVCyqPF19zraFOLzMsQBexXy
	 5AWXsGeLq2wNO0eL3tVAQFWtzIdBAV0foyRHcfCdNs39bQu/4z5JTaHUhhkiM06tO2
	 G6VJX3bpMjx7Rxp0ke5Lo4ivIfGkfPuF2e102YPs=
Message-ID: <7a610cb2-391f-4f34-99c1-6c1f38243dda@at.encryp.ch>
Date: Fri, 1 Dec 2023 13:43:37 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Unit dependency of network-pre.target in nftables.service
To: Reindl Harald <h.reindl@thelounge.net>
References: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <84d15779-675a-4c2d-a287-49dd39a9313f@thelounge.net>
From: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org
In-Reply-To: <84d15779-675a-4c2d-a287-49dd39a9313f@thelounge.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/23 13:15, Reindl Harald wrote:
> 
> i would be interested to hear a use-case where you want fire up your network completly unprotected and after the damage ist done assign rules
> 

For example netdev table
