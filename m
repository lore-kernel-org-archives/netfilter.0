From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 15:16:35 -0500
Message-ID: <1110744995.16492.6.camel@hubcap.ljm.dom>
References: <Pine.GSO.4.62.0503131105020.8331@shaka.acc.umu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.GSO.4.62.0503131105020.8331@shaka.acc.umu.se>
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

On Sun, 2005-03-13 at 05:11, M=C3=A5rten Segerkvist wrote:
> I tried to log the packets reaching POSTROUTING with
>=20
> > iptables -t nat -A POSTROUTING -j log
>=20
> but none of them showed up in the syslog; that's a minor? problem thoug=
h.

fixating on what does/doesn't get logged in NAT POSTROUTING is
counter-productive to the task at hand.  if you wish to log POSTROUTING
packets for the purposes of troubleshooting, please do it in MANGLE:

  iptables -t mangle -A POSTROUTING -j LOG --log-prefix "POSTROUTED: "

> I'd be most grateful for any suggestions!

the wire never lies:

run:
  tcpdump -n -nn -p -i wlan0 icmp

and ping something.

run:
  tcpdump -n -nn -p -i eth0 icmp

and ping something.

from looking at the counters, it looks like the packets are making it
out of the gateway, but not making it back to it for whatever reason...

-j

--
"Dear Mr. President, there are too many states nowadays, please
 eliminate three. I am not a crackpot."
	--The Simpsons


