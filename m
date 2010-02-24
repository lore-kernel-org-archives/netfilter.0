From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Port Scanning: Is there a difference between stateful INVALID
 	filtering and stateless TCP flag filtering?
Date: Wed, 24 Feb 2010 12:12:54 +0100
Message-ID: <4B8509B6.7000408@chello.at>
References: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 24.02.2010 09:18, netfilter-owner@vger.kernel.org wrote:
> Hello everyone,
> 
> When preventing (nmap) port scans is it better to use the
> connection-tracking INVALID option or use a set of TCP flag filters or
> both?
> 
> Note, by my calculations there are 21 possible combinations of TCP
> flags, this includes legal and illegal flag combinations.
> 
> ASIDE:
> Can stateful filtering using NEW and ESTABLISHED on their own also
> work, given that connection-tracking is supposed to be tracking
> connections?
> For example, allow outbound NEW and ESTABLISHED traffic and allow
> inbound traffic recognised as ESTABLISHED.
> Would these stateful operations prevent nmap scanning?

Why are you so much afraid of nmap scans???
You cannot prevent them, you can just drop them.
It's not the first time you come here to ask the same thing.
Did you ever TRY IT OUT?

iptables -I INPUT -m state --state INVALID -j LOG
iptables -I INPUT -m state --state INVALID -j DROP

then start your nmap scans... you will see what it catches....

http://jengelh.medozas.de/projects/chaostables/ <- read this!
http://xtables-addons.sf.net/ <- includes portscan detection module.


> 
> I saw a few examples where the stateless tcp syn flag match was used
> (by checking that no other flag was set) in conjunction with the NEW
> operator.
> For example, iptables -A INPUT -p tcp ! --syn -m state --state NEW -j
> DROP # using the not (!) operator
Any new tcp connection attempt that does NOT have the SYN bit set -j DROP.

> 
> Why is this the case? I would have imagined that the NEW operator,
> would require by default that only a syn flag be present. Unless the
> NEW operator does not check by default that no other flag is enabled
> in conjunction with the syn flag. Would this be the case?

State NEW is any packet not already known to be
ESTABLISHED,RELATED,INVALID,(UNTRACKED).


regards

Mart
