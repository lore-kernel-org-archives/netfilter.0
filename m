From: Mika Rantonen <Mika.Rantonen@vtt.fi>
Subject: unresolved symbols and depmod
Date: Tue, 12 Aug 2003 14:57:52 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.3.2.7.2.20030812145009.00d70580@elemail.ele.vtt.fi>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all!

I have a following kind of problem. I have laptop with Red Had 7.3 and 
kernel 2.4.20. In addition I have install mipv6 of HUT which uses 
netfilter- functions and this works fine. Then I try to install AODV6-uu ad 
hoc routing daemon which also uses same functions and I get following errors:

depmod: *** Unresolved symbols in /lib/modules/2.4.20/aodv/kaodv6.o
depmod: nf_unregister_hook_RFfeda11ee
depmod: dev_get_by_name_Re225cd47
depmod: nf_register_hook_R4bd477f0
depmod: netdev_finish_unregister_Rbc1e4da8
make: *** [install] Error 1

Has anyone some kind of clue, how this problem can be solve? AODV6_uu works 
fine if mipv6 is not installed.

Best regards,

Mika Rantonen
Research Scientist
VTT Electronics


