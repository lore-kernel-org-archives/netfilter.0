From: "Elvis Aaron Presley" <elvisa@terra.es>
Subject: RE: Newbie in a deep trouble!!!
Date: Thu, 12 Aug 2004 10:09:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c48043$c021a0d0$3d01a8c0@rxn32.biz>
References: <D5C9032B2B09C64EA2409D6214E91AC9051268@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051268@asimail2.alphanumeric.com>
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
To: 'Jason Opperisano' <Jopperisano@alphanumeric.com>, 'Netfilter' <netfilter@lists.netfilter.org>

It works!!!!!!!!!!!

With this three lines:

iptables -t nat -A PREROUTING -p tcp -d 172.16.0.0/16 --dport 80 -j =
ACCEPT
iptables -t nat -A PREROUTING -p tcp -d 10.34.0.0/16 --dport 80 -j =
ACCEPT
iptables -t nat -A PREROUTING -p tcp -i ! eth0 --dport 80 -j REDIRECT
--to-port 3128

Thank you to all!!!!

Elvis


-----Mensaje original-----
De: Jason Opperisano [mailto:Jopperisano@alphanumeric.com]=20
Enviado el: mi=E9rcoles, 11 de agosto de 2004 14:12
Para: Elvis Aaron Presley; Netfilter
Asunto: RE: Newbie in a deep trouble!!!


>
> First I put this:
>
> iptables -t nat -A PREROUTING -p tcp -d ! 172.16.0.0/16 --dport 80 -j=20
> REDIRECT --to-port 3128
>
> Ok with this, the 10.34.x.x pcs can access to internet through the=20
> proxy and can view the web pages of the 172.16.x.x pcs ... It works!!!
>
> Then I put this:
>
> iptables -t nat -A PREROUTING -p tcp -d ! 10.34.0.0/16 --dport 80 -j=20
> REDIRECT --to-port 3128
>
> With this,  the 172.16.x.x pcs can access to internet through the=20
> proxy and can view the web pages of the 10.34.x.x pcs ... It works=20
> too!!!
>
> This commands works separately, but when I put the two at same time it =

> doesn't work.

it's because 10.34.0.0/16 matches "-d ! 172.16.0.0/16" and 172.16.0.0/16
matches "-d ! 10.34.0.0/16"

> Can anybody help me please????

i can try.  your PREROUTING rules should be, in order:

iptables -t nat -A PREROUTING -p tcp -d 172.16.0.0/16 --dport 80 -j =
ACCEPT
iptables -t nat -A PREROUTING -p tcp -d 10.34.0.0/16 --dport 80 -j =
ACCEPT
iptables -t nat -A PREROUTING -p tcp -i ! eth0 --dport 80 -j REDIRECT
--to-port 3128

which allows traffic to 172.16.0.0/16 and 10.34.0.0/16 to pass without =
going
through the squid proxy, and anything else received on either eth2 or =
eth1
to get redirected to the squid cache.

-j


