From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into
 nftables
Date: Wed, 19 Aug 2020 09:58:32 +0200
Message-ID: <20200819075832.GA3994@salvia>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com>
 <CAKcfE+anbh1OoHt7vgyYRt89J-fjsKK48Fzy8SCm3RP=HQQcOw@mail.gmail.com>
 <32610365.DCq6cjG4UW@deimos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32610365.DCq6cjG4UW@deimos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Nirgal =?iso-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Cc: Balazs Scheidler <bazsi77@gmail.com>, netfilter@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 01:08:43PM +0200, Nirgal Vourg=E8re wrote:
> On Tuesday, 18 August 2020 11:18:50 CEST Balazs Scheidler wrote:
> >> Does any one know the proper equivalent to
> >>     iptables -t mangle -A PREROUTING -m socket --transparent -j MARK -=
-set-mark 1
> >> using nft?
> >
> > The original iptables "socket" match had an extra check so that it woul=
dn't
> > match listener sockets, at least by default (that is if --nowildcard is=
 not
> > specified).
> >=20
> > I don't see however how "outbound masqueraded connection" could be
> > impacted. The "socket transparent 1" expression should require that the
> > socket being matched has IP_TRANSPARENT setsockopt set. Are those
> > connections also initiated by haproxy?
> >=20
> > In any case, I think the check to ignore wildcard bound listener socket=
s is
> > definitely missing, however I am not sure how to properly add it to
> > nftables. If I added it to the socket match implementation that might b=
reak
> > a few currently well behaving use-cases. @pablo@netfilter.org
> > <pablo@netfilter.org> can you please advise? This is the check that is =
in
> > iptables -m socket:
> >=20
> >                 wildcard =3D (!(info->flags & XT_SOCKET_NOWILDCARD) &&
> >                             sk_fullsock(sk) &&
> >                             inet_sk(sk)->inet_rcv_saddr =3D=3D 0);
> >=20
> > And then if --transparent is used, these sockets are not accepted / the
> > rule does not match.
>=20
> That's it I guess:
>=20
> I tried adding --nowildcard to my working iptables rules and I got the sa=
me error, https connections from the lan side are not masqueraded toward th=
e wan, but routed locally to the socket listening to *:443.
> (thanks tcptraceroute for the info)
>=20
> So basically
>     nft > socket transparent 1 meta mark set 1
> may be the equivalent of
>     iptables > -m socket --transparent --nowildcard -j MARK --set-mark 1
> while I'm looking for *not* having "--nowildcard".
>=20
> Any idea about how work around this? I was thinking of using the
> "fib" rules to match the wan side packets since they have a
> destination ip address that match one of the local address, while
> the wan bound packets don't.

I'll post this patch to netfilter-devel to add the missing logic.

--LZvS9be/3tNcYl/X
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="x.patch"

diff --git a/include/uapi/linux/netfilter/nf_tables.h b/include/uapi/linux/netfilter/nf_tables.h
index 42f351c1f5c5..fed3514395a5 100644
--- a/include/uapi/linux/netfilter/nf_tables.h
+++ b/include/uapi/linux/netfilter/nf_tables.h
@@ -1008,10 +1008,12 @@ enum nft_socket_attributes {
  *
  * @NFT_SOCKET_TRANSPARENT: Value of the IP(V6)_TRANSPARENT socket option
  * @NFT_SOCKET_MARK: Value of the socket mark
+ * @NFT_SOCKET_WILDCARD: Socket listener is bound to any address
  */
 enum nft_socket_keys {
 	NFT_SOCKET_TRANSPARENT,
 	NFT_SOCKET_MARK,
+	NFT_SOCKET_WILDCARD,
 	__NFT_SOCKET_MAX
 };
 #define NFT_SOCKET_MAX	(__NFT_SOCKET_MAX - 1)
diff --git a/net/netfilter/nft_socket.c b/net/netfilter/nft_socket.c
index 637ce3e8c575..7511640e513a 100644
--- a/net/netfilter/nft_socket.c
+++ b/net/netfilter/nft_socket.c
@@ -14,6 +14,23 @@ struct nft_socket {
 	};
 };
 
+static void nft_socket_wildcard(const struct nft_pktinfo *pkt,
+				struct nft_regs *regs, struct sock *sk,
+				u32 *dest)
+{
+	switch (nft_pf(pkt)) {
+	case NFPROTO_IPV4:
+		nft_reg_store8(dest, inet_sk(sk)->inet_rcv_saddr == 0);
+		break;
+	case NFPROTO_IPV6:
+		nft_reg_store8(dest, ipv6_addr_any(&sk->sk_v6_rcv_saddr));
+		break;
+	default:
+		regs->verdict.code = NFT_BREAK;
+		return;
+	}
+}
+
 static void nft_socket_eval(const struct nft_expr *expr,
 			    struct nft_regs *regs,
 			    const struct nft_pktinfo *pkt)
@@ -59,6 +76,13 @@ static void nft_socket_eval(const struct nft_expr *expr,
 			return;
 		}
 		break;
+	case NFT_SOCKET_WILDCARD:
+		if (!sk_fullsock(sk)) {
+			regs->verdict.code = NFT_BREAK;
+			return;
+		}
+		nft_socket_wildcard(pkt, regs, sk, dest);
+		break;
 	default:
 		WARN_ON(1);
 		regs->verdict.code = NFT_BREAK;
-- 
2.20.1


--LZvS9be/3tNcYl/X--
