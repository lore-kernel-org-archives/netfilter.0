From: Evgeniy Zaitsev <eightn@roger.net.ru>
Subject: Re[2]: CONNMARK patch do not work in kernel 2.6.9
Date: Tue, 14 Dec 2004 01:28:18 +0300
Message-ID: <1916839365.20041214012818@comtv.ru>
References: <1241129595.20041204132415@roger.net.ru>
	<41B3271B.20008@lopsch.com>
Reply-To: Evgeniy Zaitsev <eightn@comtv.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B3271B.20008@lopsch.com>
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

Hello, Lopsch.

Sunday, December 5, 2004, 6:19:55 PM, you wrote:

>> I try to use latest patch-o-matic to
>> I have tried to use last patch-o-matic
>> (patch-o-matic-ng-20040621.tar.bz2 also do not work)
>> for addition of purpose CONNMARK in iptables on a kernel 2.6.9
>> 
>> But the patch is not set, as does not find the necessary lines of a code in a file
>> linux/net/ipv4/netfilter/ip_conntrack_standalone.c
>> 
L> Try this:

Thanks, Lopsch, patch are works. It appears, for its imposing it was
necessary to take advantage switcg "-F 3", As with "-F 2 " don't
passed any chunks.

Unfortunately, I have faced the same problem, as with previous a patch (patch-o-matic-ng-20040621)
on a kernel 2.6.7

iptables -t mangle -A PREROUTING -i eth1 -j prert_services_ctv_spec_ctv
iptables -t mangle -A prert_services_ctv_spec_ctv -s 10.0.0.0/8 -m mac --mac-source 00:90:27:A7:58:21 -m
state --state NEW -j CONNMARK --set-mark 0x40 
iptables -t mangle -A prert_services_ctv_spec_ctv -m mark --mark 0x40 -j ACCEPT 
iptables -t mangle -A prert_services_ctv_spec_ctv -s 10.0.0.0/8 -m state --state NEW -j CONNMARK
--set-mark 0x60 
iptables -t mangle -A prert_services_ctv_spec_ctv -m mark --mark 0x60 -j ACCEPT 

In this rules list a command
iptables-t mangle-A prert_services_ctv_spec_ctv-m mark - mark 0x40-j ACCEPT 
does not work:

# iptables -t mangle -nxvL  prert_services_ctv_spec_ctv
Chain prert_services_ctv_spec_ctv (1 references)
    pkts      bytes target     prot opt in     out     source               destination
       5      304 CONNMARK   all  --  *      *       10.0.0.0/8           0.0.0.0/0           MAC
00:90:27:A7:58:21 state NEW CONNMARK set 0x40
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match
0x40
     116     6048 CONNMARK   all  --  *      *       10.0.0.0/8           0.0.0.0/0           state NEW
CONNMARK set 0x60
   57464 48953156 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           MARK match
0x60


This commands used for "not simple routing":

                                      ----- router1 ---\
    LAN1            LAN1-router,NAT  / mark 0x40        \
192.168.1.0/24 ---> 192.168.1.1(eth1)                      LAN2 10.0.0.0/8
                                     \ mark 0x60        /
                                      ----- router2 ---/


LAN2, 10.0.0.0/24 it is possible to enter two different ways, through
router1 with mac addr 00:90:27:A7:58:21 and through router2.

Inside LAN1 are a servers which from LAN2 are visible under different
IP-addresses (router1 and router2 addresses).
Therefore it is necessary  what the inquiry coming through router1 in
LAN1, back came back as through router1. For router2 - it is similar.

For this purpose I marking incoming connections (from LAN2) in a chain
"prert_services_ctv_spec_ctv" (*mangle table) and when packets on this connection come back in LAN2,
they depending on marks (I apply - restore-mark) on the same channel on whom they and came.

But the matter is that a command
iptables-t mangle-A prert_services_ctv_spec_ctv-m mark - mark 0x40-j ACCEPT 
does not work, therefore all entering connections are marked as 0x60
and are sent through router2 :(

I where that was mistaken in a spelling of rules?
I can not understand in any way. Thought, switching to kernel 2.6.9 will rescue, appeared - has not
rescued.




-- 
Best regards,
 Evgeniy                            mailto:eightn@roger.net.ru


