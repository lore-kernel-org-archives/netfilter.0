From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat problems
Date: Wed, 30 Jun 2004 11:34:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301134.50622.Antony@Soft-Solutions.co.uk>
References: <20040630100418.6D70F5B783@gollum.dreamhost.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040630100418.6D70F5B783@gollum.dreamhost.com>
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

On Wednesday 30 June 2004 11:04 am, Per Fr=F6deberg wrote:

> i=B4ve got a firewall with the following configuration:
>
> internet: eth0, 1.2.3.4
> lan: eth1, 192.168.0.1
>
> on my lan there are several computers attached that are not supposed to=
 use
> the firewall for internet-access.
> they are routed to different internal networks, so they do not (and sho=
uld
> not) know about ip 1.2.3.4
>
> what i want to do is to forward traffic from my public internetaddress =
(on
> eth0) to a specific machine on the lan,
> lets say 192.168.0.2. normally i just DNAT it like:
> "iptables -t nat -A PREROUTING -p TCP -i eth0 --dport [port] -j DNAT
> --to-destination 192.168.0.2:[port]"
>
> but now since 192.168.0.2 does not know about 1.2.3.4 packets will not =
find
> the way back. so my question is, how
> do i do that? in some way i want to forward traffic through eth0 -> eth=
1 ->
> 192.168.0.2 on a specific port
> and back the same way.

Add a default route on 192.168.0.2 via gateway 192.168.0.1, and restrict =
the=20
traffic through the firewall so that it accepts the DNATted packets *to*=20
192.168.0.2 and allows replies, but will not allow new connections *from*=
=20
192.168.0.2.

eg:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport xxx -j ACCEPT
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport xxx -j DNAT --to=20
192.168.0.2

Regards,

Antony.

--=20
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


