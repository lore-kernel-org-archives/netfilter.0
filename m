From: Payal <rpayal@indiainfo.com>
Subject: iptables : masq
Date: Thu, 13 Jun 2002 15:28:27 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <ae9qdl$trm$2@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,
As I said earlier I am using Mdk Linux 8.2 with kernel 2.4.18. I am tryin=
g to=20
shift from ipchains to iptables for a simple reson that I cannot connect =
to=20
one particular ftp site where ip_masq_ftp was required in earlier version=
s of=20
kernel. Now this module is no longer available. So, I have to shift to=20
iptables since connecting to that site is really imp.
But I am having a problem. I read briefly NAT and iptables HOWTOs and dec=
ided=20
the rule,
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

My loaded modules by lsmod include,
ipt_MASQUERADE          1504   5  (autoclean)
iptable_mangle          2336   0  (autoclean) (unused)
iptable_nat            15988   1  (autoclean) [ipt_MASQUERADE]
ip_conntrack           15180   1  (autoclean) [ipt_MASQUERADE iptable_nat=
]
iptable_filter          1952   0  (autoclean)
ip_tables              11584   6  [ipt_MASQUERADE iptable_mangle iptable_=
nat=20
iptable_filter]

But my problem is that inspite of giving the above command I have,

#iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

What is wrong now? Why is'nt my rule listed?
I even have 1 in /proc/sys/net/ipv4/ip_forward.
Please do tell as early as possible or atleast tell me how to get it work=
ing=20
under ipchains.

Thanks a lot in advance and bye.
-Payal
p.s i have some problems with my present email address, it would be great=
 if=20
you can cc the mail to payal99  @  cyberspace.org

