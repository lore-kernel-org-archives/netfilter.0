From: Robert Olsson <Robert.Olsson@data.slu.se>
Subject: Re: [ANNOUNCE] Proceedings of Netfilter Developer Workshop 2004
Date: Mon, 27 Sep 2004 20:11:41 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <16728.22493.546099.392454@robur.slu.se>
References: <20040925213322.GJ3236@sunbeam.de.gnumonks.org>
	<4158452F.1040904@lanl.gov>
	<20040927172007.GY3236@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040927172007.GY3236@sunbeam.de.gnumonks.org>
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
To: Harald Welte <laforge@netfilter.org>
Cc: Stephen J Smoogen <smoogen@lanl.gov>, netfilter@lists.netfilter.org, Robert Olsson <Robert.Olsson@data.slu.se>


Harald Welte writes:
 > On Mon, Sep 27, 2004 at 10:51:59AM -0600, Stephen J Smoogen wrote:
 > 
 > > Is there more publishing on Rober Olsson's benchmarks and findings. We 
 > > are doing various testing here and while the numbers look similar, I 
 > > would like to get an established testing methodology so that we can 
 > > confirm/help results from baseline tests.
 > 
 > http://robur.slu.se/Linux/net-development/experiments/2004/
 > http://robur.slu.se/Linux/net-development/experiments/10G.html
 > http://robur.slu.se/Linux/net-development/experiments/

 Yeep I keep notes of some my test here. Not alwayes to well organized 
 or documented I suffer from this myself.

 > > Our next line of testing is to find out which network cards will give us 
 > > the best bang for the buck on 10 gig testing. We currently have 300kpps 
 > > at 1 gig (E1000 + 2.4.2x kernel) but not sure if we are reaching the 
 > > limitations of the E1000 fibre optics or the PCI-X bus.


 > 300kpps is bad, even for a 32bit/33MHz  PCI bus, and definitely way too
 > bad for any kind of PCI-X

 I think Harald and I booth seen ~800 kpps pure forwarding with Opteron 
 and e1000 w. UP-kernel and I've seen aggregated performance of 1.3 Mpps 
 from dual Opteron in a dual flow experiment. 

 Yes in the long run method/benchmark would be needed but simple tests just 
 as adding fw-rules is enough to meditate about improvements. 

 The lookup code is getting cleaned up now to get pluggable lookups. With
 faster lookup and w/o route hash at least some filters could be very 
 fast but it probably break the currents semantics. Maybe replacing all 
 lookup with general classifier bitvector>/hi-pac as discussed at the 
 workshop could be possible when the times comes...

 Anyway have the LC-trie todo prefix lookup up now but not interfaced to
 the kernel yet. A lot of work happens in the hash chains which makes it 
 hard to replace current route lookup.

 Cheers.
						--ro

