From: manisha s <cdac_manisha@yahoo.com>
Subject: Re: Iptables command failed
Date: Thu, 8 Apr 2004 04:58:19 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408115819.8901.qmail@web61004.mail.yahoo.com>
References: <001801c41d43$99a8b000$1202a8c0@admin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001801c41d43$99a8b000$1202a8c0@admin>
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
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Hi,

Thanks for ur help....
i again recompiled the kernel with netfilter support
and the iptables is now working fine....
i think i did not copied the newly kernel image to the
boot dir  so that the problem remained....

anyway
thanks once again for ur time


--- Rob Sterenborg <rob@sterenborg.info> wrote:
> > I have downloaded iptables-1.2.9 from
> netfilter.org and
> > installed using  make and make install commands
> after
> > compiling the kernel with network packet filtering
> > (replaces ipchains) option having value yes
> 
> Did you patch the kernel with a new Patch-O-Matic
> (also from the Netfilter
> website) before you configured/compiled it ?
> I suppose iptables-1.2.9 requires symbols not yet in
> an unpatched kernel.
> 
> > > iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
> > >
> > > i got the following error
> > >
> > >
>
/lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
> > > unresolved symbol
> nf_register_sockopt_Rsmp_f5985dce
> 
> 
> Gr,
> Rob
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! Small Business $15K Web Design Giveaway 
http://promotions.yahoo.com/design_giveaway/

