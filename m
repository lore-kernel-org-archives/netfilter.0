From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Newbie Question...
Date: Wed, 26 Mar 2003 13:53:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303261353.12826.netfilter@newkirk.us>
References: <OE60D1dBUUjBzZjxmyZ0001e4f6@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OE60D1dBUUjBzZjxmyZ0001e4f6@hotmail.com>
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
To: Carlos Cajina <cecajina@hotmail.com>, netfilter@lists.netfilter.org

On Wednesday 26 March 2003 12:37 pm, Carlos Cajina wrote:
> Hi, I'm Carlos from Nicaragua but currently living in Mexico... I just
> signed up to this list and already have one question in mind: Is it
> possible to specify a particular IP address range when creating
> filtering rules? If so... where can I find the info that talks about
> it?

Yes.  For example, to match a single source IP use "-s a.b.c.d", while to=
=20
match a range of IPs you have to be able to match with a mask, like "-s=20
a.b.c.d/24" or "-s a.b.c.d/255.255.255.0" to match a.b.c. and anything=20
for d.  Destinations are matched with "-d a.b.c.d/m" the same way. =20

If you need to match an 'odd' range of IPs, that cannot be fitted to a=20
single ip/mask test, then it is usually necessary to use multiple rules. =
=20
IE, if you need to match 192.168.0.4-192.168.0.6, then you can match .4=20
and .5 with 192.168.0.4/31, but .6 will need a separate rule.  (unless=20
you don't mind catching .7 as well, in which case a mask for 30 bits=20
instead of 31 would work for all 4 IPs)

http://iptables-tutorial.frozentux.net is the best tutorial around for=20
iptables.

j

> Best regards!!!!


