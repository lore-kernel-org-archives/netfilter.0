From: "Joel n.solanki" <jnsolanki@d2visp.com>
Subject: kernel panic : help
Date: 18 Aug 2004 11:04:56 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092807296.2549.42.camel@joel.d2visp.com>
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
Content-Type: text/plain; charset="us-ascii"
To: lartc <lartc@mailman.ds9a.nl>, netfilter <netfilter@lists.netfilter.org>

Dear all,
when i am starting my bandwidth script i m getting below errors. then my
machine gets unusable.
This is surely something related with tc /iptables and kernel but i cant
sort out what is the problem.
Can any body over have experience such problem.
????????????????


Starting Bandwidth Management: ip_conntrack (4031 buckets, 32248 max)
Kernel BUG at slab.c:1130
invalid operand: 0000
CPU: 0
EIP: 0010:[<c012e188>]	Not tainted
EFLAGS: 00010202
eax: 000001f0	ebx: 00000000 ecx: c15732d0	edx: c02194bc
esi: c15732c0	edi: 000001f0 ebp: c15732c0	esp: dc1c3ae0
ds: 0018 es: 0018 ss: 0018
Process tc (pid: 1164, stackpage=dc1c3000)
Stack: 000001f0	00000000 c1573480 000001f0 c15732c0 c012e20a c15732c0
c15732c0
00000246 000001f0 c15732c0 c012e4fd c15732c0 000001f0 000001d2 c1573480
00000246 000001f0 dc137000 c02209c0 dc137184 df496c00 c01af3f3 00000064

Call Trace: [<c012e20a>] [<c012e4fd>] [<c01af3f3>] [<e017f102>]
[<c01b0e4b>]

"	"	"

Code: 0f 0b 6a 04 bb b6 1f c0 89 7c 24 04 b8 03 00 00 00 81 64 24
 <0>Kernel panice: Aiee, killing interrupt handler!
In interrupt handler - not sycning



Any ideas,
-- 
Joel N.Solanki
Network Administrator
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)



