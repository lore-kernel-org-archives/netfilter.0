From: Eric Crossman <eric.crossman@critical.com>
Subject: MARK target with unsigned long
Date: Fri, 05 Sep 2003 11:25:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F58AACF.2060503@critical.com>
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
To: netfilter list <netfilter@lists.netfilter.org>

Has anyone run across a problem trying to use the high order bits in 
MARKing packets (i.e. 0xffffffff)? The fwmark seems to be using a signed 
long opposed to an unsigned long with limits the highest allowable value 
to 0x7fffffff. I have created the following patch which uses an unsigned 
long. Is this a legitimate fix that won't interfere with other parts of 
the iptables code?

diff -Naur iptables-1.2.8.orig/iptables.c iptables-1.2.8/iptables.c
--- iptables-1.2.8.orig/iptables.c      2003-03-31 07:11:55.000000000 -0500
+++ iptables-1.2.8/iptables.c   2003-08-30 16:08:05.000000000 -0400
@@ -889,12 +889,12 @@
 string_to_number(const char *s, unsigned int min, unsigned int max,
                 unsigned int *ret)
 {
-       long number;
+       unsigned long number;
        char *end;
 
        /* Handle hex, octal, etc. */
        errno = 0;
-       number = strtol(s, &end, 0);
+       number = strtoul(s, &end, 0);
        if (*end == '\0' && end != s) {
                /* we parsed a number, let's see if we want this */
                if (errno != ERANGE && min <= number && number <= max) {

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Eric Crossman <eric.crossman@critical.com>
Critical Technologies Inc.
1001 Broad St., Suite 400
Utica, NY 13501


