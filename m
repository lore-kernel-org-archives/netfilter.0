From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: is it possible to nat to the routed IP?
Date: Tue, 19 Dec 2006 00:06:23 +0100
Message-ID: <45871EEF.3070008@plouf.fr.eu.org>
References: <000f01c720e8$f75b5d50$0202fea9@tanjian>	<4583D232.1040402@plouf.fr.eu.org>
	<ad41208c0612170208h70c43da2ldb684d1ccbf76767@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ad41208c0612170208h70c43da2ldb684d1ccbf76767@mail.gmail.com>
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

Zhen Zhou a =E9crit :
> On 12/16/06, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
>>
>> Insert this kind of rule before the generic SNAT rule :
>>
>> $ipt -t nat -A POSTROUTING -o <interface> -s 192.168.2.208 -p <proto> =
\
>>    [--dport <port>] -j SNAT --to 210.153.22.y
>=20
> Thanks for your help, but the issue is still there, so I post what I
> add iptables rules in the system then we could analyze where is the
> issue:
>=20
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -m state --state NEW -d 192.168.3.208 -p tcp
> --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 -j
> DNAT --to 192.168.3.208

So far so good.

> iptables -t nat -A POSTROUTING -o 210.153.22.y -s 192.168.3.208 -p tcp
> --sport 80 -j SNAT --to 210.153.22.y

The -o (output interface) option takes a network interface name, not an=20
IP address. Also, why do you match on source port 80 ? NAT rules can=20
match only packets in the NEW state opening a new connection, but TCP=20
packets with source port 80 are usually return packets (thus in=20
ESTABLISHED state) from a web server.

> I assign:
> ip addr add 210.153.22.y dev eth1 label eth1:1
>=20
> in the another hand, I want to track the network link when I access
> web to some sites, nothing show me via:
> netstat -ant | grep 192.168.3.208
> nothing .....

netstat shows only the state of local sockets, not forwarded=20
connections. To see the the state of all tracked connections (incoming,=20
outgoing and forwarded), use :

cat /proc/net/ip_conntrack

