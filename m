From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Problem with state match for ip6tables
Date: Tue, 14 Feb 2006 00:30:43 +0900 (JST)
Message-ID: <200602131530.k1DFUhLt012479@toshiba.co.jp>
References: <20060210145631.1726fd0d@localhost.localdomain>
	<200602130416.k1D4GP73019763@toshiba.co.jp>
	<8764njipgp.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8764njipgp.fsf@newton.gmurray.org.uk>
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
Content-Type: Text/Plain; charset="us-ascii"
To: graham@gmurray.org.uk
Cc: netfilter@lists.netfilter.org

From: Graham Murray <graham@gmurray.org.uk>
Date: Mon, 13 Feb 2006 09:21:26 +0000

> Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp> writes:
> 
> > The only kernel >= 2.6.15 supports IPv6 state match.
> > And kernel option CONFIG_NETFILTER_XTABLES and 
> > CONFIG_NETFILTER_XT_MATCH_STATE are required.
> >
> > Please "make menuconfig" in kernel source, and go to the menu
> > "Network packet filtering (replaces ipchains)",
> > enable "Netfilter Xtables support (required for ip_tables)",
> > enable "state match support".
> 
> I am using kernel 2.6.15 but I do not see these config options
> anywhere. I have grep'd the kernel source and can find
> CONFIG_IP_NF_MATCH_STATE (which is only used in the ipv4 makefile to
> build ipt_state.o)

Sorry, I was wrong. nf_conntrack lives in kernel >= 2.6.15,
but only kernel >= 2.6.16 supports IPv6 state match.

-- Yasuyuki Kozakai

