From: Jamie Pratt <jamie@nucdc.org>
Subject: Re: problems with alias
Date: Fri, 16 Jul 2004 09:05:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7D299.8010803@nucdc.org>
References: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
Reply-To: jamie@nucdc.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



Batstru wrote:

> Hi all!
> I changed my server running redhat9 (kernel 2.4.x) with a new one with
> fedora core 2 (kernel 2.6.x): each one has  2 ethernet interfaces, so I copy
> network configuration fron rh9 to fc2 
> 
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.254
> eth1:1 --> 82.186.92.91 / 255.255.255.254
> eth1:2 --> 82.186.92.92 / 255.255.255.254
> eth1:3 --> 82.186.92.93 / 255.255.255.254
> eth1:4 --> 82.186.92.93 / 255.255.255.254
> also, I copy and apply iptables configuration but it does not work well.
> now iptables doesn\'t apply rules to virtual interfaces, eth1...eth4.
> a line of my configiguration files is:
> -A INPUT -p tcp -m tcp -m state -d 82.186.92.91 --dport 20 --state NEW -j
> ACCEPT
> I tried different rules configuration but it still not work.
> 
> can you help me? 
>  --
>  Email.it, the professional e-mail, gratis per te: http://www.email.it/f
>  
>  Sponsor:
>  Lerboristeria.biz: per la tua bellezza e salute il miglior assortimento 
> di prodotti erboristici ed oggettistica online
> 
>  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2152&d=20040716
> 
> 

Have you tried to use the iproute2 suite for aliasing instead of 
ifconfig? I believe the ifconfig way is considered "deprecated". Then, 
specify your rules by interface and/or ip and it should work properly - 
maybe the old method only works in iptables using the interface name now?

example:

## old ip aliasing
##/sbin/ifconfig eth0:0 192.168.0.1
##/sbin/ifconfig eth0:1 192.168.0.2

## New IP aliasing using ip tool from iproute2 package:
/sbin/ip addr add 192.168.0.1/24 brd + dev eth0
/sbin/ip addr add 192.168.0.2/24 brd + dev eth0

regards,
jamie


