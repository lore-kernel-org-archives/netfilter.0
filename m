From: Jerry Vonau <jvonau@shaw.ca>
Subject: Why does ipv6 addresses appear when loading a module?
Date: Sun, 11 Nov 2007 01:04:30 -0600
Message-ID: <4736A97E.8070604@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All:

I'm not subscribed to the list, please cc me on any replies please.

While playing around with the latest fedora, think I found an issue with
a netfilter module. I run my boxes with ip6 disabled, you know, don't
run what is not needed. I couldn't figure out why I was seeing ipv6
addresses on my interfaces, and ipv6 module was loaded when I know that
I disabled ipv6 in modprobe.conf and sysconfig/network. For my netfilter
needs I use shorewall, which loads the module nf_nat_h323, which loads
the nf_conntrack_h323 module, and that loads ipv6! Once ipv6 is loaded,
you can't rmmod it and ipv6 addresses are assigned to the interfaces.
I've disabled the loading of those modules and the ipv6 addresses don't
occur. My question is this the intended behavior for this module?

Thanks in advance,

Jerry
