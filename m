From: "b.fx" <b.fx@free.fr>
Subject: Re[2]: log - kernel BUG at transaction.c
Date: Fri, 6 Dec 2002 10:49:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <578959783.20021206104907@free.fr>
References: <1013773586.20021206092240@free.fr>
 <1039164490.18412.47.camel@rayw.knowledgefactory.co.za>
Reply-To: "b.fx" <b.fx@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039164490.18412.47.camel@rayw.knowledgefactory.co.za>
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

hello Raymond,

Sorry i guess i have answer to your personal Email adress, excuse me.

I haven't consult the mailing list archives yet.
I will try to look for something this way.

thanks

RL> Hi

RL> Maybe I'm way off here, but I recall something similar being discussed
RL> on this list previously and it was a file system corruption in the
RL> journaling file system (reiserfs?).

RL> Ray

RL> On Fri, 2002-12-06 at 10:22, b.fx wrote:
>> Hello list,
>> 
>> Here is an incomprehensible log for me. Is anybody able to tell me
>> wath does that mean, bad config, bug, need to be patch ?...
>> I use a RedHat7.2 updated and a 2.4.18-18.7 kernel.
>> 
>> thanks
>> 
>> Dec  5 23:30:00 firewall kernel: Assertion failure in __journal_unfile_buffer() at transaction.c:1569: "transaction->t_nr_buffers >= 0"
>> Dec  5 23:30:00 firewall kernel: ------------[ cut here ]------------
>> Dec  5 23:30:00 firewall kernel: kernel BUG at transaction.c:1569!
>> Dec  5 23:30:00 firewall kernel: invalid operand: 0000
>> Dec  5 23:30:00 firewall kernel: ipt_MASQUERADE ipt_state ipt_limit ipt_LOG iptable_mangle iptable_filter ip_nat_irc ip_conntrack_ftp ip_nat_ftp iptable_
>> nat ip_conntrack ip_tables autofs 8139
>> Dec  5 23:30:00 firewall kernel: CPU:    0
>> Dec  5 23:30:01 firewall kernel: EIP:    0010:[8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-198791/96]    Not tainted
>> Dec  5 23:30:01 firewall kernel: EIP:    0010:[<c480e779>]    Not tainted
>> Dec  5 23:30:01 firewall kernel: EFLAGS: 00010286
>> Dec  5 23:30:01 firewall kernel:
>> Dec  5 23:30:01 firewall kernel: EIP is at __journal_unfile_buffer [jbd] 0xb9 (2.4.18-18.7.x)
>> Dec  5 23:30:01 firewall kernel: eax: 0000006a   ebx: c2f88740   ecx: 00000000   edx: c2818000
>> Dec  5 23:30:01 firewall kernel: esi: 00000000   edi: c0b8e490   ebp: 00000004   esp: c3f71e20
>> Dec  5 23:30:01 firewall kernel: ds: 0018   es: 0018   ss: 0018
>> Dec  5 23:30:01 firewall kernel: Process kjournald (pid: 12, stackpage=c3f71000)
>> Dec  5 23:30:01 firewall kernel: Stack: c48141a0 c4813c0f c4813a40 00000621 c4814720 c0b8e490 c2f88740 00000000
>> Dec  5 23:30:01 firewall kernel:        c480ed87 c0b8e490 00000001 c22dc300 c0b8e490 0000000a c3f70000 c480eea4
>> Dec  5 23:30:01 firewall kernel:        c0b8e490 c2f88740 00000004 c480fadb c0b8e490 c2f88740 00000004 00000001
>> Dec  5 23:30:01 firewall kernel: Call Trace: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-175712/96] .rodata.str1.32 [jbd] 0x20
>> (0xc3f71e20))
>> Dec  5 23:30:01 firewall kernel: Call Trace: [<c48141a0>] .rodata.str1.32 [jbd] 0x20 (0xc3f71e20))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-177137/96] .rodata.str1.1 [jbd] 0x1df (0xc3f71e24)
>> )
>> Dec  5 23:30:01 firewall kernel: [<c4813c0f>] .rodata.str1.1 [jbd] 0x1df (0xc3f71e24))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-177600/96] .rodata.str1.1 [jbd] 0x10 (0xc3f71e28))
>> Dec  5 23:30:01 firewall kernel: [<c4813a40>] .rodata.str1.1 [jbd] 0x10 (0xc3f71e28))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-174304/96] .rodata.str1.32 [jbd] 0x5a0 (0xc3f71e30
>> ))
>> Dec  5 23:30:01 firewall kernel: [<c4814720>] .rodata.str1.32 [jbd] 0x5a0 (0xc3f71e30))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-197241/96] __journal_file_buffer [jbd] 0xd7 (0xc3f
>> 71e40))
>> Dec  5 23:30:01 firewall kernel: [<c480ed87>] __journal_file_buffer [jbd] 0xd7 (0xc3f71e40))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-196956/96] journal_file_buffer [jbd] 0x14 (0xc3f71
>> e5c))
>> Dec  5 23:30:01 firewall kernel: [<c480eea4>] journal_file_buffer [jbd] 0x14 (0xc3f71e5c))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-193829/96] journal_commit_transaction [jbd] 0x9cb
>> (0xc3f71e6c))
>> Dec  5 23:30:01 firewall kernel: [<c480fadb>] journal_commit_transaction [jbd] 0x9cb (0xc3f71e6c))
>> Dec  5 23:30:01 firewall kernel: [schedule+533/576] schedule [kernel] 0x215 (0xc3f71f7c))
>> Dec  5 23:30:01 firewall kernel: [<c0115d95>] schedule [kernel] 0x215 (0xc3f71f7c))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-184680/96] kjournald [jbd] 0x118 (0xc3f71fc0))
>> Dec  5 23:30:01 firewall kernel: [<c4811e98>] kjournald [jbd] 0x118 (0xc3f71fc0))
>> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/2.4.18-18.7.x/kernel/drivers+-184992/96] commit_timeout [jbd] 0x0 (0xc3f71fd8))
>> Dec  5 23:30:01 firewall kernel: [<c4811d60>] commit_timeout [jbd] 0x0 (0xc3f71fd8))
>> Dec  5 23:30:01 firewall kernel: [kernel_thread+38/48] kernel_thread [kernel] 0x26 (0xc3f71ff0))
>> Dec  5 23:30:01 firewall kernel: [<c0107176>] kernel_thread [kernel] 0x26 (0xc3f71ff0))



-- 
 b.fx


