From: Robert Allmeroth <robert.allmeroth@epygi.de>
Subject: Re: FTP problems
Date: Thu, 27 Feb 2003 22:26:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302272126.h1RLQiT9001970@ally.epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

hello,

I had the same problem.. but it was a DNS problem. Most FTP servers do
a reverse lookup of your IP address and if that fails it takes a while.

Robert

> Everything seems to work fine except FTP via NAT.
> The interfaces that are not natted handle ftp normally.
> When I do ftp from inside where the connection goes thru nat, I get an
> instant establisment of connection,syn,ack,syn-ack followed by a 30
> second wait...then all works normally from that point. This 30 second
> delay is constant with each new ftp connection. I have tried about
> everything in the iptables script.
> Passive ftp does the same thing.
> All the other protocols seem okay including IRC.
> I am running RedHat kernel 2.4.18-24.7.x i686, iptables version 1.2.5,
> all the latest RedHat updates.

> I have loaded:
> ip_conntrack
> ip_conntrack_ftp
> ip_conntrack_irc
> ip_table_nat
> ip_nat_ftp
> ip_nat_irc
> ipt_state
> ipt_limit
> ipt_REJECT
> ipt_LOG
> ipt_unclean
> ipt_mac
> iptable_filter
> iptable_mangle
> iptable_nat

> Should the ftp connection show up in /proc/net/ip_conntrack ? It does
> NOT show in there.
> Is there a problem with the ipt_nat_ftp module?








