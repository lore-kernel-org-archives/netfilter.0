From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: non-masquerade routing (nfcan: addressed to exclusive sender
	for this address)
Date: Sat, 4 Feb 2006 11:26:03 -0500
Message-ID: <20060204162603.GA26094@salty>
References: <af2c99310602040722g71cc5491i51fa411e47bcd02f@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <af2c99310602040722g71cc5491i51fa411e47bcd02f@mail.gmail.com>
	(from
	+nfcan+jimlaur+fb897d0c5f.bangular#gmail.com@spamgourmet.com on
	Sat, Feb 04, 2006 at 10:22:33 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2006.02.04 10:22, Chris Baechle - bangular@gmail.com wrote:
> I'm trying to setup a linux router for routing of public addresses
> (non-nat / non-masquerade). I really don't know what this is called
> (so googling hasn't helped much).
>

Um, perhaps this is called 'routing'.

Once the route is set up,
and routing is turned on - something like:

echo 1 > /proc/sys/net/ipv4/ip_forward

all the *firewall* needs is permission to forward the packets
from one network/interface to the other.

> Example:
> 
> [Box A] ( 72.14.207.2)  <--->  (72.14.207.1) [Linux Router]
> (66.94.234.1)  <---> (66.94.234.2) [Box B]
> 
> Box A eth0 = 72.14.207.2
> Linux Router eth0 = 72.14.207.1
> Linux Router eth1 = 66.94.234.1
> Box B eth0 = 66.94.234.2
> 
> I want to be able to connect from [Box A] to [Box B] and Box B web
> server logs to show Box A's ip address (no natting); and if I do a
> traceroute have the linux router show up as a hop (no bridging).
> 
> So is this something for iptables or am I barking up the wrong tree? I
> checked out regular old route and iproute2 and didn't get much
> further. Any point in the right general direction would be greatly
> appreciated.
> 
> 
> 
>

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

