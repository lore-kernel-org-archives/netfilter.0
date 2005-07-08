From: Willy Chang <changwilly@gmail.com>
Subject: dhcrelay still responds dropped inbound offer packets from iptables
Date: Fri, 8 Jul 2005 17:18:33 -0400
Message-ID: <673fb82305070814186036ce2f@mail.gmail.com>
Reply-To: Willy Chang <changwilly@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Folks,

     I am running a dhrelay service and using iptables to be a
firewall to block packets from dhcp server on the inbound side, eth0,
of my Liunx. The reason to do this is to avoid generating duplicated
packets from my machine to dhcp client on the same subnet.
     For some reasons, I am unable to block these packets. I have a
simple rule setting below to simply block all incoming UDP packets
where it should block dhcp package as well.

iptables -A INPUT -p UDP -i eth0 -j DROP

     dhcp client are still able to receive duplicated packets, one is
from dhcp server and another is from my machine while dhcp relay agent
is relaying packets. Any people see this before? Any comments or
suggestions are welcome. Thanks,




Willy

