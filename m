From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Routing from private to bridge
Date: Sat, 22 Oct 2005 12:07:22 +0300
Message-ID: <3063e50510220207w1f56a36brf3f6d476df60c0e2@mail.gmail.com>
References: <43598481.8040306@internode.on.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43598481.8040306@internode.on.net>
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
To: Tom Gaudasinski <cetus@internode.on.net>
Cc: netfilter@lists.netfilter.org

If you use bridge, doesn't it mean the gateway of public ips is located on
your ISP or DSL modem? Because this way the
120.40.60.193<http://120.40.60.193>also needs to know about
192.168.1.0 <http://192.168.1.0> to forward packets to you. Why don;t you
just ask an ip from your ISP and that subnet will be routed to that ip. Thi=
s
way you won't need bridge.

On 10/22/05, Tom Gaudasinski <cetus@internode.on.net> wrote:
>
> Greetings,
> I have a problem in regards to the routing i've set up. I have a
> public subnet bridged from my ISP(DSL), it's a full bridge. So in order
> to use this subnet i have created a bridge out of two eth interfaces so
> that i may also firewall what will be behind the router. In addition to
> this I have a private subnet (192.168.1.x) that I NAT to the public IP
> of the router. My setup looks like this:
>
> DSL Modem (in bridge mode)
> |
> / eth0 \
> <br0> 120.40.60.194/29 <http://120.40.60.194/29>
> \ eth1 /
> / \__ Publically addresses machines
> eth2
> 192.168.1.1___Privately NATted machines
>
> So eth0 and eth1 are part of the bridge (which has 1 ip address), and
> eth2 has a private address. eth0 plugs directly into the dsl modem, eth1
> into a switch that contains publically addressed computers and eth2
> logically so as well. I've set the rules up so that the users behind
> eth2 get natted and the public users also get internet. This works, what
> doesn't work however is that the 192.168.1.x users cannot communicate
> with the publically addressed users through the router. Even when the
> firewall has been cleared out (of natting rules) they still cannot ping
> or communicate. It seems there's a different procedure for routing to a
> bridge. my route -n output is:
>
> Kernel IP routing table
> Destination Gateway Genmask Flags Metric Ref Use
> Iface
> 120.40.60.192 <http://120.40.60.192> 0.0.0.0 <http://0.0.0.0>
> 255.255.255.248 <http://255.255.255.248> U 0 0 0 br0
> 192.168.1.0 <http://192.168.1.0> 0.0.0.0 <http://0.0.0.0> 255.255.255.0<h=
ttp://255.255.255.0>U 0 0 0 eth2
> 0.0.0.0 <http://0.0.0.0> 120.40.60.193 <http://120.40.60.193> 0.0.0.0<htt=
p://0.0.0.0>UG 0 0 0 br0
>
> How can i get the private LAN users to route to the publically bridged
> subnet?
>
> Thankyou.
>
>
>
>


--
Bla bla
