From: =?iso-8859-1?q?Joerg=20Bruenner?= <joerg_bruenner@yahoo.de>
Subject: firewall without rules blocks packages
Date: Sat, 5 Jun 2004 15:06:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040605130615.10604.qmail@web20027.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I have configured iptables:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source=20
            destination
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source=20
            destination
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source=20
            destination

It should be wide open. But it is not:
If I ping from firewall-box to box A A replies the
expected way. If I ping from A to firewall A wont
get an answer. Firewall recives the ping packes I
verified.
I can play the same with ssh or telnet ...

What can I do?=20

Thanks a lot for help
Joerg


=09

=09
	=09
Mit sch=F6nen Gr=FC=DFen von Yahoo! Mail - http://mail.yahoo.de

