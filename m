From: Michael Goldish <michael.goldish@gmail.com>
Subject: Problem with connrate
Date: Wed, 2 Feb 2005 03:18:41 +0000
Message-ID: <200502020318.42074.michael.goldish@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

This is my first post to this list. I've just started using iptables and I 
very much like it, except for two little things --


(1) I tried the following command:

iptables -A OUTPUT -m connrate --connrate 1024 -j ACCEPT

and got this error message:

iptables v1.2.11: Couldn't load match 
`connrate':/usr/local/lib/iptables/libipt_connrate.so: cannot open shared 
object file: No such file or directory

(other match modules like connmark seem to work fine)

To solve this I tried looking for related config options in my kernel and I 
think I pretty much enabled everything (I know it's not a good idea). Then I 
recompiled iptables but I still don't seem to have libipt_connrate.so. I've 
noticed that there's a .C file with a similar name in my iptables source 
tree, but it probably just doesn't get compiled for some reason.

I also tried using patch-o-matic, which brings me to my second problem:




(2) No patch in patch-o-matic could be applied. I tried:

KERNEL_DIR=/usr/src/linux 
IPTABLES_DIR=/home/cyber/Installs/iptables-1.2.11 ./runme base

and got:

Kernel:   2.6.10, /usr/src/linux
Iptables: 1.2.11, /home/cyber/Installs/iptables-1.2.11
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied: CLASSIFY_more-hooks amanda_offset-fix

Testing conntrack-acct... not applied
The conntrack-acct patch:
   Author: Harald Welte <laforge@netfilter.org> 
   Status: Stable

If you enable this option, the connection tracking code will keep
per-flow packet and byte counters. 

Those counters can be used for flow-based accounting or the `connbytes' match.

If unsure, say N.
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
cannot apply (10 rejects out of 12 hunks)
-----------------------------------------------------------------

This happened for every patch that followed.

The patch-o-matic I downloaded was patch-o-matic-ng-20050130.







(I'm using Slackware 10 with kernel 2.6.10)

Sorry for the long post and the for the newbie questions. But if you can help 
me somehow I'll be grateful.

