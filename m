From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: RELATED emulation without ip_conntrack
Date: Thu, 24 Oct 2002 12:45:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210241245.52685.roy@karlsbakk.net>
References: <200210231602.00745.roy@karlsbakk.net> <200210231518.g9NFI4L02942@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210231518.g9NFI4L02942@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wednesday 23 October 2002 17:17, Antony Stone wrote:
> On Wednesday 23 October 2002 3:02 pm, Roy Sigurd Karlsbakk wrote:
> > hi
> >
> > I've got this video server streaming @ ~250Mbps, so I really don't wa=
nt
> > to waste cpu cycles on ip_conntrack.
> >
> > how can I test for tcp flags to allow me to do a poor-man's-conntrack=
?
>
> Treat packets with SYN set, and ACK, FIN and RST clear as NEW connectio=
ns.
> Treat packets with SYN and ACK set, FIN and RST clear as NEW replies.
> Treat packets with ACK set, SYN, FIN and RST clear as ESTABLISHED
> connections.
> Treat packets with FIN or RST set (probably ACK too) as terminating
> connections.

ok. My system has a private network and a public network. the private is =
open=20
to everyone connected on it. The public is open only to the video service=
=20
(tcp/1234) and icmp. Does the following look reasonable?

iptables -I INPUT -i eth0 -j ACCEPT
iptables -I INPUT -i eth1 -p icmp -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST=
 \
=09SYN -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST=
 \
=09SYN ACK -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST=
 \
=09FIN,RST -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 1234 --tcp-flags SYN,ACK,FIN,RST=
 \
=09ACK,FIN,RST -j ACCEPT
iptables -I INPUT -j LOG --log-prefix "Illegal packet" --limit 5/second \
=09--limit-burst 10
iptables -I INPUT -j DROP

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


