From: Henrik Nordstrom <hno@marasystems.com>
Subject: RE: Possible Bug? /proc/net/ip_tables_targets listing problem?
Date: Mon, 10 Oct 2005 11:28:04 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510101115001.9129@filer.marasystems.com>
References: <4349f4d2.1827431c.3cb4.ffffbea5@mx.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4349f4d2.1827431c.3cb4.ffffbea5@mx.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rob M <c4blem0nkey@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 9 Oct 2005, Rob M wrote:

> The problem here is that I've only built v1.3.2 on this box.  I've found
> there is a similar problem in the listing for `/proc/net/ip_tables_matches'.
> There I find a double listing for `multiport'.  I don't think this is a
> feature mislisting since it is a clean build and I've done no patching (well
> the patches leading up to yes but not) beyond v1.3.2.  It's as clean of a
> build as I think you can get with out totally unmerging the package and
> remerging v1.3.3, but I digress.

It is a misfeature of current Linux kernels.

> If the problem were the comparison of built modules to features that I had
> built into the kernel, there _should_ be more duplicates then 1 match and 1
> target in their respected lists.

It depends on the target/matches loaded. Some have multiple versions to 
support old iptables binaries and gets listed multiple times.

> As far as I can tell, it does not affect
> functionality.

Correct, and is why it is a misfeature not a bug.

> But then again, I assume that when it checks to see if a match or target 
> is loaded, it compared the requested match/target against the required 
> list, and in turn could cause problems for checking available 
> match/targets.  This is an assumption that I'm making, whether it's true 
> or false.  If this isn't affect anything and it's simply an aesthetic 
> issue, then I'm going to get back to work and just code what I'm working 
> on to expect the possibilities for duplicates in these lists.

You could also submit a patch to the kernel to only list these 
targets/matches once.

Regards
Henrik

