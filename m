From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Feature suggestion ...
Date: Sun, 6 Sep 2015 20:34:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 6 Sep 2015, Akshat Kakkar wrote:

> With latest addition of storing skbinfo (mainly skbprio) in ipset and 
> then applying it later to the traffic as and when it passes the iptables 
> ruleset, it becomes relatively easy and simple to do traffic shaping.
> 
> IMHO what one of the feature set which we can add is to have an ipset of 
> only fwmarks i.e. fw-marks will be hashed and stored in the ipset and 
> then later using these marks we can instantly (in single look up) set 
> traffic class.

You can already store skbmark in the set element extension and set the 
mark value to the matching packets. 

> Motivation for this is the fact that just reading the mark can signify
> which fw rule it belongs to (no matter how complex was that firewall
> rule). So if we do traffic shaping based on marks, it becomes
> straightforward traffic shaping for that fw rule. Now as no of rules
> increase, this lookup will also increase linearly and
> more-importantly, we cant take advantage of any statefulness over
> here, i.e. if there are 100 rules then everytime my packet will have
> to go down 100 lines, get it matched, get its skbprio value and then
> move forward.

Sorry, but I don't undestand this...
 
> however, if we such an ipset as I am mentioning, so all these skbprio
> settings and all can always be done in single shot,
> 
> say we make something like
> ipset -N MARK-TC-MAP hash:mark skbinfo
> 
> iptables -t mangle -A POSTROUTING -j SET --map-set MARK-TC-MAP src --map-prio

...and your example doesn't help either. Why do you need the set at all?
You could simply write

iptables -t mangle -A POSTROUTING -j MARK --set-mark value

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
