From: "Nix N. Nix" <nix@go-nix.ca>
Subject: Re: DNAT to localhost
Date: 13 Nov 2002 18:53:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037231613.6791.13.camel@tux.go-nix.ca>
References: <1037219719.6450.5.camel@tux.go-nix.ca>
	 <1037225641.10536.1.camel@lilleulv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037225641.10536.1.camel@lilleulv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>
Cc: netfilter@lists.netfilter.org

On Wed, 2002-11-13 at 17:14, Bj=F8rn Ruberg wrote:
> On Wed, 2002-11-13 at 21:35, Nix N. Nix wrote:
> > Hi ! I sent the following message to netfilter@lists.samba.org as wel=
l,
> > so, if it hits this list twice, please forgive me.
> >=20
> > Here it is:
> >=20
> > Why doesn't this work ?
> >=20
> > /sbin/iptables -t nat -A PREROUTING -p udp --destination 192.168.1.1/=
32
> > --dport 80 -j DNAT --to-destination 127.0.0.1:8080
>=20
> [snip]
>=20
> > So, is there any way to forward TCP ports from local interfaces to th=
e
> > loopback interface ?
>=20
> Change from "udp" to "tcp" in your iptables line above.

Sorry, I'm an idiot.  That line was from one of my debugging efforts.=20
Of course that's supposed to be tcp.  The reason it is udp:

I wrote a util that would open a SOCK_DGRAM socket and bind it to a
specific interface, like 127.0.0.1:<some_port> or
192.168.1.1:<some_port> .  Thus, I had something listening on
localhost:8080/udp.  I added the rule, then tried this from a computer
on the 192.168.1.0/24 network (in bash):

echo -n 'Abracadabra' > /dev/udp/192.168.1.1/80

This had no effect.  It did have an effect without the rule and with my
util listening on 192.168.1.1:80 .

>=20
> When you debug your iptables rules, turn on full logging to see what is
> being dropped.

How do I do that ?

>=20
> Hope this helps,
>=20
> Bj=F8rn

Sorry about the misunderstanding.  I still need a solution, if somebody
happens to know it.


Thanks a lot !


