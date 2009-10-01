From: andy thomas <tds@time-domain.co.uk>
Subject: Re: Using iptables to anonymize incoming IP addresses
Date: Thu, 1 Oct 2009 16:37:58 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0910011629510.8877@virt1.netstat-a.net>
References: <Pine.LNX.4.58.0909301456490.29957@virt1.netstat-a.net>
 <4AC3A5B2.7080804@solutti.com.br>
Reply-To: andy@time-domain.co.uk
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AC3A5B2.7080804@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org



On Wed, 30 Sep 2009, Leonardo Rodrigues wrote:

> andy thomas escreveu:
> > But, I want all the packets received by the webserver to appear to be
> > coming from the address 192.168.1.1, not the external public IP address
> > they really came from, eg the apache logs will show all page requests as
> > coming from 192.168.1.1. Can this be done with iptables?
> >
>
>     sure !!! Pretty simple.
>
>     you'll need a DNAT rule for the 80 port forwarding
>
>     and you'll need a SNAT rule to, to make the firewall source-nat all
> connections 'going' to your real webserver
>
> 192.168.1.1 = your firewall
> 192.168.1.200 = your real web server
>
>
> iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.1.200 -j
> SNAT --to-source 192.168.1.1

Thanks, it works! I knew SNAT was the solution but couldn't get it to work
despite a lot of attempts with different options, etc. I'm now using the
following ruleset:

	iptables -A INPUT -i eth0 -j ACCEPT
	iptables -t nat -A PREROUTING -p tcp -d 11.22.33.44 \
		--dport 80 -j DNAT --to 192.168.1.2:80
	iptables -t nat -A POSTROUTING -p tcp --dport 80 \
		-d 192.168.1.2 -j SNAT --to-source 192.168.1.1

(11.22.33.44 is not my real external IP address ;-)

I suppose I ought to add the -o eth1 option to the last rule (the SNAT
rule) to make sure this traffic only goes out onto the internal network
but it's working very well as it is.

Thanks again,

cheers, Andy
