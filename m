From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Starting a fw
Date: Fri, 8 Jul 2005 09:34:20 +0400
Message-ID: <9927912d0507072234673f1aa0@mail.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
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

Hi to all,

I was once told that in order to start a firewall automatically when a
machine boots, we must make sure that the init process calls the
script by making a symbolic link to that file in the /etc/rc.d/rcX.d
directories.

I have found that there is a file called S08iptables (kernel 2.4.20-8)
containing startup commands for iptables service. Do i delete it and
then put the symbolic link to my script there or just leave it?

Let's say I have a firewall script called fw.sh with the following rules in=
 it:

#!/bin/bash
IPT=3D/sbin/iptables

$IPT -F
$IPT -X
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

$IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
-m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
request -j ACCEPT

$IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
-m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
reply -j ACCEPT

What steps (where to create symbolic links, at which runlevel, etc)
should I take in order to have this script be started automatically
when PC boots up. How can I make sure that it is this firewall script
that is running and all packets are being checked against these rules?

Thx in advance..

Warm regards,
Visham

