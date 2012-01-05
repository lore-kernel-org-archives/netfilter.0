From: Andrew Beverley <andy@andybev.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 07:35:24 +0000
Message-ID: <1325748924.2270.334.camel@andybev-desktop>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325748926;
	bh=lQSHcM32U42H/9Tfs0yUqEKCtD4tISV3Cp8AP/sUbKQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=acCnqTNcpRB4IAh5lkCfa8VB3UXL3oSPPQvqrHzKFaMdQJ1fg+dLxUh5aCAIByk5h
	 lMGnVBquaaaU6r17oCVvnp0pv+/dorMVojg2Mn+Wxk2jLFx5xDwwOteBw8GmiCJ1mj
	 Bg8HIkDIqlfmjgYFzvtCPK8RIT8C6TLgPmg1Fhlk=
In-Reply-To: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Melser <anton@linux.com>
Cc: netfilter@vger.kernel.org

On Sun, 2012-01-01 at 17:10 +0100, Anton Melser wrote:
> Hi,
> I am very new to iptables but have been trying hard to learn as much
> as I can... I have a reasonably simple need but performance might
> quickly become an issue so would like some advice on the best way to
> go forward.
> So, I have around 1600 public IPs in 4 blocks (3 x /23 + /25 on
> different ISPs). I have a certain number of machines (somewhere from 3
> to 8, needs to be variable and changeable without FW reconfiguration),
> and each one needs to be able to send email from each external IP (and
> needs to be able to do this deterministically). The only traffic
> should be to port 25 on the external destination IPs - the machines
> are only sending email, never receiving, so AFAICT everything can be
> closed inbound (at least for NEW).
> I thought that the best way to go would be to set up NAT using blocks
> in the 10.0.0.0 range. So say for each external IP I would have a /24,
> giving me up to 250-odd potential internal machines. So 10.1.1.1,
> 10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
> 10.1.2.3, etc. would map to 1.1.1.2, etc.
> I have been reading as many sites as I can but I can't work out the
> best way to go forward.

So you have something like:

Server A ----|
             |
Server B ----|
             |-----> Linux router ----> Internet
Server C ----|
             |
Server D ----|

Correct? And it's the Linux router you're asking about?

> 
> AFAICT the best way to do this is with iptables SNAT - is that the
> case?

I think the main question is: how does the Linux router know which IP
address that the mail should be sent from? Server A/B/C/D somehow need
to pass this information on. This can't be done with fwmarks, because
they aren't retained between on packets between servers.

>  It's not 1 to 1 so it needs to be stateful, and can't be done
> with just iproute2 stuff - am I correct in my understanding?

You might be able to do this with iproute2, but depends on answer to
above.

> 
> There seem to be many different ways I could do this in terms of
> routing - at least by source IP, TOS, and fwmark.

I'm going to guess that source IP is the only option. So can you set the
source IP from each server depending on its eventual external IP
address?

Andy


