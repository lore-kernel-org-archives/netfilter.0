From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ARP & IPTables!!
Date: Tue, 31 Jan 2006 08:16:43 -0600
Message-ID: <200601310816.44019.rob0@gmx.co.uk>
References: <1354.172.22.28.50.1138686445.squirrel@mx.uom.ac.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1354.172.22.28.50.1138686445.squirrel@mx.uom.ac.mu>
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
To: netfilter@lists.netfilter.org

On Monday 2006-January-30 23:47, ramsurrunv@mx.uom.ac.mu wrote:
> I wanted to know if there is a way of relaying (forwarding) ARP
> requests and replies using iptables. What rule can I use?

ARP is layer 2, iptables is layer 3, so no, I doubt it is possible. 
You're needing a bridge interface. That *is* possible, actually very 
easy to do.

The high-level overview: flush all IP addresses on the interfaces you 
want to bridge, assign them 0.0.0.0/0. Use brctl(8) to create a bridge 
interface and to add each physical interface to it. Assign your IP 
address to the bridge interface.

ebtables(8) can control layer 2 bridge traffic if you want to limit or 
filter it. With CONFIG_BRIDGE_NETFILTER=y you can control bridged 
traffic at layer 3 in your filter / FORWARD chain.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

