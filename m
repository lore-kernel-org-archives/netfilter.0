From: <llana@hanzy.ath.cx>
Subject: string.patch  - iptables-1.2.6a/ linux-2.6.5
Date: Thu, 6 May 2004 18:12:03 +0800 (PHT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <21350.61.9.69.125.1083838323.squirrel@hanzy.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Ive been running Debian 3.0r2. Ive been using the string matching patch
on my old 2.4.x kernel. But i upgraded my kernel to 2.6.5. Now im trying to
add the string matching patch to the new kernel but im getting error.

Has anyone compiled the string matching patch on a 2.6.x kernel?
Im getting an error saying...  "Could not find place to slot in Config.in
line"...

TIA



.:: screenshot ::.

#export KERNEL_DIR=/usr/src/linux-2.6.5
#cd /usr/src/iptables-1.2.6a

#make patch-o-matic KERNEL_DIR=/usr/src/linux-2.6.5



Testing... string.patch NOT APPLIED ( 2 missing files)
The extra/string patch:

   This patch adds CONFIG_IP_NF_MATCH_STRING which allows you to
   match a string in a whole packet.

   THIS PATCH DOES NOT WORK WITH KERNEL 2.4.9 !!!

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] Y
Testing patch extra/string.patch...
fgrep:
/usr/src/linux-2.6.5/../87b4dc3322fefa73e617f3394aa4409c6f5f407df6300bd0ce2bf3348840cd2b/net/ipv4/netfilter/Config.in:
No such file or directoryCould not find place to slot in Config.in line
TEST FAILED: patch NOT applied.

[Press enter to continue]



