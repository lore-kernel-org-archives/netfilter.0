From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Primordial tool missing
Date: Thu, 12 Aug 2004 15:40:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00bf01c480a4$31863f50$a900a8c0@cybergeneration.com>
References: <200408120947.40823.nadim@khemir.net>
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
To: nadim <nadim@khemir.net>, netfilter@lists.netfilter.org


Hey Nadim

I suggest that you use logging mechaninsm of iptables,
put -j LOG lines in many tables, it will allow you to "see"
the packets going trough tables and chains.

By default packets are logged in /var/log/messages

a good schema on how it works :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFT=
ABLES

a good example script of -j LOG :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#INCLUDE.TESTT=
ABLES

(option "--log-prefix" is important here to know where you are)

I also suggest that you dont drop a packet before logging it,
you may add a logging rule to every DROP or REJECT
rules you may have in your configuration. It also helps
to know where the packet have been dropped.

Hope this helps

Have a nice day

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "nadim" <nadim@khemir.net>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, August 12, 2004 3:47 AM
Subject: Primordial tool missing


> Hi,
>
> For you gurus this might be superfluous but for the lambda user a tool
which
> given an input packet (xxx.xxx.xxx.xxx:tcp:25) and a set of rules, show
how
> the packet goes from one rule to the other and finally make it to it's
> destination , gets tansformed or dropped.
>
> This would help enormously in understanding how this stuff works (no it's
not
> that obvious) and I also think it would be a great help when adding rules.
>
> Does such a utility exist?
>
> Cheers, Nadim.
>


