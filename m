From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: How to install patch-o-matic
Date: Wed, 18 Aug 2004 14:09:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512A2@asimail2.alphanumeric.com>
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

> During my research on the net, I found that I need to load two modules =
in
> the kernel in order to enable this function; the modules (please =
correct me
> if I am mistaken) are "ip_conntrack_pptp" & "ip_nat_pptp".
>
> And I found that these two modules come with patch "patch-o-matic". I =
have
> kernel version "2.4.20-8" and iptables version "v1.2.7a", and hence I
> downloaded the "patch-o-matic-20030107.tar.bz2" in accordance.
>
> I decompressed and untar that patch inside "/root" directory.
> Then I get inside the directory "/root/patch-o-matic-20030107" and I =
found a
> list of files and other directories.
> In fact I don't know how to complete the installation process after =
that and
> which file I should start with in order to have these two modules in =
hand;
> it is not mentioned precisely in the README file.

you need to have the kernel source code available on your system, and =
run (for example):

KERNEL_DIR=3D/usr/src/linux-2.4.20-8  ./runme pending
KERNEL_DIR=3D/usr/src/linux-2.4.20-8  ./runme extra/pptp-conntrack-nat

(the KERNEL_DIR above is just an example)

> It is required to recompile and build the Red Hat 9.0 kernel after
> installation that patch, so can you refer me where can I find a =
detailed
> instructions and steps on how to compile the kernel?

yes--recompiling the kernel is required.  refer to the kernel how-to:

  http://www.digitalhermit.com/linux/Kernel-Build-HOWTO.html

it's usually a good idea to rebuild the userspace iptables after =
applying pom; though, i don't think it's necessarily "required" in your =
case.

-j

