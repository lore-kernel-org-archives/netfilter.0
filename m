From: Phil Oester <kernel@linuxace.com>
Subject: Re: Bug in owner module
Date: Wed, 18 Dec 2013 13:15:02 -0800
Message-ID: <20131218211501.GA21881@home>
References: <52ADB534.7020700@zensecurity.su>
 <20131215163832.GA4337@home>
 <52ADE190.8010405@zensecurity.su>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52ADE190.8010405@zensecurity.su>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ZenSecurity <mailto@zensecurity.su>
Cc: netfilter@vger.kernel.org

On Sun, Dec 15, 2013 at 08:06:24PM +0300, ZenSecurity wrote:
> Kernel version: Linux lab 3.2.0-4-amd64 #1 SMP Debian 3.2.51-1 x86_64
> GNU/Linux
> 
> # iptables -t nat -L
> DNAT       tcp  --  domain.com   anywhere             owner GID match
> usergroup to: X.X.X.X:80
> 
> Rule:
> iptables -t nat -A OUTPUT -o eth0 -p tcp -s X.X.X.X -m owner --gid-owner
> usergroup -j DNAT --to-destination X.X.X.X:80;
> 
> Doesn't match (usergroup exist).

Works fine here, on kernel.org kernel.

[root@f20_main ~]# uname -r
3.13.0-rc1+
[root@f20_main ~]# iptables -t nat -A OUTPUT -m owner --gid-owner 1000
[root@f20_main ~]# su - phil
[phil@f20_main ~]$ id
uid=1000(phil) gid=1000(phil) groups=1000(phil)
[phil@f20_main ~]$ ping -c1 10.10.10.1
PING 10.10.10.1 (10.10.10.1) 56(84) bytes of data.
64 bytes from 10.10.10.1: icmp_seq=1 ttl=64 time=1.02 ms

--- 10.10.10.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 1.022/1.022/1.022/0.000 ms
[phil@f20_main ~]$ logout
[root@f20_main ~]# iptables -t nat -nvL OUTPUT
Chain OUTPUT (policy ACCEPT 1 packets, 84 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    1    84            all  --  *      *       0.0.0.0/0            0.0.0.0/0            owner GID match 1000

I suggest filing a bug with Debian bugzilla if you suspect a problem in a Debian
kernel.  

Phil
