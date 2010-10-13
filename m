From: Peter Trenkamp <s_6cg5kj@uni-bremen.de>
Subject: D-NAT and S-NAT in IPv6
Date: Wed, 13 Oct 2010 11:12:52 +0200
Message-ID: <20101013111252.603920lk59ex94ic@webmail.uni-bremen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=uni-bremen.de; s=dkim;
	t=1286961171; bh=GCLEcZrLR4tvqSpI2i4/EdkKKkWRyWio0qqK2KBcGfo=;
	h=Message-ID:Date:From:To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=3XAHeK+myt120QrS7wxoTNjHr7uV/iSlHEvIH
	vWeAfRcW6KgJzaqwEaREHSC/HmnQYAE+dlY8UyUTQyPQJhSf5Y7V34L/hcJpC8VL6Ft
	3LfUml3MBM/eCJSALLPn4RxvwWDBvkbko8660oFgAAz8n2dZF+jTOzjfZHY8jnC1BS4
	=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hello everybody,

I was searching in the Internet about how to change the destination
IPv6 address into another IPv6 address. Unfortunately I did not find
anything about this, except the information that ip6tables does not
support this kind of NAT.
So my question is: Is there a workaround for selecting a packet by
Source and/or Destination address and then change the IPv6
destination address into a new one?

Kind regards

Peter Trenkamp

