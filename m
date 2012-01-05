From: Andrew Beverley <andy@andybev.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 17:14:25 +0000
Message-ID: <1325783665.2270.348.camel@andybev-desktop>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325753945.2910.11.camel@ns014530.dcyb.net>
	 <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
	 <1325782799.2270.339.camel@andybev-desktop>
	 <1325783325.2910.58.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325783667;
	bh=hIUL3Zi0Mn8ET5na/fKRDNT7vfyoDqPyrAm5VgR4jRM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=ZxNcN90Nr9vnjv3DFXxGJie0OY+Duf/A9PWK7JEU9CwbMdI1V+mkRtI0jibxG3Kc7
	 UveGyxJJXXbu+1UoNXkCIomjtdskgdjjW/eWt6W/dAzJeDgiarvh9qyaS2a6UvuOnx
	 Oj9VKT03VPkCOYqXSGJWubQfWbTYrlCABkWJXWI0=
In-Reply-To: <1325783325.2910.58.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, 2012-01-05 at 18:08 +0100, Rob Sterenborg (lists) wrote:
> Except if the OP wants to NAT, say, a /24 to each of his public IP's;
> then it's not going to work with NETMAP. And that is what I understood
> when I re-read his first post. NETMAP will only do a 1:1 NAT (each
> private IP to a corresponding public IP) for networks.

Ah, got you. As per my other (later) post, I'm not entirely sure I
understand the exact network configuration here.

I was assuming that the OP could send on the internal network from a
suitable internal IP address (per customer) and then map that 1:1 to an
external address.

Andy


