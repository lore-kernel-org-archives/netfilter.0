From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Transparent proxy setup with apache on the nat gateway
Date: Mon, 5 Jun 2006 12:51:07 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C74@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Nicolas Mailhot <nicolas.mailhot@laposte.net>
Cc: netfilter@lists.netfilter.org

Well, if Apache sees the traffic on port 8081 then your redirect is =
working as it should. Netfilter does nothing with the contents of the =
packets, just with the addresses and ports.

Your problem is then with Apache. A browser never requests a / but =
always a URL, your apache makes something different of it.=20

-Sietse

-----Original Message-----
From: Nicolas Mailhot [mailto:nicolas.mailhot@laposte.net]=20
Sent: Monday, June 05, 2006 11:48 AM
To: Sietse van Zanen
Cc: netfilter@lists.netfilter.org
Subject: RE: Transparent proxy setup with apache on the nat gateway

Le lundi 05 juin 2006 =E0 10:40 +0200, Sietse van Zanen a =E9crit :

Thank you for taking the time to look at my problem !

> I think the error is in your first two rules for the PREROUTING chain
> in the NAT table:

...

> All WEB traffic will only hit the first rule and never the second.

I have traces of many attempts in my rule file - I never used those two
rules together so it's not the problem

> I think you should try something like this.
> Have apache proxy listen on localhost (127.0.0.1) port 8081
> Iptables -t NAT -A PREROUTING -p tcp -i eth0(internal nic) -m
> multiport
> --dports http,https,squid,svn,http-alt,webcache -j REDIRECT --to
> 127.0.0.1:8081

If I use REDIRECT the to is interpreted like --to-port and I see the LAN
system hammer the gateway 127 port :(

If I use
-A PREROUTING -i eth1 -p tcp -m multiport --dports
http,https,squid,svn,http-alt,webcache -j REDIRECT --to-port 8081

the requests are redirected to port 8081 of the lan interface IP
(192.168.1.1, I can live with that) but the result is abysmal :
apache logs=20

"GET / HTTP/1.1" requests instead of
"GET http://www.slashdot.org/ HTTP/1.1" requests

so all sites are served as if the browser asked for the local root
(empty) and the browser only receives blank pages

Regards,

--=20
Nicolas Mailhot

