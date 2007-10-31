From: Jason Blumenkrantz <jason.blumenkrantz@onlinebankingsolutions.com>
Subject: iptables problem with port translation
Date: Wed, 31 Oct 2007 08:29:01 -0400
Message-ID: <4728750D.4020505@onlinebankingsolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm having a very strange intermittent problem getting iptables to work 
performing port address translation. I'm running a Tomcat web server on 
my server on a non-privileged port and trying to redirect traffic from 
ports 80 and 443 to ports 8080 and 8443 respectively  on a virtual IP 
address:

     /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dst #{ip} -- 
dport 80 -j DNAT --to-destination #{ip}:8080
     /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dst #{ip} -- 
dport 443 -j DNAT --to-destination #{ip}:8443

Generally speaking, everything works fine, unless I'm trying to download 
large files (1MB+) in size, and then the connection will freeze up from 
both the client's and server's perspective (both think the connection is 
established, but all tcp traffic has ceased.) This does not happen every 
time, or in the same point in the download, but it only happens when 
iptables is performing the PAT, if I run Tomcat as root and bind 
directly to 80 and 443 then the problem never occurs. I've also noticed 
that it's less likely to occur while I'm running  tcpdump to monitor the 
traffic, this may be making the root cause less likely to trigger. I've 
also observed via tcpdump that the client does notice the pause and 
attempts to send TCP resets, but the server has "gone quiet" at this 
point. The server is running CentOS 4.4 with iptables 1.3.5. Anyone have 
any ideas what might be causing the connection problems or how I can 
track this down?

Thanks in advance,
Jason Blumenkrantz
