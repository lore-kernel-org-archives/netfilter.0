From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset issues
Date: Wed, 25 May 2016 22:58:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1605252255340.18463@blackhole.kfki.hu>
References: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:references
	:message-id:in-reply-to:from:from:date:date:received:received
	:received; s=20151130; t=1464209801; x=1466024202; bh=24Zia6glFl
	HIpzaIuVyZ28DDAupm+CQs2JWBwGLaIWo=; b=sXzU49SkvGsNiEHX72r3t3Kq/Q
	mbUXWZaaJVtrzX6GS3gIsDCLS0/XhtgsIIeWMU2Gg/++ozrTG4kJF6is97PJdHeo
	RBs35/f0S1DAA1mzuDXw85dTQYojljFoiOhYOHaDjol0Dj1zxpjPsM188eTxYc2v
	q7kF2yGVhK/K5HvQs=
In-Reply-To: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Emius <art@emius.ru>
Cc: netfilter@vger.kernel.org

On Wed, 25 May 2016, Art Emius wrote:

> Recently I've encountered an issue with using ipset in my firewall.
> 
> I use Debian Linux 8.4, running in virtual machine inside ESXi 5.5.
> My host is 192.168.1.2, remote host is 192.168.1.1.
> I'm running ssh server on my host and want to limit access to it using
> one rule with two sets of different types like this:
> 
> iptables -t filter -A INPUT -m set --match-set NETS_IFACE src,src -m
> set --match-set SSH src,dst,dst -j ACCEPT
> iptables -p OUTPUT ACCEPT
> 
> ipset create SSH hash:ip,port,ip hashsize 8 maxelem 8 family inet
> ipset add SSH 192.168.1.1,tcp:22,192.168.1.2
> 
> ipset create NETS_IFACE hash:net,iface hashsize 128 maxelem 128 family inet
> ipset add NETS_IFACE 192.168.1.0/24,eth1

You should use "--match-set NETS_IFACE src,dst" in the rule above if you 
want to limit the access to the traffic from the 192.168.1.0/24 subnet 
received on interface eth1 only.

> It doesn't work this way. eth1 really exists and handle traffic.
> But If I use rule like this it works fine.
> iptables -t filter -A INPUT -i eth1 -m set --match-set SSH src,dst,dst -j ACCEPT

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
