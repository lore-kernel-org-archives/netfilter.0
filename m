From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Iptables command failed
Date: Thu, 8 Apr 2004 10:29:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001801c41d43$99a8b000$1202a8c0@admin>
References: <20040408071811.94845.qmail@web61010.mail.yahoo.com>
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

> I have downloaded iptables-1.2.9 from netfilter.org and
> installed using  make and make install commands after
> compiling the kernel with network packet filtering
> (replaces ipchains) option having value yes

Did you patch the kernel with a new Patch-O-Matic (also from the Netfilter
website) before you configured/compiled it ?
I suppose iptables-1.2.9 requires symbols not yet in an unpatched kernel.

> > iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
> >
> > i got the following error
> >
> > /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
> > unresolved symbol nf_register_sockopt_Rsmp_f5985dce


Gr,
Rob


