From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 10:17:13 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41598079.2020000@pbl.ca>
References: <41596898.178.36a5.6993354@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41596898.178.36a5.6993354@arbbs.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

John Black wrote:
> eth0 161.31.31.22 
> eth0:0 161.31.31.23 (i hope)
> eth1 192.168.1.1

So, eth0 is your external interface with two IP addresses assigned to 
it, and eth1 is interface to your local network?  Don't hope if the 
interface has an address assigned.  Check it with "ifconfig" or "ip 
address show".

Access to the Internet from the firewall box will work out of the box. 
Linux will use address of eth0 for all packets that are to leave the box 
out of eth0.

To allow hosts on your local network to access the internet, you need to 
enable forwarding and define simple NAT rule:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j SNAT 
--to-source 161.31.31.23

If you wanted to allow access *from* the Internet to one of the hosts on 
your local network (that doesn't have public IP address), than you would 
use DNAT target.

> this is how it was shown in the double nat howto.  so i was
> trying to take that and make it work for a signle.

Howtos are nice, but having an understanding on how things work should 
be priority.  Otherwise you end up with configuration that you have no 
idea what it is doing.  And that is a very bad thing, especially when 
building an firewall.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

