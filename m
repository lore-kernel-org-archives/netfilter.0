From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can iptables/ip6tables start and work in parallel (fwd)
Date: Thu, 14 Sep 2006 11:41:51 +0200
Message-ID: <450923DF.1080601@plouf.fr.eu.org>
References: <Pine.GSO.4.53.0609140244170.1024@compserv3>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.53.0609140244170.1024@compserv3>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Vidya Ravipati a =E9crit :
>=20
> 1)Can iptables and ip6tables run together on same linux machine.

Yes, of course. iptables and ip6tables are mostly independent, as IPv4=20
and IPv6 are on any dual stack machine (with restrictions due to=20
IPv4-mapped addresses).

> 2)I found out in redhat linux adminstration guide that Iptables cannot
> start along with Ip6tables.
> http://www.redhat.com/docs /manuals/linux/RHL-8.0-Manual
> /security-guide/ch-fw.html
> This is what it is mentioned in this page
> The IPChains and IP6Tables services must be turned off to use the IPTab=
les
> service with the following commands:
> Then how can we build a firewall for a machine which can be used both i=
n
> IPv4 and IPv6 networks.

That may be a specific RedHat restriction. I don't know RedHat at all=20
and use my own scripts to create iptables and ip6tables rulesets.

