From: Andrew Beverley <andy@andybev.com>
Subject: Re: can't set default route for virtual interface
Date: Tue, 27 Dec 2011 23:43:01 +0000
Message-ID: <1325029381.1672.38.camel@steve-pc>
References: <op.v654qjz3x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325029389;
	bh=V7SsEVlFL/kx5ldEGNZ5YnsaQvevBFZ9nQ5ICr+6qS8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=ZldnBZEudJSUfSH6Qbcq8uzRbhcj2cGXt6/WjvVf03tm6ZBr925Baj4v8x33Lrp0b
	 TFNFlnBk4uF/GwyMLfLu9+u+a3j0wVVuDQOisQcH9v5kaageM4T3899pUa+FM9unG0
	 ZR7bTaYZ1UC55Vi802FXahwrkrCdvw2WLvmugpIE=
In-Reply-To: <op.v654qjz3x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 2011-12-27 at 17:32 -0600, Lloyd Standish wrote:
> + ip route add default via 192.168.2.1 table T1
> RTNETLINK answers: No such process

This normally means that the kernel doesn't think that 192.168.2.1 is a
valid address. Is that IP address definitely set up by that point in the
script?

Have you tried *not* using ifconfig to set up your interfaces? You
should only be using iproute2.

> Similarly, I was unable to use "ip" to set a "nexthop via" default route for virtual interfaces.
> 

Same probably applies to this.

Andy


