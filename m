From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: [GLUG-chat] Patching iptables 1.2.11 and kernel 2.6.10
Date: Fri, 4 Mar 2005 10:29:10 +0200
Message-ID: <fad9d48405030400294ebd15d7@mail.gmail.com>
References: <fad9d484050303155657737228@mail.gmail.com>
	<20050304061112.GQ20645@hvs.envisage.co.za>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050304061112.GQ20645@hvs.envisage.co.za>
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
To: Hendrik Visage <hvisage@envisage.co.za>, Kenneth Kalmer <kenneth.kalmer@gmail.com>, netfilter@lists.netfilter.org, GLUG-Chat <glug-chat@linux.org.za>

On Fri, 4 Mar 2005 08:11:12 +0200, Hendrik Visage
<hvisage@envisage.co.za> wrote:
> On Fri, Mar 04, 2005 at 01:56:09AM +0200, Kenneth Kalmer wrote:
> > Guys
> >
> > I've spend hours trying to figure this, and plenty of Google searches.
> > If anyone can help it would be greatly appreciated.
> >
> > I'm trying to get IPP2P and the layer7-filter to work with iptables
> > 1.2.11 and kernel 2.6.10 on Fedora Core 3. The kernel patches cleanly,
> > compiles just fine and reboots perfectly. The problem is that I can't
> > get iptables to compile.
> >
> > I get the same error message every time I run make:
> >
> > #error including kernel header in userspace; use the glibc headers instead!
> 
> Hmmm.... never seen this on the Lunar and gentoo systems I've tried/used it on...
> 
> > Problem is that for every rule I try I get the same response from iptables:
> >
> > # iptables -A FORWARD -o eth0 -m ipp2p --ipp2p -j DROP
> > iptables: No chain/target/match by that name
> >
> > When I run:
> >
> > # iptables -m ipp2p --help
> >
> > I do get help, leading me to believe that the iptables binary is
> > screwed in some way. Looking in /lib/iptables I can see
> > libipt_ipp2p.so and libipt_layer7.so. The modules exists and both can
> > be loaded.
> 
> You are sure those are modules for the filter tables?

yip, according to the IPP2P examples at
http://rnvs.informatik.uni-leipzig.de/ipp2p/docu_en.html you can use
it in FORWARD, MANGLE, PREROUTING, POSTROUTING in both FILTER and
MANGLE.

according to the l7 examples at
http://l7-filter.sourceforge.net/L7-Netfilter-example-nonbridge you
can use in in MANGLE, but elsewhere I've seen it used in FILTER as
well

> You are are using the newly compiled iptables binary (typically in
> /usr/local/bin AFAIR) and not the Fedore one?
> The other modules in /lib/iptables have the same date and timestamps
> as the libipt_ipp2p.so and libipt_layer7.so binaries?
> The iptables binary aren't looking in /usr/local/lib/iptables/ ??

Yip, I did a quick rpm -qV iptables which confirmed that the binaries
changed. I also simlinked /usr/local/lib/iptables to /lib/iptables to
make sure. As I said, the iptables binary clearly knows about the new
modules, pitty they don't work.

> 
> Hendrik
> >
> > How would I get iptables to compile with my modules without changing
> > (and breaking) the kernel source? I know nothing about C, or C++ so I
> > can't dive in and fix things up myself.
> >
> > Any help would be appreciated.
> >
> > --
> >
> > Kenneth Kalmer
> > kenneth.kalmer@gmail.com
> > http://opensourcery.blogspot.com
> > ---
> > To unsubscribe: send the line "unsubscribe glug-chat" in the
> > subject of a mail to "glug-chat-request@linux.org.za".
> > Problems? Email "glug-chat-admins@linux.org.za". Archives are at
> > http://www.linux.org.za/Lists-Archives/
> >
> >
> 


-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

