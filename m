From: Jamie Pratt <jamie@nucdc.org>
Subject: compile problem with 1.2.10
Date: Thu, 17 Jun 2004 08:12:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D18AB4.4070101@nucdc.org>
Reply-To: jamie@nucdc.org
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi, I'm trying to compile 1.2.10 on a RH 7.2 box, running kernel 2.4.26.
(The prior version is 1.2.9, no POM or anything fancy, just the default 
stuff..)

I get the following error upon running 'make KERNEL_DIR=/usr/src/linux' :

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.10\"  -DIPT_LIB_DIR=\"/usr/local/lib/iptables\" 
-rdynamic -o iptables iptables-standalone.c iptables.o libiptc/libiptc.a 
-ldl -lnsl
/bin/sh: -c: line 1: syntax error near unexpected token `;'
/bin/sh: -c: line 1: `if [ -n "" ]; then  for ext in ; do  echo ".SS 
$ext (not supported, see Patch-O-Matic)" ; cat 
extensions/libipt_$ext.man ; done ; fi >>extensions/libipt_matches.man'
make: *** [extensions/libipt_matches.man] Error 2
rm libiptc/libip6tc.o libiptc/libip4tc.o


Any ideas?

regards,
jamie


