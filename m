From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Looking for ipt_connlimit.so
Date: Thu, 25 Sep 2003 12:50:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E4D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Blair Vessey <vessey@upei.ca>, netfilter@lists.netfilter.org

You have to download / rebuild your userspace tools. If you checked out
the CVS root, it is in the userspace directory. Not only do you need a
kernel module, but you also need the userspace extensions to match with
what is on the kernel.

Steps:

Build Kernel w/POM
<same old>

Install Kernel
<same old>

Build iptables (userspace)
# KERNEL_DIR=3D<justbuiltkernelsourcedir> make; make install
If the build gets b0rked due to some incompatibility between
kernel/userspace extensions, rebuild the kernel without the offending
extension.

Reboot!

Enjoy!



