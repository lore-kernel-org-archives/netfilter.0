From: Denis Kaganovich <mahatma@bspu.unibel.by>
Subject: Re: POM "--without-kernel" & "--without-iptables"
Date: Tue, 03 Apr 2007 10:38:40 -0200
Message-ID: <46124AD0.20306@bspu.unibel.by>
References: <460AE614.9090806@bspu.unibel.by>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <460AE614.9090806@bspu.unibel.by>
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

Denis Kaganovich wrote:

> I recommend to add "--without-kernel" & "--without-iptables" into POM 
> "runme".
> (I needs it for Gentoo separated package installations, but there are 
> good options anymore)
> 
> There is my solution:

Sorry, no suitable topic in bugzilla. Now clean:

--- Netfilter_POM.pm
+++ Netfilter_POM.pm
@@ -667,2 +667,3 @@

+	return 1 if(!defined($self->{projects}->{$proj}->{PATH}));
  	$projpath = $copy || $self->{projects}->{$proj}->{PATH};
@@ -1045,2 +1046,3 @@
  	foreach $proj (keys %{$self->{projects}}) {
+		next if (!defined($paths->{$proj}));
  		foreach $branch (keys %{$self->{config}->{$proj}->{branches}}) {
--- runme
+++ runme
@@ -91,2 +91,4 @@
  my $opt_download;
+my $opt_nokernel;
+my $opt_noipt;

@@ -101,2 +103,4 @@
  			"download" => \$opt_download,
+			"without-kernel" => \$opt_nokernel,
+			"without-iptables" => \$opt_noipt,
  			"kernel-path=s" => \$opt_path,
@@ -229,2 +233,3 @@
  	  'check'	=> 'Makefile',
+	  'without'	=> $opt_nokernel,
  	},
@@ -236,2 +241,3 @@
  	  'check'	=> 'Makefile',
+	  'without'	=> $opt_noipt,
  	}
@@ -240,2 +246,6 @@
  foreach my $path (@paths) {
+	if($path->{without}){
+	    $paths{$path->{project}}=undef;
+	    next;
+	}
  	if (!defined($ENV{$path->{env}}) && !$path->{opt}) {
@@ -497,2 +507,10 @@

+=item B<--without-kernel>
+
+don't patch kernel
+
+=item B<--without-iptables>
+
+don't patch iptables
+
  =item B<--verbose>





-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by

