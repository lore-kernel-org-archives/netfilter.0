From: Filip Sneppe <filip.sneppe@uptime.be>
Subject: Re: mms and rtsp patches = make modules fail
Date: 30 Jan 2004 01:31:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075422674.17013.8.camel@exile>
References: <4017BB98.7090203@dsl.pipex.com>
	<1075368500.18100.7.camel@exile>  <40190E1F.6090700@dsl.pipex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40190E1F.6090700@dsl.pipex.com>
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
To: Andy Furniss <andy.furniss@dsl.pipex.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Thu, 2004-01-29 at 14:43, Andy Furniss wrote:
> I just tested on a different machine, same old distro, though.
> 
> vanilla 2.4.24(I didn't patch this time) same POM (3 days old now) did 
> ./runme extra (last time I did make dep first)
> 
> and said y to connlimit nth quota u32 connbytes mms-conntrack-nat
> rtsp-conntrack string and it said this -

With these patches, my 2.4.24 compiles fine when doing a 
"make SUBDIRS=net/ipv4/netfilter modules"
 
> Already applied: connlimit nth quota u32 connbytes conntrack-seqfile 
> conntrack_arefcount conntrack_locking conntrack_nonat mms-conntrack-nat 
> netfilter-docbook owner-socketlookup owner-supgids ownercmd 
> rtsp-conntrack string

Where do conntrack-seqfile, conntrack_arefcount, and these other
patches come from ? You must have selected them at one point in
time during a POM run, as they don't get applied automatically.

The list of patches mentioned in "Already applied: " step on
each other - in fact, in current CVS, POM warns against this and
one can only apply them all by forcing POM to apply some of them.

I get a compilation error afterwards, not the same as you, but
this probably depends on the order in which these patches have
been applied on our systems.

> make mrproper (should I do this here?)

It's ok to do a make mrproper here

Regards,
Filip


