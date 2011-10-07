From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Need to remove 802.1Q tagging
Date: Fri, 7 Oct 2011 21:52:12 +0200
Message-ID: <20111007215212.68a88b56@catus>
References: <CAFcM1Eo0X77tfC4yYHjLPJs=xPGyrV-WUMnCnEWvbD2p5uW+9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFcM1Eo0X77tfC4yYHjLPJs=xPGyrV-WUMnCnEWvbD2p5uW+9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duane Larson <duane.larson@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

>I am thinking that the two interfaces on the Linux box will be bridged
>(in transparent mode) and when traffic passes through the linux box
>the vlan 802.1q tag can be removed and then the traffic goes to the
>Is my thinking correct?  Will this work?  What all do I need to be
>aware of and are there any current examples that point to what I am
>trying to do???  I am very new to netfilter and ebtables (I found out
>about it last night).

Your idea should work.

Let's assume that "south" interface of Linux bridge on your diagram is
eth0 and "north" is eth1.

You can bridge all eth0.X vlan interfaces and eth1 to single bridge
with stp off. You should probably filter traffic on that bridge
and allow anything but eth0.x <-> eth1. It's also a good thing to setup
filtering ruleset before you start bridging (l'oops :).

I've similar solution working very well in production environment. It
involves providing pppoe on multiple vlans.

If you need any more implementation details please feel free to ask on
prv.

Best regards,
Marek Kierdelewicz
