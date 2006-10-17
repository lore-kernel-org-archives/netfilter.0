From: Eric Leblond <eric@inl.fr>
Subject: Re: Ip_conntrack enhancement idea
Date: Wed, 18 Oct 2006 00:07:56 +0200
Message-ID: <1161122877.4002.30.camel@localhost.localdomain>
References: <F1B471B6CE5CFA458DFED6C7669D039706C21D75@usplm234.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F1B471B6CE5CFA458DFED6C7669D039706C21D75@usplm234.amer.corp.eds.com>
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
To: "Wilson, Richard E" <richard.wilson@eds.com>
Cc: netfilter@lists.netfilter.org

Le mardi 17 octobre 2006 =E0 16:46 -0500, Wilson, Richard E a =E9crit :
> All,
>=20
> I am having some issues with servers that run caching DNS and iptables
> -- the ip_conntrack table overflows resulting in dropped packets.  I am
> wondering what the value is in tracking connections whose source and
> destination are both 127.0.0.1 -- would it be possible to flag such
> packets so that no ip_conntrack table entry gets created for them at
> all?  For my servers this can represent a third of the total tracked
> connections (ip_conntrack_max is set at 65536 on systems with 2GB of
> RAM).

As I said in a previous mail you can really increase this value. The
default setting of conntrack size is computed to firewalling server and
it has to be increased to be used on server used as gateway.=20

>=20
> I know this can be addressed other ways -- I am working to get the
> server upgraded from its current kernel (2.4.21) to something newer so
> that I can change the default ip_conntrack timeout value (I don't really
> want to increase the ip_conntrack_max), but thought I should bring this
> up.  Perhaps in other situations it's desirable to track localhost
> connections, but I can't think of a good reason why.

You can use the NOTRACK target to do so.

BR,

>=20
> Thanks,
>=20
> Richard Wilson
>=20
> richard dot wilson at eds dot com
>=20
>=20


