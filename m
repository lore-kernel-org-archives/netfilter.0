From: Hari Hendaryanto <hari.h@csmcom.com>
Subject: L7 compile
Date: Fri, 09 Jun 2006 09:10:35 +0700
Message-ID: <4488D89B.70001@csmcom.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hello,

i'm new in iptables.

is there a way to compile L7 extensions as a kernel module and iptables 
extensions module without recompiling the kernel?

i'm using kernel 2.6.9 and iptables 1.2.11.

by default L7 compiled as iptables extensions modules and built in 
kernel image.and i don't wanna messed around with the existing working 
kernel.

in directory /usr/src/linux/net/ipv4/netfilter i've tried to do this
(i've already patch the kernel and iptables with L7-extensions)

gcc -O3 -Wall -I/usr/src/linux/include -c ipt_layer7.c -D__KERNEL__ 
-DMODULES -DMODVERSIONS

but always come up with bunch of errors.

is there any howto modified L7 patch so i can compile it as a kernel module?

many thanks :)


PT.CITRA SARI MAKMUR
SATELLITE & TERRESTRIAL NETWORK

Connecting the distance - anytime, anywhere, any content

