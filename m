From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Sat, 04 Feb 2012 19:58:32 +0000
Message-ID: <1328385512.1632.7.camel@andy-laptop>
References: <30967745.2025.1327448042608.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <30967745.2025.1327448042608.JavaMail.root@ixer.mx>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328387970;
	bh=rTZPaXI7y4/jeFdDUa+QPGCmRer9Iwd5g84jrU0gowk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=LGc7+5jD8u0cPlJqmg26rFhuUDJbaawdG496m8Qc7HDJdWbqtkxciExD8T2UAy++G
	 4k3dELMb8Ih4hWsgitkKEBNFHVpAfdFFsVkkGGeynSr9ku61xCJwBME4DWg4Q2tyKg
	 7Xph6amHxLYjJHwo98jd9JPNcet9DbFl41xNtsrM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ehuerta@ixer.mx
Cc: netfilter@vger.kernel.org

On Tue, 2012-01-24 at 17:34 -0600, Enrique Huerta de la Fuente wrote:
> Hello
> 
> I have OpenVPN (lan to lan)
> 
> On site 1 (4 links)
> - eth0 (LAN)
> - eth1 (internet link)
> - eth3 (enalce internet)
> - ppp0 (internet link)
> - Deafult gateway eth1
> 
> On site 2 (3 links)
> - eth0 (LAN)
> - eth1 (internet link)
> - ppp0 (internet link)
> - Deafult gateway ppp0
> 
> The eth3 interface (site 1) and the eth1 interface (site 2) are the same supplier, the same mask.
> 
> The VPN works with eth3 (site 1) <---> eth1 (site 2) and it works great. We must not over because they are the same provider and does not require the gateway.
> 
> But if it fails any of the VPN link (eth3 o eth1), we need to change links of VPN to ppp0 (site 1) <-----> ppp0 (site 2).
> 
> Here's the problem!
> 
> At site 1, the UPD packets should go out by ppp0 (the default gateway is eth1). To do this:
> 
> # Iptables-t nat-I POSTROUTING-p udp-m udp - dport 1195-o ppp0-j MASQUERADE
> # Iptables-t mangle-I OUTPUT-p udp-m udp - dport 1195-j MARK - set-mark 1

Are you sure you've got this rule correct? Have you tried doing a LOG
target to check that it is matching the packets that you would expect?

> 
> So are the paths:
> 
> # Ip rule ls
> 0: from all lookup 255
> 32757: from all fwmark 0x1 lookup infinitum
> 32758: from 189.143.36.36 lookup infinitum
> 32759: from 38.124.170.15 lookup bbs
> 32766: from all lookup main
> 
> # Ip route ls table infinitum
> default via 189.143.36.36 dev ppp0
> 
> 
> The problem is that no packets arrive from site 1 to the site 2. The UDP packets arrive to site 1 from site 2
> 
> I tested with port 22 (ssh) and it works.
> 
> # Iptables-t nat-I POSTROUTING-m tcp-p tcp - dport 22-o ppp0-j MASQUERADE
> # Iptables-t mangle-I OUTPUT-m tcp-p tcp - dport 22-j MARK - set-mark 1
> 
> 
> Any idea why that no UDP packets  arrive to site 2?
> 
> regards
> 
> E.Huerta
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


