From: Francois LE BOURDELLES <flebourdelles@free.fr>
Subject: How to nat a full subnet ?
Date: 11 May 2003 10:44:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052642696.17942.14.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
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

Hello happy netfilter users,

First i use kernel 2.4.20 patch-o-matic'ed and iptables 2.4.8
I have to SNAT an DNAT a full subnet (199.1.4.0/0 (internal address
plan) to 1998.1.4.0/0 (external view))
so I tried to use the command :

iptables -t nat -A POSTROUTING -s 199.1.4.0/24 --to 199.1.4.0/24 -o
tunnel0 -j SNAT
(tunnel0 is a GRE typed tunnel)

as the NAT Howto page shows (NAT-HOWTO-6.html).

The aim is to have per exemple : 199.1.4.13 source changed to 198.1.4.13

but this command is rejected :

As I understand the sources (iptables and kernel) this is because the
--to only accept single IP address
or a range of IP-address, the last one for a pool automatic selection
[And I do not know for what this could be used !).

DO THE HOW-TO PAGES HAVE TO BE UPDATED (removing of the full subnet SNAT
and DNAT) ... or the iptables/ipfilter updated ?

Regards.
-- 
Francois LE BOURDELLES <flebourdelles@free.fr>


