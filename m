From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: Dropping network "noise"
Date: Wed, 16 Feb 2005 10:34:50 +0300
Message-ID: <200502161034.50448.e-boogie@yandex.ru>
References: <200502130928.41225.e-boogie@yandex.ru>
	<20050215161520.GA19496@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050215161520.GA19496@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Tuesday 15 February 2005 19:15, Jason Opperisano wrote:
> On Sun, Feb 13, 2005 at 09:28:41AM +0300, Mikhail Zotov wrote:
> > I have a Linux machine (with a static routable IP address)
> > connected to a windoops LAN.  As is known, there is certain
> > "noise" in windoops networks, which can be silently dropped
> > by a rule like this:
> > 
> > iptables -A INPUT -p udp --dport 135:139 -j DROP
> > 
> > I have found that this "noise" can also be effectively blocked
> > by the following rule:
> > 
> > iptables -A INPUT -d ! $IP.ADDRESS.OF.MY_BOX -j DROP
[snip]
> you can also use the pkttype match to drop broadcast/multicast traffic,
> without having to calculate the broadcast address for every interface,
> and having another rule for the all-ones broadcast:
> 
>   -m pkttype --pkt-type broadcast -j DROP
>   -m pkttype --pkt-type multicast -j DROP
> 
> -j

Great.  Thanks a lot for the idea.  These rules call another question:
Are broadcast/multicast messages used in Linux/UNIX or other than
windoops networks?  If so, will not these rules break anything?
I haven't seen such rules in any iptables guides/scripts available in
the Internet.

Regards,
Mikhail

