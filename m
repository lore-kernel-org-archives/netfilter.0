From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Setup simple PC-based router using IPTABLES
Date: Wed, 12 Jan 2005 17:09:29 +0800
Message-ID: <029e01c4f886$6e93c2a0$0100a8c0@newlife>
References: <20050112085342.40592.qmail@web12503.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

From: "Lim Boon Ping" <syseeker@yahoo.com>
>
> Could anyone verify/suggest commands to set for this setting?
> # iptables -A FORWARD -i eth0 -o eth1 
> # iptables -A FORWARD -i eth1 -o eth0 
>  
> Is it that's all we need to do? Thanks.

iptables is not even needed. 

Just

    echo 1 > /proc/sys/net/ipv4/ip_forward

Will do.







