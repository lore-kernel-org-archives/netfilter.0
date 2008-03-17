From: Phil Sutter <phil@ctekproducts.com>
Subject: port forwarding question
Date: Mon, 17 Mar 2008 09:26:35 -0700
Message-ID: <1205771195.2681.14.camel@dev002.ctekproducts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

We have been using commands like the following to forward a single port
on our Linux systems and it works fine:

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5080 -j DNAT --to
192.168.1.10:80

I am now trying to find a method for port forwarding a range of ports.
For instance, forwarding port 5080 - 5084 to ports 80 - 84 so that:
- port 5080 traffic ends up on port 80
- port 5081 traffic ends up on port 81
- port 5082 traffic ends up on port 82
- port 5083 traffic ends up on port 83
- port 5084 traffic ends up on port 84

I thought I could do the following but it does not work:

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5080:5085 -j DNAT
--to 192.168.1.10:80-85

Is there a way to do what I want to do with a single command or do I
have to forward each port with an individual command?

Thanks,

Phil Sutter


