From: Matt Killock <lists@killock.net>
Subject: Re: Routing LAN to external IP from behind NAT
Date: Fri, 13 Jan 2017 10:25:54 +0000
Message-ID: <675323d5f1ce20d6205e49b0bc784663@killock.net>
References: <F7FF15A4-8565-43D9-985B-5F66DCC224B6@skidrow.la>
 <28e62ab70eb5ea675eaca3a1fa08e52b@killock.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killock.net; s=mail;
        t=1484303154; bh=eqIjyBaTfYhFE67zQGv5IDJWUdf1lj0YU30QWDsIKG8=;
        h=To:Subject:Date:From:In-Reply-To:References:From;
        b=csRSGXnwymVjG4G4/ezmJMd/lz3mYPL9g/PtOUeEJXej3+uGrcVSdhuAsu+46hNlA
         iGuz5n6mshKICCwp4/A+1GM7+VpJCMsm4oB1c6OpEhsVoxd0gwsEuUjUna/uFtPcOZ
         oH2Mc5yKWDGOww3cggkUC5gC107bVjxtFepxTllA=
In-Reply-To: <28e62ab70eb5ea675eaca3a1fa08e52b@killock.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeremy Hansen <jeremy@skidrow.la>, netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

On 2017-01-13 10:25, Matt Killock wrote:
> On 2017-01-13 09:14, Jeremy Hansen wrote:
>> What do I have to
>> do with iptables so I can access these things from within the LAN
>> without having to do something like fake dns so it uses internal IPs
>> to access these hosts and ports?
> 
> You'd need to do some careful NAT'ing.
> 
> First you'd need to direct traffic arriving on the internal interface
> from the LAN hosts to each of those IP address, and DNAT to the
> relevant internal host IP. Something like
> 
> iptables -t nat -A PREROUTING -i $LANIF -s $LANSUBNET -d
> 111.114.34.128 -p tcp --dport 80 -j DNAT --to $LANSERVER
> 
> You need to narrow down the interface/destination host/port as much as
> possible to stop this interfering with any general NAT rules you have
> got. Next you'd need to SNAT the traffic that you've just DNAT'd so
> that it appears to come from the firewall host
> 
> iptables -t nat -A POSTROUTING -o $LANIF -s $LANSUBNET -d $LANSERVER
> -p tcp --dport 80 -j SNAT --to $FWLANIP
> 
> These rules would need to come before any general NAT rules.
> 
> $LANIF = your internal LAN interface
> $LANSUBNET = internal subnet
> $LANSERVER = internal LAN IP of your server
> $FWLANIP = the LAN IP on your firwall
> 
> Matt
