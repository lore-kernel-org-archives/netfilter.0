From: "Manikandan" <manikandan_m@java-green.com>
Subject: Unable to apply pptp conntrack patch
Date: Fri, 14 May 2004 16:04:09 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKMEMOCFAA.manikandan_m@java-green.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi all,

	I am trying to patch my RedHat kernel kernel-2.4.20-31.9 with pptp
conntrack patch as my NAT clients requires access to one of my Windows 2000
VPN server. I am getting the following error when I patch my kernel.

[root@manikandan patch-o-matic-ng-20040302]# ./runme pptp-conntrack-nat/
Hey! KERNEL_DIR is not set.
Where is your kernel? [/usr/src/linux] /usr/src/linux-2.4.20-31.9
Where is your iptables source code? [/usr/src/iptables]
/usr/src/iptables-1.2.9
Loading patchlet definitions... done
Welcome to Patch-o-matic (1.14)!

Kernel:         /usr/src/linux-2.4.20-31.9
Iptables:       /usr/src/iptables-1.2.9

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied:

Not all requirements fulfilled for pptp-conntrack-nat/, skipping:
 Can't find a patch version of  matching your  version

Excellent! Source trees are ready for compilation.

Any help!

-- Manikandan.




