From: Gary Smith <gary.smith@holdstead.com>
Subject: FTP port mode, client and server behind iptables
Date: Mon, 30 Nov 2009 13:50:32 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD50B01@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

As per the subject, I have a proftp server running behind iptables.  I'm NAT'ing in the entire IP to the ftp server.  

I have the following rules in place on the server (where eth0 is internal, eth1 is external):
*nat
-A PREROUTING -d x.x.x.x -p tcp -m tcp -j DNAT --to-destination 10.20.0.12
*filter
-A FORWARD -d 10.20.0.12 -i eth1 -p tcp -m tcp --dport 1025:65535 -j ACCEPT 
-A FORWARD -d 10.20.0.12 -i eth1 -p tcp -m tcp -m multiport --dports 80,443,21,20,22 -j ACCEPT
-A FORWARD -j LOG --log-prefix "FW-F: " 
-A FORWARD -i eth1 -j REJECT --reject-with icmp-port-unreachable
ip_conntrack_ftp and ip_nat_ftp are loaded

On the client side (where eth0 is internal, eth1 is external), 
-A FORWARD -I eth0 -j ACCEPT 
-A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
-A FORWARD -j LOG --log-prefix "FW-F: " 
-A FORWARD -i eth1 -j REJECT --reject-with icmp-port-unreachable
ip_conntrack_ftp and ip_nat_ftp are loaded

I'm not seeing any hits in the log file (which logs on each chain before reject).

Anyway, what am I missing for PORT mode for FTP.  The windows command line users seem to be the only ones affected by this (as pretty much everything else allows passive).

Any ideas?
