From: Andrew Beverley <andy@andybev.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 07:16:54 +0100
Message-ID: <1303885014.18916.10.camel@andybev-desktop>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1303885014; bh=EcD/KxdUhBenBu4L9N6H5kxd0nX3csF8bHg+/
	43M1fA=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=fCfmCE05
	bS0dPoBVbxwBx8wI8EaaCFQeHskBGRBRTXSdG3vWRAy7D43Jx9xlV9hDKXUaHtbri41
	nWB2MWRnoA/NsFU8ZSZU8ZZGySsoAEsZD11JhdcTZTxCZiqIQBP96twrqgHsBMwMxVo
	Jy3QjMDzfYIJ/BuFI2LWlFyG4CIss=
In-Reply-To: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Hendrie <mike@hendrienet.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-04-26 at 22:07 -0500, Mike Hendrie wrote:
> All,
> I have a PROXY server with 2 Nics.  One is public facing NIC, the
> other is private facing Nic.

I assume that you mean a web proxy and that all your clients already use
the server as their default gateway?

> What would be the best settings to force all private IPs, on the LAN,
> to pass through the Proxy server?

Depending on the answer to the above, something like this:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 \
	-j REDIRECT --to-port 3128

Your proxy server will need to support transparent proxying.

Andy


