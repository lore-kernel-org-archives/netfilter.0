From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: chains sequence
Date: Mon, 30 Sep 2002 16:02:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D985969.1070205@fugmann.dhs.org>
References: <001901c26883$48718980$3201a8c0@leonardo>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>

Leonardo Rodrigues ( listas ) wrote:
>     Which is the correct sequence of a packet received on a machine
> interface and redirected via DNAT ?? Would it be:

This has been discussed on this list in a thread called "mangle tables" 
[1] a few weeks back. Also see Oskar Andreasson's tutorial[2] - It 
explains quite good how chains and tables are traversed.

[1]http://lists.netfilter.org/pipermail/netfilter/2002-September/038169.html.
[2]http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES

Regards
Anders Fugmann

--
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org


