From: P@draigBrady.com
Subject: UDP connection tracking problem
Date: Mon, 10 Nov 2003 14:31:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAFA135.9050707@draigBrady.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi, I've a very simple rule set as follows, and in summary
it looks to me like udp connection tracking info
is only being updated for traffic comming into the box?

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.1            anywhere
ACCEPT     all  --  anywhere             anywhere           state=20
RELATED,ESTABLISHED
ACCEPT     all  --  172.18.1.170         anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state=20
NEW,RELATED,ESTABLISHED

The problem is that I can't initiate udp from this box.
If I allow udp in, I can do tftp fine.
Then removing the udp rule I can tftp fine for
variable amount of time 0s, 30s, 180s.

I'm using linux 2.4.20 and iptables v1.2.7a

cheers,
P=E1draig.


