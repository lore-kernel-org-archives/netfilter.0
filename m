From: "PAUL FABRICIO VILLACRESES LEON" <paulvillacreses@hotmail.com>
Subject: Ok more REDIRECT,DNAT,SNAT in C
Date: Thu, 30 Jan 2003 21:03:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F1154CfngVdwnPUF4eN00008a5b@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ranjeet.shetye2@zultys.com
Cc: netfilter@lists.netfilter.org


Hi
Developers

Thanks for the answers

Ok I give details i use libiptc and bridging firewall for put rules in chain 
FORWARD for develop a transparent firewall contents(block pornographic page 
and block tcp ports like 80HTTP,53DNS,22SSH,21TELNET). Iptables enable or 
disable the use of some ports tcp and may do it NAT with pages.

i probe all rules in SNAT, DNAT and REDIRECT and all work well with the 
scrips . but my program need use the extended target modules for put rules 
en table nat .

How can i include extended target modules in my proyect and used it?

Thank for the answers

regards,

Paul Villacreses





_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


