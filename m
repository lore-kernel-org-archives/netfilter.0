From: "Jesse Gordon" <jesseg@nikola.com>
Subject: SNAT not working on locally generated packets if they're the result
	of an incoming connection on other network card.
Date: Wed, 16 Nov 2005 16:49:56 -0800
Message-ID: <017b01c5eb10$d48642e0$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Greetings!

I am trying to do something a bit nonstandard I know -- but iptables is 
really cool and I think it can do it anyway, but I haven't figured out how.

I have a linux box with two network cards -- one with a real routable IP 
connected to the internet, and the other on the LAN with of course an IP of 
10.0.0.5.

Now there's another firewall with two network cards -- one on LAN, and the 
other on the internet, just like the first, except different IPs, with a LAN 
ip of 10.0.0.27.
Both are set up as NAT /masq boxes.

For a third party (i.e. client) on the LAN, they can use either as a default 
gateway.

Also, each nat box has a default gateway of our upstream provider -- in 
other words, neither NAT box has the other for a default gateway -- they 
both point directly to the same upstream default gateway.

Now, the 10.0.0.27 NAT box forwards incoming internet port 443 traffic to 
10.0.0.5 via the LAN.
10.0.0.5 runs apache.

The problem is when a connect attempt to port 443 is made on the real 
internet IP of the 10.0.0.27 box, the 10.0.0.5 box sends it's response 
packets out it's internet NIC,
with a source address of 10.0.0.5, because the reply packet's destination 
address is the routable IP of the calling party. (As it should be.)

I see no way to make 10.0.0.5 send replies back to 10.0.0.27 to solve the 
problem, but it should be simple to
use iptables to catch all packets leaving the internet NIC with a source IP 
of 10.0.0.5, and rewrite the source IP to that of 10.0.0.27 box.

In other words, packets coming in would come through the 10.0.0.27 box, and 
packets going out would go out through the 10.0.0.5 box's internet NIC, but 
with a spoofed source address of the 10.0.0.27's internet NIC.

This should work I think, and would solve my problem.

I tried a bunch of different things, and did manage to get it to rewrite the 
source IP of all other traffic going out the internet NIC, but not these 
replies -- they still went out the internet port with a from address of 
10.0.0.5, which probably looks really weird to the calling party  ha ha ha.

The stuff I was trying was along the lines of:

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 222.222.222.222

(Of course in the end I wouldn't be rewriting _everything_, but I just used 
this to verify that it did work for other traffic as I wished, and even 
through it was very broad, it didn't catch the intended traffic.)

Sure enough, anything that went out eth1 had a source address of 
222.222.222.222, including locally generated packets like ping google.com, 
except those packets which were
the replies from within as a result of a connection which was coming in over 
eth0.

Hope that makes sense.

My question is, I guess, How do I make it rewrite the source to even those 
packets that are the local apache's reply to an incoming connection which is 
coming in over the other ethernet port?

In the mean time, we just set the 10.0.0.27 box to rewrite source ports on 
the incoming, so 10.0.0.5 thinks that 10.0.0.27 is actually the source of 
the connection -- which throws out all ability for 10.0.0.5 to know what IP 
is _really_ connecting.

Thanks very much!

Jesse Gordon

Nikola Engineering Inc.
224 W. Washington St.
Suite 104
Sequim, WA 98382-3371
Tel  (360)582-1051
Fax (360)582-1104




