From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: How to set netfilter variables on Kernel???
Date: 29 Dec 2004 13:26:03 +0100
Message-ID: <1104279281.23103.6.camel@nostromo.bgsecm.com>
References: <41D1934C.6694.24923ECC@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D1934C.6694.24923ECC@localhost>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mar, 28 de 12 de 2004 a las 23:09, Jorge Agrelo escribi=C3=B3:
> Does anybody can help me to set or leave by default the following netfi=
lter=20
> variables at a Border/Firewall running kernel 2.6.9 and iptables 1.2.11=
 ???
>=20
> ip_conntrack_buckets
> ip_conntrack_generic_timeout
> ip_conntrack_icmp_timeout
> ip_conntrack_max
> ip_conntrack_tcp_timeout_close
> ip_conntrack_tcp_timeout_close_wait
> ip_conntrack_tcp_timeout_established
> ip_conntrack_tcp_timeout_fin_wait
> ip_conntrack_tcp_timeout_last_ack
> ip_conntrack_tcp_timeout_syn_recv
> ip_conntrack_tcp_timeout_syn_sent
> ip_conntrack_tcp_timeout_time_wait
> ip_conntrack_udp_timeout
> ip_conntrack_udp_timeout_stream
>=20
> Thanks in advance

The easiest way to set this variables it's to create a
script in /etc/rc.d/init.d and add it to the runlevel
you are using with chkconfig or similars. You can also
add some lines to /etc/rc.d/rc.local to set the
variables.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


