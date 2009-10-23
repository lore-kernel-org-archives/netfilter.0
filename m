From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ssh connections stalling
Date: Fri, 23 Oct 2009 09:10:26 +0200
Message-ID: <002001ca53af$e58ebe80$b0ac3b80$@info>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <200910222224.15040.karl@hiramoto.org> <alpine.LNX.2.00.0910221327250.21366@spider.phas.ubc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910221327250.21366@spider.phas.ubc.ca>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> > Send your configuration,  as root or using sudo do:
> >
> > iptables -L -vn
> > iptables -L -vn -t mangle
> > iptables -L -vn -t nat
> >
> > --
> > Karl Hiramoto
> >
> 
> as configured by firehol:
> 
> iptables -L -vn

[...]

I've not looked extensively through the entire listing but I didn't see
anything relating to it: I've seen delays when sshd is not able to
lookup the hostname/IP. Are you allowing DNS lookups in your ruleset? Or
maybe the hosts file can help.


Rob


