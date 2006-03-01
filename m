From: Philip Craig <philipc@snapgear.com>
Subject: Re: Multiple inet gw and multipath
Date: Wed, 01 Mar 2006 15:35:54 +1000
Message-ID: <440532BA.40009@snapgear.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901673AA@pxtbenexd01.pxt.primeexalia.com>
	<20060301045503.GA7482@nihil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060301045503.GA7482@nihil>
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
To: Alpt <alpt@freaknet.org>
Cc: netsukuku@freaknet.org, netfilter@lists.netfilter.org

On 03/01/2006 02:55 PM, Alpt wrote:
> We have multiple gw. When a new connection is established through a gw,
> all the packets belonging to the same connection must be sent through the
> same gw. 
> We cannot use the source routing method since all the IFs use the same IP,
> thus in order to accomplish this we have to:
> mark with the same id all the packets which belong to the same
> connection.
> Each connection has to have a different mark in order to go through
> different gateways.
> 
> A simple idea is to assign a mark to each tunnel (outgoing IF), and
> when a new connection is created through a specific tunnel, all the outgoing
> packets of the connection are marked with the same id. But how?
> 
> Another idea is to conntrack the connection and marking the packets with a
> 4bit number which is the hash of the destination IP. Probably this requires a
> new netfilter extension.

Why the destination IP?
It should work if you just mark the connection with the same mark
you use for the route tables.  Some untested rules:

# Save the gateway in the connection mark for new outgoing connections
iptables -t mangle -A POSTROUTING -o eth0 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x4
iptables -t mangle -A POSTROUTING -o eth1 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x8
# Save the gateway in the connection mark for new incoming connections
iptables -t mangle -A PREROUTING -i eth0 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x4
iptables -t mangle -A PREROUTING -i eth1 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x8
# Use the correct gateway for reply packets from the LAN
iptables -t mangle -A PREROUTING -i eth2 -m conntrack --ctstate ESTABLISHED,RELATED -j CONNMARK --restore-mark
# Use the correct gateway for reply packets from local connections
iptables -t mangle -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j CONNMARK --restore-mark


