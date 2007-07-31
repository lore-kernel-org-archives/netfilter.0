From: "Sashan Govender" <sashang@gmail.com>
Subject: compiling extension modules with -std=c99 fails
Date: Tue, 31 Jul 2007 12:14:32 +1000
Message-ID: <23738f080707301914p65be54c2o9ef6e840c86920e6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=SNUq6xNfWeWLV1nwGiU3pckmxf/s0FCX6lWgwrd6qpAWwJ8wV0mQeQNY5mlyDeV1BsFqswA16cej1fsXmND2Xx0mqGwZGnOdXStkc2xkS09hz80QYB7mJlmuLSVZCg7KfJyyUzr928x3SPsmBT2llK32M/jHzD+8IzXK1ZTu8vw=
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

Hi

Is there any reason why compiling the iptables extensions should fail
when using -std=c99?

cc -O2 -Wall -Wunused
-I/usr/src/kernels/2.6.18-1.2798.fc6-i586/include -Iinclude/
-DIPTABLES_VERSION=\"1.3.5\"
-DIPT_LIB_DIR=\"/usr/local/lib/iptables\" -rdynamic -o iptables
iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl -std=c99
In file included from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from iptables-standalone.c:38:
/usr/src/kernels/2.6.18-1.2798.fc6-i586/include/linux/netfilter_ipv4/ip_tables.h:43:
error: IFNAMSIZ undeclared here (not in a function)


-- 
sashan
http://sashang.orcon.net.nz/

