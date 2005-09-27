From: Nick Taylor <nickt@lightlink.com>
Subject: RE: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 18:29:33 -0400 (EDT)
Message-ID: <Pine.GSU.4.58.0509271801200.25028@adore.lightlink.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2E72@farmer.vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7742E2E72@farmer.vikus.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

<-------removed on topic discussion to rant off topic------>

> Your internet address is 143.233.222.77 and your network mask is
> 255.255.255.192. That 192 means you only have 64 IPs in your network. If
> you don't believe me then google CIDR masks for yourself like I did a
> couple years back. Now supposing that your network address is
> 143.233.222.76 (and it is probably 143.233.222.64), you run out of IPs
> at 143.233.222.139, which is your network's default broadcast address.
> This is quite far away from 143.233.222.253 so your packet never gets to
> the intended host.
>

So many people can't understand binary, and it's statements like the one
above that make this so confusing for people.  There's no such thing as a
"network address" that doesn't fall on a subnet boundry.  The math is so
simple, please try to understand, it will make the world a better place:

143.233.222.77 NETMASK 255.255.255.192

In binary the netmask reads:
11111111.11111111.11111111.11000000

This means that there are 64 addresses in the network, but it's much more
specific.  Try to understand *which* 64 addresses, and *why*.

What exactly is a netmask then, you may ask?

Computer X wants to talk to computer Y

X must know whether Y is on the same network as X.  If they are on the
same network, X must use local delivery.  Otherwise, X must route the
message to Y.  X knows its own address and its own netmask, and Y's
address, and that's all it needs.

X checks to see if it's network address is the same as Y's network
address.  If the network addresses are the same, then they must be on the
same network.

Any bit which is set in the netmask must match in X and Y's address.

So, the network address in the example above, given the ip address and
netmask HAS TO BE:143.233.222.64.  No other "network address" is
meaningful.  Setting the "network address" to .76 would mean in binary:
01001100, but the netmask ends:
11000000, which means the network address has to be one of the following:

00000000 =   0,
01000000 =  64,
10000000 = 128, or
11000000 = 192.

These are the ONLY four network addresses that make sense
with this netmask.  You'll notice that if we extend the netmask one more
bit to the right, 11100000 = 224, the possibilities are now:


00000000 =   0,
00100000 =  32,
01000000 =  64,
01100000 =  96,
10000000 = 128,
10100000 = 160,
11000000 = 192,
11100000 = 224

