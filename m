From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_\=28GWA\=29?=
	<sa.campos@datasulsp.com.br>
Subject: Two netwok cards to access the internet.
Date: Tue, 22 Mar 2005 18:54:26 -0300
Message-ID: <010801c52f29$bb2cd7d0$280211ac@PIVT>
Reply-To: "=?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_\\=28GWA\\=29?="
	<sa.campos@datasulsp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hi!

I have the following:

A RedHat 9.0 with 3 Network cards: One we use in local network (eth1) =
and the other (eth0 and eth2)  to access the internet.

I'd like to separate the traffic. In the eth0 use only with the e-mail =
server (pop, smtp, 1723, 1701 and protocol 47) and the eht0 with others =
traffis (http, https, msn....).

I tried=20

iptables -t nat -A POSTROUTING -o eth2 -s 172.17.1.8 -j MASQUERADE   =
(--this ip addrs is pop and smtp server)
iptables -t nat -A POSTROUTING -o eth0 -s 172.17.0.0/16 -j MASQUERADE=20

But when I did this I could not access the port 1723, 1701 and protocol =
47 using the eth2.

I tried too use only iptables -t nat -A POSTROUTING -o eth2 -s =
172.17.0.0/16 -j MASQUERADE

And I got the same prob.

If I use iptables -t nat -A POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE=20

I will get a success access. Only when I use iptables -t nat -A =
POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE (without -o eth2 or -o =
eth0).


Who could help me?

Thanks


Sebasti=E3o Ant=F4nio Campos
Infojoi Computadores Ltda
Joinville -SC - R. Iriri=FA, 3587
Cml. (47) 437-0796 - Cel. (47) 9927-5349
tiao@infojoi.com.br
http://www.lupusnet.com.br
