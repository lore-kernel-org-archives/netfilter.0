From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Problem with connection tracking in IPtables!!
Date: Thu, 10 May 2007 15:33:43 +0900 (JST)
Message-ID: <200705100633.l4A6XiPv022314@toshiba.co.jp>
References: <802220ef0705090754q7b242fefvee61ea00ee58277e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <802220ef0705090754q7b242fefvee61ea00ee58277e@mail.gmail.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: vishamr@gmail.com
Cc: netfilter@lists.netfilter.org

From: "Ramsurrun Visham" <vishamr@gmail.com>
Date: Wed, 9 May 2007 18:54:27 +0400

> Hi to all,
> 
> I am using Fedora Core 5 with an upgraded kernel of 2.6.20.4. I
> installed iptables-1.3.7 on it. However, I am not able to use
> connection tracking. I checked all the items in Networking options
> related to connection tracking and iptables. However, when I boot in
> my 2.6.20.4 kernel, and issue the comand "service iptables start", I
> get this:
> 
> [root@localhost ~]# service iptables start
> Flushing firewall rules:                                   [  OK  ]
> Setting chains to policy ACCEPT: raw mangle filter         [  OK  ]
> Unloading iptables modules:                                [  OK  ]
> Applying iptables firewall rules:                          [  OK  ]
> Loading additional iptables modules: ip_conntrack_netbios_n[FAILED]
> 
> [root@localhost ~]# locate ip_conntrack_netbios
> /lib/modules/2.6.15-1.2054_FC5smp/kernel/net/ipv4/netfilter/ip_conntrack_netbios_ns.ko
> /usr/src/linux-2.6.20.4/net/ipv4/netfilter/ip_conntrack_netbios_ns.c
> [root@localhost ~]#
> 
> It seems that connection tracking is not being activated. How can I
> solve this problem?

You really installed kernel modules for 2.6.20.4 by 'make modules_install' ?
And please check that NF_CONNTRACK_NETBIOS_NS or IP_NF_NETBIOS_NS is set in
your .config.

-- Yasuyuki Kozakai

