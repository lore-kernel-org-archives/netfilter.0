From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Fri, 10 Feb 2012 15:57:16 +0000
Message-ID: <1328889436.18690.255.camel@andrew-desktop>
References: <20909671.2928.1328853919518.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20909671.2928.1328853919518.JavaMail.root@ixer.mx>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328889439;
	bh=l4Z8yhgAdUCAKVvO5VB5TMGvEmlASlOnzeu10RIOwAM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=u75TMGx7524fIIVHVGQ1jaWWMKji6YaknqAEsbt1XSIiZG/Bnu1XJwHVuP6qpR12t
	 pMO5zxYUUfI+9gdNpGJKk7UUkY0tS/n9kjdU0YwklNHVh2/aZecJVgJaz5J8otEfqE
	 dUaJnnODoEc1Dmf+N1kcx2+ha4rNX43uDMNYogCA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ehuerta@ixer.mx
Cc: netfilter@vger.kernel.org

On Fri, 2012-02-10 at 00:05 -0600, Enrique Huerta de la Fuente wrote:
> I have four interfaces and the default gateway is eth1
> 
> - eth0 (LAN)
> - eth1 (internet link)
> - eth3 (internet link)
> - ppp0 (internet link)
> 
> I mark (mangle) package udp (1195) for out by interface ppp0.
> "iptables -t mangle -I OUTPUT -p udp -m udp --dport 1195 -j MARK --set-mark 1
> 
> and when i try MASQUERADE the package udp (1195) with "iptables -t nat
> -I POSTROUTING -p udp -m udp --dport 1195 -o ppp0 -j MASQUERADE", does
> not work!!

I'm still not sure exactly what you're trying to achieve. Presumably you
want different traffic going out on different interfaces, source-natted
to that interface IP address.

If so, why not route your traffic as you are already doing (I assume
that is working) and then just MASQUERADE each interface:

iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

Andy


