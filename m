From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Most stable firewall distro
Date: Thu, 4 Jul 2002 09:22:08 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA20C@JUPITER>
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

Yes Bering is a good distro and very up to date but I rewrote the smoothwall
script as it not only took ~83KB of diskspace, it also was too confusing for
me.. call me lazy to read.... ;)
I just deleted their confs files and rewrote the /etc/init.d/smoothwall
scripts and resaved them back to the floppy.

Works wonders but 1.68MB is very limited especially if you want IPSEC then
it's very hard to get it to fit. I just got 1-3KB left on the floppy after
removing alot of stuff..

But in the end it's worth it as long as you make backups of your floppy.
Verbatim disks apparently are good with this 1.68MB setup and holds for
years...

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Steve Fink [mailto:stevef@netvantix.com]
Sent: Thursday, 04 July 2002 9:17 AM
To: 'Antony Stone'; netfilter@lists.samba.org
Subject: RE: Most stable firewall distro


Anthony,

	For use of iptables on a mini-firewall distro ( fits on a diskette
or
two ). I would have to recommend Bering, available at
http://leaf.sourceforge.net.

Best,

Steve



-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
Sent: Wednesday, July 03, 2002 4:34 PM
To: netfilter@lists.samba.org
Subject: Re: Most stable firewall distro


On Wednesday 03 July 2002 11:23 pm, riffraff wrote:

> ---------- Original Message ----------------------------------
> From: "Miguel Laborde" <miguel.laborde@canada.com>
> Date: Wed, 3 Jul 2002 18:22:38 -0400
>
> >Hello all,
> >	I have a question here for those of you who use iptables heavily in
a
> >production environment. Right now I am about to replace a older Mandrake
> >(release 7.2) with an updated linux firewall however before I go ahead
and
> >do that, I'm interested in knowing what you people consider the most
> > stable distribution for a linux firewall.
> >	I realize that the underlying OS and iptables software is common
across
> > all distributions however some distributions apply patches which others
> > don't, and as result might be better suitable as a firewall.
> >
> >
> >	Thanks for your time,
> >				Miguel
>
> I just used redhat 7.0 (I think, it's been a while), and removed
everything
> that was completely unnecessary, then compiled a whole new kernel (I had
> to; I'm using the bridge-netfilter patch).  So, it isn't much of a redhat
> anymore, just uses redhat paths and rpm.

I agree with this approach.   A firewall shouldn't really be any
recognisable
distro, because distros basically differ in all the add-ons they include
around the kernel, nearly all of which you should not have on a firewall.

And, as suggested above, you really ought to compile your own kernel for a
firewall, too, so it contains what you want and doesn't contain what you
don't want, therefore you start from ftp://ftp.kernel.org and 'make config'
(or whichever variation of that you prefer).

The 'distro' I would really like to see people use for firewalls is Linux
From Scratch, because this is expressly designed to contain only the tools
you choose for a specific job, and not a whole bunch that someone else
thought might come in handy one day.....

Not the easiest thing to play with though, admittedly.

http://www.linuxfromscratch.org



Antony.






