From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: whats wrong???
Date: Thu, 30 Jun 2005 12:43:55 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0506301243170.638@yvahk01.tjqt.qr>
References: <42C17D6F.70709@adinet.com.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C17D6F.70709@adinet.com.uy>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juan Manuel Tato <madness@adinet.com.uy>
Cc: netfilter@lists.netfilter.org


> where come the output of the chains
>
> fw-new:~# iptables -L -n
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> ACCEPT     all  --  192.168.100.1        0.0.0.0/0
> ACCEPT     all  --  192.168.100.2        0.0.0.0/0
> ACCEPT     all  --  192.168.100.3        0.0.0.0/0
> ACCEPT     all  --  192.168.100.4        0.0.0.0/0
> ACCEPT     all  --  192.168.100.5        0.0.0.0/0
> ACCEPT     all  --  192.168.100.6        0.0.0.0/0
> ACCEPT     all  --  192.168.100.7        0.0.0.0/0
> ACCEPT     all  --  192.168.100.8        0.0.0.0/0
> ACCEPT     all  --  192.168.100.9        0.0.0.0/0

Uh you could merge those.

> ACCEPT     tcp  --  192.168.100.0/24     0.0.0.0/0           tcp dpt:22
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:80
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:25
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:110
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:110
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:143
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:143
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53

You can also merge this using -m dport



Jan Engelhardt                                                               
--                                                                            
| Gesellschaft fuer Wissenschaftliche Datenverarbeitung Goettingen,
| Am Fassberg, 37077 Goettingen, www.gwdg.de

