From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: multiple pptp clients behind one machine
Date: Wed, 9 Mar 2005 13:50:53 +0100 (CET)
Message-ID: <18086.212.238.226.227.1110372653.squirrel@212.238.226.227>
References: <Pine.LNX.4.58.0503081436210.29834@sloth.wcug.wwu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.58.0503081436210.29834@sloth.wcug.wwu.edu>
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

> I have compiled a 2.6.9 kernel with the pptp patches.  When I try out t=
he
> new modules GRE is blocked on the firewall.
>
> Shorewall:net2all:DROP:IN=3Deth0 OUT=3D
> MAC=3D00:a0:cc:56:b8:5c:00:10:67:00:1f:04:08:00 SRC=3Dx.x.48.2
> DST=3Dx.x.116.164 LEN=3D61 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D36900 D=
F PROTO=3D47
>
> I'm running debian unstable.  I patched and installed the new version o=
f
> iptables.  I'm using the patch-o-matic-ng-20050307.tar.bz2 and most rec=
ent
> iptables source.
>
> The modules load OK:
> root@router-jl:~# lsmod
> Module                  Size  Used by
> ip_nat_proto_gre        3264  0
> ip_nat_pptp             4512  0
> ip_conntrack_pptp       6336  1 ip_nat_pptp
> ip_conntrack_proto_gre     5632  2 ip_nat_pptp,ip_conntrack_pptp
>
>
> Do you have any ideas, or need more information that I can provide?

You are not telling anything about your ruleset.
Do you have a rule that allows the gre protocol to be forwarded ?

$IPT -A FORWARD -p gre [...] -j ACCEPT


Gr,
Rob



