From: Ard van Breemen <ard@telegraafnet.nl>
Subject: Re: Neighbour table overflow
Date: Tue, 26 Nov 2002 19:38:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126183823.GD31207@telegraafnet.nl>
References: <1038321617.13707.28.camel@ben.mis.tnsi.com> <35211.200.60.189.231.1038335981.squirrel@www.netfids.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <35211.200.60.189.231.1038335981.squirrel@www.netfids.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 26, 2002 at 12:39:41PM -0600, g_netfilter@netfids.com wrote:
> Friends, I have some logs like this:
> 
> Nov 26 11:29:46 firewall kernel: NET: 96 messages suppressed.
> Nov 26 11:29:46 firewall kernel: Neighbour table overflow.
> Nov 26 11:29:52 firewall kernel: NET: 52 messages suppressed.
> Nov 26 11:29:52 firewall kernel: Neighbour table overflow.
> Nov 26 11:29:56 firewall kernel: NET: 83 messages suppressed.
> Nov 26 11:29:56 firewall kernel: Neighbour table overflow.
> Nov 26 11:30:08 firewall kernel: NET: 19 messages suppressed.
> Nov 26 11:30:08 firewall kernel: Neighbour table overflow.
> 
> Im running Red Hat 7.3 kernel 2.4.18-3 and iptables 1.2.5-3, please could
> you tell me if those logs are showing some attempts of attacks?
First of all: this has nothing to do with netfilter, just with
the routing and cacheing of the routes.

I guess that you have an internet connection, serving a lot of
different IP's, *and* that this system sees more than 128
different mac addresses, right?

I used to fix it by raising the gc_thresh1 over the amount of mac
addressess I normally would see:
echo 512 > /proc/sys/net/ipv4/neigh/default/gc_thresh1
echo 2048 > /proc/sys/net/ipv4/neigh/default/gc_thresh1
echo 4096 > /proc/sys/net/ipv4/neigh/default/gc_thresh1

This is what I think happens:
All the routing information is cached on an IP-IP pair basis.
Part of the information is the *destination* mac address.
A new entry in the routing-cache will lock the neighbour entry in
the neighbour table (mac address table) cache by upping it's
usage counters.
So for every new source ip to a common local ip, the mac address
of that local-ip will be locked for every new ip.

If you have more than /proc/sys/net/ipv4/neigh/default/gc_thresh1
in the neighbour table, the garbage collector will try to free
entries in the neighbour table.

(From this point on I am just guessing and trying to understand
the source code:)
If I am correct, it will mark entries to be freed, so that they
wont be used anymore. So to be able to use a specific destination
again, it needs to make a new entry in the neighbour table. So
instead of cleaning up the tables, your neighbour (arp) table
will be filled fast if you see more new source ip's than that old
neighbour entries are discarded by having their usage counts down
to 0.

If somebody else knows the true truth about how it exactly works,
please tell me. I will make notes of it for the lartc so it can
be a FAQ.

-- 
procedure signature;
begin  { telegraaf.com
} writeln('<ard@telegraafnet.nl> SMA-IS | Geeks don't get viruses');
end

