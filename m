From: BGrummel@zuendel.de
Subject: Antwort: Re: Antwort: RE: Most stable firewall distro
Date: Mon, 8 Jul 2002 13:41:29 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OF20FB00F3.D5EE995E-ONC1256BF0.003FFC60@zuendel.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

                                                                                                                             
                    Raymond Leach                                                                                            
                    <raymondl@knowledgefact        An:     BGrummel@zuendel.de                                               
                    ory.co.za>                     Kopie:  netfilter@lists.samba.org                                         
                    Gesendet von:                  Thema:  Re: Antwort: RE: Most stable firewall distro                      
                    netfilter-admin@lists.s                                                                                  
                    amba.org                                                                                                 
                                                                                                                             
                                                                                                                             
                    08.07.2002 12:31                                                                                         
                                                                                                                             
                                                                                                                             








>IMO the best firewall 'solution' is SuSE Firewall on CD. Similar to the
>debian solution described below, boots from CD and rules written to
>floppy.

->

thats right but i want to do it on my self
so that i know what my firewall is doing
and the packaging at debin is very good



On Mon, 2002-07-08 at 12:05, BGrummel@zuendel.de wrote:
>
>                     "Ed Street"
>                     <blacknet@simplyaquat        An:     "'Antony Stone'"
<Antony@Soft-Solutions.co.uk>,
>                     ics.com>
<netfilter@lists.samba.org>
>                     Gesendet von:                Kopie:
>                     netfilter-admin@lists        Thema:  RE: Most stable
firewall distro
>                     .samba.org
>
>
>                     04.07.2002 01:06
>                     Bitte antworten an
>                     blacknet
>
>
>
>
>
>
>
>
>
>
> Hello,
>
> The correct choice to go with would be debian.  You can do a minimal
> install from a business card cd and have everything you need.  For those
> of you that's interested contact me off list for the details and the
> script/iso file (approx 41 megs)
>
>
>
> - a good choice
> - i am working on a cd-based firewall on debian. booting from cd and
> firewall rules from
> - write-protect disk. no hdd is needed. if a kernelchange is needed
-create
> a new cd.
> - if somebody hacks it reboot and hes gone!
>
>
> Ed
>
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Wednesday, July 03, 2002 6:34 PM
> To: netfilter@lists.samba.org
> Subject: Re: Most stable firewall distro
>
> On Wednesday 03 July 2002 11:23 pm, riffraff wrote:
>
> > ---------- Original Message ----------------------------------
> > From: "Miguel Laborde" <miguel.laborde@canada.com>
> > Date: Wed, 3 Jul 2002 18:22:38 -0400
> >
> > >Hello all,
> > >  I have a question here for those of you who use iptables heavily
> in a
> > >production environment. Right now I am about to replace a older
> Mandrake
> > >(release 7.2) with an updated linux firewall however before I go
> ahead and
> > >do that, I'm interested in knowing what you people consider the most
> > > stable distribution for a linux firewall.
> > >  I realize that the underlying OS and iptables software is common
> across
> > > all distributions however some distributions apply patches which
> others
> > > don't, and as result might be better suitable as a firewall.
> > >
> > >
> > >  Thanks for your time,
> > >                 Miguel
> >
> > I just used redhat 7.0 (I think, it's been a while), and removed
> everything
> > that was completely unnecessary, then compiled a whole new kernel (I
> had
> > to; I'm using the bridge-netfilter patch).  So, it isn't much of a
> redhat
> > anymore, just uses redhat paths and rpm.
>
> I agree with this approach.   A firewall shouldn't really be any
> recognisable
> distro, because distros basically differ in all the add-ons they include
>
> around the kernel, nearly all of which you should not have on a
> firewall.
>
> And, as suggested above, you really ought to compile your own kernel for
> a
> firewall, too, so it contains what you want and doesn't contain what you
>
> don't want, therefore you start from ftp://ftp.kernel.org and 'make
> config'
> (or whichever variation of that you prefer).
>
> The 'distro' I would really like to see people use for firewalls is
> Linux
> >From Scratch, because this is expressly designed to contain only the
> tools
> you choose for a specific job, and not a whole bunch that someone else
> thought might come in handy one day.....
>
> Not the easiest thing to play with though, admittedly.
>
> http://www.linuxfromscratch.org
>
>
>
> Antony.
>
>
>
>
>






