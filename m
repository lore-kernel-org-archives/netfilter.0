From: Blizzards <blizzards@libero.it>
Subject: Re: Iptables and various domains
Date: Thu, 12 Dec 2002 10:29:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF856F9.3000002@libero.it>
References: <NEBBKLENIBMGHGCLGBPIKEBKCDAA.security@e-gim.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: E-GIM Security <security@e-gim.es>
Cc: netfilter@lists.netfilter.org

This is not an iptables work.
You can use iptables to DNAT your webserver1 and webserver2 port 80 to=20
internal webservers port 80,
and use HTTPd  (like apache, iis, netscape, zeus, ecc) + DNS to do a=20
name based virtual hosts resolving.

Bye.
G.

>	Hi,
>
>	Can Iptables route by domains? For example, I have a webserver and my
>firewall with iptables route all request on port 80 throw IP webserver. I
>need add another webserver, and various domains (www.dom1.com, www.dom2.co=
m)
>will be redirect to webserver-1 and other domains (www.dom3.com,
>www.dom4.com) will be redirect to webserver-2. Can IPTables help me? Which
>is the solution)
>
>	Thanks and sorry ... my english is very poor.
>
>Jos=E9 Antonio Garc=EDa Garc=EDa
>Technical Internet Solutions
>
>E-GIM 	+34 952700010
>http://www.e-gim.es
>
>
>
>
> =20
>




