From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables script file
Date: Thu, 28 Oct 2004 11:05:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041028150535.GA4228@bender.817west.com>
References: <B069AFB1CBDE6F6A01A304D9@[10.169.6.246]>
	<200410281351.i9SDpdoL058208@jkcpub.iserver.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200410281351.i9SDpdoL058208@jkcpub.iserver.net>
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
To: netfilter@lists.netfilter.org

On Thu, Oct 28, 2004 at 09:56:36AM -0400, Deepak Seshadri wrote:
> Hello everybody,
> 
> Kenneth: Thank you very much for the reply. I'll look into this option.
> 
> Does anybody have any other suggestion? How does everyone load their
> rule-set?

here's the state-of-the-union:

loading rules from a script that issues "iptables -A ..." commands over
& over again is not "efficient."  whether this inefficiency is a problem
or not depends on the number of rules being loaded.  the firewall i'm
testing with uses an actual ruleset of ~100 rules and takes less than 5
seconds to load:

  time ./fw start

  real    0m4.632s
  user    0m0.300s
  sys     0m4.310s

here's an example using a script that loads 1024 rules of the form:

  iptables -A INPUT -i eth0 -p tcp --syn -m state --state NEW \
    -s 10.x.y.1/24 -j ACCEPT

  (where x and y are incremented via a for loop)

  # time ./addrules

  real    0m20.855s
  user    0m0.410s
  sys     0m20.440s

now, let's do an "iptables-save" on those loaded rules, and see how long
an "iptables-restore" takes:

  # time iptables-restore 1000rules.save

  real    0m1.253s
  user    0m0.080s
  sys     0m1.130s

all these tests are performed on the same machine:

Linux vmg2 2.4.26-gentoo-r9 #2 Fri Sep 3 07:13:35 EDT 2004 i686 Intel(R)
Pentium(R) M processor 1.70GHz GenuineIntel GNU/Linux

192 MB RAM

so, the upshot is this--if your ruleset is sufficiently large to make
the inefficiency of scripted "iptables" commands a problem--you'll need
to use "iptables-restore" to load your rules.  once you get the hang of
it, it really isn't that hard to just edit the "iptables-restore" file
format (even though this isn't "recommended").

hope this helps...

-j

-- 
Jason Opperisano <opie@817west.com>

