From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: Re: how do i forward ftp from my firewall to an internal server?
Date: Sun, 29 Feb 2004 21:16:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040229211627.4c0713a2.j.vriesman@prompt.nl>
References: <404050F8.8040902@karlskrona.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <404050F8.8040902@karlskrona.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Mayby use a rule with:

-m helper --helper ftp

It uses conntrack and conntrack_ftp.


On Sat, 28 Feb 2004 09:27:36 +0100
Gustav Petersson <gustav.petersson@karlskrona.net> wrote:

> Like the subject line says.. how do I do it?
> 
> I have port http traffic forwarded to the same server but when i use the 
> same rule with only the port(s) changed for ftp traffic my ftp server 
> opens the connection but immediately closes it again. I have tried 
> running both the standard in.ftpd and proftpd. Any help would be greatly 
> appreciated.
> 
> Gustav Petersson
> 
> I am running debian 3.0 with kernel 2.4.24 and I have the following 
> modules loaded:
> 
> ipt_LOG
> ipt_state
> iptable_filter
> ip_nat_ftp
> ip_conntrack_ftp
> iptable_nat
> ip_conntrack
> ip_tables
> 
> Here is my firewall config:
> #!/bin/sh
>  
> EXT_IP=1.2.3.4
> INT_IP=192.168.x.x
> 
> modprobe iptable_nat
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
>  
> echo "1" > /proc/sys/net/ipv4/ip_forward
>  
> iptables -P INPUT ACCEPT
> iptables -F INPUT
> iptables -P OUTPUT ACCEPT
> iptables -F OUTPUT
> iptables -P FORWARD ACCEPT
> iptables -F FORWARD
> iptables -t nat -F
> 
> # NAT
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 213.88.181.68
>  
>                                                                                 
> 
> # Forward port 80 to internal server
> iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 80 \
>         -j DNAT --to $INT_IP:80
> 
> # Forward ports 20 and 21 to internal server
> iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 20 \
>         -j DNAT --to $INT_IP:20
>                                                                                 
> 
> iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 21 \
>         -j DNAT --to $INT_IP:21
> 
> 
> 
> 

