From: "Sezmillenium" <sezmillenium@yahoo.es>
Subject: RE: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 18:52:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BOfvN-0004BQ-H5@vishnu.netfilter.org>
References: <200405141414.34877.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200405141414.34877.Antony@Soft-Solutions.co.uk>
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

Hi!

OK. I have this situation


VPN_CLIENT(w2k box) ---> router ---> FIREWALL (NAT) ---> M$ Server


I want to configure only the Firewall.

First, I tried to create a connection with pptp. Pptp need protocol GRE and
iptables don't support nat with protocol GRE. I must recompile the Kernel...

M$ server also supports ipsec and l2tp. Is ipsec/l2tp supported with
iptables without recompile the kernel? It's more difficult???

Thanks!

SERGI


