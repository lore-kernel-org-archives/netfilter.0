From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: RE: Hardly loaded machines and iptables? Your experiences?
Date: Thu, 7 Sep 2006 16:31:31 -0400
Message-ID: <48261.3581269563$1157661188@news.gmane.org>
References: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060902174858.44865.qmail@web56212.mail.re3.yahoo.com>
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
To: 'Elvir Kuric' <omasnjak@yahoo.com>, netfilter@lists.netfilter.org

=20

Hello Elvir

We run iptables on a DELL PowerEdge 750
Pentium 4 2.6 GHz, 1 gig RAM

Firewall has 5 nics, 1 WAN and 4 DMZ

We have about 40 servers for 600+ IPs of 3
different ranges, and bandwidth is a little
above 25 mbits in peaks

We have simple routing and NAT also, filtering
is done at both.

I cannot tell how many requests per second
we have, but CPU runs at less than 10% and
the system have an uptime of more than 550 days

mission critical, yes :)

HTH

Maxime Ducharme

=20

-----Message d'origine-----
De : netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] De la part de Elvir Kuric
Envoy=E9 : 2 septembre, 2006 13:49
=C0 : netfilter@lists.netfilter.org
Objet : Hardly loaded machines and iptables? Your experiences?

Hi all,=20

I need your opinion about heavy load machines acting
as firewals based on iptables package.
If I have Pentium 4, equiped with 1GB of RAM, two
NICs, one NIC to internet, second to private network (
in private network are servers ). On firewall (
iptables ) machine I have nat, pat, everthing using
iptables. How that works in  environment with many
reqestes to servers in the LAN, I mean about 10000
request per day? Have you experience about this topic.
Is there any limit on hits to iptables machine, what
is about memory, procesor.

What do you think is solution based on iptables enough
secure for mission critical cases? I just need your
frank opinion.

Thanks=20
Regards

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20



