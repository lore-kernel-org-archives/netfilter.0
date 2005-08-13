From: "Rosario Pingaro" <rpingar@italycom.it>
Subject: compilation problem rhat el4
Date: Sat, 13 Aug 2005 18:59:25 +0200
Message-ID: <001601c5a028$5c89d500$23d8b2d5@iserver1>
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

I would like to have the l7-filter funtionality on my redhat el4.

So I downloada the latest iptable-1.3.3 and the last patch from =
l7-filter

But trying to compile the patched files I get this error:
#error including kernel header in userspace; use the glibc headers =
instead! make: *** [extensions/libipt_layer7_sh.o] Error 1

I found several posts about it without any useful solution.
In fact if I use "KERNEL_DIR=3D/usr" I get the header from userspace so =
everything is compiled but not the layer7 module "libipt_layer7.so".

I checked if everything into the kernel (about packet filtering and =
layer7) is activated, and there, everythings seems fine.

Just to note that "libipt_layer7.h" is not present on my system.=20

Where is my problem?

Thanks
Rosario
