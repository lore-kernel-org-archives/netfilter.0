From: "Ilo" <sneak@gmsg.co.za>
Subject: Strange Occurrences
Date: Mon, 25 Aug 2003 08:59:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c36ad6$6b981360$8200000a@sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Ive got a mail server which has been able to connect and exchange mail with
one of our clients mail server for quite a while but now out of the blue it
cant seem to connect to any service on there server, even though I can ping
it.

What makes it even stranger is that I use this mailserver to masquerade to
all my local workstations.
Now from my workstation I am able to connect to the desired mailserver
"telnet mailserver 25",  where I cant do this
from the server...

Below is what my iptables chains look like? does anybody have any Idea what
the problem might be?

Thanks,
Ilo Lorusso.


Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  10.0.0.0/28          anywhere


