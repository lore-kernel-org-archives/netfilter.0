From: Andrew Beverley <andy@andybev.com>
Subject: Re: facing problem with iptables nat rules and traffic flow scnerios
Date: Fri, 04 May 2012 18:09:23 +0100
Message-ID: <1336151363.1912.97.camel@andrew-desktop>
References: <CAE1WnGdo1O0AyS0Q=00m3vou0nQnE0FzSR3-NWi-YMr3zwn8dA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGdo1O0AyS0Q=00m3vou0nQnE0FzSR3-NWi-YMr3zwn8dA@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1336151367;
	bh=A64uX8ezn5bbLj4NhbBHsHhoTECHcRgntMRx5KDcn+I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=noo+uiia7IvyPP4MFVACGhRvrAD151ymIjrlurhkL06lydxBvtZjsAnq9zKNeD7BQ
	 P58CahfWD8L5N6s3QkPH8PvG5nHqhnWdZynbeMZGFT9r1Ew671WOOACMH4UH+hYnUX
	 vyqCqSe2RxjLVKYXFyHn/n5ewwi3/40rTQkecgzU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

[ Please use the netfilter not netfilter-devel list for this sort of
question ]

On Thu, 2012-05-03 at 14:25 +0530, rahul shrivastava wrote:
> I am using iptables for nat
> kernel version is 2.6.35+
> working on powerpc target
> 
> case 1) traffic is already flowing and we apply a rule, that rule will
> become effective only when we stop traffic and start again.
> 
> case 2) traffic is already flowing and we delete a rule, this rule
> will still be effective unless we stop and start traffic again.
> 
> observation: /proc/net/ip_conntrack file is updated only after stoping
> and starting traffic again.

Depending what you are doing, this shouldn't happen. How are you
applying the rules? Directly with iptables commands? If so, what are the
commands? For some rules, such as port redirection, I have found that
the conntrack cache needs to be cleared.

Andy


