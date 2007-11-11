From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Why does ipv6 addresses appear when loading a module?
Date: Mon, 12 Nov 2007 00:10:11 +1300
Message-ID: <4736E313.70804@treenet.co.nz>
References: <4736A97E.8070604@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4736A97E.8070604@shaw.ca>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jerry Vonau <jvonau@shaw.ca>
Cc: netfilter@vger.kernel.org

Jerry Vonau wrote:
> Hi All:
> 
> I'm not subscribed to the list, please cc me on any replies please.
> 
> While playing around with the latest fedora, think I found an issue with
> a netfilter module. I run my boxes with ip6 disabled, you know, don't
> run what is not needed. I couldn't figure out why I was seeing ipv6
> addresses on my interfaces, and ipv6 module was loaded when I know that
> I disabled ipv6 in modprobe.conf and sysconfig/network. For my netfilter
> needs I use shorewall, which loads the module nf_nat_h323, which loads
> the nf_conntrack_h323 module, and that loads ipv6! Once ipv6 is loaded,
> you can't rmmod it and ipv6 addresses are assigned to the interfaces.
> I've disabled the loading of those modules and the ipv6 addresses don't
> occur. My question is this the intended behavior for this module?
> 
> Thanks in advance,
> 
> Jerry

Why are you so resistant to IPv6?

Addresses should only start occurring if the network the machine is 
attached to is IPv6-enabled and active. When that happens ::1 
(localhost, actually less dangerous than 127.0.0.1) is assigned, but 
only the IPv6-connected interface gets an actual 2000::/3 public 
allocation to use.

You appear to be in the perfect position to make the transition now and 
painlessly. By forcibly disabling it you are making yourself come back a 
a few months and re-enable it all piece-by-piece.

You would do better to leave it, and just configure the FW through 
ip6tables.

Amos
