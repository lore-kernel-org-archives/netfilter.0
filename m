From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Path to configure stateless DNAT with iptables ?
Date: Wed, 2 Oct 2002 17:34:45 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002203429.512C2681B4@engenho.terra.com.br>
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
To: netfilter@lists.netfilter.org

 Hi,

 I humbly ask your advice on this one:

 I need to do DNAT changing destination to a single 
 ip-address for every non-marked packet.

 I mark the packets in mangle table, I DNAT in nat table...
 that would suffice but I need it to be stateless instead of 
 stateful! Tolerating conntrack overhead (in my case) is too
 expensive.

 The question is...how can I disable conntrack for DNAT ?

 (a) there is a secret switch ? (not very likely ;o)
 (b) there is a patch ?
 (c) should I make such patch ? ( then touch what piece
     of code: conntrack, ip_tables module,?)
 (d) forget about it because...

 TIA
 
 Senra
 
-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

