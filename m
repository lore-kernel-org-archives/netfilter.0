From: Jason Opperisano <opie@817west.com>
Subject: Re: Limiting access to some number from random users.
Date: Fri, 15 Oct 2004 11:33:54 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015153354.GA7143@bender.817west.com>
References: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
	<1097755804.1708.14.camel@wolfpack.ljm.dom>
	<200410151048.28634.rio@martin.mu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200410151048.28634.rio@martin.mu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 10:48:28AM +0000, Rio Martin. wrote:
> Folks,
> I need to know how to limit access to some number from bulk random users.
> Let say, i have 256 PCs connecting to Internet daily. 
> I want to limit my users accessing to Internet only for 100 users during peak 
> time. But these 100users must be selected in random.
> 
> Need a fresh idea how to do that with iptables. Should i apply special 
> patches?

iptables -N random
iptables -A FORWARD -j random

--- BEGIN PERL CODE TO GENERATE LIST OF 100 RANDOM IPs ---
  #!/usr/bin/perl

  use strict;

  my %ips = ();
  my $ip;
  my $randomIP;

  while ( scalar(keys(%ips)) < 100) {
    $randomIP = int( rand(254)) + 1;
    if ( exists($ips{$randomIP}) ) {
      next;
    } else {
      $ips{$randomIP} = $randomIP;
    }
  }

  foreach $ip (sort {$a <=> $b} keys %ips) {
    print "$ip\n";
  }
--- END PERL CODE ---

iptables -F random

for i in `./random_ips.pl`; do
  iptables -A random -s 192.168.1.${i} -j ACCEPT
done

-j

-- 
Jason Opperisano <opie@817west.com>

