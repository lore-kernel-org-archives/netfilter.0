From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Unable to apply pptp conntrack patch
Date: Fri, 14 May 2004 12:56:47 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0405141253510.21804-100000@blackhole.kfki.hu>
References: <GHEILNONPACCGBGKBEKKCEMPCFAA.manikandan@manikandan.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKCEMPCFAA.manikandan@manikandan.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manikandan <manikandan@manikandan.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Fri, 14 May 2004, Manikandan wrote:

>         I am trying to patch my RedHat kernel kernel-2.4.20-31.9 with pptp
> conntrack patch as my NAT clients requires access to one of my Windows 2000
> VPN server. I am getting the following error when I patch my kernel.
>
> [root@manikandan patch-o-matic-ng-20040302]# ./runme pptp-conntrack-nat/
> Hey! KERNEL_DIR is not set.
> Where is your kernel? [/usr/src/linux] /usr/src/linux-2.4.20-31.9
> Where is your iptables source code? [/usr/src/iptables]
> /usr/src/iptables-1.2.9
> Loading patchlet definitions... done

Your kernel, iptables source and patch-o-matic versions are too old:
oldest supported kernel is 2.4.23, iptables is 1.2.10 (from cvs).
And definitely use newer pom-ng.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


