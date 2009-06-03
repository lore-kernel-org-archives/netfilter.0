From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack INVALID packets
Date: Wed, 3 Jun 2009 09:23:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0906030918050.14110@blackhole.kfki.hu>
References: <vmime.4a2550f5.5fdc.8868102d67fdfa5b@mona.topdesk.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <vmime.4a2550f5.5fdc.8868102d67fdfa5b@mona.topdesk.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xesc Arbona <X.Arbona@topdesk.com>
Cc: netfilter@vger.kernel.org

On Tue, 2 Jun 2009, Xesc Arbona wrote:

> > Olivier Sessink wrote:
> >> Roman Ledovskiy wrote:
> >> Hi,
> >> 
> >> I have linux firewall in between internet and my network, diagram is
> >> following:
> >> 
> >> Upstream
> >>    |
> >> Firewall server
> >>    |
> >> my network
> >>  
> >> "My network" hosts many different email/web servers.
> >> 
> >> Firewall server is not a bridge, it has 2 interfaces (one to upstream, one
> >> to internal network)
> >> Not much kernel configuration, kernel is default kernel from Centos5 x64
> >> repo: 2.6.18-8.1.10.el5
> >> 
> >> On this server I get quite a lot of INVALID packets, about 0.07% of all and
> >> I can't figure out why..
> >
> > same thing here. most of the INVALID packets seem to have RST or FIN ACK
> > set. So what I did, I increased the timeouts to setup a connection, and
> > I increased the timeouts for connection closing. That helped a lot.
> 
> I have a similar problem, but increasing the timeouts didn't help me. 
> Our situation is:
> 
> We have several Windows backend webservers on an internal network, 
> connected to a Debian machine (kernel 2.6.18.dfsg.1-24) which has a 
> direct connection to Internet and acts as Reverse-Proxy. 

The kernel release 2.6.18 is pretty old and a lot of TCP connection 
tracking improvements has been added since then. I don't think that 
tweaking the timeout parameters would really help, the best would be to 
upgrade to a recent kernel.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
