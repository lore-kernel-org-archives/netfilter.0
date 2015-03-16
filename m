From: Ryan <ryan_gerstenkorn@fastmail.fm>
Subject: Re: Outbound SNAT on non-local connections
Date: Sun, 15 Mar 2015 18:16:43 -0700
Message-ID: <1426468603.3944396.240747921.14A2017D@webmail.messagingengine.com>
References: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
 <55059BE3.4030702@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastmail.fm; h=
	message-id:x-sasl-enc:from:to:cc:mime-version
	:content-transfer-encoding:content-type:subject:date:in-reply-to
	:references; s=mesmtp; bh=H+hzJzWe9FrLc2+xP+I6SepzUAc=; b=XkHq8z
	ebJINmdTnH05E5E9JYOXK6LBICN3doEpNHLw+pE84b1p1T4aSw4bsCWslcJUda5p
	Qbks+NuRUhn33AOUVTC55sI/b3mEsag8HBm5GQoCajIhShb6NHqqr8Z1ZwwKtoTQ
	Kg0uw6QhhP6GDUsT0f+VI50BB/TG+G9ABaPfY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:x-sasl-enc:from:to:cc
	:mime-version:content-transfer-encoding:content-type:subject
	:date:in-reply-to:references; s=smtpout; bh=H+hzJzWe9FrLc2+xP+I6
	SepzUAc=; b=KWq5XFoiCvnhgX+vEcEbWIlhnqrhZC54NGxaikZ+lm0hIj+lQnwg
	+e3nEg+S1WFEdmfxDCWL5HhSjp8jynLG9E8zpnA8608Z/7YNNKFpObCszLsi0yaF
	n56M1Pu7Xk3uOD2f2U64vDvao4rdAbjIdm0+z8oGGiMlw3wMfSCri7M=
In-Reply-To: <55059BE3.4030702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


> > 
> > The server will respond directly to the client (which is what I want)
> 
> Why ?
Because the connection to the server from the LB has the source address
of the client. 

 
> I do not see how SNAT in PREROUTING would help in any way. Recent
> kernels can do SNAT in INPUT, however it wouldn't help either.

You're right that doesn't make sense, forget what I was thinking
there...

I think we experimented with putting the LB's IP on lo and DNAT'ing to
it on inbound but
didn't seem to work either.

> 
> > Am I doing something wrong
> 
> Yes, this :
> 
> "The server will respond directly to the client (which is what I want)"
> 
> Stateful NAT (DNAT, SNAT) needs connection tracking and requires
> symmetric routing. If you break symmetric routing, you break stateful
> NAT.
> 
> > If so is there a way to work around this issue?
> 
> As you found out, you can use stateless NAT on the server (RAWSNAT) and
> also on the load balancer (RAWDNAT, no need to waste resources for
> stateful NAT). Or you can just make the routing symmetric and route the
> reply traffic through the load balancer.

Yeah I think that makes sense, just not obvious without understanding
how
iptables works. This is working for us now using those targets in
xtables
however unfortunately it looks like RAWDNAT and RAWSNAT has been removed
from the latest version of xtables. The other options are iproute
(deprecated) and 
tc, which I didn't look into much for this but has always been a pain to
use in the past.



 
