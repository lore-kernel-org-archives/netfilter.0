From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: Firewalling non-IPsec connections
Date: Thu, 18 Dec 2003 12:59:36 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDCENIEKAA.mark@npsl.co.uk>
References: <3FE0D27B.9080900@hoeg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FE0D27B.9080900@hoeg.com>
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
To: Netfilter List <netfilter@lists.netfilter.org>

> so i have decided to make a small guide
> (i needed to learn docbook anyway so this seemed like a good chance)
> which can be found here:
>
> http://hoeg.org/lri/
>
Splendid, more information on this sort of thing is always useful.  I guess
2.6 is lagging a bit behind in the documentation stakes at the moment.

> then technically somebody else could tag
> the packets themselves before entering my system which would bypass the
> solution. and thats why i didnt take it further. can anybody shed any
> light on that?
>
The mark is just an internal tag in the kernel attached to the packet.  As
such, only the kernel ever adds or uses the mark, and it is not something
that can be automatically introduced by anything in a packet that someone
sends to you -- in other words, it's quite safe.

As soon as the freeswan users list is back, I'll see if I can get help
figuring out how to match on the SPI (I'm using pluto for keying currently
as it's a lot less manual than racoon), which allows easy per tunnel
firewalling.

> but in order for the search engines to pick up this message: racoon
> linux kernel 2.6 ipsec vpn tunnel firewall iptables netfilter
>
Google picks up a lot of russian pages for that at the moment :)


