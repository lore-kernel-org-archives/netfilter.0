From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: P-O-M and string matching
Date: Fri, 4 Apr 2003 13:04:24 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404210424.80582.qmail@web40203.mail.yahoo.com>
References: <1049489589.25147.98.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049489589.25147.98.camel@tux.rsn.bth.se>
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
Content-Transfer-Encoding: 7bit
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: nml <netfilter@lists.netfilter.org>


--- Martin Josefsson <gandalf@wlug.westbo.se> wrote:
> On Fri, 2003-04-04 at 22:38, SBlaze wrote:
> 
> > Its not in the binary... The binary I use right now is from the iptables
> deb
> > package pulled from the testing tree of Debian(doesn't really have any
> bearing
> > on this since it runs fine but does not have string matching set up). Its
> in
> > trying to set up the string matching in a downloaded kernel.org source that
> I
> > have the problem. Other things that I applied with the patch of matic show
> up
> > and I can select as modules fine. String matching just remains to not have
> the
> > option in the netfilter configuration of a make menuconfig (for the
> kernel.org
> > source sym linked to /usr/src/linux )
> 
> "Then using patch o matic I applied a very few changes (quote time and
> string). Now the quote and time patches are selectable from a make
> menuconfig from the /usr/src/linux directory. However the string
> matching options are NO WHERE to be found. I don't understand why and
> thats why I need help."
> 
> I'm _very_ confused here.
> 
> First you say you can select the modules and now you say you can't.
> 
> Things that's needed to get the stringmatch (and other p-o-m stuff
> working):
> 
> 1. a patched kernel
> 2. an iptables compiled against that kernel
> 3. that you actually use that iptables and not the one from debian
> unstable.
> 
> The Debian iptables package installs the libs in /usr/lib/iptables , the
> iptables you compiled installs the libs in /usr/local/lib/iptables.
> 
> dpkg -r iptables
> 
> -- 
> /Martin


"Other things that I applied with the patch of matic show up
> and I can select as modules fine. String matching just remains to not have 
the
> option in the netfilter configuration of a make menuconfig (for the 
kernel.org
> source sym linked to /usr/src/linux )"

OK what I was trying to say is that... I applied a few patches.. the quota,
time and string patches with the patch o matic to the kernel source I got from
kernel.org... Of thosee three that I applied... only two show up when I go back
in to a make menuconfig for  the kernel to select as modules. The string
matching  option just simply is NOT there...while the other TIME and QUOTA
options are there and can be selected to compile as modules.

I have not tried to compile those options in to the kernel... since the main
purpose for a compilation of a new kernel would be to add the STRING option. I
do not understand why the option does not appear in the make menuconfig when
the opther quota and time options appear fine...

Does this give you a better understanding of the problem?

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

