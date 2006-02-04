From: Chris Baechle <bangular@gmail.com>
Subject: Re: non-masquerade routing (nfcan: addressed to exclusive sender
	for this address)
Date: Sat, 4 Feb 2006 13:11:01 -0500
Message-ID: <af2c99310602041011y5886a8n6feda857f3102d39@mail.gmail.com>
References: <af2c99310602040722g71cc5491i51fa411e47bcd02f@mail.gmail.com>
	<20060204162603.GA26094@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060204162603.GA26094@salty>
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

> Um, perhaps this is called 'routing'.
>
> Once the route is set up,
> and routing is turned on - something like:
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> all the *firewall* needs is permission to forward the packets
> from one network/interface to the other.
>

Turns out the problem was just with a switch. Nothing to do with the linux =
box.

