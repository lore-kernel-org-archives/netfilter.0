From: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 15:13:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA9716C.8070806@bewegungsmelder.de>
References: <20021013065007.A15824@hamal.ipal.net> <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there> <20021013080034.B15824@hamal.ipal.net>
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
To: Phil Howard <phil-netfilter@ipal.net>
Cc: netfilter@lists.netfilter.org

>
>
>| Why don't you want 10000 rules on your netfilter box ?   Have you tried it 
>| and found it causes any problems ?
>
>My understanding is they are tested sequentially.  Maybe this isn't true,
>but I see no documentation to the contrary regarding netfilter being any
>different than past table oriented access list style filtering which uses
>sequential testing to implement the ordered logic usually involved.
>
>One other goal I had not mentioned is being able to add/delete netblocks
>as needed without replacing the whole ruleset.  But I don't think it would
>be a big issue.
>
With the posibility of user defined tables you can create an BTREE that 
is much faster the linear search.
But i think that for this propose an mathing like "pool" should be the 
right. there was some ime ago an
discousion here. If pool should support sparse set of ip's to (rand 
spread). Maybe you can implement it
and the use the pool module.

Cu Thomas


