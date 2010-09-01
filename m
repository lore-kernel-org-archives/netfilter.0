From: Stig Thormodsrud <stig@vyatta.com>
Subject: change to max length of jump target
Date: Tue, 31 Aug 2010 18:11:58 -0700
Message-ID: <4C7DA85E.8000809@vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm in the process of upgrading to iptables 1.4.9 and noticed that the
max jump target has changed from 30 characters to 28 characters.  For
example I can still create a 29 character chain but can't create a jump
target to it:

root@r1:~# iptables -t filter --new-chain A2345678901234567890123456789

root@r1:~# iptables -L A2345678901234567890123456789
Chain A2345678901234567890123456789 (0 references)
target     prot opt source               destination

root@r1:~# iptables -t filter --insert VYATTA_IN_HOOK 1 --in-interface
eth3 --jump A2345678901234567890123456789
iptables v1.4.9: Invalid target name `A2345678901234567890123456789' (28
chars max)
Try `iptables -h' or 'iptables --help' for more information.


This worked in 1.4.4.   In the code I see these changes:

git show 491c1660 include/linux/netfilter/x_tables.h
commit 491c1660fced08e2d1a08c101c63af04250275d0
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Mon Jun 7 10:59:03 2010 +0200

    includes: sync header files from Linux 2.6.35-rc1

    Signed-off-by: Jan Engelhardt <jengelh@medozas.de>

diff --git a/include/linux/netfilter/x_tables.h
b/include/linux/netfilter/x_tabl
index ccb5641..fa2d957 100644
--- a/include/linux/netfilter/x_tables.h
+++ b/include/linux/netfilter/x_tables.h
@@ -1,9 +1,10 @@
 #ifndef _X_TABLES_H
 #define _X_TABLES_H
-
+#include <linux/kernel.h>
 #include <linux/types.h>

 #define XT_FUNCTION_MAXNAMELEN 30
+#define XT_EXTENSION_MAXNAMELEN 29
 #define XT_TABLE_MAXNAMELEN 32




and:


git show 0cb675b8 iptables.c
commit 0cb675b8f18c4b074d4c69461638820708e98100
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Mon Jun 7 11:50:25 2010 +0200

    xtables: another try at chain name length checking

    Since XT_EXTENSION_MAXNAMELEN is now available, make use of it
    and clear the confusion.

    Signed-off-by: Jan Engelhardt <jengelh@medozas.de>

diff --git a/iptables.c b/iptables.c
index 19c2af5..efe993e 100644
--- a/iptables.c
+++ b/iptables.c
@@ -460,10 +460,10 @@ parse_target(const char *targetname)
                xtables_error(PARAMETER_PROBLEM,
                           "Invalid target name (too short)");

-       if (strlen(targetname) > XT_FUNCTION_MAXNAMELEN - 1)
+       if (strlen(targetname) >= XT_EXTENSION_MAXNAMELEN)
                xtables_error(PARAMETER_PROBLEM,
                           "Invalid target name `%s' (%u chars max)",
                           targetname, XT_EXTENSION_MAXNAMELEN - 1);



Is the change from > to >= a mistake or is max length change intentional?

thanks,

stig
