From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: SO HOW! iptables: invalid argument
Date: Sat, 25 Oct 2003 11:16:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310251116.56917.Alistair@nerdnet.ca>
References: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com> <200310250955.11841.Alistair@nerdnet.ca> <020b01c39b02$227d9040$63000a0a@pooh>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <020b01c39b02$227d9040$63000a0a@pooh>
Content-Disposition: inline
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
To: John Paul <john@pinoylinux.sytes.net>, netfilter@lists.netfilter.org

On October 25, 2003 10:13 am, John Paul wrote:
> > Ummm.
> >
> >    I would personally apply POM before building iptables code
>
> I actually did the other way around but still have same problem "invalid
> argument"
>
> i have two versions of iptables running.
>
> iptables (from rpm /sbin/iptables) = works okay
> iptables (from source /usr/local/sbin/iptables) = invalid argument
	
1) iptables core code does depend on the code in the kernel to ensure 
consistency. POM to kernel before building the iptables code.

2) having two copies of an application is ... difficult.
    I would remove the rpm myself for ease of use.  It can be worked around, 
but it annoying at the least.

3) ensure that /etc/ld.so.conf does include  a reference to /usr/local/lib/
	this is where the libraries for the new version of iptables are.  ... or
        review *(uuuuhhmmm I think its) LD_PRELOAD variable when you are 
	running the iptables command. (if you want to try running with two 
	installed packages)


>
> my Q is... why did the iptables from source didnt work. any helpful hint?
>
	Code inconsistencies between the RPM and the built versions.

>
> ----- Original Message -----
> From: "Alistair Tonner" <Alistair@nerdnet.ca>
> To: "John Paul" <john@pinoylinux.sytes.net>;
> <netfilter@lists.netfilter.org> Sent: Saturday, October 25, 2003 9:55 PM
> Subject: Re: SO HOW! iptables: invalid argument
>
> > On October 25, 2003 09:40 am, John Paul wrote:
> > > Hello Folks,
> > >
> > > Just want to find the real answer with this. sorry but ans to google is
>
> not
>
> > > clear for me. I did upgrade my iptables to iptables-1.2.9rc1.tar. steps
> > > done;
> > >
> > > --> installed new iptables source (iptables-1.2.9rc1.tar)
> > >         - make KERNEL_DIR=/usr/local/linux
> > >         - make install KERNEL_DIR=/usr/local/linux
> > >
> > > --> applied POM (patch-o-matic-20030912.tar) to my latest kernel
> > > (linux-2.4.22.tar)
> > >
> > > --> recompile the kernel
> > >         - make dep; make clean; make bzImage; make modules; make
> > > modules_install
> > >         - all went fine
> > >
> > > --> reboot the machine
> > >
> > > all went fine but when NAT/MASQUERADE is used, i got this "iptables:
> > > invalid argument"
> > >
> > > anything i missed?
> > >
> > > Thanks.
> > > -JP
> >
> > Ummm.
> >
> >    I would personally apply POM before building iptables code....
> >
> > if you do find  / -name iptables ... how many results do you get?
> >
> > I've found followup installs don't tend to sit on top of original
>
> installs,
>
> > thus you likely have two copies of iptables stuff on your system now...
>
> you
>
> > need todetermine which to remove.
> >
> >
> > --
> >
> > Alistair Tonner
> > nerdnet.ca
> > Senior Systems Analyst - RSS
> >
> >      Any sufficiently advanced technology will have the appearance of
>
> magic.
>
> > Lets get magical!

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

