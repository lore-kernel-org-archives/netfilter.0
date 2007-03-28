From: Denis Kaganovich <mahatma@bspu.unibel.by>
Subject: POM "--without-kernel" & "--without-iptables"
Date: Wed, 28 Mar 2007 20:03:00 -0200
Message-ID: <460AE614.9090806@bspu.unibel.by>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I recommend to add "--without-kernel" & "--without-iptables" into POM "runme".
(I needs it for Gentoo separated package installations, but there are good 
options anymore)

There is my solution:

diff -U 2 patch-o-matic-ng-20070323/Netfilter_POM.pm 
patch-o-matic-ng-20070323.fixed/Netfilter_POM.pm
--- patch-o-matic-ng-20070323/Netfilter_POM.pm	2007-01-12 19:07:08.000000000 +0200
+++ patch-o-matic-ng-20070323.fixed/Netfilter_POM.pm	2007-03-28 
22:15:34.000000000 +0300
@@ -1044,4 +1044,5 @@
  	my($branch, $oldest);
  	foreach $proj (keys %{$self->{projects}}) {
+		next if (!defined($paths->{$proj}));
  		foreach $branch (keys %{$self->{config}->{$proj}->{branches}}) {
  			$self->{projects}->{$proj}->{branch} =
Common subdirectories: patch-o-matic-ng-20070323/patch2pom and 
patch-o-matic-ng-20070323.fixed/patch2pom
Common subdirectories: patch-o-matic-ng-20070323/patchlets and 
patch-o-matic-ng-20070323.fixed/patchlets
Common subdirectories: patch-o-matic-ng-20070323/pom2patch and 
patch-o-matic-ng-20070323.fixed/pom2patch
diff -U 2 patch-o-matic-ng-20070323/runme patch-o-matic-ng-20070323.fixed/runme
--- patch-o-matic-ng-20070323/runme	2007-01-12 19:07:08.000000000 +0200
+++ patch-o-matic-ng-20070323.fixed/runme	2007-03-28 22:18:02.000000000 +0300
@@ -90,4 +90,6 @@
  my $opt_iptpath;
  my $opt_download;
+my $opt_nokernel;
+my $opt_noipt;

  my $result = GetOptions("batch" => \$opt_batch,
@@ -100,4 +102,6 @@
  			"man" => \$opt_man,
  			"download" => \$opt_download,
+			"without-kernel" => \$opt_nokernel,
+			"without-iptables" => \$opt_noipt,
  			"kernel-path=s" => \$opt_path,
  			"iptables-path=s" => \$opt_iptpath) or pod2usage(2);
@@ -228,4 +232,5 @@
  	  'default'	=> '/usr/src/linux',
  	  'check'	=> 'Makefile',
+	  'without'	=> $opt_nokernel,
  	},
  	{ 'project'	=> 'iptables',
@@ -235,8 +240,13 @@
  	  'default'	=> '/usr/src/iptables',
  	  'check'	=> 'Makefile',
+	  'without'	=> $opt_noipt,
  	}
  );

  foreach my $path (@paths) {
+	if($path->{without}){
+	    $paths{$path->{project}}=undef;
+	    next;
+	}
  	if (!defined($ENV{$path->{env}}) && !$path->{opt}) {
  		print("Hey! $path->{env} is not set.\n");
@@ -496,4 +506,12 @@
  specify the iptables source path

+=item B<--without-kernel> path
+
+don't patch kernel
+
+=item B<--without-iptables> path
+
+don't patch iptables
+
  =item B<--verbose>




-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by

