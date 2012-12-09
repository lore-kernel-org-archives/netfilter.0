From: Andrew Beverley <andy@andybev.com>
Subject: Re: help with --helper sane
Date: Sun, 09 Dec 2012 21:18:51 +0000
Message-ID: <1355087931.26190.110.camel@andrew-desktop>
References: <50C4F111.8090702@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50C4F111.8090702@mailinator.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1355087939;
	bh=ujlhl23apRWaOf0myundfTbbJuQF0Z37nWkaXgd8sWE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=iUcI1GDcStsIGPYgVQcAEYnb7qzSNuxmHxOw3HymIYa6GP/6PhhXFFX/xbfGIS8C4
	 tcIJFv+5s9zHQWhCKfFWkJaIQ/C+KVYeMkx/cWaFTUwvrHm4zpqybVa+KrLS+QTFZh
	 6wtZ0OiPIQKC7ujseFLRvicikKDL9uuE5/385j0k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter list <netfilter@vger.kernel.org>

On Sun, 2012-12-09 at 12:14 -0800, Mike Wright wrote:
> Hi all,
> 
> I'm trying to make a usb scanner network available using "saned".  The 
> machines involved are both running "saned -a".  It works well until I 
> turn on iptables on the machine with the scanner.
> 
> If I enable firewalling with port 6566 open the scanner initializes but 
> never proceeds beyond that point.
> 
> I tried these:
> 
> -A INPUT -p tcp -m tcp --dport 6566 -m conntrack --ctstate NEW -m helper 
> --helper "sane" -j ACCEPT
> -A INPUT -p udp -m udp --dport 6566 -m conntrack --ctstate NEW -m helper 
> --helper "sane" -j ACCEPT

That's only accepting the packet that initiates the connection. You'll
need to allow subsequent related packets as well. Something like:

-A INPUT -p tcp -m conntrack --ctstate ESTABLISHED -j ACCEPT

I don't know the "sane" protocol, so you might need to add RELATED as
well. You'll also need to make sure that you're allowing the packets to
return out as well (OUTPUT).

Also, I consider the dport *and* helper match a bit of an overkill. I
would just use the dport match, at least until it's working.


