From: =?ISO-8859-1?Q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>
Subject: Re: DNAT to localhost
Date: 13 Nov 2002 23:14:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037225641.10536.1.camel@lilleulv>
References: <1037219719.6450.5.camel@tux.go-nix.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037219719.6450.5.camel@tux.go-nix.ca>
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
To: netfilter@lists.netfilter.org

On Wed, 2002-11-13 at 21:35, Nix N. Nix wrote:
> Hi ! I sent the following message to netfilter@lists.samba.org as well,
> so, if it hits this list twice, please forgive me.
>=20
> Here it is:
>=20
> Why doesn't this work ?
>=20
> /sbin/iptables -t nat -A PREROUTING -p udp --destination 192.168.1.1/32
> --dport 80 -j DNAT --to-destination 127.0.0.1:8080

[snip]

> So, is there any way to forward TCP ports from local interfaces to the
> loopback interface ?

Change from "udp" to "tcp" in your iptables line above.

When you debug your iptables rules, turn on full logging to see what is
being dropped.

Hope this helps,

Bj=F8rn


