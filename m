From: Kevin White <ml-kevin@kevbo.org>
Subject: Can't get pom-ng to batch apply one patch
Date: Tue, 20 Jul 2004 15:05:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FD6D16.1000004@kevbo.org>
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
To: netfilter@lists.netfilter.org

I'm trying to automatically build a kernel.  As such, I need to 
automatically apply pom patches, and I can't get it to work.

I'm using patch-o-matic-ng-20040621.  For kicks, I'm trying to apply the 
"first" patch in the base suite, 04_linux-2.4.26-helper_reassign.patch.

That patch does apply if I run:

./runme base

and say "Y" to it.  But I can't get this to work:

./runme --batch updates/04_linux-2.4.26-helper_reassign.patch

First, on an unmodified runme, this code causes my patch to be skipped:

for my $rep (@repositories) {

         PATCHLET: for my $plname (@patchlets) {
                 my $patchlet = $session->{patchlets}->{$plname};
                 next PATCHLET unless defined $patchlet

The $session hash doesn't have a patch called 
"updates/04_linux-2.4.26-helper_reassign.patch", but I have to refer to 
the patch by that name to get past all of the prior checks for .info 
files and such.

So, I hacked this in there:

             $plname =~ s/.*\///;
             print "looking at $plname\n";

before the my $patchlet line, and it causes it to match, but then, the 
patch won't actually apply:

cannot apply (1 rejects out of 1 hunks)
cannot apply (41 rejects out of 43 hunks)
ERROR (41 rejects out of 43 hunks)
apply_dependency: unable to apply dependent 02_linux-2.4.24.patch
-----------------------------------------------------------------

Which wouldn't happen if I just ran runme and picked this patch.

So, help!  How to people batch apply specific patches?

Kevin



