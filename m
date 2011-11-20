From: Andrew Beverley <andy@andybev.com>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 20:34:06 +0000
Message-ID: <1321821246.2382.1044.camel@andybev-desktop>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
	 <1321798603.2382.987.camel@andybev-desktop>
	 <op.v482atdzx1lyi3@debiandesk2.net>  <op.v4823hgfx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321821246;
	bh=Yg0xPygFvR16iJLr2wJE2Uqi8rMRVWQvsdTNfZmY/J4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=rl3fn9BpOBuU3nJbrPU6zuegAfLOs3VqaEOVPQSV4b8/wXPI1HCPTaH2v38f2qd0A
	 qWXeOfJzlkeNPq9CeuzQKzGYKe5j5H08WwXQNQ6mzZRXkNSzi0pueiEw5T4dwKvYej
	 SHE0a0bOB6IYWxQ4zC1Nzd1ZOd3uZN70XqZ6bdOs=
In-Reply-To: <op.v4823hgfx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sun, 2011-11-20 at 09:10 -0600, Lloyd Standish wrote:
> Now that the default routes are set in tables T1 and T0, the above
>  rules to "override" the load-balancing appear to work perfectly.  The
>  router will ONLY send packets to T1 (eth1) for those subnets,

Ah, got you. So you're splitting the network by subnets and routing over
the link depending on the subnet. Therefore packets from one client PC
will always go over the same link?

Andy


