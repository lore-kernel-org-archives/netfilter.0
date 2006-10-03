From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: patchomatic runme script bug - using backup files?
Date: Tue, 3 Oct 2006 08:55:16 -0700
Message-ID: <200610030855.16979.alan.ezust@presinet.com>
References: <200609201525.39890.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609201525.39890.alan.ezust@presinet.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi - I don't have commit access yet, so I'm hoping someone will apply this 
patch for me.

This patch will prevent patchomatic from sucking up old backup files when it's 
applying patches.

diff -u ../patch-o-matic-ng-trunk/Netfilter_POM.pm  Netfilter_POM.pm
--- ../patch-o-matic-ng-trunk/Netfilter_POM.pm  2006-10-03 
08:21:19.000000000 -0700
+++ Netfilter_POM.pm    2006-10-03 08:46:41.000000000 -0700
@@ -361,7 +361,7 @@
        opendir(DIR, $dir)
                or croak "can't open directory $dir: $!";
        # Don't miss .foo-test files!
-       my @dents = sort grep {!/^(\.\.?|CVS|\.svn)$/} readdir(DIR);
+       my @dents = sort grep {!/^(\.\.?|CVS|\.svn|#?.*~)$/} readdir(DIR);
        closedir(DIR);
        foreach my $dent (@dents) {
                my $fullpath = "$dir/$dent";

On Wednesday 20 September 2006 15:25, Alan Ezust wrote:
> I just ran into this bug in runme script from patchomatic - I was writing a
> patch file called linux-2.6.16.29.patch but there was a BACKUP file
> called linux-2.6.16.29.patch~ and another one called linux-2.6.patch~
> and it seems to be finding the BACKUP files and using them in favor of the
> actual patch files I am developing. Since the output doesn't tell me which
> file it is reading, I couldn't tell what was wrong, and wasted quite a lot
> of time looking at a file that wasn't even being read by runme.

