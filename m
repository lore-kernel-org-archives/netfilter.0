From: Askar <askarali@gmail.com>
Subject: Re: ram and processor cycles for a firewall machine
Date: Sat, 2 Oct 2004 01:29:41 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e5041001122911e148b5@mail.gmail.com>
References: <a0f69e504093023354ec7c59e@mail.gmail.com>
	<1096637833.22962.36.camel@wolfpack.ljm.dom>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096637833.22962.36.camel@wolfpack.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

thanks jose alot, okay i will upgrade ram to 128 * 2 = 256MB thanks,
however where should I look for optimization the iptables rules?
any link will be greatly appreciated

On Fri, 01 Oct 2004 09:37:13 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Fri, 2004-10-01 at 02:35, Askar wrote:
> > hi all,
> > im in the process of changing my fw machine for that atm im simulating
> > and testing. I got a very fair question
> > 1) How much RAM and and processor would be best for moderate firewall box?
> > Unfortunatly currently my company running the fw on a P-III 500MHz
> > with 128MB of RAM.
> > I am wondering if I change to default DROP things (atm its default
> > ACCEPT) aren't these specification kinda makes problem?
> >
> > right now 75 users online the /proc/net/ip_conntrack shows
> >
> > egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
> >    4888
> > cat /proc/net/ip_conntrack | wc -l
> >    6511
> 
> (6511 * 360) / 1024 / 1024 = 2.235 MB
> 
> even if you need 5 times that number of conntrack entries at peak
> load--you still would require about 11 MB of kernel memory for conntrack
> entries.
> 
> if you machine has 128 MB RAM--the automatic setting for
> ip_conntrack_max should be somewhere around 8192.  you could easily bump
> that number up to 32768 or 65536.
If i go with 128mb of ram which number should I choice for conntrack
32768 or 65536?
> 
> keep in mind that this is *kernel* memory; and therefore, cannot be
> paged.  if the machine needs to do "other things" (which is not a good
> idea) you may want to bump up the memory just to be safe.
sure I will move my apache to another machine which is atm running on
the same machine for MRTG.
> 
> > well these number would probably little higher when 120 users online.
> > Is my current fw machine specs adequate for such ip_conntrack load?
> 
> i would say so.  one thing that you might want to keep in mind is that
> if going to a "default drop" is going to cause a huge amount of logging,
> you might want to use the "-m limit" match in your "-j LOG" rules and
> make the rotation of your log files more aggressive.
okay I will to do fa few logging, however in starting I have to do
logging for testing and finalizing, however it would be nice of you if
you give me rules for -m limit for well known DROP ports that is 135,
445 etc hmm say 1 log in 5 minutes for these ports :)
Im getting lot of help and learning lot of new things through this great list :D
regards
askar
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
> 



-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

