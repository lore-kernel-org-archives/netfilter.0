From: Jason Opperisano <opie@817west.com>
Subject: Re: Dropping network "noise"
Date: Tue, 15 Feb 2005 11:15:20 -0500
Message-ID: <20050215161520.GA19496@bender.817west.com>
References: <200502130928.41225.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200502130928.41225.e-boogie@yandex.ru>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Feb 13, 2005 at 09:28:41AM +0300, Mikhail Zotov wrote:
> Hello everybody,
> 
> I have a Linux machine (with a static routable IP address)
> connected to a windoops LAN.  As is known, there is certain
> "noise" in windoops networks, which can be silently dropped
> by a rule like this:
> 
> iptables -A INPUT -p udp --dport 135:139 -j DROP
> 
> I have found that this "noise" can also be effectively blocked
> by the following rule:
> 
> iptables -A INPUT -d ! $IP.ADDRESS.OF.MY_BOX -j DROP
> 
> I haven't noticed anything going wrong yet, still I'd like to
> know: Does this rule have a (potential) drawback?  Can it break
> anything in case I have NFS or obtain IP address via DHCP or
> in any other situation?
> 
> A similar question goes for the case of a Linux router/gateway
> protecting a LAN (with machines with routable IP addresses).
> Can the following rules do any harm?
> 
> iptables -A FORWARD -i $EXTERIOR_INTERFACE -d $LAN.BROADCAST -j DROP
> iptables -A FORWARD -i $EXTERIOR_INTERFACE -d ! $LAN.IP.ADDRESSES.RANGE -j DROP

you can also use the pkttype match to drop broadcast/multicast traffic,
without having to calculate the broadcast address for every interface,
and having another rule for the all-ones broadcast:

  -m pkttype --pkt-type broadcast -j DROP
  -m pkttype --pkt-type multicast -j DROP

-j

--
"Boy, if you want anything in this life, you have to work for it. Now
 be quiet while I listen for these lottery numbers."
        --The Simpsons

