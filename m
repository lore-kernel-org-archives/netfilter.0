From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Transparent proxy setup with apache on the nat gateway
Date: Mon, 05 Jun 2006 13:24:57 +0200
Message-ID: <44841489.4040005@plouf.fr.eu.org>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>	<1149500883.6397.9.camel@rousalka.dyndns.org>
	<44841133.90004@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44841133.90004@plouf.fr.eu.org>
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

Pascal Hambourg a =E9crit :
>=20
>> Le lundi 05 juin 2006 =E0 10:40 +0200, Sietse van Zanen a =E9crit :
>=20
>>> I think you should try something like this.
>>> Have apache proxy listen on localhost (127.0.0.1) port 8081
>>> Iptables -t NAT -A PREROUTING -p tcp -i eth0(internal nic) -m multipo=
rt
>>> --dports http,https,squid,svn,http-alt,webcache -j REDIRECT --to=20
>>> 127.0.0.1:8081
>=20
> No, this won't work. The IP stack refuses packets with a loopback=20
> destination address received on a non loopback interface.

I forgot to mention that anyway this rule won't work and should cause an=20
error because its syntax is incorrect.  REDIRECT accepts only a port or=20
port range in the --to or --to-ports option, not an address. Didn't you=20
mistake REDIRECT for DNAT ?

