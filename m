From: Jason Opperisano <opie@817west.com>
Subject: Re: Filtering encrypted vs. unencrypted packages?
Date: Sun, 31 Oct 2004 13:43:42 -0500
Message-ID: <1099248085.3271.7.camel@hubcap.ljm.dom>
References: <41840BB2.6020904@danisch.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41840BB2.6020904@danisch.de>
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

On Sat, 2004-10-30 at 17:46, Hadmut Danisch wrote:
> Hi,
> 
> I was just playing around with 2.6 IPSec and isakmpd and ran into a problem:
> 
> In order to have the packets from the peer IPSEC network accepted,
> I need to have an entry like
> 
> iptables -A INPUT -s 192.168.19.0/24 -j ACCEPT
> 
> where 192.168.19.0 is the network behind the ipsec peer.
> 
> But if I do this, the machine would also accept unencrypted packages
> from the Internet (except for the fact that packets to RFC1918-Adresses 
> are not
> routed, but assume that the LAN has official addresses).
> 
> I can't even distinguish them by the interface, because from an
> iptables point of view, the packages are incoming on the external 
> interface,
> as if they were coming unencrypted.
> 
> How do I treat packets from IPSec and unencrypted plain packets from the
> Internet differently with iptables?

the packets pass through the netfilter tables twice--once encrypted, and
once unencrypted.  the 'common' way to filter IPSec traffic with the 2.6
kernel is to mark the IPSec packets:

  # mark ipsec packets from vpn peer 1
  iptables -t mangle -A PREROUTING -p 50 -s $vpn_peer1 \
    -j MARK --set-mark 1

  # accept IKE & ESP packets from vpn peer 1
  iptables -A INPUT -i $extif -p udp -s $vpn_peer1 \
    --sport 500 --dport 500 -j ACCEPT
  iptables -A INPUT -i $extif -p 50 -s $vpn_peer1 -j ACCEPT

  # accept packets from the remote vpn net that have the mark
  iptables -A FORWARD -s $vpn_peer_net1 -m mark --mark 1 -j ACCEPT

-j

--
"That's it! You people have stood in my way long enough. I'm going
to clown college!"
	--The Simpsons


