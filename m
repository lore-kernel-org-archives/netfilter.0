From: =?iso-8859-1?B?SOlsaW8gRHViZXV4?= <hdubeux@hotmail.com>
Subject: Redirect my internat web server
Date: Fri, 17 Jan 2003 16:06:51 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F60TcZJ8R6BDH5oJTE10000304c@hotmail.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I have a machine with squid + nat with an valid ip (1.1.1.1) and a false ip=
=20
(2.2.2.2) and running apache on port 80, i want to publish another apache=20
server on port 8000 in a machine with ip (3.3.3.3). how can i do this=20
redirect? I=B4ve already used:

iptables -A PREROUTING -t nat -p tcp -d 1.1.1.1 --dport 8000 -j DNAT -to=20
3.3.3.3:8000

My clients type on their browser http://1.1.1.1:8000 and i wanto to show th=
e=20
content of 3.3.3.3:8000

Anyone can plz help me?


----------------------
H=E9lio Dubeux Neto




_________________________________________________________________
MSN Hotmail, o maior webmail do Brasil. http://www.hotmail.com


