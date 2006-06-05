From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Transparent proxy setup with apache on the nat gateway
Date: Mon, 05 Jun 2006 13:10:43 +0200
Message-ID: <44841133.90004@plouf.fr.eu.org>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>
	<1149500883.6397.9.camel@rousalka.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1149500883.6397.9.camel@rousalka.dyndns.org>
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

Nicolas Mailhot a =E9crit :
> Le lundi 05 juin 2006 =E0 10:40 +0200, Sietse van Zanen a =E9crit :
>=20
>>I think the error is in your first two rules for the PREROUTING chain
>>in the NAT table:
>>=20
>>> #-A PREROUTING -p tcp -m multiport --dports
>>> http,https,squid,svn,http-alt,webcache -j REDIRECT --to-port 8081
>>> #-A PREROUTING -p tcp -m multiport --dports
>>> http,https,squid,svn,http-alt,webcache -j DNAT --to 192.168.1.1:8081
>>
>>All WEB traffic will only hit the first rule and never the second.  So
>>the destination IP address doen't get changed. A packet for 1.2.3.4 on
>>port 80 will be redirected to 1.2.3.4 port 8081.

This is not true. REDIRECT replaces the destination address with the=20
address of the input interface. So when the input interface has address=20
192.168.1.1 both rules would produce the same result.

>>I think you should try something like this.
>>Have apache proxy listen on localhost (127.0.0.1) port 8081
>>Iptables -t NAT -A PREROUTING -p tcp -i eth0(internal nic) -m multiport
>>--dports http,https,squid,svn,http-alt,webcache -j REDIRECT --to 127.0.=
0.1:8081

No, this won't work. The IP stack refuses packets with a loopback=20
destination address received on a non loopback interface.

> If I use REDIRECT the to is interpreted like --to-port and I see the LA=
N
> system hammer the gateway 127 port :(

Looks like iptables command parsing could be improved. ;-)

> If I use
> -A PREROUTING -i eth1 -p tcp -m multiport --dports
> http,https,squid,svn,http-alt,webcache -j REDIRECT --to-port 8081
>=20
> the requests are redirected to port 8081 of the lan interface IP
> (192.168.1.1, I can live with that) but the result is abysmal :
> apache logs=20
>=20
> "GET / HTTP/1.1" requests instead of
> "GET http://www.slashdot.org/ HTTP/1.1" requests
>=20
> so all sites are served as if the browser asked for the local root
> (empty) and the browser only receives blank pages

The question is : are you sure that Apache can act as a _transparent_=20
proxy, like Squid ?

*Disclaimer : I don't know Apache much*
 From a quick search it does not seem that mod_proxy can do transparent=20
proxying. There is a mod_tproxy that is designed to do it, but it does=20
not seem to be part of the standard Apache distribution.
HTH.

