From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall
Date: Wed, 16 Feb 2005 19:08:31 +0100
Message-ID: <87k6p8gyxs.fsf@helmut.nilsson.homedns.org>
References: <200502151715.j1FHFtfO029324@pepsi.fishpuppy.com>
	<200502160129.26423.rowdy@com> <4213200C.9060108@hotpop.com>
	<87r7jgwu3x.fsf@helmut.nilsson.homedns.org>
	<20050216145936.25916.qmail@mail.norac.net>
Mime-Version: 1.0
In-Reply-To: <20050216145936.25916.qmail@mail.norac.net> (Jean Caron's
	message of "Wed, 16 Feb 2005 09:59:36 -0500")
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
To: Jean Caron <caronj@norac.net>
Cc: netfilter@lists.netfilter.org

"Jean Caron" <caronj@norac.net> writes:
> Ola, Your problem is directly related to NAT. You can not use NAT. ESP
> will not establish any security association if the source or
> destination address have been modified, which is exactly what NAT does
> to your packets. In order for this to work, you need to encapsulate
> your ESP (IPsec) traffic within either UDP or TCP. NAT-Traversal does
> this. Different vendors implement this using different ports.protocol,
> but essentially they are encapsulating the orignal packets, hiding the
> info from NAT. The iptable rules above are exactly what you'd need if
> the tunnel was terminating ON the firewall. But to terminate it PAST
> the firewall, unless you use public addresses everywhere (no NAT), you
> will need to encapsulate, and define approriate (additional) rules on
> your firewall fot the NAT-T port used. Hope this helps,
> Jean

Right. I went back to Ethereal to have another look. It seems to
report the inner most protocol it can decode (in the view I posted
initially). Looking at the packet in detail gives this:

Frame 275 (160 bytes on wire, 160 bytes captured)
Linux cooked capture
Internet Protocol, Src Addr: 102.168.3.249 (192.168.3.249). Dst Addr: 1.2.3.4 (1.2.3.4)
user Datagram Protocol, Src Port: 4500 (4500), Dst Port: 4500 (4500)
UDP Encapsulation of IPsec Packets
Encapsulating Security Payload

So, you're right it is encapsulated in some form. Also, colleagues
using e.g. D-Link routers have no problems connecting. So the traffic
should NAT OK. I will now try the patch-o-matic dropped-table to try
to understand we the packets get dropped instead of NATed (as
suggested by Samuel Jean).

-- 
/Ola Nilsson


