From: "Jacob Mathew" <jacobmat@addr.com>
Subject: Re: Setup simple PC-based router using IPTABLES
Date: Wed, 12 Jan 2005 14:40:47 +0530
Message-ID: <012901c4f886$9acd2be0$5500a8c0@BLRADDRCOM>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Lim Boon Ping <syseeker@yahoo.com>
Cc: netfilter@lists.netfilter.org

#Allow all connections OUT and only existing and related ones IN"
iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j 
ACCEPT
iptables -A FORWARD -i eth1 -o eth1 -j ACCEPT

# Enable SNAT (MASQUERADE) functionality on eth0"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

in this scenario eth0 is external and eth1 is internal

regds
Jacob

----- Original Message ----- 
From: "Lim Boon Ping" <syseeker@yahoo.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 12, 2005 2:23 PM
Subject: Setup simple PC-based router using IPTABLES


> Hi,
>
> I need some help on using IPTABLES to setup a simple PC-based router (for 
> LAN usage).
> The PC consists of  a 10/100 NIC on eth0, and a gigabit fiber NIC on eth1. 
> The gigabit fiber NIC is connected to another fiber-based port, whereas 
> the 10/100 NIC is connected to a 10/100 hub. Now, for all packets coming 
> from eth0, forward it to eth1, and vice versa.
> Could anyone verify/suggest commands to set for this setting?
> # iptables -A FORWARD -i eth0 -o eth1
> # iptables -A FORWARD -i eth1 -o eth0
>
> Is it that's all we need to do? Thanks.
>
> Regards,
> Jocelyn
>
>
> ---------------------------------
> Do you Yahoo!?
> Read only the mail you want - Yahoo! Mail SpamGuard.
>
> 


