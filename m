From: Miguel Angel Amador L <amador@puc.cl>
Subject: Re: bad tcp packets
Date: Tue, 23 Nov 2004 09:42:24 -0300
Message-ID: <1101213743.32475.37.camel@JOKER.INFOWORLD.CL>
References: <web-23112413@infinito.it>
Reply-To: amador@puc.cl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-23112413@infinito.it>
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



El mar, 23-11-2004 a las 09:18, hamals@infinito.it escribi=C3=B3:
> Hello to everyone
>=20
> I'm reading "Iptables Tutorial 1.1.19" by Oskar=20
> Andreasoon, and I cant understand these bad packets rules
>=20
>=20
> $IPTABLES -N bad_tcp_packets
> #
> #
> # bad_tcp_packets chain
> #
> $IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK=20
> SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset

May be that you can't got the three flags on, in the same packet


> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state=20
> --state NEW -j LOG \
> --log-prefix "New not syn:"

> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state=20
> --state NEW -j DROP

May be, if the packet haven't the syn flags on, the packet is not new

> someone could explain me why that are bad tcp packets?
I don't secure, but i thing that is this.
regards

 Miguel Amador

> Thanks
>=20
> _______________________________________
> Connessione ed e-mail gratuita da 10 mb
> consultabile tramite web e tramite pop.
> www.infinito.it vieni a scoprire tutti=20
> i nostri servizi!
>=20
> http://www.infinito.it/xmail
>=20
>=20


