From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: Syn Flood and DDoS Protect
Date: Wed, 12 Mar 2014 09:42:50 +0100
Message-ID: <20140312094250.12046ac5@redhat.com>
References: <CAB0UdF1KjZtOiddUGq8sOKkVWs6BLJ1rfb5CVfdknjvpDw7Z6g@mail.gmail.com>
	<20140311121932.2f3eda9d@brouer.com>
	<CAB0UdF3XqND20T4MZM0iUBjmZyh0qicDUxEd5y2wy2xzkpAheQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAB0UdF3XqND20T4MZM0iUBjmZyh0qicDUxEd5y2wy2xzkpAheQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thiago Oliveira <cpv.thiago@gmail.com>
Cc: brouer@redhat.com, netfilter@vger.kernel.org

On Tue, 11 Mar 2014 14:12:37 -0300
Thiago Oliveira <cpv.thiago@gmail.com> wrote:

> Mr. Jesper,
> 
> I had a time now and I did execute the script SYN-PROXY and getting this Output.
> 
> root@spweb02:~# ./syn-proxy.sh -v -i eth0 -p 80
> WARNING: Shell env variable IPTABLES_CMD is undefined
> WARNING: Fallback to default IPTABLES_CMD=/sbin/iptables
> iptables: No chain/target/match by that name.
> WARNING -- Error (1) when executing the iptables command:
>  "iptables -t raw -I PREROUTING -i eth0 -p tcp -m tcp --syn --dport 80
> -j CT --notrack"
> iptables v1.4.8: unknown option `--sack-perm'
> Try `iptables -h' or 'iptables --help' for more information.
> WARNING -- Error (2) when executing the iptables command:
>  "iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state
> INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss
> 1460"
> iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -m state --state
> INVALID -j DROP
> 
> Maybe my iptables version doesn't support this?

Exactly... you need iptables v1.4.21, you can run the commands below:

 wget http://www.netfilter.org/projects/iptables/files/iptables-1.4.21.tar.bz2
 tar xvf iptables-1.4.21.tar.bz2
 cd iptables-1.4.21/
 ./configure && make
 sudo make install

Remember you also need a newer kernel... minimum kernel 3.13, but
preferably the upcoming nf-next kernel, for the conntrack scaling:
 https://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/

 git clone git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git
 cd nf-next/
 make menuconfig #(select all netfilter modules)
 make -j24
 make install #(depend on your distro)

 #On Debian perhaps also run these: 
 export VER=`cat include/config/kernel.release`
 depmod -a ${VER}
 mkinitramfs -o /boot/initrd.img-$VER $VER
 update-grub2
 # (reboot and select kernel)

Good luck, fighting your DDoS...
--Jesper


> On Tue, Mar 11, 2014 at 8:19 AM, Jesper Dangaard Brouer
> <netdev@brouer.com> wrote:
> > On Tue, 11 Mar 2014 04:23:39 -0300
> > Thiago Oliveira <cpv.thiago@gmail.com> wrote:
> >
> >> I am looking for to add protection to firewall (IPTABLES based)
> >> specifically for SYN flood and DDoS attack to start with and, to that
> >> end, was trawling through the archives of this mailing lists and other
> >> places Google suggested I visit.
> >>
> >> Unfortunately, what I found suggests that there is some debate about
> >> how best to approach this.
> >> Specifically, many postings suggest using a 'limit' module or TCP flag
> >> combinations, but other postingssay that such rules will not help and
> >> in fact may even themselves act as a kind of internal DoS!
> >
> > Yes, unfortunately many of the iptables modules with state, have not
> > (yet) been optimized for parallel processing (this is work in progress,
> > at some point they will hopefully all scale and avoid serialization on
> > their internal state).  Note, normal/simple iptables rules without
> > state is capable of parallel processing.
> >
> >
> >> So my question is, has there been a resolution to this case? Can I
> >> protect my Linux Firewall using IPTABLES?
> >
> > You are in luck. I recently gave a talk on the subject of using
> > iptables/netfilter to protect against SYN-flood DoS attacks.  We have
> > recently developed a module called SYNPROXY that address this.
> >
> > YouTube videos:
> >  https://www.youtube.com/watch?v=BklSqr9t4uA
> >
> > Slides:
> >  http://people.netfilter.org/hawk/presentations/devconf2014/
> >
> > Script:
> >  https://github.com/netoptimizer/network-testing/blob/master/iptables/iptables_synproxy.sh
> >
> > And extra (not in slides) is that I recently optimized conntrack
> > new-and-del operations, by implementing "parallel" locking.  These
> > changes will appear in kernel 3.14.
> >  http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.devel/51681
> >
> > I would appreciate if people can test these recent conntrack
> > optimizations, the kernel code is avail in Pablo's nf-next tree:
> >
> >  https://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/
> >
> > I'm willing to help to provide build kernels for your system, if you
> > can try/test these changes in production...
> >
> > --
> > Best regards,
> >   Jesper Dangaard Brouer
> >   MSc.CS, Sr. Network Kernel Developer at Red Hat
> >   Author of http://www.iptv-analyzer.org
> >   LinkedIn: http://www.linkedin.com/in/brouer



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Sr. Network Kernel Developer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer
