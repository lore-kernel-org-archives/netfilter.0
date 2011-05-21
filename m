From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 00:33:36 +0100
Message-ID: <4DD84BD0.5040904@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu> <4DD83FDE.9000901@googlemail.com> <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu> <4DD84349.5040407@googlemail.com> <alpine.DEB.2.00.1105220115100.24174@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=YlY+C7skEPFLEUXGxEJNiWpXOqA0FhcZpHTXSBBYaxU=;
        b=dv8wnEczWytPv8b5EZ1g4oEjm067hLg4ZWOpPe9Asmzj0LSWC0gLFZf5gtfh+S+Rof
         5AnDWr04q+JJgfusl5CMX71YwDu7dO8B36NuhISGtVx78+XYLeDFVUPwEAWl7TYKtD2q
         by1ccnEOoiMCITVESIgnSj97jc6+E9QlwLgxY=
In-Reply-To: <alpine.DEB.2.00.1105220115100.24174@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

> I think you have got NETFILTER_NETLINK_QUEUE, NETFILTER_NETLINK_LOG or 
> NF_CT_NETLINK selected as module, and in consequence NETFILTER_NETLINK as 
> module too. And because the ipset kernel modules depend on 
> NETFILTER_NETLINK, then those can be selected as modules only too.
I have them all as modules (i.e. "m"), *but* that is the case with 4.5 as well - I just checked my 4.5 .config, so there is not difference in that respect.

