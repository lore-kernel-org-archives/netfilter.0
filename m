From: Phil Howard <phil-netfilter@ipal.net>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 08:45:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013084558.C15824@hamal.ipal.net>
References: <20021013065007.A15824@hamal.ipal.net> <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there> <20021013080034.B15824@hamal.ipal.net> <3DA9716C.8070806@bewegungsmelder.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DA9716C.8070806@bewegungsmelder.de>; from thomas.lussnig@bewegungsmelder.de on Sun, Oct 13, 2002 at 03:13:16PM +0200
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
To: netfilter@lists.netfilter.org

On Sun, Oct 13, 2002 at 03:13:16PM +0200, Thomas Lussnig wrote:

| >
| >
| >| Why don't you want 10000 rules on your netfilter box ?   Have you tried it 
| >| and found it causes any problems ?
| >
| >My understanding is they are tested sequentially.  Maybe this isn't true,
| >but I see no documentation to the contrary regarding netfilter being any
| >different than past table oriented access list style filtering which uses
| >sequential testing to implement the ordered logic usually involved.
| >
| >One other goal I had not mentioned is being able to add/delete netblocks
| >as needed without replacing the whole ruleset.  But I don't think it would
| >be a big issue.
| >
| With the posibility of user defined tables you can create an BTREE that 
| is much faster the linear search.
| But i think that for this propose an mathing like "pool" should be the 
| right. there was some ime ago an
| discousion here. If pool should support sparse set of ip's to (rand 
| spread). Maybe you can implement it
| and the use the pool module.

Can you provide some references?  URLs?  I'm not really following what
you are saying (maybe language problem) but maybe I would understand it
better with technical background.  I know about BTREE.  I do not know
about "pool" in this context.

I certainly want to avoid linear search of 10000 rules.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

