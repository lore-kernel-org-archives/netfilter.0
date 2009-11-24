From: Patrick McHardy <kaber@trash.net>
Subject: Re: arptables v0.0.8: no hln defined
Date: Tue, 24 Nov 2009 14:30:41 +0100
Message-ID: <4B0BE001.6010404@trash.net>
References: <4B0BD91C.9090506@lrz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B0BD91C.9090506@lrz.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Claus Wimmer <Claus.Wimmer@lrz.de>
Cc: netfilter@vger.kernel.org

Claus Wimmer wrote:
> Hello,
> 
> I am trying to build up a gateway cluster according to the example in
> the iptables manpage (see cluster extension). But I am not able to use
> the arptables command successfully:
> 
> 
> host1:/ # arptables -A OUT -o intern --arhln 6 -j mangle --mangle-hw-s
> 01:00:5e:11:11:11
> arptables v0.0.8: no hln defined
> Try `arptables -h' or 'arptables --help' for more information.
> host1:/ #

That appears to be a bug in arptables, it seems to expect a mask
for arhln, but doesn't assume a full match in case none is specified.

This is an unofficial version which I think orginates at RedHat, so
you should talk to whoever maintains this.

