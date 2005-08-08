From: "hareram" <hareram@sol.net.in>
Subject: ipt_random patch
Date: Mon, 8 Aug 2005 22:42:39 +0530
Message-ID: <025b01c59c3c$61699f50$0903a8c0@southern>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all

iam trying to patch with POM with my new source kernel
i could able to do with random patch

[root@test patch-o-matic-ng-20040621]# IPTABLES_DIR=/root/iptables-1.3.2 
KERNEL_DIR=/usr/src/linux-2.6.12.3 ./runme random/
Loading patchlet 
definitions.............................................................................................................. 
done


Excellent! Source trees are ready for compilation.


its says successfully done

but when i see in in kernel config
make menuconfig
in network configuration, i dont see random.. options at all

but i could able to see others like TTL , Quote

what is wrong ??


iam using FC4
iptable 1.3.2

hare 



