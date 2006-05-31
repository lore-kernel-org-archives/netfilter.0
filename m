From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: packet filter rules updating
Date: Thu, 01 Jun 2006 00:05:33 +0200
Message-ID: <447E132D.7070002@plouf.fr.eu.org>
References: <6770617.1149090967505.JavaMail.root@ps12>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6770617.1149090967505.JavaMail.root@ps12>
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
To: netfilter@lists.netfilter.org

Hello,

moniacheli@tiscali.it a =E9crit :
> I have configured iptables for modifying ip source
> of syslog packets outgoing from one of my router interfaces.
[...]
> If I delete the previuos rules, I have no effect on syslog traffic and=20
> also if I  give new iptables command with different ip source=20
> syslog pkt maintains the previous ip source (2.2.2.2) while no rule is=20
> configured with this ip.

The reason of this apparently (but only apparently) unexpected behaviour=20
is explained in chapter 5 of the NAT-HOWTO=20
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-5.html :

"At each of the points above, when a packet passes we look up what=20
connection it is associated with. If it's a new connection, we look up=20
the corresponding chain in the NAT table to see what to do with it. The=20
answer it gives will apply to all future packets on that connection."

So, once a NAT operation has been associated to a connection and as long=20
as the connection exists (or, at least, as long as Netfilter connection=20
tracking keeps track of that connection), the same NAT operation applies=20
to every packet belonging to that connection. This is independant of any=20
subsequent iptables rule modification.

> Is there some iptables options that I have to give to force the rules=20
> updating?

No, iptables cannot help you on this. All you can do is close the=20
affected connection to delete the entry in the conntrack table and the=20
NAT operation associated to it. When a new connection is established,=20
the new NAT rule will apply to it.

