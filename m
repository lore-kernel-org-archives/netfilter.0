From: Tomasz Wrona <tw@eter.tym.pl>
Subject: iptables or kernel bug report.
Date: Wed, 18 Sep 2002 00:29:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0209180012200.2702-100000@king.klan.gda.pl>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,


I would like to report some bug...
Today I launched kernel 2.4.20-pre7 patched with path-o-matic 2020916 and
iptables 1.2.7a.
First reboot with new kernel was successfull but next hanged system during
startup process.
On terminal I had some info telling about some "kernel BUG at
slab.c:1128!" and "iptables process". I put complete screenshot [sorry for
photo] on location "http://eter.tym.pl/bug.gif" [27KB].

System hanged during firewall startup in the moment when special user
defined chain was created. This chain summons two experimental modules
"PSD" and "Recent".  When I removed this chain, system didn't hang up.


Regards.
tw
-- 

----------------
 ck.eter.tym.pl

"Never let shooling disturb Your education"


