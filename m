From: Vivek Dasmohapatra <vivek@etla.org>
Subject: Re: Linux router in bridge mode
Date: Fri, 18 Aug 2006 10:08:38 +0100 (BST)
Message-ID: <Pine.LNX.4.62.0608180957070.23453@pike.pepperfish.net>
References: <A78C6C481BFAE949BC5990E1EEB2FE12585A@q.LeBlancNet.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE12585A@q.LeBlancNet.us>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, 17 Aug 2006, Robert LeBlanc wrote:

> Is it possible to use iptables with two NICs in bridge mode? I'd like to
> do some NATing on the back end for computers behind the router still.
> Can that be done with virtual addresses, or can an adapter be in bridged
> mode and IP mode (is that what it's called?) at the same time?

Yes, it is possible to do this. IIRC you used to need a patch, but I think
it was rolled in a while ago. Enable

CONFIG_BRIDGE_NETFILTER

Symbol: BRIDGE_NETFILTER [=y]
   Prompt: Bridged IP/ARP packets filtering
     Defined at net/Kconfig:137
     Depends on: NET && BRIDGE && NETFILTER && INET
     Location:
       -> Networking
        -> Networking support (NET [=y])
          -> Networking options
            -> Network packet filtering (replaces ipchains)

You may also want CONFIG_IP_NF_ARPTABLES (but this is a bit more 
specialised):

Symbol: IP_NF_ARPTABLES [=m]
Prompt: ARP tables support
   Defined at net/ipv4/netfilter/Kconfig:581
   Depends on: NET && INET && NETFILTER && NETFILTER_XTABLES
   Location:
     -> Networking
       -> Networking support (NET [=y])
         -> Networking options
           -> Network packet filtering (replaces ipchains) (NETFILTER [=y])
             -> IP: Netfilter Configuration

Depending on where your bridge is in the network, you may also need to
turn on proxy arp for the interfaces in question.

The brctl tool is used to set up/remove bridges.
On debian this can be configured in /etc/network/interfaces iirc, or
just use an init script or similar.


