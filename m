From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 15:47:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109204745.GE24304@cannon.eng.us.uu.net>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net> <001101c3d6e3$cdf03e60$1684188d@Kiste>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001101c3d6e3$cdf03e60$1684188d@Kiste>
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
Content-Transfer-Encoding: 7bit
To: Thhoep <thhoep@gmx.de>
Cc: netfilter@lists.netfilter.org

On Fri, Jan 09, 2004 at 08:06:33PM +0100, Thhoep wrote:

> besides of the marking there is a masquerading active, as mentioned in
> previous mails:
> "iptables -t nat -A POSTROUTING -o ppp4 -j MASQUERADE"
> 
> filter table is empty.
> 
> ok, i did monitor all interfaces using
> "tcpdump -n -i ppp0 icmp and host 141.24.12.2"
> and so on. as expected nowhere a pong went out. i think any pong leaving the
> box would have showed up in the FORWARD counting rule in the first test.

Yes. But one other possibility is if you receive the return traffic through
another interface (which should not happen because you're MASQ'ing) then
the de-MASQ does not take place. But again, it doesn't have anything to do
with the MARK and rule...

> you are right. and _all_ routing tables contain a route to the local net, so
> a packet should always find its way from the outside in.

Except if it's being dropped by conntrack... And remember, tcpdump sees stuff
before the stack does its thing to the packets.


> i think even if the
> masquerading would be broken, the packet wouldnt get lost. it would show up
> somewhere OR an icmp error would be sent to its sender.

An ICMP is not being sent for another ICMP. But I guess an ICMP for ping
can be sent, though.


> so is there a bug in
> the routing code? and why am i then the only one having this problem?

You got me there. Try to reduce the complexity of your setup (just bring
up one ppp, remove the unnecessary tables and so forth) and retest again.
If the test passes then add little by little to your setup. I'm sure you'll
find/locate the problem that way.

Ramin

