From: Andrew Beverley <andy@andybev.com>
Subject: Re: fail in the connmark load-balancing
Date: Sat, 25 Feb 2012 10:53:56 +0000
Message-ID: <1330167236.30413.175.camel@andrew-desktop>
References: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
	 <1329084658.18690.375.camel@andrew-desktop>
	 <CAMTjHrx9EPdrBYPDSbo03wYxd8BGcqbwe3Ns3rxkK=wMOm8EUA@mail.gmail.com>
	 <CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrxzWaCx6Vp9r-x1JXBkMcdFz7gLEKYrwq5CQgveDhmshg@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1330167238;
	bh=t+ZY319aZDEWlJivv3yu7o0lyO1CUBu6vIdnHb3FfzY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=OiUPGarGH+YAK8Qk/lph/bLR1VM+GtPg5wGXa9KwyRD4+db5f4GzVIEfXz7yS4J44
	 5AC9S8AePHzviS8r0SCawIMAmn0R7sPNmQsIGXO2lbpzMR1y8eDYLkfQykDRzzpocZ
	 g2acOBzWWOAXBWd8lpjC4/GmF4vmv11vubtRY/1U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> >> If it's not working, there must be another problem. Please show the
> >> output of "ip rule show", "ip ro" and "ip ro show table <table>" for
> >> each of your tables where <table> is the name of the tables.

> 
> [root@mtjve sbin]# ip ro
> 192.168.215.0/24 dev eth1  proto kernel  scope link  src 192.168.215.1
> 192.168.217.0/24 dev eth2  proto kernel  scope link  src 192.168.217.254
> 192.168.216.0/24 dev eth0  proto kernel  scope link  src 192.168.216.254
> default via 192.168.216.1 dev eth0
> 
> 
> [root@mtjve sbin]# ip rule show
> 0:	from all lookup 255
> 32763:	from all fwmark 0x2 lookup gvttelecom
> 32764:	from all fwmark 0x1 lookup oitelecom
> 32765:	from 192.168.217.254 lookup oitelecom
> 32766:	from all lookup main
> 32767:	from all lookup default
> 
> [root@mtjve sbin]# ip ro show table oitelecom
> 192.168.217.0 via 192.168.217.1 dev eth2
> 192.168.217.254 via 192.168.217.1 dev eth2
> default via 192.168.217.1 dev eth2
> 
> [root@mtjve sbin]# ip ro show table gvttelecom
> 192.168.216.0 via 192.168.216.1 dev eth0
> default via 192.168.216.1 dev eth0
> 
> 
> I think here is the issue! there are two PREROUTING rule that they
> should do the load-balance but I wonder when the socond rule (
> CONNMARK2 ) coming use it ?? I think never because data flows always
> going to into at the first rule ( CONNMARK1 ). so...the second rule
> never is using! today I have done a test download from three diferente
> sites and the load-balance it wasn't work.
> 
> 
> eth1: is my lan interface
> 
> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
> --state NEW -m statistic --mode nth --every 2 --packet 0 -j CONNMARK1
> iptables -t mangle -A PREROUTING -i eth1 -s 0/0 -d 0/0 -m state
> --state NEW -m statistic --mode nth --every 2 --packet 1 -j CONNMARK2

I can't see any restoration of the marks. You are marking the connection
when it is NEW, but "ip rule fwmark" will match on the packet's mark, so
you need to copy the connection mark to the packet mark with "-j
CONNMARK --restore-mark".

Andy


