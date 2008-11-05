From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: 2 ips, same port, forward to original ip but different port
Date: Wed, 05 Nov 2008 10:42:07 +0100
Message-ID: <49116A6F.1070508@plouf.fr.eu.org>
References: <54857.29141.qm@web45902.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54857.29141.qm@web45902.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

=46u-Tung Cheng a =E9crit :
>=20
> $IPTABLES -A FORWARD -p tcp --destination-port 80 -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -j REDIRECT -p tcp --destination-port
> 80 --to-ports 12080
>=20
> Now what I need to happen is that requests coming into ip1:80 goto
> ip1:12080 and ip2:80 goto ip2:12080.  What seems to be happening is
> that all requests coming into 80 are going to ip1:12080.

If I understand correctly, you want to change only the destination port=
,=20
not the destination address. But the iptables manpage says that the=20
REDIRECT target replaces the destination address with the primary=20
address of the incoming interface, so it may not be suitable for your=20
purpose.

You can use the DNAT target instead. Either :

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to :12080

will translate the destination port 80 into 12080 regardless of the=20
destination address and without changing it,

or :

iptables -t nat -A PREROUTING -d $ip1 -p tcp --dport 80 \
   -j DNAT --to $ip1:12080
iptables -t nat -A PREROUTING -d $ip2 -p tcp --dport 80 \
   -j DNAT --to $ip2:12080

will translate only ip1:80 into ip1:12080 and ip2:80 into ip2:12080.

PS: What is the purpose of the first rule in the FORWARD chain ?
