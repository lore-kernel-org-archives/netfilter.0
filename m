From: =?iso-8859-1?Q?Per_Fr=F6deberg?= <per@astrotrain.com>
Subject: dnat problems
Date: Wed, 30 Jun 2004 12:04:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040630100418.6D70F5B783@gollum.dreamhost.com>
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
To: netfilter@lists.netfilter.org

hi, i am new on the list, so here comes a newbie question i guess. i =
hope
thats ok.

i=B4ve got a firewall with the following configuration:

internet: eth0, 1.2.3.4
lan: eth1, 192.168.0.1

on my lan there are several computers attached that are not supposed to =
use
the firewall for internet-access.
they are routed to different internal networks, so they do not (and =
should
not) know about ip 1.2.3.4.5.

what i want to do is to forward traffic from my public internetaddress =
(on
eth0) to a specific machine on the lan,
lets say 192.168.0.2. normally i just DNAT it like:
"iptables -t nat -A PREROUTING -p TCP -i eth0 --dport [port] -j DNAT
--to-destination 192.168.0.2:[port]"

but now since 192.168.0.2 does not know about 1.2.3.4 packets will not =
find
the way back. so my question is, how
do i do that? in some way i want to forward traffic through eth0 -> eth1 =
->
192.168.0.2 on a specific port=20
and back the same way.

hope you understand the problem.

huge thanks,
per



