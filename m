From: Andrew Beverley <andy@andybev.com>
Subject: Re: filter before NAT
Date: Tue, 11 Oct 2011 20:37:52 +0100
Message-ID: <1318361872.26402.2504.camel@andybev-desktop>
References: <20111011112453.49d1a3f1@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1318361875;
	bh=/QNRnByADJd4qDXWKjwDIvHKZdFRqeFIJfSmw6VxgOQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=OGmFj4WQrQMiJOHuXOCGwXgHUSXfdG0UY0NKJylDYR6vyP2ArJILE7isCy3s3P4cj
	 3K8oOHQaJHcaEFWCO6Sh6Y7mag6jpAKw1DTKivl7sL0CUHw9KPpsBUV/Nur/6CPDoQ
	 LJ+ruK0N3gtfXlXt5tKf2ZmcO+PeXW2v92R/VST4=
In-Reply-To: <20111011112453.49d1a3f1@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On Tue, 2011-10-11 at 11:24 -0300, Ethy H. Brito wrote:
> Hi All.
> 
> I am trying to control some outbound traffic thru a Linux NATing box via this:
> 
> $TC filter add dev $INTERNET protocol ip parent 3: pref 1 \
>    u32  \
>       match ip src 192.168.106.2  \
>    flowid 3:5602
> 
> The problem is that the packets are hooked *after* passing SNAT and all the
> rules can see is the outbound IP. So no redirects to the corresponding
> flowid occur.
> 
> Is it possible to make the filter rule above "see" the packets before they
> get NATed?
> 

How about marking them using an iptables rule before SNAT? The mangle
table of POSTROUTING sits before the nat table.

Andy


