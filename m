From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Iptables router issue
Date: Tue, 23 Sep 2003 16:11:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E4B@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: dalive@flashmail.com, netfilter@lists.netfilter.org

$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets

Should be setup in the FORWARD chain, since the DNS request was not sent
from the local machine itself.

$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -j udp_packets



-----Original Message-----
From: DALive Editor [mailto:dalive@flashmail.com]=20
Sent: Tuesday, September 23, 2003 3:48 PM
To: netfilter@lists.netfilter.org
Subject: Iptables router issue

Objective:

To use a single Penguin box to do everything. (at least for now). But=20
more importantly to route traffic to and from a private lan to the=20
internet, and to filter off open ports of the box.


Problem:

When DNS lookup to my client returns the my internet dynamic ip) as it=20
should for my own domain, for some reason my firewall filters out the=20
traffic. Although it's to an open port and the firewall is suppose to=20
accept all traffic from the lan.


Host Setup

Kernel from RH9 Distribution and latest version of Iptables (having been

haveing probs with settign up my own kernel)


Network Map:

eth0 -- 192.168.100.1 -- internal lan's NIC
eth1 -- dynamic address -- internet's NIC

Additional Information:

I have attached my firewall script as a .txt file.


Your assistance is much appreciated and anticipated.
Thank you.

