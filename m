From: "Fonz" <shorewall@incisoft.com>
Subject: 2 internet ip numbers on eth0
Date: Fri, 28 Feb 2003 22:04:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c2df6c$f964a5a0$fe00000a@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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


Hi,

I am migrating from one ISP to another, and would like to run both
simultaneously for a while.

So:
	(both netmask 255.255.255.248)
[ISP1] 24.106.62.180	[ISP2] 209.181.237.230
		|				|
		|				|
		\				/
		 -----[    HUB	]-----
				|
				|
		 -------- eth0 ---------
		|	Linux FW/Server	|
		 ---------eth1 ---------
				|
				|
			[    HUB	]
				|
			10.0.0.x/255.255.255.0

The default IP on eth0 in my RedHat 7.2 box is ISP1 and it's default =
route
to ISP1's gateway.

I am getting rid of ISP2 in the future. Until then, I want to either =
forward
all request coming in on ISP2 to ISP1 so all ISP1 firewall rules will =
apply,
or just maintain separate rules for them, whichever is easier.

So both internet ip's are on eth0, and I tried manually setting ISP2 as =
an
alias for ISP1, giving me eth0 and eth0:0 under ifconfig. This allows me =
to
ping both ip's from my FW, but only ISP1 is pingable from the internet.
I am assuming it is a routing issue, where requests coming in on ISP2 =
try to
go back out via ISP1's default route.

I am using iptables 1.2.6a (also shorewall.net's shorewall 1.3.14)

I have spent a week reading docs and about routing, but am too much of a
rookie to figure this out. So I am hoping someone can help me out more =
than
referencing to more docs I don't understand.

I tried DNATting one internet ip to another, not knowig if that is even
possible, using something like

Iptables -t nat -A PREROUTING -d 209.181.237.230=20
	-j DNAT --to-destination  24.106.62.180

But to no avail. Iptraf shows I am hitting 209.181.237.230 on eth0, but =
the
pinging/telnetting clients on the internet never get a reply from my
machine.

I'd appreciate it extra much if I'd get a CC on my shorewall at incisoft =
dot
com address.

Thanks,
Fonz


