From: Erik <erikev@gmail.com>
Subject: QoS with netfilter
Date: Sat, 10 Dec 2005 04:53:11 -0800
Message-ID: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
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

Am trying to add QoS to some web cam traffic on a network.  Also a
newbie to netfilter.

Packet forwarding and NAT works fine.  I can browse the web just fine
from 10.0.0.5.

Gateway  <---------->Linux router<------------------>webcam
192.168.1.254<-->eth1     eth0 10.0.0.1<------->10.0.0.2

Tried netfilter commands like:
>iptables -t mangle -A FORWARD -s 10.0.0.0/8 -j DSCP --set-dscp 1

This does not work (Using Etheral to inspect traffic)

Furthermore, a command like
>iptables -L FORWARD

list a set of rules etc but this QoS is not one of them apparently...

Please:
a) Suggest a solution to my problem.
b) Suggest a Qos HOWTO. (Other than http://iptables-tutorial.frozentux.net =
)

Thanks

