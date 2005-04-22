From: Mariusz Kruk <Mariusz.Kruk@epsilon.eu.org>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 18:56:06 +0200
Message-ID: <20050422165606.GA22193@epsilon.rdc.pl>
References: <1114180192.4118.106.camel@pauloric.intranet>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1114180192.4118.106.camel@pauloric.intranet>
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

On Fri, Apr 22, 2005 at 11:29:52AM -0300, Paulo Ricardo Bruck wrote:
> I agree w/ you. I'm studyng a lot of QoS and I stopped w/ IMQ x dummy.
> 
> From rom gname :http://article.gmane.org/gmane.linux.network/21224 . Jamal
> explained differences betwen IMQ x dummy. Like you I prefer not patch
> kernel..80)
> 
> I know that's not a netfilter stuff but it's RELATED w/ it 8).
> Could you give some hints about your solution ? how-to/tutorial or other
> place where I can find ?
> 
> thanks in advanced

Well, there is no tutorial or howto. I sent a question to LARTC-HOWTO
maintainer if he's interested and didn't get any response whatsoever.
I wrote an article on polish newsgroup pl.comp.os.linux.sieci. You can
google for it. But it's in polish. So I'll write it again.
And, be aware that it's not done using dummy device but using tunnel
between localhost and localhost.

Loop-routing mini-howto ;-)

Let's assume that we have a Linux box with interface eth0 connected to
our ISP and eth1 and eth2 connected to our local subnets.
To do IMQ without IMQ (with exception for locally destined packets) we
need to create a tunnel and route all the traffic into it.

First, we need at least one additional addres on loopback device (you
can't create tunnel with both endpoints having the same address!). For
clearance, I add two of them.

ip addr add 127.0.0.2 dev lo
ip addr add 127.0.0.3 dev lo


Now we have to set up a tunnel between those IPs (i'm not sure which one
will the most efficient one). Let it be a ipip tunnel.

ip tunnel add localend mode ipip remote 127.0.0.2 local 127.0.0.3 
ip tunnel add remoteend mode ipip remote 127.0.0.3 local 127.0.0.2
ip link set remoteend up
ip link set localend up
ip addr add 10.0.0.1 dev localend
ip addr add 10.0.0.2 dev remoteend

(of course, both tunnel endpoints' addresses are arbitrary; you can use
any private addresses)
Next, you have to convince Linux to route the packets to the tunnel.

ip rule add iif eth0 lookup 10 pref 10
ip rule add default dev remoteend table 10
ip rule add iif eth1 lookup 20 pref 20
ip rule add iif eth2 lookup 20 pref 21
ip rule add default dev localend table 20
ip route flush cache

And the tricky part (I spent half a day debugging why the things shown
above don't work):

echo 0 >/proc/sys/net/ipv4/conf/localend/rp_filter
echo 0 >/proc/sys/net/ipv4/conf/remoteend/rp_filter

This is the minimal setup.
If you want the local trafic to run without going into the tunnel (why
should you shape the local traffic, for example?), you have to add some
rules before the rules concerning local interfaces. For example:

ip rule add to 192.168.0.0/8 lookup main pref 13
ip route flush cache

And that's all.
CAVEAT: If you want to NAT the connections, remember that only packet
that starts a connection is consulted with NAT iptable. So inside the
tunnel you'll get already natted packets (at least those going outside;
don't remember how about the inbound packets).

Hope this will be of help.
-- 
d'`'`'`'`'`'`'`'`'`'`'`'`'Yb Error:   unable  to  come up with a good er-
`b  Kruk@epsilon.eu.org   d' ror...
d' http://epsilon.eu.org/ Yb 
`b,-,.,-,.,-,.,-,.,-,.,-,.d' 

