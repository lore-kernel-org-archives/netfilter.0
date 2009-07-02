From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 02 Jul 2009 19:04:48 +0200
Message-ID: <1246554288.17132.38.camel@enterprise.ims-firmen.de>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
	 <1246548394.17132.19.camel@enterprise.ims-firmen.de>
	 <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Terry Burton <tez@terryburton.co.uk>
Cc: netfilter@vger.kernel.org

On Thu, 2009-07-02 at 17:06 +0100, Terry Burton wrote:
> Thanks, but my issue isn't with firewalling, rather that I'd like thi=
s
> traffic to avoid the conntrack table altogether to avoid system load.

Still it's a way to disable conntracking for just one interface, right?=
=20

The raw table is evaluated before the connection tracking code. In fact
being able to do stuff before the connection tracking code is called
is the raison d'=C3=AAtre of the raw tables.

I.e. -A PREROUTING -i <MIRROR-INTERFACE> -j NOTRACK

If you want to disable conntracking altogether just unload
the conntracking/iptables modules.

> As soon as I bind the (unaddressed) interface into the bridge the
> packets are conntracked.

Oh yes, sorry, I didn't read you email correctly, you are bridging
packets thru your box so the conntrack code gets to see them. Don't
know if the above will still work under these circumstances, just
try it out.
    =20
   Thomas


