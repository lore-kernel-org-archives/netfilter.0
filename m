From: Hideaki Nemoto <eme@bg8.so-net.ne.jp>
Subject: can't delete with iptables
Date: Sat, 07 Feb 2004 16:23:07 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402070721.i177LxJ09969@mail.bg8.so-net.ne.jp>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I can't delete the rule by iptables, that I inserted
with my program using libiptc.

I've managed to insert, replace, and delete the rulesfrom my program.
But I can't delete that rule by iptables, or the ip6tables.

It tells me,

 "Bad rule (does a matching rule exist in that chain?)"

Could any one give me some clues to solve this problem?

I'll show the structure of my ipt_entry at the bottom.
Is there something wrong with this?Anything missing?
I've seen in a web site, that I need to build something about
matching if I wanted to delete the rule, but ipt_delete_num_entry
doesn't require that....

I'd really be happy for your help.

Thanks in advance.

   +---------------------+
   |______ipt_entry______|
   |                     |
   | next_offset---------|--->to the next rule(end of the struct)
   |                     |
 +-|-target_offset       |
 | |              elems--|-->+----------------------+
 | +---------------------+   |_ipt_standard_target__|
 |                           |                      |
 |                           |  ipt_entry_target    |
 |                           |                      |
 |                           |  name=udp            |
 |                           |                      |
 |                           |                      |
 |      +---------------+ <--|--data                |
 |      |___ipt_udp_____|    +----------------------+ 
 |      |               |
 |      |               |
 |      |_______________|
 |
 |
 +->+---------------------+
    |_ipt_standard_target_|
    |  ipt_entry_target   |
    |                     |
    |                     |
    | name=ACCEPT         |
    +---------------------+
 

-- 
Hideaki Nemoto mailto:eme@bg8.so-net.ne.jp

