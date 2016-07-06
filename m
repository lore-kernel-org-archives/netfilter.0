From: alvin.ml@Mail.DDoS-Mitigator.net
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 07:21:00 -0700
Message-ID: <20160706142100.GA30556@Mail.DDoS-Mitigator.net>
References: <loom.20160705T084958-392@post.gmane.org>
 <f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antonio Prado <thinkofit@gmail.com>
Cc: Josh Day <conna666@gmail.com>, netfilter@vger.kernel.org


hi antonio

On 07/06/16 at 10:29am, Antonio Prado wrote:
> "methods to stop DDoS attacks using iptables" ?

- yup.. one "cannot stop" incoming ddos attacks

there are many ways to mitigation different ddos attacks ..

> "DDoS and iptables" are words that should not stay in the same sentence.
> trying to block a DDoS using iptables is a nonsense, 

yup ...  but that depends on where iptables is used, at the 
ISP or at the server under attack, and also depends on if it
is tcp-based attacks or not ...

but without iptables, the ddos attacks are even worst ..

with iptables limit, at least some of the incoming ddos attacks does 
not generate any outgoing (useless) reply

without iptables limit, the incoming ddos attacks are doubled with
the useless outgoing replies
( host not avail, service not avail, etc etc )

> actually, because
> that kind of traffic fills the pipe before your iptables-tricks can play
> a role.

and it also uses up your /var/log if you're "crazy" enuff to log things
and it uses cpu/memory ....
and it definitely wastes your time looking for "ddos mitigation" options
or is it not a waste of time to google/yahoo/bing .... you have to do
that sooner or later before the ddos probes/scans get worst and becomes
real attacks to take your servers or somebody elses servers offline..

magic pixie dust ..
alvin
#
# DDoS-Mitigator.net/Howto 
#
