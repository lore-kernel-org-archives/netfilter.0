From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: patchomatic runme script bug - using backup files?
Date: Tue, 3 Oct 2006 10:46:34 -0700
Message-ID: <200610031046.34705.alan.ezust@presinet.com>
References: <200609201525.39890.alan.ezust@presinet.com>
	<200610030855.16979.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200610030855.16979.alan.ezust@presinet.com>
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

Found another place which also needed to be patched. Here is the updated diff:

diff -u ../patch-o-matic-ng-trunk/Netfilter_POM.pm Netfilter_POM.pm
--- ../patch-o-matic-ng-trunk/Netfilter_POM.pm  2006-10-03 
08:21:19.000000000 -0700
+++ Netfilter_POM.pm    2006-10-03 10:23:52.000000000 -0700
@@ -361,7 +361,7 @@
        opendir(DIR, $dir)
                or croak "can't open directory $dir: $!";
        # Don't miss .foo-test files!
-       my @dents = sort grep {!/^(\.\.?|CVS|\.svn)$/} readdir(DIR);
+       my @dents = sort grep {!/^(\.\.?|CVS|\.svn|#?.*~)$/} readdir(DIR);
        closedir(DIR);
        foreach my $dent (@dents) {
                my $fullpath = "$dir/$dent";
@@ -486,7 +486,7 @@
        # get list of source files that we'd need to copy
        opendir(PDIR, $patchdir)
                or croak "unable to open patchdir $patchdir: $!";
-       my @dents = sort readdir(PDIR);
+        my @dents = sort grep {!/^(\.\.?|CVS|\.svn|#?.*~)$/} readdir(PDIR);
        closedir(PDIR);

        foreach my $pf (@dents) {
@@ -494,7 +494,6 @@
                my $ver;
                my $oldpwd;

-               next if $pf =~ /^(\.|CVS$)/;

                if ($pf =~ /\.patch/) {
                        # Patch file of a project:


On Tuesday 03 October 2006 08:55, Alan Ezust wrote:
> Hi - I don't have commit access yet, so I'm hoping someone will apply this
> patch for me.
>
> This patch will prevent patchomatic from sucking up old backup files when
> it's applying patches.
>

