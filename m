From: Tvrtko Ursulin <tvrtko@ursulin.net>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Wed, 9 Jun 2010 09:00:54 +0100
Message-ID: <201006090900.54496.tvrtko@ursulin.net>
References: <201006082203.22238.tvrtko@ursulin.net> <alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tuesday 08 Jun 2010 22:36:28 Jan Engelhardt wrote:
> On Tuesday 2010-06-08 23:03, Tvrtko Ursulin wrote:
> >I have a small home network behind a cheap ADSL router and a bizarre
> > problem where I am not getting responses from some web sites in some
> > situations.
> 
>  - Select one web page/URL where this has happened, preferably one
>    that has a small output (like Apache's ingenious "It works!")
>  - Is it 100% reproducible on every page reload?
> 
> If yes: check your firewall. Don't block ICMP errors.
> Name the URL so that people can confirm.

Firewall rules do not mention ICMP and I can ping outside world so I guess 
that means it is not blocked?

There is this:
TCPMSS     tcp  --  anywhere             anywhere            tcp 
flags:SYN,RST/SYN TCPMSS set 1452 
TCPMSS     tcp  --  anywhere             anywhere            tcp 
flags:SYN,RST/SYN TCPMSS set 1452 

In the forward chain at the firewall which is the only thing which stands out. 
If I understand it correctly it sets MTU to 1452 for outgoing packets. Why it 
is specified twice I have no idea. 

I tried doing "ifconfig eth0 mtu 1452" on the client and that did not help. I 
had to go all the way down to 1400 for one site and that also worked for the 
other one. 

Site I was testing with is http://www.tesco.com/superstore/ . This page does 
not load unless MTU 1400 is set on the client.
 
> If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
> but 2.6.25 looks good), and if either client or server make use
> of it, things can hang once SACKs are exchanged.
 
My clients are 2.6.31 - 2.6.34, but the router/firewall is running 2.6.21.5. 

Tvrtko
