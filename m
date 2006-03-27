From: "=?ISO-8859-1?Q?Mart=EDn_Ferrari?=" <martin.ferrari@gmail.com>
Subject: Lost packets - strange problem
Date: Mon, 27 Mar 2006 17:33:43 -0300
Message-ID: <b9800b70603271233p2507e071k317dde92dc72448d@mail.gmail.com>
References: <1143483717.776638.226080@u72g2000cwu.googlegroups.com>
	<b9800b70603271128h7d0372b9ie7abf79780420042@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b9800b70603271128h7d0372b9ie7abf79780420042@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

(x-posted in linux-net mailing list)

Hi!

I'm having a very strange problem. I have already tested a *lot* of
things before asking, and I still have no clue of what's happening.

I have 6 linux boxes acting as firewalls/routers. They have been using
similar configurations and netfilter rules for 4 years, when I
installed the first of these. Some of them route more than 10 Mbps
between interfaces, 50000+ connections tracked with netfilter, traffic
shaping, NAT, and stuff, and they don't even blink.

BUT, two of them started giving headaches, they don't have the highest
usage, but they lose packets (in any interface) up to 80%, sometimes
softirqd eats all the cpu, and you cannot even connect to the boxes.
This does not happen from the very first day, and not all the time!

The NICs are mostly 3c905*(a mix of them), also some e100 and 3c940
(sk98lin). The troublesome computers have 3c905 and 3c940, but I do
not find any pattern on hardware.

Also, the error count is 0 in the internet interface of the host which
fails the most.

I tried rewriting the rules, turning off traffic shaping, changing
NICs, then changing ALL the hardware (they have some very nice and fast
hardware now). I even migrated from debian woody with 2.4.x  kernels to
debian sarge with 2.6.8 kernels and the problem is still the same. I
don't really know what to do.

I suspect that this could be triggered by some internet DoS attack, but
I didn't find anything special (I have already solved the recursion
problem with DNS servers). The 6 servers receive loads of dumb attacks
all the time.

Any help would be greatly appreciated!

--
Mart=EDn Ferrari

