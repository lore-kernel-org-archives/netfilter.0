From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: MARK not working
Date: Fri, 2 Apr 2010 15:02:07 +0200
Message-ID: <20100402150207.7d98c74a@catlap>
References: <4BB53BEC.9010709@gmail.com>
	<20100402065742.23be08f0@catlap>
	<alpine.LSU.2.01.1004021325420.18189@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004021325420.18189@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Dennison Williams <dennison.williams@gmail.com>, netfilter@vger.kernel.org

Hi,

>>-A INPUT -i eth1 -p udp -m udp --dport 4500 -j ACCEPT

>There is no such rule (given in the mail).

There was one at the end of email in the iptables-save output.

>Use `iptables-save -c`, it's much more complete and better to parse 
>because it does not try to make a pretty-print table that always wraps 
>in e-mail anyway.

True ;-). Looks much better.

Regards,
Marek
