From: "Muhammad Talha" <talha@worldcall.net.pk>
Subject: Re: kernel 2.6.x and iptables
Date: Wed, 14 Jan 2004 10:30:33 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a801c3da5f$891ec7f0$23c051cb@ns3.worldcall.net.pk>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk> <008401c3d9cb$d634aa30$23c051cb@ns3.worldcall.net.pk> <00c201c3d9ce$62968d70$23c051cb@ns3.worldcall.net.pk> <200401130838.47327.Alistair Tonner <> >  <012001c3d9ea$a64d8a20$23c051cb@ns3.worldcall.net.pk> <1074028552.1586.17.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Thanks Joel This solved my problem

Yes i have installed module-init-tools-0.9.13

actually i check
http://www.kernel.org/pub/linux/kernel/people/rusty/modules/FAQ

but there is not information about Redhat there now iptables module load
just fine :)

Thanks and Regards

Talha

----- Original Message ----- 
From: "Joel Newkirk" <firewalldude@newkirk.us>
To: "Muhammad Talha" <talha@worldcall.net.pk>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 14, 2004 2:15 AM
Subject: Re: kernel 2.6.x and iptables


> On Tue, 2004-01-13 at 10:33, Muhammad Talha wrote:
> > Thanks Alistair for respones
> >
> > there is no .o file there only .ko i think these are changed in 2.6.x
kernel
> > i see them when kernel is compiling as well
> >
> > there is /etc/rc.local which can load things @ startup in RedHat
> >
> > thanks and Regards
> >
> > Talha
>
> Since you're successfully inserting modules under 2.6.x I assume you
> installed module-init-tools to replace modutils.  However, I think you
> might have missed this part of the module-init-tools FAQ:
>
> {excerpt}
> Q) I'm using RedHat and modules don't autoload any more.
> A) RedHat turns module autoloading off if /proc/ksyms isn't found.
>    Change line 337 of /etc/rc.d/rc.sysinit from:
>
>   if ! grep -iq nomodules /proc/cmdline 2>/dev/null && [ -f /proc/ksyms
> ]; then
>
>    to
>
>   if ! grep -iq nomodules /proc/cmdline 2>/dev/null && [ -f
> /proc/modules ]; then
>
>
> Q) Things still don't load properly.
> A) Do you have an /etc/modprobe.conf?  If not, use
>    generate-modprobe.conf to generate an /etc/modprobe.conf from your
>    old setup.
> {/excerpt}
>
> You may not find 'line 337' at line 337.  Search "/proc/ksyms" - don't
> change the ones later in the file, though!
>
> j
>
> > ----- Original Message ----- 
> > From: <Alistair Tonner>
> > To: "Muhammad Talha" <talha@worldcall.net.pk>;
> > <netfilter@lists.netfilter.org>
> > Sent: Tuesday, January 13, 2004 6:38 PM
> > Subject: Re: kernel 2.6.x and iptables
> >
> >
> > > On January 13, 2004 07:11 am, Muhammad Talha wrote:
> > > > i insert modules located at
/lib/modules/2.6.1/kernel/net/ipv4/netfilter
> > > >
> > > > like
> > > >
> > > > insmod ip_tables.ko
> > > > insmod iptables_filter.ko
> > > >
> > > AHhhhh ...
> > >    Your modutils is out of date.
>
>
>
>


