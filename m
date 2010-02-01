From: <koen.news@koca.be>
Subject: Re: multiple external IP's - virtual NIC - DNAT problems
Date: Mon, 01 Feb 2010 09:43:11 +0100
Message-ID: <51f1a6a7bd4bbe42e8619e29b7f3aec6@mail.priorweb.be>
References: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>    <4B62F4B7.80701@mailinator.com> <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be> <alpine.DEB.2.00.1001301414410.16952@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1001301414410.16952@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> Not pre-up, put them in up / post-up

> 

> You can also use eth0:1 eth0:2 interface definitions in debian 

> /etc/network/interfaces and use "-i eth0 -d $ip" in your firewall 

> config.

> 

> The eth0:X interfaces are not really network interfaces, they are just 

> secondary ip addresses on the base interface with a different label 

> attached to them for ifconfig backward compatibility.

> 

> Example:

> 	ifconfig eth2:2 192.168.19.123 up

> 	ip addr show dev eth2

> 	-> inet 192.168.19.123/24 brd 192.168.19.255 scope global secondary

eth2:2

> 

> 	ip addr add 192.168.19.124/24 dev eth2

> 	ip addr show dev eth2

> 	-> inet 192.168.19.123/24 brd 192.168.19.255 scope global secondary

eth2:2

> 	-> inet 192.168.19.124/24 scope global secondary eth2

> 

> 

> c'ya

> sven



This is exactly what I needed. Everything works now as expected. 



Sidenote: I first created an extra address with:

ip addr add 192.168.19.124/24 dev eth2



And checked that is was there. THen I put everything in the post-up

command including the one I already did.

invoke-rc.d networking restart didn't activate the other addressess. 

I remove the first one:

ip addr del 192.168.19.124/24 dev eth2



then invoke-rc.d networking restart worked.



Many thanks.

Koen
