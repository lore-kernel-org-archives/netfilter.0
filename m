From: "Stefan Bosnjakovic" <sb@digital-vitamins.com>
Subject: cannot compile extensions/libipt_ECN.c
Date: Mon, 9 Feb 2004 18:13:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAPCp1YAf+Yku8TNzXRFUK5MKAAAAQAAAApakBm76La0OUjD2MrlZa8QEAAAAA@digital-vitamins.com>
Reply-To: <sb@digital-vitamins.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi list,

when I try to compile the user-land applications of iptables 1.2.6a,
it stops at extensions/libipt_ECN.c with the following message:
extensions/libipt_ECN.c: In function `parse':
extensions/libipt_ECN.c:51: `IPT_ECN_OP_REMOVE' undeclared (first use in
this function)
extensions/libipt_ECN.c:51: (Each undeclared identifier is reported only
once
extensions/libipt_ECN.c:51: for each function it appears in.)
extensions/libipt_ECN.c: In function `print':
extensions/libipt_ECN.c:82: `IPT_ECN_OP_REMOVE' undeclared (first use in
this function)
extensions/libipt_ECN.c:83: warning: unreachable code at beginning of switch
statement
extensions/libipt_ECN.c: In function `save':
extensions/libipt_ECN.c:99: `IPT_ECN_OP_REMOVE' undeclared (first use in
this function)
extensions/libipt_ECN.c:100: warning: unreachable code at beginning of
switch statement
make: *** [extensions/libipt_ECN.o] Error 1

any idea what include file I'm missing?

In #include <linux/netfilter_ipv4/ipt_ECN.h
I can find a couple of IPT_ECN_OP_SET... there - but no IPT_ECN_OP_REMOVE.

I tried kernel 2.4.5 and 2.4.24 fyi ...

Cheers, Stefan !


