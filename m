From: diegoa@imagiro-1.com
Subject: Iptables + extensions + Fedora 3
Date: Wed, 22 Mar 2006 10:31:30 -0800 (PST)
Message-ID: <48135.82.214.211.1.1143052290.squirrel@webmail.imagiro-1.com>
Reply-To: diegoa@imagiro-1.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I need to add the extenions for iptables. I am running Fedora 3. I
downloaded patch-o-matic which lets me add the extensions I need. Here's
what I have done so far.

1. Download patch-o-matic, kernel sources, etc.
2. Installed the kernel source.
3. Ran iptables runme -extra and installed the quota patch
4. Complied the kernel according to this site:
http://www.cri.ch/linux/docs/sk0010.html
5. I restarted and booted into the new kernel that appeared in the grub m=
enu.
6. I ran the iptables command to apply the quota patch: iptables -A INPUT
-p tcp -m quota --quota 2147483648 -j ACCEPT

and I got this error: iptables v1.2.11: Couldn't load match
`quota':/lib/iptables/libipt_quota.so: cannot open shared object file: No
such file or directory

7. I ran make menuconfig and I found the kernel module marked for Module.
Which to me says that it is configured in the new kernel.

Is the module loaded? Yes, according to...
[root@localhost ~]# modprobe -l | grep quota
/lib/modules/2.6.9-prep/kernel/net/ipv4/netfilter/ipt_quota.ko

What is going on here?


