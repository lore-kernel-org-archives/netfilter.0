From: Tom Eastep <teastep@shorewall.net>
Subject: Re: shorewall: how to open high port
Date: Thu, 01 Apr 2004 06:27:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406C26EE.7070707@shorewall.net>
References: <20040401052857.4A66B380B@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401052857.4A66B380B@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg wrote:

> 
> Not familiar with Shorewall and I didn't fully read the rules above but what
> I'm not seeing is an entry stating : RELATED,ESTABLISHED or something. My
> guess is you need such a rule.

Shorewall provides such rules automatically.

> And are you loading the ftp helper module ?

I suspect that is the problem. The OP has also posted on the Shorewall 
list where I've replied as well.

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



