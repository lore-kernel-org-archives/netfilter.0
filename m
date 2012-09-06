From: Luigi Rizzo <rizzo@iet.unipi.it>
Subject: Re: Using Netfilter with high bandwidth
Date: Thu, 6 Sep 2012 20:29:04 +0200
Message-ID: <20120906182904.GA29642@onelab2.iet.unipi.it>
References: <56bebadff4785d716c997d7aba22b9dd@linuxwall.info> <alpine.LNX.2.01.1209010028550.27474@frira.zrqbmnf.qr> <1346658980.3069.584.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346658980.3069.584.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: Jan Engelhardt <jengelh@inai.de>, Julien Vehent <julien@linuxwall.info>, netfilter <netfilter@vger.kernel.org>

On Mon, Sep 03, 2012 at 09:56:20AM +0200, Jesper Dangaard Brouer wrote:
> On Sat, 2012-09-01 at 00:39 +0200, Jan Engelhardt wrote:
> > On Friday 2012-08-31 21:38, Julien Vehent wrote:
...
> > > * How much traffic can we expect to route to a decently configured Firewall ?
> > > Can we target 10GBPS with good NICs/CPUs and proper kernel tuning, or is that
> > > completely out of range ?
>
> I did a lot of 10Gbit/s routing testing back in 2009:
> http://vger.kernel.org/netconf2009_slides/LinuxCon2009_JesperDangaardBrouer_final.pdf
> 
> Which showed that Intels Nehalem microarchitecture, was capable of doing
> 10Gbit bi-directional routing on Linux.  Combined with multiqueue NICs,
> where the Intel 10G NIC were the winning NIC.  (Disclaimer, this testing
> were without iptables rules)
> 

Jesper's report is extremely interesting but covers routing.
For firewalls, it might be interesting to have a look at the
netmap+ipfw integration

	http://info.iet.unipi.it/~luigi/dummynet/#8696

which i recently completed and runs on linux as well (uses a kernel
module for network I/O, and a userspace versions of ipfw and dummynet
for the firewalling, scheduling, shaping).
I measured over 6 million packets per second (Mpps) with simple
rulesets, and over 2.2 Mpps through dummynet pipes.
This is with 1 core doing the processing.

The links from there should bring you to the other relevant
pieces, but just in case

    http://info.iet.unipi.it/~luigi/netmap
	is the netmap API, drivers etc

    http://info.iet.unipi.it/~luigi/vale
	describes the VALE soft switches, useful for testing

    http://info.iet.unipi.it/~luigi/dummynet
	features of dummynet and ipfw

cheers
luigi
