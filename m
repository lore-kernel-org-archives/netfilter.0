From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Is there something wrong with patch-o-matic?
Date: Thu, 28 Nov 2002 10:24:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211281024.18984.fabrice@netfilter.org>
References: <031e01c2930e$41097800$4545450a@drbroyles.com> <038e01c2937d$cece8030$4545450a@drbroyles.com> <04bb01c293df$79be2610$4545450a@drbroyles.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04bb01c293df$79be2610$4545450a@drbroyles.com>
Content-Disposition: inline
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
To: Brandon Broyles <netfilter@drbroyles.com>, netfilter@lists.netfilter.org


Hello Brandon,

On Monday 25 November 2002 01:32, Brandon Broyles wrote:
> [...]
> I think I may have a clue on where to start.  I was looking at the
> 'isapplied' script that came with patch-o-matic.  In line 32 it references
> a command that doesn't exist for me.  It reads as such...
> MISSING_FILES=`patch -R -s -f -p1 < $PATCH | grep "No file to patch" | wc -l`
> I have no 'patch' command and there isn't one anywhere under my netfilter
> directory I got from CVS.  I'm not too keen with shell scripting, so I'm
> not sure how the absence of a patch command will effect the overall
> workings of the 'runme' script.
> Is this as it should be or is something wrong with the patch-o-matic that I
> downloaded?

patch-o-matic is all about helping you applying your patches automatically
with the 'patch' command. Without patch command there's simply no patch-o-matic.
If you want to use the netfilter extensions which are provided only in patch(-o-matic)
format, then just install 'patch' tool first.

On mandrake, you can simply run
# urpmi patch
it will download and install the tool for you along with dependencies.

BTW, are you really sure you don't have patch ? :)
(usually, patch is /usr/bin/patch)

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

