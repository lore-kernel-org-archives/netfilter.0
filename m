From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: bad argument state
Date: Fri, 21 Aug 2009 12:42:41 -0500
Message-ID: <200908211242.42352.rob0@gmx.co.uk>
References: <4A8E5924.2050302@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A8E5924.2050302@infoservices.in>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday 21 August 2009 03:21:56 J. Bakshi wrote:
> But whenevr I insert these rules in my existing iptables rule it
> reports "bad argument state"
>
> Any clue ?

Looks like shell scripting failure.

root@chestnut:~# iptables -vA INPUT -p tcp -i $IFACE -m state
Bad argument `state'

That's what I get when $IFACE is not set.

> ``````````````````
> IFACE=eth0
> iptables -A INPUT -p tcp -i $IFACE -m state --state NEW -m recent --set

Is this exactly and completely what you tried, to get that result? I
bet not.

> iptables -A INPUT -p tcp -i $IFACE -m state --state NEW -m recent
> --update --seconds 30 --hitcount   10 -j DROP
> iptables -A FORWARD -p tcp -i $IFACE -m state --state NEW -m recent --set
> iptables -A FORWARD -p tcp -i $IFACE -m state --state NEW -m recent
> --update --seconds 30 --hitcoun  10 -j DROP
> `````````````````````````````

"--hitcoun" is definitely wrong too.

I think Jan's "Perfect Ruleset" document might be helpful for you:
    http://jengelh.medozas.de/documents/Perfect_Ruleset.pdf
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
