From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: P-O-M and string matching
Date: Fri, 4 Apr 2003 14:08:52 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404220852.54660.qmail@web40209.mail.yahoo.com>
References: <1049491816.25168.100.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049491816.25168.100.camel@tux.rsn.bth.se>
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
> On Fri, 2003-04-04 at 23:04, SBlaze wrote:
> 
> > OK what I was trying to say is that... I applied a few patches.. the quota,
> > time and string patches with the patch o matic to the kernel source I got
> from
> > kernel.org... Of thosee three that I applied... only two show up when I go
> back
> > in to a make menuconfig for  the kernel to select as modules. The string
> > matching  option just simply is NOT there...while the other TIME and QUOTA
> > options are there and can be selected to compile as modules.
> > 
> > I have not tried to compile those options in to the kernel... since the
> main
> > purpose for a compilation of a new kernel would be to add the STRING
> option. I
> > do not understand why the option does not appear in the make menuconfig
> when
> > the opther quota and time options appear fine...
> > 
> > Does this give you a better understanding of the problem?
> 
> Did you enable CONFIG_EXPERIMENTAL ?
> 
> -- 
> /Martin

I wouldn't know how but....

      <M>   TIME match support (EXPERIMENTAL)       

shows up in the make menuconfig... So I'm guessing if that wasn't set then this
wouldn't show up?(since  the time module is labled experiemental)...




=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

