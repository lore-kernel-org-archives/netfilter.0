From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: Wed, 30 Oct 2002 16:28:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210301628.g9UGSpe11970@vulcan.rissington.net>
References: <200210301928.42300.mail@vickysh.wlink.com.np>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210301928.42300.mail@vickysh.wlink.com.np>
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
To: netfilter@lists.samba.org

On Wednesday 30 October 2002 1:43 pm, Vicky Shrestha wrote:

> I have built a firewall on 2.4.8-17 kernel which has 2 Mb of traffic going
> in an out of it.
>
> I recently added a line :
> iptables -A FORWARD -m state --state ESTABLISED,RELATED -J ACCEPT
>
> Now I can see the lines "ip_conntrack : table full, dropping packet" in my
> kern.log.
>
> Does dropping packets means that it is actually dropping the packets or
> just truncating the file /proc/net/ip_conntrack , does this affect my
> client's connections???

It means it really is dropping packets.   You should find out why the 
conntrack table is too small and do something about it.

The two possible reasons are:

1. You have a reasonable sized conntrack table but something is creating 
large numbers of entries (maybe SYN floods or something similar).

2. You have a reasonable number of connections being created through the 
machine, but insufficient memory has been allocated to the conntrack table.

Questions:

1. How much memory do you have in your firewall machine ?

2. What are the results of:
wc -l /proc/net/ip_conntrack
cat /proc/sys/net/ipv4/ip_conntrack_max

Antony.

-- 

Your email has been returned due to insufficient voltage.

