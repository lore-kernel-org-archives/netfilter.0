From: dlm4444 <dlm4444@bigzoo.net>
Subject: automating iptable scripts
Date: Thu, 20 Mar 2003 11:51:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303201151.54490.dlm4444@bigzoo.net>
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

hello all,=20

I tried using cron to start up iptable scripts , even thought the script =
run=20
with out errors at the command line.=20
It enables routing. for example,

the script is execuable! chmod +x routeup.sh
#!/bin/bash


echo 1 > /Proc/sys/net/ipv4/ip_forwarding
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERED

I even tried iptables scripts to let me ping my maching at certint times =
of=20
the day. but all fails in cron.

OS

 RedHat 8.0
Linux Mandrake 9.0

thanks for any help=20

David

