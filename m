From: Raul Siles <raul_siles@hp.com>
Subject: Iptables and IPSec
Date: Wed, 25 Jun 2003 13:39:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EF989FF.50200@hp.com>
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

Hi all,
I have a Linux box (RedHat 7.3, kernel 2.4.18-19.7) working with=20
IPtables v.1.2.5.
I have installed a VPN client from NetLock (IPSEC), ver. 2.1.1-0,=20
www.netlock.org.

Everything works fine except the stateful rules, I mean:
- Once I connect through the VPN tunnel (it is using ISAKMP (UDP,500)=20
and ESP (IP prot. 50)) I cannot use UDP or TCP protocols just filtering=20
based on the following rule:

 From /etc/sysconfig/iptables:
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

When working without VPN tunnel, just Internet connected, all the=20
protocols work fine, as for example, UDP dns resolution or TCP telnet,=20
ssh or http sessions.

When the tunnel has been established, it seems that IPTables cannot=20
extract the stateful information from the encapsulated packets (IPSec,=20
ESP), so it only works using old stateless rules as:

-A INPUT -s 0/0 -d 0/0 -p tcp ! --syn -j ACCEPT

Any help and information about when the IPTables stateful processing=20
when using IPSec takes place will be appreciated,

Best Regards,
Ra=FAl



