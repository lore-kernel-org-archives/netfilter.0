From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 15:46:09 +0200
Message-ID: <4881F021.3080101@unipex.it>
References: <48819901.6030604@unipex.it> <4881A371.3060803@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4881A371.3060803@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Bernhard Bock <bernhard@bock.nu>

Bernhard Bock wrote:
> Hi Michele,
> 

Hi!

> My proposal has nothing to do with netfilter, but you may have a look
>  into "Proxy ARP".
> 

I have already tried the proxy_arp trickle, but doesn't help.

> Basically you give each interface the same IP address, put in host 
> routes based on interfaces (route add -host 172.16.0.3 dev ethx) and
>  enable proxy_arp in /proc/sys/net/ipv4/conf/ethx/proxy_arp. This
> should do the trick.

The problem it's that I don't know who (which ip) wants to talk on which
port...
Starting from this problem I thought to mark the packets for say "you
(packet) with that mark, go out through that port" with iptables, mark 
and ip rules


Thanks,
Michele
