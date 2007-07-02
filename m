From: Clister <clist@uah.es>
Subject: Re: can this be written as one rule ?
Date: Mon, 2 Jul 2007 22:03:14 +0200
Message-ID: <200707022203.14830.clist@uah.es>
References: <4687C1D4.3090704@gatworks.com>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4687C1D4.3090704@gatworks.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Did you try ipsets?

Just create a ipset  populate it and then

i$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -m set --set $IPSET src -j D=
ROP

et voila!!
Just try this:
http://ipset.netfilter.org/

or dig on the netfilter home page

Regards,
El Domingo, 1 de Julio de 2007 17:01, U. George escribi=F3:
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.124.176.0/20 -j DR=
OP
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.124.32.0/20 -j DROP
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.127.64.0/17 -j DROP
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.128.94.0/24 -j DROP
> > $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.130.126.128/26 -j
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.132.194.0/24 =
=2Dj
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.139.164.0/24 =
=2Dj
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.139.198.0/24 =
=2Dj
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.141.9.0/24 -j
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.142.125.0/24 =
=2Dj
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.142.3.128/25 =
=2Dj
> > DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.145.21.128/25
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.146.201.0/=
24
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.152.32.0/24
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.153.78.0/24
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.153.98.0/24
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.155.196.0/=
25
> > -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.158.66.128/25 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE
> > -s 121.16.0.0/13 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE =
=2Ds
> > 121.224.0.0/12 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.24.0.0/14 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.254.15.0/24 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.32.0.0/14 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.36.0.0/16 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.36.64.0/18 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.51.0.0/16 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.54.208.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.54.224.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.55.128.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.55.144.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.55.160.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.55.64.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.68.0.0/14 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.88.32.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.88.64.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 121.96.0.0/15 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.0.128.0/17 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.100.48.0/20 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.169.0.0/19 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.169.100.0/23 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE =
=2Ds
> > 122.199.106.0/22 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE =
=2Ds
> > 122.199.90.0/23 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.2.0.0/15 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s
> > 122.202.128.0/17 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE =
=2Ds
> > 122.254.128.0/17 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_IFACE =
=2Ds
> > 122.32.0.0/12 -j DROP $IPTABLES -t nat -A PREROUTING -i $INET_I
>
> And so on ?

=2D-=20
=2D---------------------------
Universidad de Alcal=E1 (UAH)
=2D---------------------------

