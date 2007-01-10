From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: REDIRECT ports in forward chain
Date: Wed, 10 Jan 2007 22:28:29 +0100
Message-ID: <45A55A7D.1030604@plouf.fr.eu.org>
References: <001201c734e9$8052c1c0$cf00000a@maku>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001201c734e9$8052c1c0$cf00000a@maku>
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

marko a =E9crit :
>=20
> is it possible to change the --dport on a packet that is forwarded thro=
ugh?

You cannot do NAT in the FORWARD chain. However you can do it in the=20
PREROUTING chain.

> for example, two pc's and internet in between. both pc's have linux as=20
> gateways. both gateways do NAT. now, i'd like to access port 8080 on=20
> machine A from machine B. for example telnet X.X.X.X 8080. normally i'd=
=20
> have to do a DNAT on machine A's gateway for that port, right? but i=20
> would like the port to change during internet. like i type telnet to=20
> port 8080, but linux redirects it to port 18080 on machine B's network=20
> and on machine A's gateway i'd have to a DNAT from 18080 to 8080. so i'=
d=20
> telnet to 8080 seemingly, the linux B redirects it to 18080 and it=20
> travels over the net to linux A to port 18080 and the it is DNAT'ed to=20
> 8080 to machine B.

No problem, DNAT in the PREROUTING chain can handle that.

> but the redirection doesn't work. as i understood if=20
> i redirect on nat table's prerouting chain the packet the travels to=20
> INPUT chain instead on FORWARD chain.

REDIRECT is intended to redirect connections to the local host, this is=20
not what you want to do. You need the DNAT target instead. DNAT can do=20
destination address and/or port translation. For instance, on B's gateway=
 :

iptables -t nat -A PREROUTING -d $original_dst_ip -p tcp --dport 8080 \
   -j DNAT -to $apparent_dst_ip:18080

If you don't want to change the destination address, just remove=20
"$apparent_dst_ip"). If you want to catch any connection on port 8080,=20
just remove "-d $original_dst_ip".

And on A's gateway :

iptables -t nat -A PREROUTING -d $apparent_dst_ip -p tcp --dport 18080 \
   -j DNAT --to $final_dst_ip:8080

