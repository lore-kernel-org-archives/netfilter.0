From: Eric Swenson <eric@swenson.org>
Subject: outbound http traffic requires inbound source port 80 rule?
Date: Fri, 3 Jun 2011 14:13:11 -0700
Message-ID: <3BF291B8-F9E6-48EB-9314-44E75751EC50@swenson.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

My iptables-based firewall machine (linux) has an external ip address of 192.168.0.3.  I can access most web sites from my firewall machine, but there is one that will not allow me to connect to it -- www.apple.com.  The only way I can access that web site from my firewall machine is if I add the rule:

    -A INBOUND -d 192.168.0.3/32 -p tcp -m tcp --sport 80 -j ACCEPT

Why is it that i have to allow inbound connections from source port 80 to my firewall machine to allow that machine to make success HTTP requests on www.apple.com?  And why is it that I don't seem to require this firewall rule in order to access any other web site (I'm sure there are others that I can't access for the same reason, but I haven't run across any).

(You might ask why I'm trying to access the web from my firewall machine.  I don't normally.  It is my squid proxy that is unable to access www.apple.com, while it is able to access other web sites).  Users on my LAN have complained that they cannot access this web site (and my firewall rules force them to go through the squid proxy rather than connect directly).

Thanks. -- Eric


