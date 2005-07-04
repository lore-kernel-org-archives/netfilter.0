From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem w/ iptables on FC3
Date: Mon, 4 Jul 2005 14:32:59 -0500
Message-ID: <200507041432.59605.rob0@gmx.co.uk>
References: <001701c580c7$3c53cfa0$644ba8c0@sassoj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001701c580c7$3c53cfa0$644ba8c0@sassoj>
Content-Disposition: inline
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
To: NetFilter <netfilter@lists.netfilter.org>

On Monday 04 July 2005 13:36, John Sasso Jr wrote:
> I'm curious - for the sample configuration I gave in my original
> posting, why would:
>
> iptables -A OUTPUT -o eth0 -s 192.168.50.100 -p icmp --icmp-type
> echo-request -j ACCEPT
>
> fail to permit a packet originating from my system out?  I understand

Try inserting a LOG rule ahead of that ...
iptables -I OUTPUT -o eth0 -j LOG
and watch your kernel logs while trying to ping. Check the counters, 
with "iptables -vnL". Are they incremented for each ping sent? If so, 
they matched the rule, if not, they didn't.

Maybe the replies aren't matching. Repeat the above steps for INPUT. 
Soon enough you will find out why it didn't work.

Or not. Actually I bet you will find that no pings were sent. What do 
you have for "ls -l `which ping`"? Is it SUID?

$ v `which ping`
-rws--x--x  1 root bin 29232 2004-11-03 22:55 /bin/ping
   ^
That little "s" there is necessary for non-root users.

> what "iptables -P OUTPUT ACCEPT" does, and I am not arguing the logic
> behind using that instead for my situation, but I'm wondering if
> packet filtering operates differently for traffic originated by a
> firewall as opposed to traversing a firewall.

OUTPUT is the chain that sees the packets which originated on the 
firewall machine. Packet matching follows the same principle in all 
tables and chains.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

