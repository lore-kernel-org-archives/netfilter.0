From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: Strange Behaviour with ICMP in SNAT
Date: Wed, 23 Jun 2004 20:18:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FAEE9F7@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi all,

We are currently testing NetFilter on Linux Slackware 9.0.
We have configured our netfilter to make SNAT and DNAT.
Some issues have been observed while configuring SNAT to allow ICMP.
When implemented this rule, it takes some time before icmp being able to
work.
When rebooting the NetFilter box, the same strange behaviour is
occurring.
Howewer all other SNAT/DNAT rules implemented are working immediately,=20
It' takes about 5 minutes until ICMP is working again.

It's a very strange behaviour, isn't it?

Please find the rule for ICMP:=20

Iptables -A POSTROUTING -p icmp -s 192.168.1.42 -d
172.19.92.0/255.255.255.0 -j SNAT --to-source 172.19.93.200

Any help would be appreciated.

Best regards,

Farid
Email : farid.izem@abxlogistics.fr


