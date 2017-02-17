From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset restore dropping updates?
Date: Fri, 17 Feb 2017 19:53:34 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1702171951260.12826@blackhole.kfki.hu>
References: <CAMhR0U3LvRnKqa5W7VzdPoJPi-XMXRhMAT1T2Mkj2CX1o=CuXQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1487357615; x=1489172016; bh=e9lvSje6W9
        byBHQ9J+Kk8ZUMQqPA42WIg51UbqwMNmM=; b=IiRqqqARSRKY9CeggTf9QBfTtK
        UyTN1z/xEvITB+wKydVf+fMf9CQTKqDtwvDjwfIHhAI7cokHih4ndxFZ1h84qjCS
        YHUINM3NCycVSY3lwHcuXBmcwoi02B1eXcUK3UliIOUdCse0DQbPIFdXF+uq6ZDc
        xbyrjHhbMIvafIFuY=
In-Reply-To: <CAMhR0U3LvRnKqa5W7VzdPoJPi-XMXRhMAT1T2Mkj2CX1o=CuXQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaun Crampton <shaun@tigera.io>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, 17 Feb 2017, Shaun Crampton wrote:

> My application (Project Calico) makes heavy use of IP sets for
> firewall configuration and, to update the IP sets quickly, we use
> "ipset restore" for bulk operations.  After running a churn test on
> Calico that adds and removes a lot of IPs from IP sets, it seems that
> IP sets can become inconsistent.  We add an IP in one call to ipset,
> then try to remove it later but ipset says it isn't in the set (or
> vice versa). The ipset call that adds the IP returns a good status
> code.
> 
> To remove some variables, I recorded a trace of every ipset call that
> Calico ran as a shell script.  Sometimes the script [1] runs to
> completion (so I think the script is consistent) but it typically
> fails at a random point with something like "ipset v6.29: Error in
> line 66: Element cannot be deleted from the set: it's not added".

That's a bug and was reported just a few days ago, see 
https://bugzilla.netfilter.org/show_bug.cgi?id=1119.

The fix is out in the ipset git tree and I'll release a new version at the 
weekend.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
