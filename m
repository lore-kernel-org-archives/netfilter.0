From: "Vladimir Iskoz" <Vladimir.Iskoz@alvarion.com>
Subject: RE: cannot find -ldl
Date: Tue, 14 Nov 2006 16:14:42 +0200
Message-ID: <A656C409D135BD44A5901A88AD851E5E04B171@tlvex02.alvarion.com>
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
To: Eric Leblond <eric@inl.fr>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi Eric,
Thanks a lot for your help.
I uncommented NO+AF8-SHARED+AF8-LIBS +AD0- 1 in the iptables Makefile but received:
undefined reference to 'dl+AF8-open'
It seems that some files are still looking for libdl.a or libdl.so.
I found them in /usr/lib but I don't know whether they are relevant to uClinux or not.

I will very thankfull for any help

BR 
Vladi

+AD4- Hi all,
+AD4- I'm trying to add firewall functionality to my current project. I'm starting with adding iptables (1.3.4) to my project using Buildroot menucofig tool.
+AD4- Unfortunately I received the following error during the link:
+AD4- cannot find -ldl

You should try to compile it statically as you plan to use it on an
embededded system.
In iptables Makefile uncommment :
+ACM- NO+AF8-SHARED+AF8-LIBS +AD0- 1

BR,

+AD4- 
+AD4- I tried to removed -ldl from iptables Makefile but receive the other errors:
+AD4- undefined reference to 'dl+AF8-open'
+AD4- ...
+AD4- 
+AD4- I'm using armeb-linux-uclibc-gcc 
+AD4- 
+AD4- Where are I can find corresponding libdl.a (I did not find it in my project)?
+AD4- What workaround can be done?
+AD4- 
+AD4- The last rows during Buildroot compilation before the Error are:
+AD4- /home/vladimir/R2/osdk/buildroot/build+AF8-armeb+AF8-nofpu/staging+AF8-dir/bin/armeb-linux-uclibc-gcc -Os -pipe  -membedded-pic -Wall -Wunused -I/include -Iinclude/ -DIPTABLES+AF8-VERSION+AD0AXAAi-1.3.4+AFwAIg-  -D+AF8-UNKNOWN+AF8-KERNEL+AF8-POINTER+AF8-SIZE -DIPT+AF8-LIB+AF8-DIR+AD0AXAAi-/usr/lib/iptables+AFwAIg- -rdynamic -o iptables iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl
+AD4- /home/vladimir/R2/osdk/buildroot/build+AF8-armeb+AF8-nofpu/staging+AF8-dir/bin-ccache/../lib/gcc/armeb-linux-uclibc/3.4.5/../../../../armeb-linux-uclibc/bin/ld: cannot find -ldl
+AD4- 
+AD4- What is a preferable way to add iptables: add them to Buildroot menu or explicitly to Linux Kernel menu in Network Options?
+AD4- 
+AD4- My Target details:
+AD4- Architecture: ARM
+AD4- OS: uClinux
+AD4- Linux Kernel: 2.6.14
+AD4- Cross Compilation Tool: Buildroot
+AD4- 
+AD4- Thanks a lot for any help
+AD4- 
+AD4- Vladi Iskoz
+AD4- 



 
 
************************************************************************************
This footnote confirms that this email message has been scanned by
PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses(43).
************************************************************************************




