From: Adam Kessel <ajkessel@debian.org>
Subject: IP forwarding on iptables router box no longer working after Debian upgrade; can ping but not get http request from outside hosts
Date: Wed, 25 Feb 2009 10:10:53 -0500
Message-ID: <20090225151053.GA32332@whitehail.bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a simple home router iptables setup. The router now runs Debian
Lenny; the client runs Ubuntu. Since the Debian upgrade, the forwarding
setup no longer works properly.

The iptables router has two NICs; one connects to the cable modem, the
other to an internal switch. Router is running Linux 2.6.26, iptables
1.4.2.  

The router box has no network issues with the Internet. I can ping, surf
websites, etc..  

The client box has no problems talking to the router. I can ssh to the
router, mount NFS shares, etc..  

Before the Lenny upgrade, the router box was forwarding Internet traffic
from the client to the Internet without trouble.  

After the Lenny upgrade, I can no longer make any connection from the
client to the Internet that transmits more than few bytes. I can ping
from the client, do DNS lookups, and even get a short error message from
an external website by telnetting from the client to port 80 on the
external website and sending an invalid requst. If I send a *valid*
request, however (e.g. GET /index.html HTTP/1.0), I get no response. The
connection just times out.  

/proc/net/ip_conntrack shows all the relevant connections in CLOSE_WAIT
or TIME_WAIT status.  

sysctl is properly configured:

net.ipv4.conf.all.forwarding = 1

I have ip_masquerading enabled.

I don't think this is a problem with the forwarding setup, since I am
able to ping and make an initial HTTP connection to external hosts from
the internal client. It's only when more than a few bytes are supposed to
come back that it times out.  

Finally, just as an experiment, I tried reducing the MTU packet size on
the client, but it made no difference.  

Nothing relevant appears in syslog or kernel logs. I tried logging 
packets in invalid state; no luck.

Any suggestions on how to fix or further troubleshoot this?
