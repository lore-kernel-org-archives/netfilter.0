From: Jason Opperisano <opie@817west.com>
Subject: Re: Invalid Argument
Date: Mon, 06 Sep 2004 16:18:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094501893.1745.29.camel@wolfpack.ljm.dom>
References: <004701c4940f$c155c320$0800a8c0@supreme>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004701c4940f$c155c320$0800a8c0@supreme>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="utf-8"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-06 at 08:48, Jo=C3=A3o Carlos Garcia wrote:
>     iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $EXTIF -j SNAT =
--to-source $EXTIP
>=20
> When the script run the last rule ( NAT ), occurs an error : iptables i=
nvalid argument.
> I want that the iptables change the source IP address ( 192.168 ) to hi=
s ip address ( 172.16.0.3 ) to all connection to Internet
>=20
> Could anyone help me ?
> Thanks in advanced
> Jo=C3=A3o Carlos

my guess is you've compiled a custom kernel, possibly applied some POM
patches, and you have not recompiled the iptables userspace utilities.

-j

--=20
Jason Opperisano <opie@817west.com>


