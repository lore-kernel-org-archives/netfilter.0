From: Jay Schulist <jschulist@bivio.net>
Subject: Re: [PATCH] associate user defined name with rule match
Date: Wed, 18 Sep 2002 15:17:52 -0700 (PDT)
Sender: netfilter-devel-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209181516070.5702-100000@beavis.networkrobots.com>
References: <20020918214757.GD10465@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-devel-admin@lists.netfilter.org>
In-Reply-To: <20020918214757.GD10465@oknodo.bof.de>
Errors-To: netfilter-devel-admin@lists.netfilter.org
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter-devel/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Schaaf <bof@bof.de>
Cc: Jay Schulist <jschlst@linux-sna.org>, Harald Welte <laforge@gnumonks.org>, netfilter-devel@lists.netfilter.org, netfilter@lists.netfilter.org

On Wed, 18 Sep 2002, Patrick Schaaf wrote:

> I don't understand. Do you mean "tag with some string, so we can later
> easily grep for it"? No real match operation, just a way to attach some
> text to a rule?
> 
> If that's it, I vote to rename the thing "comment", and please permit
> arbitrary quoted strings (with proper escaping for iptables-restore's
> benefit).
> 

right, it already does quoted strings on iptables-save.

jay-s.


