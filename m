From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 13:28:16 -0500
Message-ID: <20110430182815.GO2976@cardinal>
References: <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
 <4DB80945.8040304@atc.tcs.com>
 <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
 <4DB817A5.3020604@atc.tcs.com>
 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
 <4DB90AE6.9070909@atc.tcs.com>
 <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
 <1304150575.1579.15.camel@andybev>
 <20110430165041.GN2976@cardinal>
 <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

[ Top-posting fixed. Please do not do that. ]

On Sat, Apr 30, 2011 at 12:47:40PM -0500, Mike Hendrie wrote:
> > On Sat, Apr 30, 2011 at 09:02:55AM +0100, Andrew Beverley wrote:
> >> # Setup NAT:
> >> iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
> 
> Trying to apply:
> iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
> 
> I get the following error -
> Bad argument `MASQUERADE'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> It does not like the command you suggested.....

You are in over your head here. Again:

> On Sat, Apr 30, 2011 at 11:50 AM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Sat, Apr 30, 2011 at 09:02:55AM +0100, Andrew Beverley wrote:
> >> On Thu, 2011-04-28 at 16:43 -0500, Mike Hendrie wrote:
> >> > All users can get to Google and do searches just fine. I am
> >> > having funny issues with the a couple of application.
> >> >
> >> > I do not understand why I am having the below issues. Could 
> >> > this be because of the iptables?
> >>
> >> Probably, although I would say more accurately because of UFW.
> >> It's quite difficult to diagnose problems with automatically
> >> generated iptables rules.
> >
> > Indeed, and users of such rulesets should be asking elsewhere (at 
> > the provider of the ruleset) for support.

... this is not the place to get UFW support. Andy gave you a good 
(mostly good :) ) answer which you do not seem to have enough 
experience (as a Unix/Linux user) to understand.

The "$string" construct is a sh(1) shell variable. In Netfilter 
terms, it is common to refer to the *ext*ernal *I*nter*f*ace as a 
shell variable; "ext" for "external", "_" for space, and "IF" for 
"interface".

In order to benefit from help on this list, you will need to be able 
to deal in such abstractions. It is not possible to give you literal 
"type this and it will work" instructions.

You'll definitely need more experience to be able to run the proxy 
server you're hoping to use. I recommend that you concentrate on 
learning basic user skills before trying complex system 
administration tasks.

Good luck.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
