From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: block 8080, but redirect from 80 to 8080
Date: Tue, 01 Aug 2006 12:46:56 +0200
Message-ID: <44CF3120.4080008@plouf.fr.eu.org>
References: <44CED45F.10208@xsoftware.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CED45F.10208@xsoftware.biz>
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

Dean Hiller a =E9crit :
> I would like block all traffic to port 8080 except that which was=20
> redirected in the nat table from port 80 to 8080.
> I have a default policy of DROP on incoming.  The following is what my=20
> iptables file currently has and this works, EXCEPT that 8080 is left=20
> open to anyone....
>=20
> *nat table.....
> -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
>=20
> *filter table.....
> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j=
=20
> ACCEPT

This rule seems useless : port 80 has been redirected to port 8080 in=20
the PREROUTING chain, so no valid packet will ever enter the INPUT chain=20
with destination port 80.

> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 8080=20
> -j ACCEPT
>=20
> but anyone can go to http://<machine>:8080 which I want to disallow. =20
> How can I fix that?

Quick and dirty :
Drop the undesired packets in the PREROUTING chain of the 'mangle'=20
table, before REDIRECT occurs.

iptables -t mangle -A PREROUTING -p tcp --dport 8080 -j DROP (or REJECT)

Better :
Mark the desired packets in the PREROUTING chain of the 'mangle' table=20
before REDIRECT occurs and accept only the marked packets in the INPUT=20
chain of the 'filter' table.

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j MARK --set-mark 1
iptables -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp \
   --dport 8080 -m mark --mark 1 -j ACCEPT

