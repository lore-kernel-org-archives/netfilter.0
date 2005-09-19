From: Mike Ireton <mike-netfilter@tiedyenetworks.com>
Subject: MARK: targetinfosize 8 != 4
Date: Mon, 19 Sep 2005 17:12:32 -0400
Message-ID: <432F29C0.30007@tiedyenetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi List,

I'm hitting a wall with the error message 'MARK: targetinfosize 8 !=4' 
and I'm stumped. Looking at the code, this message is related to a 
sanity check that iptables and it's extensions peform and the deal seems 
to be that the size of a declared structure is different between what 
the kernel was compiled with, vs what iptables was compiled with (struct 
ipt_mark_target_info verses ipt_mark_target_info_v1). There also appears 
to be some runtime determination as to which structure version iptables 
should be using (depending on kernel. iptables appears to open a socket 
and 'ask' which it should use).

I don't see where I could possibly be compiling for one kernel / 
iptables version but then using another or anything simple like that. I 
don't see any other possible cause of this mismatch either. The software 
revions involved are iptables-1.3.3 and kernel 2.4.32-pre3.

Thanks.



