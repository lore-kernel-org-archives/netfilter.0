From: alexb@atix.com.br
Subject: ARP question
Date: Fri, 11 Mar 2005 10:06:06 -0300
Message-ID: <1110546366.423197bebe6e1@webmail.atix.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I've a strange problem in my network that I beleave is related to the arp=
 table
and would like to ask if someone could help me trace down the source of m=
y
probleme.

My firewall has two internal networks on the same nic and routes back tra=
fic
from one network to the other eaven they are on the same segment. It's no=
t
elegand, but in an emergency (after a host crash) its what I could bring =
up.


                   Internet
                       |
                       |    eth0=3DPublicIP
                   firewall
                       |    eth1=3D200.1.1.1/27
                       |  eth1:0=3D200.2.2.9/29
                       |
    Host-A          Host-B         Serv6
  200.2.2.12/29   200.2.2.14/29  200.1.1.6/27 eth0:0=3D200.1.1.5/27


At Host-A it happens that the IP+MAC of Serv6 gets in his arp table, but =
there
is no direct route between this hosts. When that happens every services
provided by serv6 can still be accessed at Host-A as they are routed thru=
 the
firewall. But I can't ping from Host-A to Serv6.
If I force to remove Serve6 from host-A arp table (arp -i eth0 -d Serv6) =
and
flush his route table (ip route flush cache) then I can ping Serv6.
Unfortunetly, some minutes later, Serv6 gots into the arp table from Host=
-A and
stops ping that I use to monitore the server.
The problem just occurs on Host-A, I can't see a topological difference b=
etwean
Host-A and Host-B, just the service they are running.
Also I have a secont IP bind to the same nic at Serv6, that doesn't get a=
fected
by this problem (in fact the second IP doesn't ever apears in the arp tab=
le).

What I whant to figure out is how the base IP from Serv6 goes into Host-A=
 arp
table, as there are no explicit route between the two networks on both (h=
ost-A
and Serv6) forcing them to use the Default Gatway to comunicate. As I
understand they shouldn't issue any arp requests from the other host as t=
hey
will comunicate thru the GW (firewall).

Any idea ?

Thanks

Alexander E. Belck

-----------------------------------------------------------------
Esta mensagem foi enviada pelo IMP, o Internet Messaging Program.

