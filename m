From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: P-O-M and string matching
Date: Fri, 4 Apr 2003 14:43:11 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404224311.60039.qmail@web40209.mail.yahoo.com>
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
> 


azkerban:/usr/src/linux# /sbin/iptables --version
iptables v1.2.7a
azkerban:/usr/src/linux# /usr/local/sbin/iptables --version
iptables v1.2.7a

one is from the debian pkg and one is from the new install... however I don't
see what this has to do with getting string matching recognized by a make menuconfig?

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

