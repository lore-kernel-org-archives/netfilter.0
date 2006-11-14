From: "Vladimir Iskoz" <Vladimir.Iskoz@alvarion.com>
Subject: cannot find -ldl
Date: Tue, 14 Nov 2006 13:27:34 +0200
Message-ID: <A656C409D135BD44A5901A88AD851E5E04B16F@tlvex02.alvarion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi all,
I'm trying to add firewall functionality to my current project. I'm starting with adding iptables (1.3.4) to my project using Buildroot menucofig tool.
Unfortunately I received the following error during the link:
cannot find -ldl

I tried to removed -ldl from iptables Makefile but receive the other errors:
undefined reference to 'dl+AF8-open'
...

I'm using armeb-linux-uclibc-gcc 

Where are I can find corresponding libdl.a (I did not find it in my project)?
What workaround can be done?

The last rows during Buildroot compilation before the Error are:
/home/vladimir/R2/osdk/buildroot/build+AF8-armeb+AF8-nofpu/staging+AF8-dir/bin/armeb-linux-uclibc-gcc -Os -pipe  -membedded-pic -Wall -Wunused -I/include -Iinclude/ -DIPTABLES+AF8-VERSION+AD0AXAAi-1.3.4+AFwAIg-  -D+AF8-UNKNOWN+AF8-KERNEL+AF8-POINTER+AF8-SIZE -DIPT+AF8-LIB+AF8-DIR+AD0AXAAi-/usr/lib/iptables+AFwAIg- -rdynamic -o iptables iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl
/home/vladimir/R2/osdk/buildroot/build+AF8-armeb+AF8-nofpu/staging+AF8-dir/bin-ccache/../lib/gcc/armeb-linux-uclibc/3.4.5/../../../../armeb-linux-uclibc/bin/ld: cannot find -ldl

What is a preferable way to add iptables: add them to Buildroot menu or explicitly to Linux Kernel menu in Network Options?

My Target details:
Architecture: ARM
OS: uClinux
Linux Kernel: 2.6.14
Cross Compilation Tool: Buildroot

Thanks a lot for any help

Vladi Iskoz




 
 
************************************************************************************
This footnote confirms that this email message has been scanned by
PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses(42).
************************************************************************************




