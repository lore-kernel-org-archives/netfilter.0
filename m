From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Rule Ordering
Date: Mon, 6 Oct 2003 15:42:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031006074248.GC6473@propaganda.localdomain>
References: <3F811366.1030608@riovia.net>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F811366.1030608@riovia.net>
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

On Mon, Oct 06, 2003 at 03:01:58AM -0400, Paul Caritj spoke thusly:

>For example, say I have a bunch of rules that will be coming and going 
>on a very frequent basis, but I have one that I need to keep last in the 
>evaluation sequence. A that I would just add the rule that needs to stay 
>last with "-A" and all the others with "-I"?

Yes.

