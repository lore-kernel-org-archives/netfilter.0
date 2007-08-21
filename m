From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Rout looping through local host.
Date: Tue, 21 Aug 2007 14:13:27 -0500
Message-ID: <46CB3957.6090903@riverviewtech.net>
References: <46CB0F78.3060107@riverviewtech.net>
	<cba9bb580708211026p721c0de8md6d66b3440d5b298@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cba9bb580708211026p721c0de8md6d66b3440d5b298@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/21/07 12:26, michel banguerski wrote:
 > here's  my 2=A2:
 > there is no need to patch the kernel.
 > what you should do is PBR and little arp hacking:
 > let's say your eth0 is 10.0.0.1/24
 > what i'd do is to put eth1 and eth2 in different subnets:
 > eth1 -> 10.0.1.1/24
 > eth2 -> 10.0.2.1/24

(For the sake of discussion) Ok...

 > default routes:
 > ip ro add default via 10.0.1.254 table 252 # from eth1 to eth2
 > ip ro add default via <gateway on eth3 side> table default # from eth3
 > to outside

I can see how this might get packets from eth1 in to eth2, but I fail to=20
see how returning packets will get from eth2 back to eth1 with out doing=20
the same in reverse.  Doing the same in reverse will either require more=20
routing tables or make routing table 252 more complex if possible.

 > PBR rules:
 > ip rule del prio 32766 # we need to put rules between lookup to main=20
and default
 > ip rule add prio 100 lookup main # rule 32766 becomes 100
 > ip rule add 200 lookup 252 iif eth0 # alternative default route for=20
local LAN

Again, returning traffic is going to be problematic.

 > arp override:
 > arp -s 10.0.1.254 <ETH addr of eth2>

Presuming that the reverse path can be worked out, this might work if I=20
was really using cross over cables, but for scalability reasons I'm not=20
doing so, but rather a program more like a tunnel than a physical=20
interface.  Said program generates a NOARP interface, so I don't think=20
this approach will work.

 > disable antispoof on eth{1,2} (may be not needed if you do NAT)
 >  echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
 >  echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter

Agreed.  I don't know for sure if reverse path protection is or is not=20
needed yet, so for safety sake we'll turn it off and do our own reverse=20
path filtering in IPTables or see if the kernel can do it for us later on.

 > there is one thing to look after: the dhcp client will put its default
 > route in table main(252) and you should move it from here to table
 > default(253)

Agreed.  However this is what the options for dhcpcd (or the likes) are=20
for to tell it not to over write any files or change any thing else for=20
that matter.  In fact, I think I'll just have the client request the=20
information and log it to files in the /etc/dhcp<what ever> directory=20
and I'll alter interfaces and routing table(s) my self.

 > This setup should work with or without NAT

Possibly.

 > Hope this works(did not test this exact setup) and helps

In theory (what I understand of what you are suggesting) has merit, but=20
lacks return path.  Even if the return path can be fixed, there is still=20
the issue of the NOARP interfaces.

Also, my project requires me to have multiple of these additional=20
routers, so this will not scale very well and thus is not really an=20
ideal solution.  (Look at a follow up post to my own question.)



Thank you very much for your input and for providing a very unique=20
solution, all be it fairly out side of the ball park one (sending=20
traffic to an IP address that does not exist...).

Grant. . . .


