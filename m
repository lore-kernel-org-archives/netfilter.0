From: Marcello Scacchetti <marcello.scacchetti@nextrem.it>
Subject: Re: how to delete a piece of rule in iptables?
Date: 18 Dec 2002 12:18:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040210327.3449.2.camel@nxitmirms1>
References: <200212181222.UAA02783@email.whu.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212181222.UAA02783@email.whu.edu.cn>
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
To: bobo <boboaq@163.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>, "bobowd@sohu.com" <bobowd@sohu.com>

Hi,
you can use iptables -D or -X or -F. -D to delete a single rule, -X do
detele a chain and -F to flush all rules from a chain.
Refer to man 8 iptables for details and examples.

Marcello

Il mer, 2002-12-18 alle 13:30, bobo ha scritto:
>              i have insert some rules to iptables firewall.now,i would 
> like to delete it  .
> but i only know to use iptalbes -L to empty them.
> but it lead to delete all the rules in it.
> how to do ??
> 
-- 
Marcello Scacchetti <marcello.scacchetti@nextrem.it>

