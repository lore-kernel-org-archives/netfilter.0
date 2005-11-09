From: "Bill Hance" <bill@billhance.com>
Subject: Re: incrementing TTL in firewall
Date: Wed, 9 Nov 2005 11:01:40 -0500 (EST)
Message-ID: <3185.192.168.3.8.1131552100.squirrel@192.168.3.8>
References: <20051108001620.25531.qmail@web60923.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051108001620.25531.qmail@web60923.mail.yahoo.com>
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


> On Tue, 08 Nov 2005 01:21:16 +0200, Bill Hance
> <bill@billhance.com> wrote:
>
>> Greetings,
>>
>>   I am trying to "hide" my firewall from showing up on
> traceroutes, but
>> want my network to be pingable.  So, I've forwarded icmp
> type 8 through
>> the firewall to a host that will do the echo replying.
>>
>>   As you can see below, when I omit the "1" from the
> command, I get a
>> message to specify a value.  But when I add "1" as the
> value, I get a
>> "No chain/target/match by that name" error...
>>
>>   Any help would be appreciated.
>>
>>  -Bill
>>
>>
>>
>>
>> [root@BULLDOG /]# uname -r
>> 2.4.20-6
>> [root@BULLDOG /]# rpm -q iptables
>> iptables-1.2.7a-2
>> [root@BULLDOG /]#
>> [root@BULLDOG /]# iptables -t mangle -L -n -v
>> Chain PREROUTING (policy ACCEPT 56522 packets, 32M bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>>
>> Chain INPUT (policy ACCEPT 14410 packets, 919K bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>>
>> Chain FORWARD (policy ACCEPT 42112 packets, 31M bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>>
>> Chain OUTPUT (policy ACCEPT 13576 packets, 1318K bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>>
>> Chain POSTROUTING (policy ACCEPT 55687 packets, 32M
> bytes)
>>  pkts bytes target     prot opt in     out     source
>> destination
>> [root@BULLDOG /]#
>> [root@BULLDOG /]#
>> [root@BULLDOG /]#
>> [root@BULLDOG /]# iptables -t mangle -A PREROUTING -j TTL
> --ttl-inc
>> iptables v1.2.7a: TTL: You must specify a value
>> Try `iptables -h' or 'iptables --help' for more
> information.
>> [root@BULLDOG /]#
>> [root@BULLDOG /]# iptables -t mangle -A PREROUTING -j TTL
> --ttl-inc 1
>> iptables: No chain/target/match by that name
>> [root@BULLDOG /]#
>> [root@BULLDOG /]#
>
> Maybe you're missing TTL target support in the kernel.
> Check
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TTLTARGET
>
>



Thanks for the help.  I believe I have TTL target support in the kernel:

I am unsure what "unused" means here, for ipt_ttl.
Does it mean I do not have TTL support?
(The man page for lsmod doesn't give details)


# lsmod
Module                  Size  Used by    Not tainted
ipt_ttl                 1144   0  (unused)
ipt_MARK                1368   0  (autoclean)
iptable_mangle          2776   0  (autoclean)
ipt_limit               1560   1  (autoclean)
es1371                 30792   0  (autoclean)
ac97_codec             13640   0  (autoclean) [es1371]
gameport                3364   0  (autoclean) [es1371]
soundcore               6404   4  (autoclean) [es1371]
ide-cd                 35708   0  (autoclean)
cdrom                  33728   0  (autoclean) [ide-cd]
parport_pc             19076   1  (autoclean)
lp                      8996   0  (autoclean)
parport                37056   1  (autoclean) [parport_pc lp]
nfsd                   80176   8  (autoclean)
lockd                  58704   1  (autoclean) [nfsd]
sunrpc                 81564   1  (autoclean) [nfsd lockd]
autofs                 13268   0  (autoclean) (unused)
8139too                18088   2
mii                     3976   0  [8139too]
ipt_state               1048  11  (autoclean)
iptable_nat            21720   1  (autoclean)
ip_conntrack           26976   2  (autoclean) [ipt_state iptable_nat]
iptable_filter          2412   1  (autoclean)
ip_tables              15096   9  [ipt_ttl ipt_MARK iptable_mangle
ipt_limit ipt_state iptable_nat iptable_filter]
keybdev                 2944   0  (unused)
mousedev                5492   1
hid                    22148   0  (unused)
input                   5856   0  [keybdev mousedev hid]
usb-uhci               26348   0  (unused)
usbcore                78784   1  [hid usb-uhci]
ext3                   70784   3
jbd                    51892   3  [ext3]
raid1                  14956   3
#
#
#
# iptables -t mangle -A PREROUTING -i eth0 -p icmp -j TTL --ttl-inc 1
iptables: No chain/target/match by that name
#









