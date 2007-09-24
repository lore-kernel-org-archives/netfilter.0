From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 20:10:40 -0400
Message-ID: <20070924001040.GB11683@minastirith>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F65D0E.6050005@verizon.net>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sep 23, 2007, Gerry Reno wrote:

> Mike,
> I'm going to try building the RPM on my system.
> 
> Here are a few things that I think the RPM should take care of though:
> 
> in a %post rule:
> set permissions: (I notice that 'other' has too much access in 1.8.2)
> /etc/fwknop/*

Agreed for /etc/fwknop/*, I will fix this.

> /usr/lib/fwknop/*

The fwknop script (as opposed to the fwknopd daemon) uses modules
installed in /usr/lib/fwknop, and normal users need to be able to
execute fwknop.  Only fwknopd and knoptm needs access to the
IPTables::ChainMgr and IPTables::Parse modules, so perhaps more
restrictive permissions makes sense for them, but standard execute
permission on the iptables binary still applies...

> /usr/bin/fwknop*

Normal users should be able to execute /usr/bin/fwknop.  The other
programs such as /usr/sbin/fwknopd, /usr/sbin/knoptm, etc. already have
minimal permissions.

> =======================================
> 
> And a question about SPA. If I switch to this mode will I still be able 
> to keep this system completely stealthy? That is no ports open anywhere? 

Yes, SPA is completely stealthy..  SPA never uses open ports (unless
you want to run the SPA packet over the Tor network, in which case a
real TCP server must be used because Tor uses TCP for transport).

--Mike


> I know I can do this with port knocking. I didn't know whether this was 
> possible with SPA mode.
> 
> Thanks,
> Gerry
> 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
