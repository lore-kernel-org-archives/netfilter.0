From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to Forward a port (DNAT) ?
Date: Sat, 10 Jul 2004 22:54:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407102254.29715.Antony@Soft-Solutions.co.uk>
References: <40F0622F.6090500@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F0622F.6090500@libertysurf.fr>
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
To: netfilter@lists.netfilter.org

On Saturday 10 July 2004 10:39 pm, Fr=E9d=E9ric Gonzatti wrote:

> My iptables rules are :
> ##########################################"
> iptables -F
> iptables -X
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> iptables -t filter -A INPUT -i lo -j ACCEPT
> iptables -t filter -A OUTPUT -o lo -j ACCEPT
>
> iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth2 -j DNAT --to
> 192.168.2.151:25
>
> #################################################"
>
> It's a very simple test. But unfortunately it doesn't work.

You need a FORWARD rule to allow the packets through the firewall after b=
eing=20
DNATted - you also need to allow the reply packets.

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 25 -d 192.168.2.251 -j ACCEPT

I recommend Oskar Andreasson's tutorial http://iptables-tutorial.frozentu=
x.net=20
to you.

Regards,

Antony.

--=20
The lottery is a tax for people who can't do maths.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


