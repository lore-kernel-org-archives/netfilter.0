From: "Benjamin Tompkins" <benji@blueone.net>
Subject: Re: Unusual routing problem
Date: Sun, 30 Mar 2003 14:00:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01d601c2f6ee$a0cddad0$0a00a8c0@blueone.net>
References: <04d501c2f232$c0dbebc0$93a22ad1@blueone.net> <200303242028.09150.kimj@dawn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I've set this up and still having no luck. Responses to packets that come in
ppp0 are still going out eth0. Any other ideas on what I may be doing wrong?


Hi Benjamin,

I have recently been playing with the same thing, and have a still
unanswered
question regarding the possibility to combine MASQUERADING with NAT!

Anyway, if you keep things down to a simple level, then all you have to do
is
create a second routing table (copy), and then add a fwmark rule to to tell
the routing system, that the second table should be used when the mark is
matched.

In your iptables, you mark all packets which are bound for your secondary
route. While the default set up will ensure that you have all packets
running
through normally.

Ip routing rule:
$ ip rule add fwmark xxx table yyy

in iptables:
$ iptables -t mangle -A PREROUTING [conditions] -j MARK --set-mark xxx

Hopes this helps. However, if you manage to set up your system with working
masquerading & natting, please give me a hint - I'm completely stuck and are
currently resolving to using aliasing!

/Kim

On Monday 24 March 2003 19:25, Benjamin Tompkins wrote:
> I am attempting to route myself an ip block from my office to my home via
a
> tunnel. Simple enough. The catch is, I only want the tunnel to be used for
> lan destined traffic and incoming connections to my IP block. The lan
> destined traffic is easy, the trick apparently is getting the block to be
> accessible via the internet, without forcing all traffic to use the
tunnel.
> A diagram.
>
> eth0  (DHCP) cable modem            eth1  (x.x.x.1/28) LAN
>                                               \   /
>                                       Linux Machine
>
>                                  ppp0 (x.x.x.2/30)
>
> Ok, so what I have so far is as follows.
>
> This takes care of access to the office network.
> route add -net x.x.x.1 netmask 255.255.255.240 dev eth1
> route add -net x.x.x.0 netmask 255.255.254.0 dev ppp0
> route add -host x.x.x.1 dev eth0
>
> Now to use the cable for everything else.
> iptables -A POSTROUTING -s x.x.x.1/28 -o eth0 -j MASQUERADE
>
> So now I can access my office lan and vice versa, and everything else gets
> masqed out the cable. But I'm having a heck of a time letting the box to
> know that stuff requested via ppp0, needs to go out ppp0. I have looked at
> using the mangle table making rules for input and forward, but am just
> missing something along the way. Any help anyone can offer would be
greatly
> appreciated. Thanks.



