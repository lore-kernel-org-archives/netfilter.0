From: Carlos Villegas <villegas@math.gatech.edu>
Subject: netfilter not rejecting on Shrike
Date: Tue, 21 Oct 2003 16:09:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021200902.GN1175@uglabng.math.gatech.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,

I found a really strange problem, in which rejecting doesn't work
on netfilter (tcp reset, I haven't tested others). The basic information
is the following:

-OS: Linux RedHat 9 (Shrike) with all the erratas
-kernel: 2.4.20-20.9 and 2.4.20-20.9smp
-iptables: v1.2.7a
-/sbin/lsmod|grep ipt:
ipt_state               1080  24 (autoclean)
ip_conntrack           29512   1 (autoclean) [ipt_state]
ipt_REJECT              3992  10 (autoclean)
ipt_LOG                 4312   3 (autoclean)
iptable_filter          2412   1 (autoclean)
ip_tables              15352   4 [ipt_state ipt_REJECT ipt_LOG iptable_filter]

I have been using a ruleset which rejects using tcp resets for tcp traffic
not explicitly allowed, I used the exact same script under RedHat 8.0
with all the erratas applied, and the rejection was working as expected.
However once the machine was moved to RedHat 9 with all the erratas, it
stopped working (the same script, it was untouched, and available on an 
NFS share), everything works, except that traffic is dropped instead 
of rejected.

I haven't been able to pinpoint it more closely in versions, but it is
possible that the problem appeared after the last iptables update from
RedHat, but I'm not sure about that (it addressed the security 
announcements from 2003-08-01 from the netfilter team). I could try to
confirm that if required. 

I have searched the archives, and the only thing I found that mentions
problems with recent kernels and iptables is: Message-ID: 
<3F697788.8080103@isfera.ru>.

Please let me know if I can provide more information. I do believe that 
the problem lies in netfilter, but I didn't file a bug report since
it might be a kernel problem, or even an rpm packaging problem or
some other subtle "distribution problem". The problem has been reproduced
here on all boxes.  Could someone verify on a different distribution? 
(Or even the same distribution with not all the updates?)

Let me know if you think that this is worthy of a bug report even without 
the verification (If some changes have been made to the REJECT module).

Carlos


