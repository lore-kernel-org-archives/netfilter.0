From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: Re: upgrade to iptabels from ipchains
Date: Wed, 28 May 2003 13:05:51 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c32533$03ad3a70$8a01a8c0@ESTACAO>
References: <09B04A55822EFF4DA48D2E0BB2941D4A01924C@wardrive.citadelcomputer.com.au> <1054131723.21086.4.camel@dejawu>
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
To: Esteban <eribicic@sinectis.com>, netfilter ML <netfilter@lists.samba.org>


    This set of ipchains rules:

$IPCHAINS -N soporte
$IPCHAINS -A FORWARD -s 10.0.0.0/25  -j soporte
$IPCHAINS -A soporte -s 10.0.1.1 -j MASQUERADE
$IPCHAINS -A soporte -j DENY

    would became this in iptables

iptables -N soporte
iptables -A soporte -s 10.0.1.1 -j ACCEPT
iptables -A soporte -j DROP
iptables -A FORWARD -s 10.0.0.0/25 -j soporte
iptables -t nat -A POSTROUTING -s 10.0.1.1 -j MASQUERADE


    Some explanations

    In ipchains, the decision to allow or not forwarding was done in forward
rule, as well as the decision of forward it with the original address or NAT
it. This has changed in iptables. FORWARD rule only take the decision of
allowing or not the forwarding of the packet. NAT is done in POSTROUTING
rule of nat table. You should also note that when you do not specify which
table, you're working with filter table. So 'iptables -N soporte' and
'iptables -t filter -N soporte' would do exactly the same thing.


    Well, hope this helps ....

    Sincerily,
    Leonardo Rodrigues


