From: Nick Taylor <nickt@lightlink.com>
Subject: Re: bind 9 and iptables
Date: Fri, 27 Aug 2004 16:19:59 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0408271617110.17638@adore.lightlink.com>
References: <web-420408468@mail01.infosat.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-420408468@mail01.infosat.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: it clown <suse@mailbox.co.za>
Cc: netfilter@lists.netfilter.org

Your question isn't really specific enough to be sure what's going on, but
I'm assuming that on your firewall box, the rules you present allow DNS
queries to work, but that on clients behind the firewall, DNS still fails,
and furthermore that you have the clients set up to use a DNS server on
the outside of your firewall.  If this is the case, try:

iptables -A FORWARD ...

Remember, the input and output chains are only for traffic with a LOCAL
source or destination (same computer as firewall), whereas forward is for
traffic that goes through the firewall computer.


 On Fri, 27 Aug 2004, it clown wrote:

> Date: Fri, 27 Aug 2004 22:06:00 +0200
> From: it clown <suse@mailbox.co.za>
> To: netfilter@lists.netfilter.org
> Subject: bind 9 and iptables
>
> Hi All
>
> I have a dns with a forwarder to my isp on the iptables
> box. I am having trouble on getting dns to work properly.
>
> When i comment:
>
> iptables -P INPUT DROP
> iptables -p OUTPUT DROP
>
> DNS will work fine and all the pc's can browse the net.
>
> I have tried the following with out any luck:
>
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> what rule do i need to add to make things more secure to
> get my dns working properly, thanks?
>
> Regards
>
>
> _____________________________________________________________________
> For super low premiums ,click here http://www.dialdirect.co.za/quote
>

