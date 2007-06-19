From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: REJECT doesnt work
Date: Tue, 19 Jun 2007 14:59:40 +0200
Message-ID: <003701c7b271$b2c80510$0b0ffe0a@NS006819>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com><01c501c7b236$54be1530$0b0ffe0a@NS006819><34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com><003001c7b256$dd268810$0b0ffe0a@NS006819><34b8543c0706190321w4fcd43e7yfa6a4a1308def5f9@mail.gmail.com><003601c7b26c$c1d25e70$0b0ffe0a@NS006819>
	<34b8543c0706190546o21265b55i98f3bb0cfd87cad1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <34b8543c0706190546o21265b55i98f3bb0cfd87cad1@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
> Thanks Rob
> it seems it's not loaded, check this:

So you can't use the REJECT target.

> #locate ipt_REJECT
> ipt_MASQUERADE          3649  8
> ipt_mac                 1985  7
> iptable_nat            23173  2 ipt_MASQUERADE
> ip_conntrack           40949  2 ipt_MASQUERADE,iptable_nat
> ip_tables              16833  3 ipt_MASQUERADE,ipt_mac,iptable_nat

"locate" can't possibly give you the above results.
The output of locate should look like this:

/lib/modules/<kernel-version>/kernel/net/ipv4/netfilter/ipt_REJECT.ko

> and
> # lsmod|grep ipt
> ipt_MASQUERADE          3649  8
> ipt_mac                 1985  7
> iptable_nat            23173  2 ipt_MASQUERADE
> ip_conntrack           40949  2 ipt_MASQUERADE,iptable_nat
> ip_tables              16833  3 ipt_MASQUERADE,ipt_mac,iptable_nat
> 
> how can I load the ipt_REJECT?

Perhaps you need to familiarize with Linux commands.

# modprobe ipt_REJECT

But if you don't have it, you can't load it.


Grts,
Rob

-- 
Disclaimer: Any errors in spelling, tact, or fact are transmission
errors.



