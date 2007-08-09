From: =?koi8-r?B?68HOydfFwyDuycvPzMHK?= <n_kanivets@futureservice.ru>
Subject: pptp-conntrack question
Date: Thu, 9 Aug 2007 11:17:37 +0400
Message-ID: <008501c7da55$5d589430$0511a8c0@Sklifer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello, all.

I have spent nearly a week trying to solve my problem and is almost entirely
stuck. I would appreciate any help or advise. In addition to main problem
description I will ask several related questions if you do not mind, which
are closely tired to the main question.

Many thanks in advance for all your answers.

So, the main problem is:
1. I have Slackware 11 with kernel (by default after installation)
2.4.33.3. - let's say it is simple router wich performs SNAT for hiding
local network behind one real external ip-address.
2. I need to enable multiple pptp clients from LAN to external pptpd server
through this box.
3. I also need to enable some extra features to iptables like "iprange",
"random", "nth", targets ROUTE and TARPIT.

The sequence of actions:
1. I have carefully read all information at netfilter.org concerning
patch-o-matic and patch-o-matic-ng installation, about iptables extensions.

And here comes the first intermediate question:
HOW do these patch-o-matic-ng snapshots and full directories correlate with
each other from the cummulative point of view? Why some extensions are
removed in later snapshots? If they are obsoleted, then these extensions
should be replaced by some functionalities in the kernel? For example
"random" feature is available in 20040621 patch-o-matic-ng and does not
present in later source folders. Why? If it is normal, then do I need to
manually look for the latest ROM-ng folder which contains the required for
me feature?

The second intermediate question is:
Where can I find information about compatibility of certain ROM-ng features
with certain kernel versions?

2. Next, I have tried to install say "random" feature to my 2.4.33.3 kernel
from 20040621 ROM-ng folder. Generally, everythin went ok:
    2.1. I have copied iptables-1.3.5 source in /usr/src/iptables
    2.2. cd /usr/src/linux
    2.3. make dep
    2.4. cd path-to-rom
    2.5. ./runme random   (answer 'y')
    2.6. cd /usr/src/linux
    2.7. make menuconfig (choose additional feature "random" in Netfilter
configuration)
    2.8. make bzImage
    2.9  make modules
    2.10 mv /boot/vmlinuz /boot/vmliuz.old
    2.11 cat arch/i386/boot/vmlinuz > /boot/vmlinuz
    2.12 mv /boot/System.map /boot/System.map.old
    2.13 cp System.map /boot/System.map
    2.14 make modules_install
    2.15 make changes to lilo.conf and reinstall lilo
    2.16 reboot the machine with the new kernel
    2.17 cd /usr/src/iptables
    2.18 make && make install

random feature is working and all is ok.

3. Now I try to apply pptp-conntrack-nat feature in the same manner.
the runme scripts says "unable to find ladd slot in src
/usr/src/linux/net/ipv4/netfilter/Config.in"   -  What does this mean?
Googling gave almost no results.
the only thing left was to press "f" to force action and check Config.in
file. The appropriate changes were made in it and I continued the whole
process. After all was recompiled and so on, I have found that I have no
appropriate modules  ip_nat_pptp.o, ip_nat_proto_gre.o,
ip_conntrack_proto_gre and ip_conntrack_pptp

4. Next I tried to manually modify
/usr/src/linux/net/ipv4/netfilter/Makefile , but that is not worthy of
presenting here as it have no results, but only new errors.

5. I have tried to apply this pptp-conntrack-nat ROM to Slackware 10 with
kernel 2.4.26 and, a miracle, it all went ok and the modules were
successfully created.

So, why does not it work for 2.4.33.3 kernel (by the way I tried to download
2.4.33.7 and 2.4.34.6 kernels from kernel.org and play with them - the same
result: "unable to find ladd slot bla-bla-bla"). Or it was removed and is
incompatible with this kernel. Then how to solve the main problem then?
pptpproxy is not suitable for me I need to do it in the kernel. Or may be
this functionality was added to the standard kernel? Then how it could be
enabled or switched on or whatever? I also encountered information about
"oldnat" and "newnat" at netfilter.org, but further investigations and
googling gave poor or no results. Is it related to my case?

Sorry for so long narration, but the case is not simple IMHO hence I tried
to describe it in details to obtain as concrete answers as possible.
Any links pointing to my blindness are welcome as well.

With respect,
Nikolay.
e-mail: n_kanivets@futureservice.ru


