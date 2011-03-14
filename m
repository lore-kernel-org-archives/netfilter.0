From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset ipporthash - need -p tcp|udp?
Date: Mon, 14 Mar 2011 21:13:15 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1103142110580.20094@blackhole.kfki.hu>
References: <AANLkTikqUPBmwvGG3Lt5jVR1rdnwA+iOTi4ijfWbC0qs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikqUPBmwvGG3Lt5jVR1rdnwA+iOTi4ijfWbC0qs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 15 Mar 2011, Pandu Poluan wrote:

> A question's been bugging me since this evening:
> 
> Do I need to specify -p tcp|udp if I want to match against an IP set
> of type ipporthash?
> 
> Or, in other words, can I just write a rule like `iptables -A FORWARD
> -m set --match-set SetName dst,dst -j ACCEPT` ?

The port stored together with the protocol, so you should not specify the 
protocol in the iptables rules. Unless you want to match a subset of the 
set, selected by the protocol.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
