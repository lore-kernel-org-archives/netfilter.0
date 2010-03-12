From: Chris Cranford <crancran@gmail.com>
Subject: iptables with snat/dnat under firewall/router 2 nic config
Date: Fri, 12 Mar 2010 10:37:53 -0600
Message-ID: <31850ba91003120837r7586b657h88830dc95f298c70@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=z/R5IXZuJPzQoLK9FJnwL+tmOggW5Pb0suRED0rLM9g=;
        b=sPaDOr1zwM/isGtbldlESr1Ay59jbfDQ1XSg5Thkb8ZU6F7qWpJrzOH2m8noxPgz4o
         JlJrrgJOTuLLQeiq5y4F0byO8VYYVQkiazoKoEGyYK90fUidPZ1cvg14kltxyENrFOUx
         anL7hzyOrGatYvUYLAmUIBpNG6uIpWkoYWwU0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am some what new to iptables and seek some guidance on
configuration.  I have setup Fedora Core 12 and I am looking to
configure the box with two NICs to perform firewall and routing
support for my network.

Our network is setup as follows:

Eth0 - Static public IP address such as 12.50.100.33.
Eth1 - Static private IP address such as 172.30.4.254.

Interface Eth1 is immediately connected to a switch that links several
servers and a router.  Each of the servers on this switch are
statically assigned an ip on the 172.30.4.0 network.  Lets assume
these servers are 172.30.4.1 through 172.30.4.10.  Each of these
servers perform various services, such as HTTP/HTTPS or even
SMTP/POP3.

Our ISP has given us a block of IP addresses like 12.50.100.33 through
12.50.100.62.  The servers behind our firewall (172.30.4.1 through
172.30.4.10) are directly mapped to a specific public IP address
assigned in our IP range.  For this, lets assume the following:

HTTP/HTTPS runs at 172.30.4.1 mapped to public IP 12.50.100.34
SMTP       runs at 172.30.4.2 mapped to public IP 12.50.100.35
POP3       runs at 172.30.4.3 mapped to public IP 12.50.100.36
DNS        runs at 172.30.4.4 mapped to public IP 12.50.100.37

So what I need to permit is if a request for an IP on our public
network comes in, it will be examined at 12.50.100.33, eth0.  If the
destination ip/port combination is permitted, it is forwarded through
to eth1.  I need to do a DNAT from the public IP to the private IP on
the LAN during this process too.

On the reverse, if a request comes into eth1 and it's for a public IP
that our eth0 interface DNATs to a LAN ip, the firewall needs to
reroute it back into the eth1 network for the LAN ip.  So for example,
if I open a web browser to http://www.mydomain.com, it resolves to
12.50.100.34 and when it goes out, we need it to eventually reach
172.30.4.1.  I assume this is using an SNAT?

I have no problem with something behind eth1 making it to a resource
on the internet that isn't part of our own network.  So for example,
going to www.google.com works.  But beyond that, I feel I am lost with
how to configure iptables appropriately to support what it is I need.

Could anyone assist with the simple firewall/nat rules required for
this type of network configuration?  I would be forever thankful for
any help.

Chris
