From: "Brandon Broyles" <netfilter@drbroyles.com>
Subject: Is there something wrong with patch-o-matic?
Date: Sun, 24 Nov 2002 12:32:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04bb01c293df$79be2610$4545450a@drbroyles.com>
References: <031e01c2930e$41097800$4545450a@drbroyles.com> <200211241243.59265.fabrice@netfilter.org> <038e01c2937d$cece8030$4545450a@drbroyles.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, fabrice@netfilter.org


----- Original Message -----
From: "Brandon Broyles" <netfilter@drbroyles.com>
To: <fabrice@netfilter.org>; <netfilter@lists.netfilter.org>
Sent: Sunday, November 24, 2002 12:53 AM
Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?


> From what I read in the above link, I think something may be wrong with my
> patch-o-matic I got via CVS.  I ran a (./runme base) and I got the following
> output.  In this output the only thing that is "Already applied:" is the
> first line.  Nothing else seems to be applied after that.  Plus, that link
> above references  switches ( Do you want to apply this patch [N/y/t/f/q/?] )
> that I am not getting.

I think I may have a clue on where to start.  I was looking at the 'isapplied'
script that came with patch-o-matic.  In line 32 it references a command that
doesn't exist for me.  It reads as such...

MISSING_FILES=`patch -R -s -f -p1 < $PATCH | grep "No file to patch" | wc -l`


I have no 'patch' command and there isn't one anywhere under my netfilter
directory I got from CVS.  I'm not too keen with shell scripting, so I'm not
sure how the absence of a patch command will effect the overall workings of the
'runme' script.


Is this as it should be or is something wrong with the patch-o-matic that I
downloaded?

Thanks,
Brandon Broyles


