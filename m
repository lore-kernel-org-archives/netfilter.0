From: Phil Oester <kernel@linuxace.com>
Subject: Re: iptables redirects packets to local proxy
Date: Sat, 30 Nov 2013 09:40:58 -0800
Message-ID: <20131130174057.GA23001@home>
References: <201311301646.rAUGk6rg005227@p3slhssl14.shr.phx3.secureserver.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201311301646.rAUGk6rg005227@p3slhssl14.shr.phx3.secureserver.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ilic_68@yopmail.com
Cc: netfilter@vger.kernel.org

On Sat, Nov 30, 2013 at 09:46:06AM -0700, ilic_68@yopmail.com wrote:
> Hello,
> 
> consider this scenario:
> 
> PC1 wants to telnet to SRV1 tcp 40000.
> 
> I would like to put a proxy in the middle that receives the
> connection, rewrites the destination, sends packet to a local socks proxy (redsocks).
> 
> So the scenario would be:
> 
> PC1 --> PROXY tcp 20000 [iptables rewrites destination to SRV tcp 40000 --> redsocks 127.0.0.1 tcp 12345] --> SRV1 tcp 40000

Use -j REDIRECT --to 12345
