From: "GBV" <guilherme@plannercorretora.com.br>
Subject: IRCd and HTTPd under Iptables
Date: Fri, 21 Mar 2003 11:58:23 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b001c2efba$51a81280$6800817d@guilherme>
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
Content-Type: text/plain; charset="iso-8859-1"
To: *netfilter <netfilter@lists.netfilter.org>

Hi all,

I=B4m using Debian 3.0r1 with kernel 2.4.19 as a iptables firewall

I have internal webservers that I need to publish as Internet Sites For this
manipulation I=B4m using Apache ProxyPass. The site works perfectly under
apache.. even when the internal host is an ISS.

1. How can I do it without apache proxypass, using iptables?

2. This internal webserver also have a IRC server... how can I manipulating
iptables, to the external hosts use this internal IRC server, since i=B4m o=
nly
"sharing" the httpd via apache proxypass?

3. Since I=B4m using apache proxypass I defined in virtualhosts that
'/internalhost' leads to http://192.168.0.69:8080 , and I need to mantain
that www.foo.com/internalhost , but using iptables someway. And I need the
ircd of this internal server, responds via the same host. I=B4d like to
mantain my apache since it=B4s in use... Is it possible? OR I=B4ll have to =
put
this apache in another internal host, and them using iptables for
manipulating?

4. I=B4ve create in my DNS an internalhost.foo.com that leads to
www.foo.com/internalhost this must be manteined too.

I have something like:

Internet -> Firewall(Debian) -> Internal httpd and ircd server
external           foo.com
internal         192.168.0.1                      192.168.0.69


Thanks all.

Debian... because codes mather more than commercials








