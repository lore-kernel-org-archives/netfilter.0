From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: kernel panic : help
Date: Wed, 18 Aug 2004 21:45:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7t3cew8k69RKL00000075@server7.bandwidthco.com>
References: <1092807296.2549.42.camel@joel.d2visp.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1092807296.2549.42.camel@joel.d2visp.com>
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
To: "'Joel n.solanki'" <jnsolanki@d2visp.com>, 'lartc' <lartc@mailman.ds9a.nl>, 'netfilter' <netfilter@lists.netfilter.org>

when i am starting my bandwidth script i m getting below errors. then my
machine gets unusable.
This is surely something related with tc /iptables and kernel but i cant
sort out what is the problem.
Can any body over have experience such problem.
????????????????


Starting Bandwidth Management: ip_conntrack (4031 buckets, 32248 max) Kernel
BUG at slab.c:1130 invalid operand: 0000
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

Call Trace: [<c012e20a>] [<c012e4fd>] [<c01af3f3>] [<e017f102>] [<c01b0e4b>]

"	"	"

Code: 0f 0b 6a 04 bb b6 1f c0 89 7c 24 04 b8 03 00 00 00 81 64 24  <0>Kernel
panice: Aiee, killing interrupt handler!
In interrupt handler - not sycning

Interesting core dump. What this is saying is that your Slab Allocator (an
object cache manager) has crashed in a very bad way. It might be worth while
looking at the script causing this, but my guess is you have a hardware
problem that only manifests itself under the conditions created by it.
Guessing somewhat further, I would say the problem is one of the motherboard
components itself. I think I might begin by resetting the memory modules and
go from there. If that does not help, it could be an indicator that your
motherboard has an ESD damaged component. Mind you, this is just an
experienced based hunch and may not be the case at all.



