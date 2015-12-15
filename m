From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Packet disappears after DNAT?
Date: Tue, 15 Dec 2015 14:06:38 +0100
Message-ID: <20151215130638.GA6295@salvia>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
 <5662BD03.60004@plouf.fr.eu.org>
 <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
 <56653CCC.6020603@plouf.fr.eu.org>
 <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Bronson <bronson@rinspin.com>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter <netfilter@vger.kernel.org>

On Tue, Dec 15, 2015 at 04:21:30AM -0800, Scott Bronson wrote:
> On Sat, Dec 5, 2015 at 2:31 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> > Bridge-nf is
> > enabled by default and can cause weird behaviour with NAT. Try to
> > disable it :
> >
> > echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
> 
> Yes, thank you!  I never would have found that.  Without it, the
> VM->Host->VM NAT
> just eats the packets.
> 
> 
> On Mon, Dec 7, 2015 at 12:01 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> > You must also MASQUERADE or SNAT these packets, otherwise the reply
> > packets won't be sent back to the host and be de-NATed properly
> 
> You're absolutely right.  With two more rules:
> 
> iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
> tcp -j MASQUERADE
> iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
> udp -j MASQUERADE
> 
> it works!
> 
> 
> Gotta say, unning `echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables` in my
> script makes me a little queasy...  but this page suggests that no other option
> will work cross-distro:
> 
>      http://wiki.libvirt.org/page/Net.bridge-nf-call_and_sysctl.conf

JFYI: The br-nf thing was moved to a separated module since 3.18. So
now this finally requires explicit modprobing.
