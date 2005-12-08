From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: compiling iptables on fedora core 4
Date: Thu, 08 Dec 2005 11:11:45 -0500
Message-ID: <s3981510.038@gwia201.syr.edu>
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

When I attempt to compile iptables, on fedora core 4, using:
make KERNEL_DIR=3D/usr/src/redhat/BUILD/kernel-2.6.11/linux-2.6.11

 it fails with the message:
/usr/src/redhat/BUILD/kernel-2.6.11/linux-2.6.11/include/linux/config.h:6:2=
: error: #error including kernel header in userspace; use the glibc =
headers instead!

this is before applying any of the patches needed for my objective of =
using ipset.

thank you for any assistance you can lend.

<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

