From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: P-O-M and string matching
Date: Fri, 4 Apr 2003 12:38:15 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404203815.99224.qmail@web40202.mail.yahoo.com>
References: <1049488336.25147.91.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049488336.25147.91.camel@tux.rsn.bth.se>
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
> On Fri, 2003-04-04 at 22:14, SBlaze wrote:
> 
> > azkerban:~/iptables-1.2.7a# make KERNEL_DIR=/usr/src/linux | grep string
> > Extensions found: IPv4:quota IPv4:string IPv4:time
> > 
> > It appears that the p-o-m is doing its job.... Mayb I am wrong but this
> leads
> > me to believe it might be a problem with the string matching files/code ?
> 
> iptables installs in /usr/local/ by default.
> You don't have an old install (maybe an old installed package?) in /usr
> ?
> 
> -- 
> /Martin

Its not in the binary... The binary I use right now is from the iptables deb
package pulled from the testing tree of Debian(doesn't really have any bearing
on this since it runs fine but does not have string matching set up). Its in
trying to set up the string matching in a downloaded kernel.org source that I
have the problem. Other things that I applied with the patch of matic show up
and I can select as modules fine. String matching just remains to not have the
option in the netfilter configuration of a make menuconfig (for the kernel.org
source sym linked to /usr/src/linux )

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

