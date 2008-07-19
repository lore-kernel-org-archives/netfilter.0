From: Bernhard Bock <bernhard@bock.nu>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 10:18:57 +0200
Message-ID: <4881A371.3060803@bock.nu>
References: <48819901.6030604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48819901.6030604@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

Hi Michele,

Michele Petrazzo - Unipex srl wrote:
> Here the server have the two ports with 172.16.0.1 and two clients,
> connected into the two others has 172.16.0.3 and 172.16.0.10
> 
> It's there a solution for achieve this?

My proposal has nothing to do with netfilter, but you may have a look 
into "Proxy ARP".

Basically you give each interface the same IP address, put in host 
routes based on interfaces (route add -host 172.16.0.3 dev ethx) and 
enable proxy_arp in /proc/sys/net/ipv4/conf/ethx/proxy_arp. This should 
do the trick.

best regards
Bernhard
