From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Fw: iptables-save/restore question
Date: Tue, 17 Sep 2002 14:45:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8723F6.50904@fugmann.dhs.org>
References: <006b01c25e32$5ede5500$6307a8c0@net>
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
To: Bo Jacobsen <subs@systemhouse.dk>
Cc: netfilter@lists.netfilter.org

Bo Jacobsen wrote:
> I run some iptables commands then run iptables -L -n > testfile1 to save the setup.
> Then I run iptables-restore testfile1 and than run iptables-save again:
> iptables -L -n > testfile2
Why dont you use 'iptables-save' to save the rules?

> The reason we want to make this test is that we need to be sure that the rules generated directly by
> the iptables commands, are EXATLY the same as what the iptables-save/restore command pair does.
Do you distrust the iptables-restore command. If you do, then insert 
each rule by hand (or through a sctipt.).  You cannot validate rules, 
the way you described above, even if the saved files were equal.

Example: Assume a bug is present resulting in iptables -L -n lists all 
ip-addresses as 0.0.0.0/0. When you use iptables-restore, then the rules 
has 0.0.0.0/0 instead of the original ipnumbers.  Even if 
iptables-save/iptables-restore produces the same results, you have not 
proven that iptables-save works, because the original rules did have 
other ipaddresses than 0.0.0.0/0.

> 
> One thing is to test that the iptable commands works, another is to blindly trust that our 300 iptable rules
> are correctly saved and restored by iptables-save/restore (a firewall with 4 different local lans).
What are you afraid of. iptables-restore not able to process 300 lines? 
You you trust it to read even 1 rule?

If you cannot trust iptables-restore then do not use it. If you trust 
it, then trust it enough the assume that iptables-restore would yeild an 
exit value <>0, if any error occured while setting the rules.

Regards
Anders Fugmann


-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


