From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Dropping network "noise"
Date: Sun, 13 Feb 2005 09:28:41 +0300
Message-ID: <200502130928.41225.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello everybody,

I have a Linux machine (with a static routable IP address)
connected to a windoops LAN.  As is known, there is certain
"noise" in windoops networks, which can be silently dropped
by a rule like this:

iptables -A INPUT -p udp --dport 135:139 -j DROP

I have found that this "noise" can also be effectively blocked
by the following rule:

iptables -A INPUT -d ! $IP.ADDRESS.OF.MY_BOX -j DROP

I haven't noticed anything going wrong yet, still I'd like to
know: Does this rule have a (potential) drawback?  Can it break
anything in case I have NFS or obtain IP address via DHCP or
in any other situation?

A similar question goes for the case of a Linux router/gateway
protecting a LAN (with machines with routable IP addresses).
Can the following rules do any harm?

iptables -A FORWARD -i $EXTERIOR_INTERFACE -d $LAN.BROADCAST -j DROP
iptables -A FORWARD -i $EXTERIOR_INTERFACE -d ! $LAN.IP.ADDRESSES.RANGE -j DROP

Thanks in advance!

--
Mikhail



