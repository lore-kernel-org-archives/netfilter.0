From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Mon, 11 Apr 2011 18:52:55 +0100
Message-ID: <1302544375.1551.11.camel@andybev>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302544423; bh=Z2jsTon/A5pn6+LBjdWMHBmgQRhCU4GGVIhXH
	Vqo4Qs=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=qLeauoiM
	ft3mf8LizgdxOBg7UytotluACOuKwcEkRPzPMjHKXM5QM4hLscrQCe6Apv7mh6D6RB0
	CQ1dV8CLf0nFU3QH49p0rnraX/JT2FXIGn3JTNf2mVQdMS8oPZbxG15S9qRllvZVdYC
	c0TJ5kezxHUBcxOlOl4l6/vrpy3JQ=
In-Reply-To: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Rogers <Tony.Rogers@erudine.com>
Cc: netfilter@vger.kernel.org

On Mon, 2011-04-11 at 15:04 +0100, Tony Rogers wrote:
> I have a question for the iptables experts out there.
> 
> I previously asked this question on this forum here.
> 
> But no satisfactory answer was given.
> 
> I have an iptables firewall, where *eth0* is the *internal interface*,
> and _eth1 is the external interface_. eth1 is connected directly to the
> internet, and this box is also a NAT router.
> 
> I am seeing traffic sourced from external IP addresses on eth0 (internal
> interface) - how can this be? (see logs below)

Can you post the iptables rules that you are using, in particular the
NAT part? What IP address range are you using on the internal network?

Andy


