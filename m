From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: SNAT "invalid argument"
Date: 04 Aug 2003 23:45:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060033549.3175.5.camel@tux.rsn.bth.se>
References: <20030804185601.GA8546@free.transpect.com>
	 <06a001c35abb$cfcf0120$1100000a@busbydev>
	 <20030804195613.GA8638@free.transpect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030804195613.GA8638@free.transpect.com>
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
To: Whit Blauvelt <whit@transpect.com>
Cc: David Busby <busby@pnts.com>, Netfilter <netfilter@lists.netfilter.org>

This has been asked several times on this list.
And I've answered it several time as well.

Recompile the iptables program against your new kernel.
Some major changes were made in the 2.4.21 kernel that requires this
recompile.

-- 
/Martin

