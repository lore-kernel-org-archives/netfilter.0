From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: iptables, portforward, DNAT, SNAT
Date: Thu, 31 Oct 2002 11:47:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210311147070.32495-100000@localhost.localdomain>
References: <200210311639.g9VGdje13442@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210311639.g9VGdje13442@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Thu, 31 Oct 2002, Antony Stone wrote:

> On Thursday 31 October 2002 3:33 pm, Thomas Meindl wrote:
> 
> > #!/bin/bash
> >
> > EXTIF=eth0
> > INTIF=eth1
> > EXTIP=www.xxx.yyy.zzz
> > INTIP=192.168.0.1
> > WWWSRV=192.168.0.2
> >
> > #here I'll make some
> > echo 1 > /proc/sys/net/ipv4/*
> 
> Does that line really say "echo 1 to every file in the /proc/sys/net/ipv4 
> directory" !?
> 
> Why ???

more to the point, it won't work anyway -- bash will give you an
"ambiguous redirect" error.

rday


