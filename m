From: Henrik Nordstrom <hno@marasystems.com>
Subject: RE: iptables spof address problem
Date: Fri, 30 Sep 2005 14:21:57 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509301414450.19019@filer.marasystems.com>
References: <FAC4E024BF776842876169173CE2F0132821@mailbox.vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F0132821@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

On Thu, 29 Sep 2005, Derick Anderson wrote:

> I reiterate: a properly spoofed packet is completely identical to a 
> genuine one. It is not Netfilter's or the kernel stack's fault, it is a 
> simple fact of life that bits are bits. With an intelligent switch this 
> kind of attack can be stopped provided the switch is set to use a 1-to-1 
> ratio of ports to MACs and to drop invalid packets. However, it is not 
> possible prevent this attack when nothing separates the two boxes but 
> twisted pair.

Well, if all you have between the boxes is a twisted pair, then 
identifying who sent the spoofed packet is trivial (you know where the 
other end of that cable is, don't you?). And also making anti-spoof rules 
is equially trivial. You know both MAC and IPs that box should use so 
making a filter ruleset to drop everything else is trivial. In this case 
you should not even need to care about MAC spoofing and as the MAC 
addrssing is only relevant between the two boxes.. (unless ofcourse if you 
act as a bridge to some other interface)

Problems to trace spoofing in an Ethernet arise if there is a HUB or 
switch without MAC locking features. In HUB based networks it is really 
bad as all you can tell is that the packet came from some station in the 
network connected to that HUB. In the switched network you may be able to 
find the originating port by querying the switch for its MAC forwarding 
table (each time a switch sees a new source MAC address on a port it is 
registered in the MAC forwarding table).

Regards
Henrik

