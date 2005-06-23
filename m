From: =?ISO-8859-2?Q?Marcin_Zaj=B1czkowski?= <mszpak@wp.pl>
Subject: Problem with ipt_time after kernel upgrade
Date: Thu, 23 Jun 2005 13:02:00 +0200
Message-ID: <42BA96A8.6080807@wp.pl>
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

Hi,

I had kernel 2.4.25 with patch-o-matic and ipt_time worked ok.
After upgrade it to 2.4.31-rc1 (with pom-ng-20050529 - latest available 
then, but since then there weren't changes in "time") and patched 
iptables-1.2.9 from Fedora3 (recompiled with the same pom).
Everything seemed ok, but recently I noticed that (after upgrade) 
iptables stopped counting packets in rules with "time".

Sample rule (I haven't changed it in meantime):
$IPT -t mangle -A FORWARD -i $INTERNAL_ETH -s $SOME_INTERNAL_IP -m time 
--timestart 8:49 \
--timestop 23:59 --days Mon,Tue,Wed,Thu,Fri,Sat,Sun -j MARK --set-mark 102

Module is loaded and used:
[root@koles rc.d]# lsmod | grep time
ipt_time                1976   2  (autoclean)
ip_tables              14784  11  [ipt_time ipt_MARK ipt_LOG ipt_limit 
iptable_mangle iptable_nat ipt_REJECT ipt_state iptable_filter]

Rule is in mangle (but nothing catch with "time"):
[root@koles rc.d]# iptables -L -t mangle -v
(...)
     0     0 MARK       all  --  eth0   any     $SOME_IP anywhere 
       TIME from 8:49 to 23:59 on Sun,Mon,Tue,Wed,Thu,Fri,Sat MARK set 0x100

After remove "time" from rule everything is ok.

Do you have any idea what could be wrong?

Thanks for help
Marcin

