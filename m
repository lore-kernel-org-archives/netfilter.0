From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Fri, 1 Oct 2010 09:18:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu>
References: <4CA5091B.1090200@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA5091B.1090200@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, 30 Sep 2010, Mr Dash Four wrote:

> I am not able to get *any* matches when I have the following combinations:
> 
> 1. ipporthash: x.x.x.x,y [src,dst] or [dst,src] (i.e. source IP address and
> destination port and vice versa);
> 2. ipportiphash: x.x.x.x,y,z.z.z.z [src,dst,dst] or [dst,src,src] (i.e. source
> IP address, destination port and destination IP address and vice versa);
> 3. ipportnethash x.x.x.x,y,z.z.z.z/c [src,dst,dst] or [dst,src,src] (i.e.
> source IP address, destination port and destination subnet and vice versa);
> 
> When I split up the above sets like:
> 
> For case 1: match-set single-set src match-set single-port dst (and vice versa
> with src and dst reversed) - all in one line - i.e. creating two separate sets
> containing the appropriate src IP address and and dst ports respectively;
> For case 2: match-set single-set src match-set double-set dst,dst (and vice
> versa with src and dst reversed) - all in one line - i.e. creating two
> separate sets containing the appropriate src IP address and another set
> containing the destination IP addresses *and* ports respectively;
> For case 3: match-set single-set src match-set double-net-set dst,dst (and
> vice versa with src and dst reversed) - all in one line - i.e. creating two
> separate sets containing the appropriate src IP address and another set
> containing the destination IP subnet addresses *and* ports respectively;
> 
> I was able to get a match! This leads me to believe that either xtables has a
> bug and can't handle mixed src,dst designations in the same set, or, I am
> doing something wrong. Which is it?

You should provide at least the following: kernel, iptables, ipset version 
numbers, the iptables rules and the (non)matching sets with the elements.
Without exact details I cannot help.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
