From: "Jason Sigurdur" <Jason.Sigurdur@aspenview.org>
Subject: iptable extentions
Date: Thu, 27 Oct 2005 15:19:08 -0600
Message-ID: <648A21EA469E3848922D9860785CD5EF23D3F9@aspen-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi, regarding adding/compiling extensions for iptables. Why must the
kernel be patched (stupid question); with the newer

fedora kernels modules can be compiled  via a Simple Makefile i.e.

=20

obj-m :=3D libipt_random.o

KDIR  :=3D /lib/modules/$(shell uname -r)/build
PWD   :=3D $(shell pwd)

default:
    $(MAKE) -C $(KDIR) M=3D$(PWD) modules

Is there a quicker way to get the extenstions or must I use the
patch-o-matic?

thx jason


