From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: Unusual routing problem
Date: Tue, 1 Apr 2003 11:58:49 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0304011156020.21674@netmonster.pakint.net>
References: <04c101c2f231$c3732de0$93a22ad1@blueone.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04c101c2f231$c3732de0$93a22ad1@blueone.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Tompkins <benji@blueone.net>
Cc: netfilter@lists.netfilter.org

On Mon, 24 Mar 2003, Benjamin Tompkins wrote:

> I am attempting to route myself an ip block from my office to my home via a
> tunnel. Simple enough. The catch is, I only want the tunnel to be used for
> lan destined traffic and incoming connections to my IP block. The lan
> destined traffic is easy, the trick apparently is getting the block to be
> accessible via the internet, without forcing all traffic to use the tunnel.
> A diagram.
>
> eth0  (DHCP) cable modem            eth1  (x.x.x.1/28) LAN
>                                               \   /
>                                       Linux Machine
>                                                 |
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

ip rule add from x.x.x.2 dev lo table pppout

Remember that the RPDB defines all packets as sourced from dev lo even
though they have the ip addr of the eventual outgoing interface.

> using the mangle table making rules for input and forward, but am just
> missing something along the way. Any help anyone can offer would be greatly
> appreciated. Thanks.
>
> Benji
>
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 553-2288
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------

