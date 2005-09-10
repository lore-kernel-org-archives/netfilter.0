From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Route packets from an interface to another
Date: Fri, 9 Sep 2005 23:45:40 -0500
Message-ID: <200509092345.40386.rob0@gmx.co.uk>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509091636.37287.rob0@gmx.co.uk>
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
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

On Friday 2005-September-09 16:18, Jonathan wrote:
> >> >> >> box2: lo:0 192.121.234.213 netmask 255.255.255.255
> >
> > lo:0 ?? Don't do this. Why are you trying to bind another IP to lo?
>
> a guy I talked to told me to do it, I have no other explaination.

It's simple to see why this is wrong. It's called "loopback", right? The 
packets loop back. You're wanting to route them outside. With enough 
NAT duct-tape and bubble-gum it could be made to work, but it's ugly.

> >> >> >> between box1 and box2 I have a OpenVPN tunnel (endpoints
> >> >> >> 10.1.0.1 and 10.1.0.2).
> >
> > Why these IP's? You could simplify by using the remote static IP as
> > the IP for your home endpoint. IINM you wouldn't need NAT at all.
> >
> > Remote eth0: 192.121.234.212 netmask 255.255.255.240
> > Remote tun0: 192.121.234.212 netmask 255.255.255.240
> > Home tun0 192.121.234.213 netmask 255.255.255.240
> >
> > When something comes in on eth0 with a destination IP of
> > 192.121.234.213, your kernel knows it needs to go out tun0. If
> > routing is enabled and nothing blocking it in table filter chain
> > FORWARD, out it goes.
> >
> > What you are talking about is indeed possible. I did it myself
> > before figuring out the better way of doing it. :) You need to do
> > both SNAT and DNAT.
>
> Yeah, your solution was much better than mine. :-p
> If I understand you right, the only thing I have to do is to edit my
> openvpn-config and restart the tunnel? No edit in routing tables? And

Yes.[1]

> I have to set up 192.121.234.213 as an alias of eth0 at the remote
> box, right?

Actually I think not. As long as the upstream router knows to send 
192.121.234.213 through you, and you have a route to 192.121.234.213, I 
think that's enough. Try it and see? I have a machine where I'll try it 
too.

[later: I tried it]

The problem, I believe, is the routing on the return. Packets get in, 
but replies are trying to go out through the default gateway.

The answer is indeed, either NAT or MARK/--set-mark/fwmark (iproute2). 
I'll mess around a bit more and let you know what I find. You are, of 
course, welcome to do the same. :)

[even later: success]

Sorry to take away your chance to shine, but I have solved this. :) It 
was easier than I thought.

Home machine: LAN address 192.168.6.6/24 (no direct external interface)
Remote machine: x.y.z.112/29

Home openvpn config:
remote x.y.z.112
ifconfig x.y.z.116 192.168.6.248
ifconfig-nowarn

Remote openvpn config:
remote my.dynamic.dnsname
ifconfig 192.168.6.248 x.y.z.116

Started both ends of the tunnel. At home:
# echo 64 tunnel >> /etc/iproute2/rt_tables
# ip rule add from x.y.z.116 table tunnel
# ip route add default via 192.168.6.248 table tunnel
# ip route flush cache
(These should go in an openvpn --up script.)

As it happens, no explicit iptables rules were needed! YMMV depending 
upon the rules you have, of course. I do the firewalling on the remote, 
so only allowed services and replies to my own connections go through 
the tunnel. I had to make sure the filter/FORWARD chain on the remote 
would pass the packets I needed. Here at home, filter/INPUT accepts 
anything from that interface.

Thanks for the idea, and for the learning experience! I left in the 
process, including the incorrect hypotheses. Please note that the 
affirmative reply above about NOT needing to edit routing tables was 
not correct.

[large snip]
> established an IRC session. Everything worked. But when I tried to
> reach the box via HTTP the connection freezed.

These things, it's hard to say what they might be. Sounds like a 
possible physical layer problem. It doesn't sound likely to be a 
netfilter issue.



[1] Believed at the time, later proven untrue.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

