From: david <dlm4444@bigzoo.net>
Subject: Why want my iptables scripts run in cron
Date: Tue, 18 Mar 2003 22:01:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303182201.19202.dlm4444@bigzoo.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a simple script called routup.sh to start the routing at a certain=
=20
time, it is excutable. It runs fine at the command line but not cron. her=
e is=20
what my cron entry looks like:                0 9 * * * root   /etc/routu=
p.sh
#routup.sh
#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE=20

I even went as far to add a path to the crontab file like this:
vi crontab  =20

/sbin/iptables. =20
where am i going wrong.=20
The o.s. is linux mandrake 9.0

thanks for any help,

david=20




