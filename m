From: "Administrador de Red" <admin@gecyt.cu>
Subject: what rule I should has for permit access to mail server
Date: Fri, 29 Nov 2002 05:30:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-100039@gecyt.cu>
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
To: netfilter@lists.netfilter.org

Hi Friends.

I need a help very fast.

I has two server linux, the first has some service www,DNS=20
primary, squid and gateway too, the second server is mail=20
server, DNS secondary, then I want to permit access to=20
server mail from my gateway, I write the folowing rules=20
but is=B4nt working with the Outlook Express.

I can access to internet very well, i test with the ping=20
to www.yahoo.com and the gateway response, but with=20
Outloook Express I can access to mail server, port 25 and=20
port 110.

*nat
:PREROUTING ACCEPT [0:65535]
:POSTROUTING ACCEPT [0:65535]
:OUTPUT ACCEPT [0:65535]
[0:0] -A PREROUTING -i eth0 -p tcp -m tcp --dport 25 -j=20
DNAT --to-destination ip_true:25=20
[0:0] -A PREROUTING -i eth0 -p tcp -m tcp --dport 110 -j=20
DNAT --to-destination ip_true:110=20
[0:65535] -A POSTROUTING -o eth0 -j SNAT --to-source=20
ip_gateway_true=20
COMMIT


someone could Help me. please.
thanks very well.

Thomas




Estamos en Calle 20 Numero 4110 % 41 y 47,
Miramar, Playa, Ciudad Habana, Cuba.
Telf:537(203-01-60) y (202-79-20)
Fax: 537(204-96-64)
Visitenos en: http://www.gecyt.cu

