From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset issues
Date: Mon, 30 May 2016 21:19:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1605302116350.18831@blackhole.kfki.hu>
References: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com> <alpine.DEB.2.10.1605252255340.18463@blackhole.kfki.hu> <CANY1rLhrLraT3PauKqZp8+8rfJjQGDd-_4Adq=oLGcJ8wUKa+Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:references
	:message-id:in-reply-to:from:from:date:date:received:received
	:received; s=20151130; t=1464635884; x=1466450285; bh=qOmBs+OOTO
	1TmM+2rjLRo4wpZXZ0PwK4z/DAuaYjrNE=; b=Mfm8mvEvrCy/THb2PsrD5Mvshh
	ZYmJzWc4hBfYylFgEY8Yxu19ixsb6Yuy1xDlILgb0fUzjV+zoe50F2O+lGZOwEAM
	CJHptigxEddyHvGYxkXyAUxBGTNiEYQAv3SxsezUkGZGK+jwNlI4AirUnv6y2FHB
	xzbU4nsPljQ9vtH10=
In-Reply-To: <CANY1rLhrLraT3PauKqZp8+8rfJjQGDd-_4Adq=oLGcJ8wUKa+Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Emius <art@emius.ru>
Cc: netfilter@vger.kernel.org

Hello,

On Sat, 28 May 2016, Art Emius wrote:

> This makes me feel confused, but seems it doesn't work at all. I've 
> tried both src,src and src,dst parameters. Still I see packets are being 
> dropped. But I use -i / -o in iptables rules it works fine.

Sorry, I messed up the parameters.
 
I think your kernel does not contain the patch

commit ef5b6e127761667f78d99b7510a3876077fe9abe
Author: Florian Westphal <fw@strlen.de>
Date:   Sun Jun 17 09:56:46 2012 +0000

    netfilter: ipset: fix interface comparision in hash-netiface sets
    
    ifname_compare() assumes that skb->dev is zero-padded,
    e.g 'eth1\0\0\0\0\0...'. This isn't always the case. e1000 driver does
    
    strncpy(netdev->name, pci_name(pdev), sizeof(netdev->name) - 1);
    
    in e1000_probe(), so once device is registered dev->name memory contains
    'eth1\0:0:3\0\0\0' (or something like that), which makes eth1 compare
    fail.
    
    Use plain strcmp() instead.

which went into the kernel v4.2. I assume it was not backported into older 
kernel releases.

Best regards,
Jozsef
 
> 2016-05-25 23:58 GMT+03:00 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> > On Wed, 25 May 2016, Art Emius wrote:
> >
> >> Recently I've encountered an issue with using ipset in my firewall.
> >>
> >> I use Debian Linux 8.4, running in virtual machine inside ESXi 5.5.
> >> My host is 192.168.1.2, remote host is 192.168.1.1.
> >> I'm running ssh server on my host and want to limit access to it using
> >> one rule with two sets of different types like this:
> >>
> >> iptables -t filter -A INPUT -m set --match-set NETS_IFACE src,src -m
> >> set --match-set SSH src,dst,dst -j ACCEPT
> >> iptables -p OUTPUT ACCEPT
> >>
> >> ipset create SSH hash:ip,port,ip hashsize 8 maxelem 8 family inet
> >> ipset add SSH 192.168.1.1,tcp:22,192.168.1.2
> >>
> >> ipset create NETS_IFACE hash:net,iface hashsize 128 maxelem 128 family inet
> >> ipset add NETS_IFACE 192.168.1.0/24,eth1
> >
> > You should use "--match-set NETS_IFACE src,dst" in the rule above if you
> > want to limit the access to the traffic from the 192.168.1.0/24 subnet
> > received on interface eth1 only.
> >
> >> It doesn't work this way. eth1 really exists and handle traffic.
> >> But If I use rule like this it works fine.
> >> iptables -t filter -A INPUT -i eth1 -m set --match-set SSH src,dst,dst -j ACCEPT
> >
> > Best regards,
> > Jozsef
> > -
> > E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> > PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> > Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
> >           H-1525 Budapest 114, POB. 49, Hungary
> 
> 
> 
> -- 
>  Art & Emius
>  www.emius.ru
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
