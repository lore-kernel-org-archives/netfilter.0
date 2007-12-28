From: reader@newsguy.com
Subject: [OT gentoo] Kernel settings for iptables
Date: Thu, 27 Dec 2007 18:01:43 -0600
Message-ID: <87wsqzit5k.fsf@newsguy.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm hoping someone can steer me toward some specific documentation
about setting up kernel options for maximum flexibility with iptables.

Googling I see piles of discussions about that but I've been unable to
pull out a clear idea of what needs to be set.

Going thru the make menuconfig dialog there seems to be quite a herd
of Netfilter related settings.  So many as to make it really confusing
what does what and which are important.

My general aim is to setup a small somewhat hardened Gentoo Linux OS
that will receive rejected traffic from an upstream Netgear
router/firewall. 

It will NOT be routing traffic to the lan so not a true DMZ but the
netgear has an option to send rejected traffic to what they call a
`DMZ'.  

So this machines' job is to reject and log analyze sift etc etc.

I want to study the traffic... not create a honey pot.. just have a
good look at what is coming at me.

