From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: multiple external IP's - virtual NIC - DNAT problems
Date: Fri, 29 Jan 2010 06:46:15 -0800
Message-ID: <4B62F4B7.80701@mailinator.com>
References: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: koen.news@koca.be
Cc: netfilter@vger.kernel.org

koen.news@koca.be wrote:
> Debian Lenny IPTABLES firewall.
> 
> I'm missing some essential knowledge on how to map multiple external IP's
> I got from the ISP to specific internal IP's. 
> Everything works qua NAT & redirects for one external IP (eth0) and
> multiple internal subnets.
> 
> The external IP pack is available at the untrust interface of the router
> (configured by the ISP) where eth0 of the firewall is connected to. 
> Until now the firewall works with one of the external IP's. Port
> forwarding works without a problem.
> 
> eth0: external IP1
> eth1: internal 192.168.1.10/24
> 
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 9999 -j DNAT --to
> 192.168.2.240:3389) = Works perfect
> 
> I thought I needed to create via /etc/network/interfaces this: eth0:1 an
> extra interfaces that matches official IP2 so I can DNAT traffic to a
> specific server. 
> IPtables doesn't accept eth0:1 as interface. But I can use the IP2. "IP2"
> is the official IP e.g. $IPTABLES -t nat -A PREROUTING -p tcp -d "IP2"
> --dport 80 -j DNAT --to 192.168.2.240:80 => doesn't work
> 
> 1) Is this really necessary? First I tried to $IPTABLES -t nat -A
> PREROUTING -p tcp -d "IP2" -j DNAT --to 192.168.2.240 without an virtual
> interface but it doesn't work, TCP/IP does need an interface with the
> correct IP to send data to I guesss :)
> 2) No other/better way than to define multiple official IP's to one iFACE?
> 
> This must be a common problem but I can't find a google answer. 
> Any pointer on how to solve this problem? Maybe another approach. I will
> need to do this for multiple servers. 

I have 7 IPs on one interface and use nat to map them to various servers 
on various internal networks and it works very well for me (redhat).  It 
allows me to take servers up and down and to move them around.  It's 
great for testing, too.

The command you seek is "ip".  Here's an example of adding an address to 
an interface:  "ip address add 1.2.3.4/8 dev eth4".

Happy hacking!
Mike Wright
