From: Sheldon Hearn <sheldonh@clue.bz>
Subject: Re: skip other iptables marking if packet is already marked
Date: Mon, 31 May 2004 11:36:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085996196.9107.5.camel@axl.seasidesoftware.co.za>
References: <020701c446e0$44e95ee0$0100a8c0@newlife>
	 <1085991395.26732.12.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1085991395.26732.12.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Ming-Ching Tiew <mingching.tiew@redtone.com>, netfilter@lists.netfilter.org

On Mon, 2004-05-31 at 10:16, Cedric Blancher wrote:

> I think your ruleset does not work because a packet without a mark will
> match your non-zero mark rule. I mean that no mark is different than 0,
> so all packets will match the first "-m mark ! --mark 0" rule.

Really?  No mark and mark 0 are different?

How do you distinguish an unmarked packet in a ruleset?

I ask because this relates to an as yet unanswered question of mine,
with Subject "CONNMARK restore-mark creates conntrack entry?"

Ciao,
Sheldon.



