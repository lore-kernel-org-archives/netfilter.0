From: =?unknown-8bit?b?P8zsyMo=?=<wsgtrsys@21cn.com>
Subject: how to Prevent passive fingerprinting
Date: Thu, 11 Nov 2004 20:54:47 +0800 (CST)
Message-ID: <EL958888794552.15665@webmail5.inner-21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jason@jasonandjessi.com

iptables can be Prevent passive fingerprinting like OPENBSD PF's "Packet Normalization"

look:
http://voodoo.somoslopeor.com/papers/nmap.html
http://www.benzedrine.cx/cgi-bin/htsearch?words=Fingerprinting
http://www.openbsd.org/faq/pf/scrub.html

can be use : IPV4OPTSSTRIP or ipv4options or TTL or TOS?




