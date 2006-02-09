From: Claas Hilbrecht <claas+maillinglists.netfilter@jucs-kramkiste.de>
Subject: iptables chain name limits differ
Date: Thu, 09 Feb 2006 14:23:51 +0100
Message-ID: <861A90786D6440B15266D502@[192.168.83.50]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

there seems to be a problem in kernel 2.4.32 and iptables 1.3.4. I think 
the maximum chain name length is different in some code pathes. See here:

fli4l # iptables -N 1234567890123456789012345678A
fli4l # iptables -nvL | grep 1234
Chain 1234567890123456789012345678A (0 references)
fli4l # iptables -A INPUT -i eth5 -j 1234567890123456789012345678A
iptables: No chain/target/match by that name
fli4l # iptables -N 1234567890123456789012345678
fli4l # iptables -A INPUT -i eth5 -j 1234567890123456789012345678
fli4l # iptables -nvL | grep 123456789
    0     0 1234567890123456789012345678  all  --  eth5   *       0.0.0.0/0 
0.0.0.0/0
Chain 1234567890123456789012345678 (1 references)
Chain 1234567890123456789012345678A (0 references)

If you create a chain with 29 characters you can't use this chain name as a 
jump target. The fli4l team thinks the problem is located in that piece off 
code:

<snip>
static void set_revision(char *name, u_int8_t revision)
{
        /* Old kernel sources don't have ".revision" field,
           but we stole a byte from name. */
        name[IPT_FUNCTION_MAXNAMELEN - 2] = '\0';
        name[IPT_FUNCTION_MAXNAMELEN - 1] = revision;
}
Breakpoint 7, set_revision (name=0x8055562 "post-out-ovpn-KarstenHorsmann",
    revision=0 '\0') at iptables.c:1806
(gdb) print name
$23 = 0x8055562 "post-out-ovpn-KarstenHorsmann"
(gdb) next
(gdb) print name
$24 = 0x8055562 "post-out-ovpn-KarstenHorsman"
</snip>

-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de


