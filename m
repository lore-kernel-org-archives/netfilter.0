From: FB <register@flintz.de>
Subject: layer 7 netfilter not working
Date: Fri, 09 Jul 2004 22:56:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EF0666.9010902@flintz.de>
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

Hello there!

I am trying to get traffic shaping working on my Linux router (debian 
woody 3r02) and for some things I wanted to use the layer 7 packet 
classifier, but I can't get it to work.
Here is what I did:

-downloaded the patches from http://l7-filter.sourceforge.net
-downloaded the kernel 2.6.7 source
-downloaded the iptables 1.2.11 source
-patched kernel (layer7 patch and some patch to get iptables 1.2.11 
working with kernel 2.6.7)
-patched iptables
-compiled iptables
-activated layer 7 support in kernel-config (and a lot of other packet 
classifing options)
-compiled and installed kernel

Now I tried to mark some packets with layer 7 so that I can shape them 
with tc afterwards. But nothing changed, outgoing connection still 
didn't changed. So I changed the line in the iptables-script to this:

  $IPTABLES -t filter -A OUTPUT -m layer7 --l7dir /etc/l7-protocols 
--l7proto ftp -j DROP

before it was:

$IPTABLES -t mangle -A POSTROUTING -m layer7 --l7proto ftp -j MARK 
--set-mark 322

but nothing of them worked (I could still connect over ftp). The 
/proc/net/layer7_numpackets is 08 (don't know which 8 packets got 
identified there, but the number is not going any higher).

(BTW: when I use the setting from the NETFILTER HOWTO page:

iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j MARK 
--set-mark 1

and change it (as written in the howto under "blocking") to:
iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j REJECT

I get an "iptables: Invalid Argument", same with DROP instead of REJECT, 
when executing the script, how that? (I must admit that I am not that 
iptable expert, so excuse some lack of knowledge of all the chains and 
structures ;) )

Any help is really appreciated!

-FB

